unit BarcodeHook;

interface

uses
  Windows, Messages, Classes, SysUtils;

var
  hook: HHOOK;
  ShiftDown: Boolean;

function KeyboardHook(nCode: Integer; wParamv: WPARAM; lParamv: LPARAM): LRESULT; stdcall;

type
  PKeyBoardHookStruct = ^RKeyBoardHookStruct;

  RKeyBoardHookStruct = record
    vkCode: DWORD; //虚拟码
    scanCode: DWORD; //扫描码
    flags: DWORD;
    Time: DWORD;
    dwExtraInfo: DWORD;
  end;

     (*
     功能: 监控扫描枪的扫描动作.即使我们的程序不是windows的当前活动程序, 也可以监控到.
     原理: 采用Keyboard hook的方式实现监控. 其实扫描枪扫描的过程相当于键盘快速输入一段文字,最后的回车相当于扫描结束
           由于采用了消息hook机制, 监控的结果并不会百分百准确, 表现为: 数字有时会错位, 有时会重复, 有时会丢掉一位
           如果准确度要求高, 有两种方法:
               1.[已实现]为扫描枪设置扫描前缀和后缀, 用作验证, 如果监控的结果不包含这对前缀/后缀, 即舍弃监控结果.
               2.[未实现]根据条码本身的验证算法, 对监控的结果进行验证
     测试方法: 如果没有扫描枪, 可使用大键盘模拟, 但不能使用小键盘.
     使用方法:
    FBarReader:=TBarcodeScanMonitor.GetInstance();
    FBarReader.RelayKeyPress:=True;//按键被捕获后, 是否要继续将按键显示出来
    FBarReader.BarcodeLengths:='3,4'; //条码可能的长度
    FBarReader.ScanMaxDurationSecond:=10;//扫描条码的最大耗时
    FBarReader.AlwaysDuplicatedRead:=False; //防止条码值重复
    FBarReader.CheckPrefixStr:=''; //前缀验证码
    FBarReader.CheckSuffixStr:='';//后缀验证码
    FBarReader.AutoRemoveCheckStr:=True;
    FBarReader.HookedThreadId:=0; //0为OS级别的键盘hook
    FBarReader.OnScanFinished:=self.OnScanFinished1; //绑定一个扫描结束的事件
    if FBarReader.StartListenScan()=False then  //开始监听键盘
    begin
        Msg:= 'Barcode scanner failed to listen';
        Application.MessageBox(PChar(Msg),'Init failure',MB_OK+MB_ICONSTOP);
    end;
     *)

  TScanEvent = procedure(Sender: TObject; barcode: string) of object;

  TScanStEvent = procedure(Sender: TObject; EventType: Integer) of object;

  TBarcodeScanMonitor = class(TObject)
  private
    FBarcodeSequence: string;
    FFirstKeyTime: TDateTime;
    FFstTick: Integer; //开始记录的第一个KEY生成时间
    FInputInterval: Integer; //输入间隔
    FFrontKeyTick: Integer; //前一个KEY生成的最后时间
    FStartRecordStrInout: Boolean;
    FStartRecordValue: Boolean; //开始记录值
    FScanFinished: TScanEvent;
    FScanStart: TScanStEvent; //开始记录事件
    FRelayKeyPress: Boolean;
    FScanMaxDurationSecond: Double;
    FAlwayDuplicatedRead: Boolean;
    FHookThreadId: Integer;
    FAutoRemoveCheckStr: Boolean;
    FCheckSuffixStr: string;
    FCheckPrefixStr: string;
    FBarcodeLengths: string;
    FBarcodeLengthStrings: TStringList;
    FIsInListening: Boolean;
    FHideNoMonitor: Boolean;
    function Hook_Register(): Boolean;
    function Hook_Unregister(): Boolean;
    procedure ResetSession();
    procedure DoScanFinished();
    procedure DoScanStart();
    function CalBarcodeLength: Integer;
    function KeyPressedByBarcodeDevice(vkCode: string): Boolean;
    function KeyPressedInUseCodeList(vkCode: string): Boolean; //检测vkode是否在需要的字符串列表里面
    procedure SetUseOtherString(UseString: string);
    constructor Create();
    function RemoveDuplicated(barcode: string): string;
    function GetFirstKeyTime(): TDateTime;
    function CheckAndRemoveCheckStr(barcode: string): string;
    function ReadSingleKey(vkCode: string; var ByBarcodeDevice: Boolean): Boolean;
    procedure SetBarcodeLengths(const Value: string);
    function IsLegalLength(barcode: string): Boolean;
  public
    property HideNoMonitor: Boolean read FHideNoMonitor write FHideNoMonitor;
    property StartRecord: Boolean read FStartRecordStrInout;
    property FrontKeyTick: Integer read FFrontKeyTick; //前一个字符的最后生成时间
    property BarcodeNowLength: Integer read CalBarcodeLength;
    property OnScanStart: TScanStEvent read FScanStart write FScanStart;
    property OnScanFinished: TScanEvent read FScanFinished write FScanFinished;
    property RelayKeyPress: Boolean read FRelayKeyPress write FRelayKeyPress;
    property BarcodeLengths: string read FBarcodeLengths write SetBarcodeLengths;
    property ScanMaxDurationSecond: Double read FScanMaxDurationSecond write FScanMaxDurationSecond;
    property AlwaysDuplicatedRead: Boolean read FAlwayDuplicatedRead write FAlwayDuplicatedRead;
    property CheckPrefixStr: string read FCheckPrefixStr write FCheckPrefixStr;
    property CheckSuffixStr: string read FCheckSuffixStr write FCheckSuffixStr;
    property AutoRemoveCheckStr: Boolean read FAutoRemoveCheckStr write FAutoRemoveCheckStr;
    property HookedThreadId: Integer read FHookThreadId write FHookThreadId;
    property IsInListening: Boolean read FIsInListening;
    property InputInterval: Integer read FInputInterval write FInputInterval;
    function StopNowInput: Boolean;
    function StartListenScan(): Boolean;
    function StopListenScan(): Boolean;
    function BarcodeFinish(): Boolean;
    destructor Destroy(); override;
    class function GetInstance(): TBarcodeScanMonitor;
  end;

implementation

{ TBarcodeScanMonitor }
uses
  Unit1;

var
  Reader: TBarcodeScanMonitor = nil;

function KeyboardHook(nCode: Integer; wParamv: WPARAM; lParamv: LPARAM): LRESULT; stdcall;

  function EncodeUniCode(Str: WideString): string; //字符串－>PDU
  var
    i, len: Integer;
    cur: Integer;
  begin
    Result := '';
    len := Length(Str);
    i := 1;
    while i <= len do
    begin
      cur := Ord(Str[i]);
      Result := Result + IntToHex(cur, 4);
      Inc(i);
    end;
  end;

  function AcsiiToString(VKCodeAcsii: Integer): string;
  var
    StrArr: array[0..35] of string;
    AcsiiArr: array[0..35] of Integer;
    i: Integer;
  begin
    Result := '';
    case VKCodeAcsii of
      161:
        begin
          ShiftDown := True;
        end;
      13:
        begin
          Result := '13';
          Exit;
        end;
      160:
        begin
          Result := '160';
          Exit;
        end;
      20:
        begin
          Result := '20';
          Exit;
        end;
      186:
        begin
          if ShiftDown then
          begin
            Result := ':';
            ShiftDown := False;
          end
          else
          begin
            Result := ';';
          end;

          Exit;
        end;
      188:
        begin
          Result := ',';
          Exit;
        end;
      189:
        begin
          Result := '_';
          Exit;
        end;
      190:
        begin
          Result := '.';
          Exit;
        end;
      219:
        begin
          if ShiftDown then
          begin
            Result := '{';
            ShiftDown := False;
          end;
          Exit;
        end;
      221:
        begin
          Result := '}';
          Exit;
        end;
      222:
        begin
          if ShiftDown then
          begin
            Result := '"';
            ShiftDown := False;
          end;
          Exit;
        end;

    end;
    if ((VKCodeAcsii > 47) and (VKCodeAcsii < 58)) or ((VKCodeAcsii > 64) and (VKCodeAcsii < 91)) then
    begin
      Result := Char(VKCodeAcsii);
      ShiftDown := False;
    end
    else
    begin
      Result := '';
    end;

  end;

var
  p: PKeyBoardHookStruct;
  key: string;
  handled: Boolean;
  ByBarcodeDevice: Boolean;
  Str1, Str2, Str3, Str4: string;
begin
  Result := 0; //if value is 1, means to stop to send out to other hooks
  //160=shift   20 =capslock
  if Reader.FHideNoMonitor then
    Exit;
  handled := False;
  if (nCode = HC_ACTION) and (wParamv = WM_KEYDOWN) then
  begin
    p := PKeyBoardHookStruct(lParamv);
    //key := StringOfChar(Char(p^.vkCode), 1); //如果用这个函数会让标点符号乱码
    key := AcsiiToString(p^.vkCode);
    //Form1.mmo1.Lines.Add('Acsii=' + IntToStr(p^.vkCode) + ' vkcode=' + key);
    Reader.ReadSingleKey(key, ByBarcodeDevice);

    {Reader.ReadSingleKey(key, ByBarcodeDevice);}

    if ByBarcodeDevice then
    begin
      handled := True;
      if Reader.RelayKeyPress then
        Result := CallNextHookEx(hook, nCode, wParamv, lParamv)
      else
        Result := 1;
    end;
  end;

  if handled = False then
    Result := CallNextHookEx(hook, nCode, wParamv, lParamv);
end;

function TBarcodeScanMonitor.BarcodeFinish: Boolean;
begin
  Result := True;
  try
    DoScanFinished();
    ResetSession();
  except
    Result := False;
  end;
end;

function TBarcodeScanMonitor.CalBarcodeLength: Integer;
begin
  Form1.mmo1.Lines.Add('CalBarcodeLength');
  Form1.mmo1.Lines.Add(IntToStr(Length(Self.FBarcodeSequence)));
  Result := Length(Self.FBarcodeSequence);
end;

function TBarcodeScanMonitor.CheckAndRemoveCheckStr(barcode: string): string;
var
  TempBarcode, EndStr: string;
begin
  TempBarcode := barcode;

  if FCheckPrefixStr <> '' then
    //check by FCheckPrefixStr
    if Pos(FCheckPrefixStr, TempBarcode) <> 1 then
    begin
      Result := ''; //check fail
      Exit;
    end;

  TempBarcode := Copy(TempBarcode, Length(FCheckPrefixStr) + 1, Length(TempBarcode));
  if FCheckSuffixStr = '' then
  begin
    if FAutoRemoveCheckStr then
      Result := TempBarcode
    else
      Result := barcode;
    Exit;
  end;

    //Check by FCheckSuffixStr
  if Length(TempBarcode) <= Length(FCheckSuffixStr) then
  begin
    Result := ''; //check failed
    Exit;
  end
  else
  begin
    EndStr := Copy(TempBarcode, Length(TempBarcode) - Length(FCheckSuffixStr) + 1, Length(FCheckSuffixStr));
    if EndStr <> FCheckSuffixStr then
    begin
      Result := ''; //check error
      Exit;
    end
    else
    begin
      TempBarcode := Copy(TempBarcode, 1, Length(TempBarcode) - Length(FCheckSuffixStr));
      if FAutoRemoveCheckStr then
        Result := TempBarcode
      else
        Result := barcode;
    end;
  end;

end;

constructor TBarcodeScanMonitor.Create;
begin
  FBarcodeLengthStrings := TStringList.Create;
  FRelayKeyPress := True;
  FScanMaxDurationSecond := 1.0;
  FHookThreadId := 0; //Windows OS level hook
  FAlwayDuplicatedRead := True;
  FCheckSuffixStr := '';
  FCheckPrefixStr := '';
  FAutoRemoveCheckStr := True;
  FInputInterval := 1000;
  FStartRecordStrInout := False;
  FStartRecordValue := False;
  Self.BarcodeLengths := '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,80,81,82,83';
end;

destructor TBarcodeScanMonitor.Destroy;
begin
  FBarcodeLengthStrings.Free;
  Self.StopListenScan();
  inherited;
end;

procedure TBarcodeScanMonitor.DoScanFinished;
var
  barcode: string;
begin

  if Assigned(Self.FScanFinished) then
  begin
    barcode := Self.FBarcodeSequence;
    Self.ResetSession();
    barcode := RemoveDuplicated(barcode);
//    if Self.IsLegalLength(barcode) then
//    begin
//      barcode := CheckAndRemoveCheckStr(barcode);
//      if Self.IsLegalLength(barcode) then
    Self.FScanFinished(Self, barcode);
//    end;
  end;
  Self.ResetSession;
end;

procedure TBarcodeScanMonitor.DoScanStart;
begin
  if Assigned(Self.FScanFinished) then
  begin
    Self.FScanStart(Self, 0);
  end;
end;

function TBarcodeScanMonitor.GetFirstKeyTime: TDateTime;
begin
  if Self.FBarcodeSequence = '' then
    Result := Now()
  else
    Result := Self.FFirstKeyTime;

end;

class function TBarcodeScanMonitor.GetInstance: TBarcodeScanMonitor;
begin
  if Reader = nil then
    Reader := TBarcodeScanMonitor.Create();

  Result := Reader;
end;

function TBarcodeScanMonitor.Hook_Register: Boolean;
const
  WH_KEYBOARD_LL: Integer = 13;
var
  tid: Integer;
begin
  tid := Self.HookedThreadId; //GetCurrentThreadId()

    //第4个参数为0, 表示全局钩子
  hook := SetWindowsHookEx(WH_KEYBOARD_LL, @KeyboardHook, HInstance, tid);
  Result := (hook <> 0);
end;

function TBarcodeScanMonitor.Hook_Unregister: Boolean;
begin
  if hook <> 0 then
    UnhookWindowsHookEx(hook);
  Result := True;
end;

function TBarcodeScanMonitor.KeyPressedByBarcodeDevice(vkCode: string): Boolean;
var
  Time: Single;
  Tick, TempInterval: Integer;
begin
  Result := True;
  Tick := GetTickCount;
  TempInterval := Tick - Self.FFstTick;
  //Form1.mmo1.Lines.Add('KeyPressedByBarcodeDevice:interval=' + IntToStr(TempInterval));
  if not Self.FStartRecordValue then
  begin
    //if ((TempInterval > InputInterval) or (Self.IsLegalLength(Self.FBarcodeSequence) = False)) then
    if TempInterval > InputInterval then
    begin
      Result := False;
    end;
  end;

end;

function TBarcodeScanMonitor.KeyPressedInUseCodeList(vkCode: string): Boolean;
var
  UpperCheck, LowerCheck, NumberCheck, OtherStrCheck: Boolean;
begin
  Result := False;

end;

function TBarcodeScanMonitor.ReadSingleKey(vkCode: string; var byBarcodeDevice: Boolean): Boolean;
var
  StrInputTime: TDateTime;
  Temp: Int64;
begin
  Result := True;
  byBarcodeDevice := True;
  //获得tick时间
  if Self.FBarcodeSequence = '' then
  begin
    Self.FFirstKeyTime := Now();
    Self.FFstTick := GetTickCount64;
    Self.FStartRecordValue := True; //此为判断是否是首次字符检测
    Self.DoScanStart();
  end
  else
  begin
    if Self.FStartRecordValue then
    begin
      Self.FStartRecordValue := False;
    end;
  end;

  //Form1.mmo1.Lines.Add(vkCode);
  //如果已经开始记录，检测是否有回车符
  if Self.FStartRecordStrInout then
  begin
    if (vkCode = '13') then
    begin
      //Form1.mmo1.Lines.Add('interval=' + IntToStr(GetTickCount64 - Self.FFstTick));
      if (GetTickCount64 - Self.FFstTick > InputInterval) {and (Length(Self.FBarcodeSequence) < 18)} then
      begin
        Self.ResetSession();
        byBarcodeDevice := False;
        Exit;
      end
      else
      begin
        Form1.mmo1.Lines.Add('ReadSingleKey:完成扫描...');
        Self.DoScanFinished();
        Exit;
      end;
    end;
  end;
  //检测是否有delphi的shift capslock按键
  if not ((vkCode = '161') or (vkCode = '20')) then
  begin
    if KeyPressedByBarcodeDevice(vkCode) = False then
    begin
      Self.ResetSession();
      byBarcodeDevice := False;
      //Form1.mmo1.Lines.Add('KeyPressedByBarcodeDevice=FALSE');
      Exit;
    end
  end
  else
  begin
    vkCode := '';
  end;
  //开始记录
  if not Self.FStartRecordStrInout then
  begin
    Self.FStartRecordStrInout := True;
  end;
  Self.FFrontKeyTick := GetTickCount;
  //累加字符串
  Self.FBarcodeSequence := Self.FBarcodeSequence + vkCode;
  Exit;

end;

function TBarcodeScanMonitor.RemoveDuplicated(barcode: string): string;
var
  str1, str2: string;
  i: Integer;
begin
  Result := barcode;
  str1 := '';
  str2 := '';
  if FAlwayDuplicatedRead then //if duplicated , remove duplicated
  begin
    if (Length(barcode) mod 2) = 0 then
    begin
      for i := 1 to (Length(barcode) div 2) do
      begin
        str1 := str1 + barcode[i * 2 - 1];
        str2 := str2 + barcode[i * 2];
        if str2 = str1 then
          Result := str1;
      end;
    end;

  end;

end;

procedure TBarcodeScanMonitor.ResetSession;
begin
  FBarcodeSequence := '';
  FFrontKeyTick := 0;
  //Form1.mmo1.Lines.Add('initial OK');
  FStartRecordStrInout := False;
  FStartRecordValue := False;
  FFstTick := 0;
end;

procedure TBarcodeScanMonitor.SetBarcodeLengths(const Value: string);
var
  i: Integer;
  list: TStringList;
begin
  FBarcodeLengths := Value;
  FBarcodeLengthStrings.Text := '';
  list := TStringList.Create;
  list.DelimitedText := Value;
  list.Delimiter := ',';
  for i := 0 to list.Count - 1 do
    FBarcodeLengthStrings.Add(Trim(list.Strings[i]));
  list.Free;
end;

procedure TBarcodeScanMonitor.SetUseOtherString(UseString: string);
//var
//  i: Integer;
//  StrTemp: string;
begin
//{用户需要添加一些需要识别的特殊字符，此属性去剔除数字大小写字母后作为使用字符集合}
//  UseString := Trim(UseString);
//  StrTemp := '';
//  UseString := StringReplace(UseString, ' ', '', [rfReplaceAll]);
//  for i := 0 to Length(UseString) - 1 do
//  begin
//    if not (UseString[i] in ['a'..'z', '0'..'9', 'A'..'Z']) then
//    begin
//      StrTemp := StrTemp + UseString[i];
//    end;
//
//  end;
//  FOtherUseString := StrTemp;
end;

function TBarcodeScanMonitor.IsLegalLength(barcode: string): Boolean;
var
  i: Integer;
  len: string;
begin
  Result := False;
  //Form1.mmo1.Lines.Add('IsLegalLength==' + barcode);
  len := IntToStr(Length(barcode));
  for i := 0 to FBarcodeLengthStrings.Count - 1 do
  begin
    //Form1.mmo1.Lines.Add('IsLegalLength==' + 'F');
    if len = FBarcodeLengthStrings.Strings[i] then
    begin
      Result := True;
      Form1.mmo1.Lines.Add('IsLegalLength==' + 'T');
      Break;
    end;
  end;

end;

function TBarcodeScanMonitor.StartListenScan: Boolean;
begin
  Result := FIsInListening;

  if Result = False then
    Result := Self.Hook_Register();

  FIsInListening := Result;
end;

function TBarcodeScanMonitor.StopListenScan: Boolean;
begin
  FIsInListening := False;
  Result := Self.Hook_Unregister();
end;

function TBarcodeScanMonitor.StopNowInput: Boolean;
begin
  Self.ResetSession();
end;

end.

