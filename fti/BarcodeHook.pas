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
    vkCode: DWORD; //������
    scanCode: DWORD; //ɨ����
    flags: DWORD;
    Time: DWORD;
    dwExtraInfo: DWORD;
  end;

     (*
     ����: ���ɨ��ǹ��ɨ�趯��.��ʹ���ǵĳ�����windows�ĵ�ǰ�����, Ҳ���Լ�ص�.
     ԭ��: ����Keyboard hook�ķ�ʽʵ�ּ��. ��ʵɨ��ǹɨ��Ĺ����൱�ڼ��̿�������һ������,���Ļس��൱��ɨ�����
           ���ڲ�������Ϣhook����, ��صĽ��������ٷְ�׼ȷ, ����Ϊ: ������ʱ���λ, ��ʱ���ظ�, ��ʱ�ᶪ��һλ
           ���׼ȷ��Ҫ���, �����ַ���:
               1.[��ʵ��]Ϊɨ��ǹ����ɨ��ǰ׺�ͺ�׺, ������֤, �����صĽ�����������ǰ׺/��׺, ��������ؽ��.
               2.[δʵ��]�������뱾�����֤�㷨, �Լ�صĽ��������֤
     ���Է���: ���û��ɨ��ǹ, ��ʹ�ô����ģ��, ������ʹ��С����.
     ʹ�÷���:
    FBarReader:=TBarcodeScanMonitor.GetInstance();
    FBarReader.RelayKeyPress:=True;//�����������, �Ƿ�Ҫ������������ʾ����
    FBarReader.BarcodeLengths:='3,4'; //������ܵĳ���
    FBarReader.ScanMaxDurationSecond:=10;//ɨ�����������ʱ
    FBarReader.AlwaysDuplicatedRead:=False; //��ֹ����ֵ�ظ�
    FBarReader.CheckPrefixStr:=''; //ǰ׺��֤��
    FBarReader.CheckSuffixStr:='';//��׺��֤��
    FBarReader.AutoRemoveCheckStr:=True;
    FBarReader.HookedThreadId:=0; //0ΪOS����ļ���hook
    FBarReader.OnScanFinished:=self.OnScanFinished1; //��һ��ɨ��������¼�
    if FBarReader.StartListenScan()=False then  //��ʼ��������
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
    FFstTick: Integer; //��ʼ��¼�ĵ�һ��KEY����ʱ��
    FInputInterval: Integer; //������
    FFrontKeyTick: Integer; //ǰһ��KEY���ɵ����ʱ��
    FStartRecordStrInout: Boolean;
    FStartRecordValue: Boolean; //��ʼ��¼ֵ
    FScanFinished: TScanEvent;
    FScanStart: TScanStEvent; //��ʼ��¼�¼�
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
    function KeyPressedInUseCodeList(vkCode: string): Boolean; //���vkode�Ƿ�����Ҫ���ַ����б�����
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
    property FrontKeyTick: Integer read FFrontKeyTick; //ǰһ���ַ����������ʱ��
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

  function EncodeUniCode(Str: WideString): string; //�ַ�����>PDU
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
    //key := StringOfChar(Char(p^.vkCode), 1); //���������������ñ���������
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

    //��4������Ϊ0, ��ʾȫ�ֹ���
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
  //���tickʱ��
  if Self.FBarcodeSequence = '' then
  begin
    Self.FFirstKeyTime := Now();
    Self.FFstTick := GetTickCount64;
    Self.FStartRecordValue := True; //��Ϊ�ж��Ƿ����״��ַ����
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
  //����Ѿ���ʼ��¼������Ƿ��лس���
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
        Form1.mmo1.Lines.Add('ReadSingleKey:���ɨ��...');
        Self.DoScanFinished();
        Exit;
      end;
    end;
  end;
  //����Ƿ���delphi��shift capslock����
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
  //��ʼ��¼
  if not Self.FStartRecordStrInout then
  begin
    Self.FStartRecordStrInout := True;
  end;
  Self.FFrontKeyTick := GetTickCount;
  //�ۼ��ַ���
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
//{�û���Ҫ���һЩ��Ҫʶ��������ַ���������ȥ�޳����ִ�Сд��ĸ����Ϊʹ���ַ�����}
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

