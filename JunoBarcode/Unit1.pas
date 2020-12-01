unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, System.RegularExpressions, SHELLAPI, Vcl.ExtCtrls, BarcodeHook,
  Vcl.Menus, Tool;

type
  TForm1 = class(TForm)
    edtPPID: TEdit;
    edtLotID: TEdit;
    edtWaferNumber: TEdit;
    lbl3: TLabel;
    edtBarcode: TEdit;
    lbl4: TLabel;
    mmo1: TMemo;
    edtWaferID: TEdit;
    tmrDelayRun: TTimer;
    tmrRunLoadPG: TTimer;
    tmrCreateData: TTimer;
    tmrLoadEnd: TTimer;
    edtOperator: TEdit;
    lblInterval: TLabel;
    tmrInterval: TTimer;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    chk5: TCheckBox;
    chk6: TCheckBox;
    chk7: TCheckBox;
    chk8: TCheckBox;
    chk9: TCheckBox;
    chk10: TCheckBox;
    chk11: TCheckBox;
    chk12: TCheckBox;
    chk13: TCheckBox;
    chk14: TCheckBox;
    chk15: TCheckBox;
    chk16: TCheckBox;
    chk17: TCheckBox;
    chk18: TCheckBox;
    chk19: TCheckBox;
    chk20: TCheckBox;
    chk21: TCheckBox;
    chk22: TCheckBox;
    chk23: TCheckBox;
    chk24: TCheckBox;
    chk25: TCheckBox;
    btn5: TButton;
    btn6: TButton;
    chk26: TCheckBox;
    pm1: TPopupMenu;
    N1: TMenuItem;
    tmrCloseRepeatDataFile: TTimer;
    lblLoadEnd: TLabel;
    lblRepeatFile: TLabel;
    chkSaveLog: TCheckBox;
    btn10: TButton;
    btn11: TButton;
    lbl6: TLabel;
    edtCardName: TEdit;
    edtProber: TEdit;
    edtTester: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    btn2: TButton;
    pm2: TPopupMenu;
    N2: TMenuItem;
    btnF1: TButton;
    btnF5: TButton;
    btnMap: TButton;
    chkLock: TCheckBox;
    mm1: TMainMenu;
    N3: TMenuItem;
    tmrAutoCheckUpdate: TTimer;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function SplitWaferNumber(WaferStr: string): Boolean;
    procedure edtBarcodeChange(Sender: TObject);
    procedure AdjustBarcodeData;
    function JunoAutoRunCore: Boolean;
    function JunoAutoRunCoreNew: Boolean;
    procedure FormDestroy(Sender: TObject);
    procedure tmrDelayRunTimer(Sender: TObject);
    procedure tmrRunLoadPGTimer(Sender: TObject);
    function LoadPGFun: Boolean;
    function LoadPGFunNew: Boolean;
    function CreateData: Boolean;
    procedure btn3Click(Sender: TObject);
    procedure tmrCreateDataTimer(Sender: TObject);
    procedure tmrLoadEndTimer(Sender: TObject);
    procedure LoadPGEnd;
    procedure LoadPGEndNew;
    procedure LoadPGEndNewSec;
    procedure CloseChooseSationFun;
    procedure ChooseStationToClose;
    procedure CloseRepeatFileName;
    procedure tmrIntervalTimer(Sender: TObject);
    procedure edtBarcodeDblClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure chk3Click(Sender: TObject);
    procedure chk4Click(Sender: TObject);
    procedure chk5Click(Sender: TObject);
    procedure chk6Click(Sender: TObject);
    procedure chk7Click(Sender: TObject);
    procedure chk8Click(Sender: TObject);
    procedure chk9Click(Sender: TObject);
    procedure chk10Click(Sender: TObject);
    procedure chk11Click(Sender: TObject);
    procedure chk12Click(Sender: TObject);
    procedure chk13Click(Sender: TObject);
    procedure chk14Click(Sender: TObject);
    procedure chk15Click(Sender: TObject);
    procedure chk16Click(Sender: TObject);
    procedure chk17Click(Sender: TObject);
    procedure chk18Click(Sender: TObject);
    procedure chk19Click(Sender: TObject);
    procedure chk20Click(Sender: TObject);
    procedure chk21Click(Sender: TObject);
    procedure chk22Click(Sender: TObject);
    procedure chk23Click(Sender: TObject);
    procedure chk24Click(Sender: TObject);
    procedure chk25Click(Sender: TObject);
    procedure chk26Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure tmrCloseRepeatDataFileTimer(Sender: TObject);
    procedure mmo1Change(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure edtBarcodeClick(Sender: TObject);
    procedure edtCardNameClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure btnF1Click(Sender: TObject);
    procedure btnF5Click(Sender: TObject);
    procedure btnMapClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkLockClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure tmrAutoCheckUpdateTimer(Sender: TObject);
  private
    procedure JunoMainPGShowCheck;
    procedure CHKAllDisable;
    procedure CHKAllAble;
    procedure HookStart;
    procedure NextActionReadyTime(Time: TTimer);
    procedure RepeatFileNameClosePro;
    function CheckWindowStatus(MyHwnd: HWND; Title: string): Boolean;
    procedure AdjustBarcodePro;
    procedure ClearEdtPro;
    procedure FKeyActivate(Key: Integer);



    { Private declarations }
  public
    { Public declarations }
    procedure RefreshWaferID;
    procedure ShowMsg(Sender: TObject; Str: string);
    procedure MmoAdd(Str: string); overload;
    procedure MmoAdd(Str: string; IsLog: Integer); overload;
    function PPIDInputPro: Boolean;
    function CreateNewData: Boolean;
    procedure DelayRun(MS: LongInt);
    function MapSetupPro: Boolean;
    function CheckValue: Boolean;
    procedure MapManualSetup;
    procedure MapSetupManualNew;
    procedure SaveLotInfo;
    procedure LockAllChk(IsLock: Boolean);
    procedure UpdateProgram;
    function NewVerCheck: Boolean;
    procedure CheckNewVersion;
  end;

var
  Form1: TForm1;
  Arr: TArray<string>;
  HwndJuno: HWND; //主程序的句柄
  HwndJunoMap: HWND; //Map软件句柄
  HwndJunoMapSetup: HWND; //map设定界面句柄
  HwndJunoLoadProgram: HWND; //测试文件加载窗体的句柄
  HwndJunoCreateTestData: HWND; //新建测试数据窗体的句柄
  HwndOKBtn: HWND; //确定按钮的句柄
  //DeskFindHwndCount: LongInt;
  BoolFindJunoHwnd: Boolean; //是否找到主程序JUNO的句柄
  BoolAlreadyShowLoadPG, BoolAlreadyShowCreateData: Boolean;
  JunoAutoRunTime: Integer;
  JunoLoadPGRunTime: Integer;
  JunoCreateDataRunTime: Integer;
  HwndStr, ClassStr, TitleStr: TStrings;
  HwndAStation, HwndBStation: HWND;
  HwndPPID, HwndLoadPGEnter: HWND;
  HwndAStationCreate, HwndBStationCreate: HWND;
  HwndMapOperatorID, HwndMapLotID, HwndMapPPID, HwndMapEqID, HwndMapTesterID, HwndMapCardName, HwndMapYesBtn: HWND; //Map设定界面句柄
  HwndFileName, HwndOperator, HwndTag, HwndAutoFile, Hwnd1_25, Hwnd2_24, HwndWaferNumber, HwndCreateEnter: HWND;
  HwndCloseDataAStation, HwndCloseDataBStation, HwndCloseDataYesBtn: HWND; //关闭数据文件窗体所用句柄

  LoadEndRetryTime: Integer; //加载ppid后弹出的次数
  RepeatFileRetryTime: Integer; //新数据文件重名警告检测
  HwndLoadEndYes: HWND; //新测试文件警告窗体YES按钮
  HwndRepeatFileYes: HWND; //数据文件重名警告窗体YES按钮
  WaferIDArr: array[0..24] of string;
  FBarReader: TBarcodeScanMonitor;
  TimeNoShowLdPGForm: Integer;
  YESBtnClicked: Boolean;
  YesBtnClickTime: Integer;
  RepeatFileYesBtnClicked: Boolean;
  CardName: string;
  MapBool: Boolean;
  LogDay: string;
  WaferIDLock: Boolean; //waferid select permission

const
  TitleJunoTitle = 'JUNO Logger';
  TitleJunoMap = 'JUNO Maping';
  TitleJunoLoadProgram = '测试文件加载';
  TitleJunoCreateTestData = '新数据文件';
  TitleJunoMapASetup = '设定 - A';
  TitleJunoMapBSetup = '设定 - B';
  TitleJunoLoadEnd = '关闭窗口';
  TitleJunoChooseStation = 'DTS-Logger';
  TitleJunoCLoseData = '关闭数据文件';
  TitleJunoLoadEndYesBtn = '是';
  TitleRepeatFile = 'DTS-Logger';
  TitleRepeatFileYesBtn = '是';
  TitleOKBtn = '确定';
  JunoPGPath = ''; //juno程序路径
  LoadPGPPIDEdtCount = 2;
  LoadEndRetryTimeMax = 5; //加载ppid后弹出的确定框处理次数上限
  EdtCountFileName = 1; //lotID位置
  EdtCountOperator = 6; //操作员ID
  EdtCountTag = 8; //Tag
  EdtCountWaferNumber = 2; //waferID号
  TitleCreateAutoFile = '自动文件';
  TitleCreateEnterBtn = '确定';
  TitleMapEnterBtn = '确定';
  LogFilePath = '.\Barlog\BarcodeLog';
  DelayInterval = 2000; //函数处理过程间隔，防止出错
  PPIDInputRetryTime = 10; //F1弹出PPID界面检测尝试次数

implementation

uses
  JsonAdjust, Global, AutoUpdate;
{$R *.dfm}

function EnumChildWndProc(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
var
  WndClassName: array[0..254] of Char;
  WndCaption: array[0..254] of Char;
  Temp: array[0..255] of Char;
begin
  GetClassName(AhWnd, WndClassName, 254);
  GetWindowText(AhWnd, WndCaption, 254);
  SendMessage(AhWnd, WM_GETTEXT, 256, Integer(@Temp));

  with Form1.mmo1 do
  begin
    Lines.add('=>' + IntToStr(AhWnd) + '//' + string(WndClassName) + '//' + string(WndCaption) + '//' + Temp);
  end;

  Result := True;
end;

function EnumChildWndProcCheckLoadAndCreate(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
var
  WndClassName: array[0..254] of Char;
  WndCaption: array[0..254] of Char;
  Temp: array[0..255] of Char;
begin
  //GetClassName(AhWnd, WndClassName, 254);
  GetWindowText(AhWnd, WndCaption, 254);
  //SendMessage(AhWnd, WM_GETTEXT, 256, Integer(@Temp));
  if string(WndCaption) = TitleJunoLoadProgram then
  begin
    BoolAlreadyShowLoadPG := True;
  end;
  if string(WndCaption) = TitleJunoCreateTestData then
  begin
    BoolAlreadyShowCreateData := True;
  end;
//  with Form1.mmo1 do
//  begin
//    Lines.add('=>' + IntToStr(AhWnd) + '//' + string(WndClassName) + '//' + string(WndCaption) + '//' + Temp);
//  end;
  Result := True;
end;

function EnumChildWndProcTitle(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
var
  WndCaption: array[0..254] of Char;
  Temp: array[0..255] of Char;
begin
  GetWindowText(AhWnd, WndCaption, 254);
  //Inc(DeskFindHwndCount);
  if Pos(TitleJunoTitle, string(WndCaption)) > 0 then
  begin
    Form1.MmoAdd('Juno主程序已找到=' + IntToStr(AhWnd));
    HwndJuno := AhWnd;
    BoolFindJunoHwnd := True;
  end;
  if string(WndCaption) = TitleJunoLoadProgram then
  begin
    Form1.MmoAdd('=>测试文件加载窗体已存在=' + IntToStr(AhWnd));
    HwndJunoLoadProgram := AhWnd;
    BoolAlreadyShowLoadPG := True;
  end;
  if string(WndCaption) = TitleJunoCreateTestData then
  begin
    Form1.MmoAdd('=>新建测试数据窗体已存在=' + IntToStr(AhWnd));
    HwndJunoCreateTestData := AhWnd;
    BoolAlreadyShowCreateData := True;
  end;
  Result := True;

end;

procedure TForm1.AdjustBarcodeData;
var
  str: string;
  TempJs: BarcodeJs;
begin
  MmoAdd('AdjustBarcodeData:准备解析Barcode信息。');
  ClearEdtPro;
  if Trim(edtBarcode.Text) = '' then
    Exit;
  if not JsonAdj(Trim(edtBarcode.Text), TempJs) then
  begin
    MmoAdd('AdjustBarcodeData:二维码解析异常。');
  end
  else
  begin
    CHKAllDisable;
    edtPPID.Text := TempJs.PPID;
    edtLotID.Text := TempJs.LotID;
    if Pos('EAS', TempJs.LotID) = 0 then
    begin
      //eas lot must manual check wafer id
      edtWaferNumber.Text := TempJs.WaferNumber;
      SplitWaferNumber(TempJs.WaferNumber);
      chkLock.Checked := True;
    end
    else
    begin
      chkLock.Checked := False;
    end;

    edtOperator.Text := TempJs.UserID;
    edtProber.Text := TempJs.ProberID;
    edtTester.Text := TempJs.TesterID;

    MmoAdd('AdjustBarcodeData:解析完成。');
  end;
//  Arr := TRegEx.Split(Trim(edtBarcode.Text), '\,');
//  try
//    edtPPID.Text := Arr[0];
//    if Pos('_', Arr[0]) <> 4 then
//    begin
//      MmoAdd('AdjustBarcodeData:PPID信息错误！');
//      Exit;
//    end;
//    edtLotID.Text := Arr[1];
//    edtWaferNumber.Text := Arr[2];
//    if SplitWaferNumber(Arr[2]) then
//    begin
//      MmoAdd('AdjustBarcodeData:AdjustBarcodeData:Barcode解析成功。');
//      //此处添加AB按钮的显示，解析成功才会显示。
//
//
//    end;
//  except
//    on E: Exception do
//      MmoAdd('AdjustBarcodeData:扫码信息有误..');
//  end;

end;

procedure TForm1.btn10Click(Sender: TObject);
begin
  WhichStation := 'A';
  MmoAdd('已选择A站...');
  SaveLotInfo;
  AdjustBarcodePro;
  JunoAutoRunCoreNew;
end;

procedure TForm1.btn11Click(Sender: TObject);
begin
  WhichStation := 'B';
  MmoAdd('已选择B站...');
  SaveLotInfo;
  AdjustBarcodePro;
  JunoAutoRunCoreNew;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  if WhichStation = '' then
  begin
    ShowMessage('请选择站点');
    Exit;
  end;

  if not CheckValue then
  begin
    MmoAdd('必要数据缺失！');
    ShowMessage('Lot信息缺失，请核实！');
    Exit;
  end;
  MmoAdd('JunoAutoRunCoreNew:准备修改针卡界面数据...');
//  if WhichStation = 'A' then
//  begin
//    HwndJunoMapSetup := FindWindow(nil, TitleJunoMapASetup);
//  end;
//  if WhichStation = 'B' then
//  begin
//    HwndJunoMapSetup := FindWindow(nil, TitleJunoMapBSetup);
//  end;
//  MmoAdd('JunoAutoRunCoreNew:获得设定界面句柄成功，寻找关键句柄...');
  MapSetupManualNew;
//
//  if HwndJunoMapSetup > 0 then
//  begin
//
//  end
//  else
//  begin
//    ShowMessage('未发现Map设定窗体');
//    MmoAdd('map一键设定失败...');
//    Exit;
//  end;

  MmoAdd('JunoAutoRunCoreNew:Map设定完毕...');
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  ClearEdtPro;
  CHKAllDisable;
  chk26.Checked := False;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  WhichStation := 'B';
  MmoAdd('已选择B站...');
  JunoAutoRunCore;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  if WhichStation = '' then
  begin
    ShowMessage('请选择站点');
    Abort;
  end;
  if not CheckValue then
  begin
    MmoAdd('必要数据缺失！');
    ShowMessage('Lot信息缺失！');
    Abort;
  end;
  if PPIDInputPro then
  begin
    MmoAdd('测试文件加载成功！');
    Self.BringToFront;
  end;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
  if not CheckValue then
  begin
    MmoAdd('必要数据缺失！');
    ShowMessage('Lot信息缺失！');
    Abort;
  end;
  if CreateNewData then
  begin
    MmoAdd('测试数据文件新建成功！');
    Self.BringToFront;
  end;
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
  LoadPGEnd;
end;

procedure TForm1.btn9Click(Sender: TObject);
begin
  if FBarReader <> nil then
  begin
    FBarReader.StopListenScan;
    MmoAdd('解除扫描枪监控.');
  end;
end;

procedure TForm1.btnF1Click(Sender: TObject);
begin
  FKeyActivate(VK_F1);
end;

procedure TForm1.btnF5Click(Sender: TObject);
begin
  FKeyActivate(VK_F5);
end;

procedure TForm1.btnMapClick(Sender: TObject);
begin
  if not CheckValue then
  begin
    MmoAdd('必要数据缺失！');
    ShowMessage('Lot信息缺失！');
    Abort;
  end;

  MapManualSetup;
  Self.BringToFront;
end;

function TForm1.CheckValue: Boolean;
begin
  Result := True;
  if edtPPID.Text = '' then
    Result := False;
  if edtLotID.Text = '' then
    Result := False;
  if edtWaferID.Text = '' then
  begin
    MmoAdd('【EAS产品请手动选择片号】');
    Result := False;
  end;
  if edtOperator.Text = '' then
    Result := False;
  if edtProber.Text = '' then
    Result := False;
  if edtTester.Text = '' then
    Result := False;
  if edtCardName.Text = '' then
  begin
    MmoAdd('请扫描针卡信息！');
    edtCardName.SetFocus;
    Result := False;
  end;
end;

procedure TForm1.ClearEdtPro;
begin
  edtPPID.Text := '';
  edtLotID.Text := '';
  edtWaferNumber.Text := '';
  edtWaferID.Text := '';
  edtOperator.Text := '';
  edtProber.Text := '';
  edtTester.Text := '';
  edtCardName.Text := '';
end;

function TForm1.CheckWindowStatus(MyHwnd: HWND; Title: string): Boolean;
var
  ss: HWND;
  ss2: tagWINDOWINFO;
begin
  Result := False;
  ss := FindWindow(nil, PWideChar(Title));
  GetWindowInfo(ss, ss2);
  if (ss2.dwStyle and WS_VISIBLE) > 0 then
  begin
    Result := True;
  end;
end;

procedure TForm1.chk10Click(Sender: TObject);
begin
  if chk10.Checked then
  begin
    WaferIDArr[9] := '10';
  end
  else
  begin
    WaferIDArr[9] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk11Click(Sender: TObject);
begin
  if chk11.Checked then
  begin
    WaferIDArr[10] := '11';
  end
  else
  begin
    WaferIDArr[10] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk12Click(Sender: TObject);
begin
  if chk12.Checked then
  begin
    WaferIDArr[11] := '12';
  end
  else
  begin
    WaferIDArr[11] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk13Click(Sender: TObject);
begin
  if chk13.Checked then
  begin
    WaferIDArr[12] := '13';
  end
  else
  begin
    WaferIDArr[12] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk14Click(Sender: TObject);
begin
  if chk14.Checked then
  begin
    WaferIDArr[13] := '14';
  end
  else
  begin
    WaferIDArr[13] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk15Click(Sender: TObject);
begin
  if chk15.Checked then
  begin
    WaferIDArr[14] := '15';
  end
  else
  begin
    WaferIDArr[14] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk16Click(Sender: TObject);
begin
  if chk16.Checked then
  begin
    WaferIDArr[15] := '16';
  end
  else
  begin
    WaferIDArr[15] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk17Click(Sender: TObject);
begin
  if chk17.Checked then
  begin
    WaferIDArr[16] := '17';
  end
  else
  begin
    WaferIDArr[16] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk18Click(Sender: TObject);
begin
  if chk18.Checked then
  begin
    WaferIDArr[17] := '18';
  end
  else
  begin
    WaferIDArr[17] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk19Click(Sender: TObject);
begin
  if chk19.Checked then
  begin
    WaferIDArr[18] := '19';
  end
  else
  begin
    WaferIDArr[18] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk1Click(Sender: TObject);
begin
  if chk1.Checked then
  begin
    WaferIDArr[0] := '01';
  end
  else
  begin
    WaferIDArr[0] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk20Click(Sender: TObject);
begin
  if chk20.Checked then
  begin
    WaferIDArr[19] := '20';
  end
  else
  begin
    WaferIDArr[19] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk21Click(Sender: TObject);
begin
  if chk21.Checked then
  begin
    WaferIDArr[20] := '21';
  end
  else
  begin
    WaferIDArr[20] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk22Click(Sender: TObject);
begin
  if chk22.Checked then
  begin
    WaferIDArr[21] := '22';
  end
  else
  begin
    WaferIDArr[21] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk23Click(Sender: TObject);
begin
  if chk23.Checked then
  begin
    WaferIDArr[22] := '23';
  end
  else
  begin
    WaferIDArr[22] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk24Click(Sender: TObject);
begin
  if chk24.Checked then
  begin
    WaferIDArr[23] := '24';
  end
  else
  begin
    WaferIDArr[23] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk25Click(Sender: TObject);
begin
  if chk25.Checked then
  begin
    WaferIDArr[24] := '25';
  end
  else
  begin
    WaferIDArr[24] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk26Click(Sender: TObject);
var
  I: Integer;
begin
  if chk26.Checked and not chkLock.Checked then
  begin
    for I := 0 to 24 do
    begin
      WaferIDArr[I] := IntToStr(I + 1);
    end;
    CHKAllAble;

  end
  else
  begin
    if not chk26.Checked and not chkLock.Checked then
    begin
      for I := 0 to 24 do
      begin
        WaferIDArr[I] := '0';
      end;
      CHKAllDisable;
    end;
  end;
end;

procedure TForm1.chk2Click(Sender: TObject);
begin
  if chk2.Checked then
  begin
    WaferIDArr[1] := '02';
  end
  else
  begin
    WaferIDArr[1] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk3Click(Sender: TObject);
begin
  if chk3.Checked then
  begin
    WaferIDArr[2] := '03';
  end
  else
  begin
    WaferIDArr[2] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk4Click(Sender: TObject);
begin
  if chk4.Checked then
  begin
    WaferIDArr[3] := '04';
  end
  else
  begin
    WaferIDArr[3] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk5Click(Sender: TObject);
begin
  if chk5.Checked then
  begin
    WaferIDArr[4] := '05';
  end
  else
  begin
    WaferIDArr[4] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk6Click(Sender: TObject);
begin
  if chk6.Checked then
  begin
    WaferIDArr[5] := '06';
  end
  else
  begin
    WaferIDArr[5] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk7Click(Sender: TObject);
begin
  if chk7.Checked then
  begin
    WaferIDArr[6] := '07';
  end
  else
  begin
    WaferIDArr[6] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk8Click(Sender: TObject);
begin
  if chk8.Checked then
  begin
    WaferIDArr[7] := '08';
  end
  else
  begin
    WaferIDArr[7] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.chk9Click(Sender: TObject);
begin
  if chk9.Checked then
  begin
    WaferIDArr[8] := '09';
  end
  else
  begin
    WaferIDArr[8] := '00';
  end;
  RefreshWaferID;
end;

procedure TForm1.JunoMainPGShowCheck;

  function EnumChildWndProcJunoMainPG(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndCaption: array[0..254] of Char;
    Temp: array[0..255] of Char;
  begin
    AlParam := 0;
    GetWindowText(AhWnd, WndCaption, 254);
    //Inc(DeskFindHwndCount);
    if Pos(TitleJunoTitle, string(WndCaption)) > 0 then
    begin
      Form1.MmoAdd('Juno主程序进程已找到=' + IntToStr(AhWnd));
      HwndJuno := AhWnd;
      Result := False;
    end;
    Result := True;
  end;

var
  HwndTemp: HWND;
  Tag: tagWINDOWINFO;
begin
  MmoAdd('Juno重启后主程序检测中...');
  EnumWindows(@EnumChildWndProcJunoMainPG, 0);
  if HwndJuno > 0 then
  begin
    MmoAdd('juno==>' + IntToStr(HwndJuno));
    GetWindowInfo(HwndJuno, Tag);
    if (Tag.dwStyle and WS_VISIBLE) > 0 then
    begin
      tmrDelayRun.Enabled := False;
      JunoAutoRunCore;
    end
    else
    begin
      MmoAdd('测试文件加载窗体还未显示，重试中...');
    end;
  end;

end;

function TForm1.CreateData: Boolean;

  function EnumChildWndProcForCreateData(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndClassName: array[0..254] of Char;
    WndCaption: array[0..254] of Char;
    //Temp: array[0..255] of Char;
  begin
    GetClassName(AhWnd, WndClassName, 254);
    GetWindowText(AhWnd, WndCaption, 254);
    HwndStr.Add(IntToStr(AhWnd));
    ClassStr.Add(string(WndClassName));
    TitleStr.Add(string(WndCaption));
    Result := True;
  end;

var
  I: Integer;
  Count: Integer;
  EdtCount: Integer; //Edt第三个为lotid位置
  RetryTime: Integer;
begin
  MmoAdd('CreateData:新数据文件处理流程...');
  Result := False;
  Count := 0;
  EdtCount := 0;
    //F5新建测试数据窗体功能
    //检测新建测试数据窗体是否存在，否则则前置Juno主程序模拟F5f
  if FindWindow(nil, TitleJunoCreateTestData) > 0 then
  begin
    MmoAdd('CreateData:发现新建测试数据窗体...');
    YESBtnClicked := True;
    MmoAdd('CreateData:已关闭新测试文件窗体警告检测...');
    if HwndStr = nil then
    begin
      HwndStr := TStringList.Create;
    end
    else
    begin
      HwndStr.Clear;
    end;
    if ClassStr = nil then
    begin
      ClassStr := TStringList.Create;
    end
    else
    begin
      ClassStr.Clear;
    end;
    if TitleStr = nil then
    begin
      TitleStr := TStringList.Create;
    end
    else
    begin
      TitleStr.Clear;
    end;
    MmoAdd('CreateData:初始化数据容器list完毕...');
    //ShowWindow(HwndJuno, SW_RESTORE);
    //ShowWindow(HwndJunoLoadProgram, SW_RESTORE);
    //遍历测试文件加载窗体寻找站点选项和PPID编辑窗口和确定按钮
    EnumChildWindows(FindWindow(nil, TitleJunoCreateTestData), @EnumChildWndProcForCreateData, 1);
    for I := 0 to HwndStr.Count - 1 do
    begin
      if Pos('&A', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateData:A站获取成功..');
        HwndAStationCreate := StrToInt64(HwndStr[I]);
        Inc(Count);
        Continue;
      end;
      if Pos('&B', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateData:B站获取成功...');
        HwndBStationCreate := StrToInt64(HwndStr[I]);
        Inc(Count);
        Continue;
      end;
      if Pos('Edit', ClassStr[I]) > 0 then
      begin
        Inc(EdtCount);

        case EdtCount of
          EdtCountFileName:
            begin
              MmoAdd('CreateData:lotname获取成功...');
              HwndFileName := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountWaferNumber:
            begin
              MmoAdd('CreateData:wafernumber获取成功...');
              HwndWaferNumber := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountOperator:
            begin
              MmoAdd('CreateData:OperatorID获取成功...');
              HwndOperator := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountTag:
            begin
              MmoAdd('CreateData:Commit获取成功...');
              HwndTag := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
        end;
      end;
      if Pos(TitleCreateAutoFile, TitleStr[I]) > 0 then
      begin
        //自动文件按钮
        MmoAdd('CreateData:自动文件按钮获取成功...');
        Inc(Count);
        HwndAutoFile := StrToInt64(HwndStr[I]);
      end;

      if Pos(TitleCreateEnterBtn, TitleStr[I]) > 0 then
      begin
        //确定按钮
        MmoAdd('CreateData:确定按钮获取成功...');
        Inc(Count);
        HwndCreateEnter := StrToInt64(HwndStr[I]);
      end;
      if Count = 8 then
      begin
        MmoAdd('CreateData:新数据文件窗体8项参数已经获取成功，退出循环...');
        Break;
      end;
    end;
    if Count <> 8 then
    begin
      MmoAdd('CreateData:新数据文件窗体8项参数获取失败。请联系工程师处理...');
      HwndStr.Clear;
      TitleStr.Clear;
      ClassStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(TitleStr);
      FreeAndNil(ClassStr);
      Exit;
    end
    else
    begin
      MmoAdd('CreateData:新数据文件窗体参数获取成功，准备录入数据...');
      HwndStr.Clear;
      TitleStr.Clear;
      ClassStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(TitleStr);
      FreeAndNil(ClassStr);
    end;
    //新数据文件窗体处理流程
    //station站选择
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateData:A-Station 勾选第' + IntToStr(RetryTime) + '次操作...');
        SendMessage(HwndAStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateData:A-Station勾选操作失败，程序退出，请检查！');
        Exit;
      end;
    end;
    if WhichStation = 'B' then
    begin
      RetryTime := 0;
      while SendMessage(HwndBStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateData:B-Station 勾选第' + IntToStr(RetryTime) + '次操作...');
        SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateData:B-Station 勾选操作失败，程序退出，请检查！');
        Exit;
      end;
    end;
    //lotid填入操作
    MmoAdd('CreateData:Station勾选操作成功...');
    MmoAdd('CreateData:准备填入数据...');
    SendMessage(HwndFileName, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateData:lotid已经设置');
    SendMessage(HwndTag, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateData:tag已经设置');
    SendMessage(HwndOperator, WM_SETTEXT, 255, LongInt(PChar(edtOperator.Text)));
    MmoAdd('CreateData:Operator已经设置');
    RetryTime := 0;
    while SendMessage(HwndAutoFile, BM_GETCHECK, 0, 0) = 0 do
    begin
      MmoAdd('CreateData:自动文件按钮第' + IntToStr(RetryTime) + '次操作...');
        //SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        //SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
      SendMessage(HwndAutoFile, BM_CLICK, 0, 0);
      Inc(RetryTime);
    end;
    if RetryTime > 6 then
    begin
      MmoAdd('CreateData:自动文件按钮无法点击，程序错误，请联系工程师处理！');
      Exit
    end;
    SendMessage(HwndWaferNumber, WM_SETTEXT, 255, LongInt(PChar(Trim(edtWaferID.Text))));
    MmoAdd('CreateData:wafernumber已经设置');
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONUP, 0, 0);
    SendMessage(HwndCreateEnter, BM_CLICK, 0, 0);
    MmoAdd('CreateData:确定按钮已发送点击...。');
    MmoAdd('CreateData:新数据文件已经设置完毕。');
    tmrCreateData.Enabled := False;
    Result := True;
  end
  else
  begin
    MmoAdd('未发现新数据文件窗体，准备前置主程序...');
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('CreateData:主程序未发现，请重启JUNO主程序...');
      Exit;
    end;
    MmoAdd('CreateData:主程序存在，准备前置JUNO主程序...');
    SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJuno, SW_NORMAL);
    MmoAdd('主程序已前置，准备启动热键...');
    keybd_event(VK_F5, 0, 0, 0);
    keybd_event(VK_F5, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('F5已激活...');
    NextActionReadyTime(tmrCreateData);
    MmoAdd('重新检测新数据文件窗体...');
  end;
end;

function TForm1.CreateNewData: Boolean;

  function EnumChildWndProcForCreateData(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndClassName: array[0..254] of Char;
    WndCaption: array[0..254] of Char;
    //Temp: array[0..255] of Char;
  begin
    GetClassName(AhWnd, WndClassName, 254);
    GetWindowText(AhWnd, WndCaption, 254);
    HwndStr.Add(IntToStr(AhWnd));
    ClassStr.Add(string(WndClassName));
    TitleStr.Add(string(WndCaption));
    Result := True;
  end;

var
  I: Integer;
  Count: Integer;
  EdtCount: Integer; //Edt第三个为lotid位置
  RetryTime: Integer;
  HwndTemp: HWND;
  FormTag: tagWINDOWINFO;
begin
  MmoAdd('CreateNewData:新数据文件处理流程...');
  Result := False;
  Count := 0;
  EdtCount := 0;
    //F5新建测试数据窗体功能
    //检测新建测试数据窗体是否存在，否则则前置Juno主程序模拟F5
  HwndTemp := FindWindow(nil, TitleJunoCreateTestData);
  if HwndTemp > 0 then
  begin
    MmoAdd('CreateNewData:发现新建测试数据窗体...');
    GetWindowInfo(HwndTemp, FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
      MmoAdd('CreateNewData:发现测试文件加载窗体但未显示,等待窗体显示中...');
      Exit;
    end;
    if HwndStr = nil then
    begin
      HwndStr := TStringList.Create;
    end
    else
    begin
      HwndStr.Clear;
    end;
    if ClassStr = nil then
    begin
      ClassStr := TStringList.Create;
    end
    else
    begin
      ClassStr.Clear;
    end;
    if TitleStr = nil then
    begin
      TitleStr := TStringList.Create;
    end
    else
    begin
      TitleStr.Clear;
    end;
    MmoAdd('CreateNewData:初始化数据容器list完毕...');
    //ShowWindow(HwndJuno, SW_RESTORE);
    //ShowWindow(HwndJunoLoadProgram, SW_RESTORE);
    //遍历测试文件加载窗体寻找站点选项和PPID编辑窗口和确定按钮
    EnumChildWindows(HwndTemp, @EnumChildWndProcForCreateData, 1);
    for I := 0 to HwndStr.Count - 1 do
    begin
      if Pos('&A', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateNewData:A站获取成功..');
        HwndAStationCreate := StrToInt64(HwndStr[I]);
        Inc(Count);
        Continue;
      end;
      if Pos('&B', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateNewData:B站获取成功...');
        HwndBStationCreate := StrToInt64(HwndStr[I]);
        Inc(Count);
        Continue;
      end;
      if Pos('Edit', ClassStr[I]) > 0 then
      begin
        Inc(EdtCount);

        case EdtCount of
          EdtCountFileName:
            begin
              MmoAdd('CreateNewData:lotname获取成功...');
              HwndFileName := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountWaferNumber:
            begin
              MmoAdd('CreateNewData:wafernumber获取成功...');
              HwndWaferNumber := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountOperator:
            begin
              MmoAdd('CreateNewData:OperatorID获取成功...');
              HwndOperator := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountTag:
            begin
              MmoAdd('CreateNewData:Commit获取成功...');
              HwndTag := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
        end;
      end;
      if Pos(TitleCreateAutoFile, TitleStr[I]) > 0 then
      begin
        //自动文件按钮
        MmoAdd('CreateNewData:自动文件按钮获取成功...');
        Inc(Count);
        HwndAutoFile := StrToInt64(HwndStr[I]);
      end;

      if Pos(TitleCreateEnterBtn, TitleStr[I]) > 0 then
      begin
        //确定按钮
        MmoAdd('CreateNewData:确定按钮获取成功...');
        Inc(Count);
        HwndCreateEnter := StrToInt64(HwndStr[I]);
      end;
      if Count = 8 then
      begin
        MmoAdd('CreateNewData:新数据文件窗体8项参数已经获取成功，退出循环...');
        Break;
      end;
    end;
    if Count <> 8 then
    begin
      MmoAdd('CreateNewData:新数据文件窗体8项参数获取失败。请联系工程师处理...');
      HwndStr.Clear;
      TitleStr.Clear;
      ClassStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(TitleStr);
      FreeAndNil(ClassStr);
      Exit;
    end
    else
    begin
      MmoAdd('CreateNewData:新数据文件窗体参数获取成功，准备录入数据...');
      HwndStr.Clear;
      TitleStr.Clear;
      ClassStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(TitleStr);
      FreeAndNil(ClassStr);
    end;
    //新数据文件窗体处理流程
    //station站选择
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateNewData:A-Station 勾选第' + IntToStr(RetryTime) + '次操作...');
        SendMessage(HwndAStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateNewData:A-Station勾选操作失败，程序退出，请检查！');
        Exit;
      end;
    end;
    if WhichStation = 'B' then
    begin
      RetryTime := 0;
      while SendMessage(HwndBStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateNewData:B-Station 勾选第' + IntToStr(RetryTime) + '次操作...');
        SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateNewData:B-Station 勾选操作失败，程序退出，请检查！');
        Exit;
      end;
    end;
    //lotid填入操作
    MmoAdd('CreateNewData:Station勾选操作成功...');
    MmoAdd('CreateNewData:准备填入数据...');
    SendMessage(HwndFileName, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateNewData:lotid已经设置');
    SendMessage(HwndTag, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateNewData:tag已经设置');
    SendMessage(HwndOperator, WM_SETTEXT, 255, LongInt(PChar(edtOperator.Text)));
    MmoAdd('CreateNewData:Operator已经设置');
    RetryTime := 0;
    while SendMessage(HwndAutoFile, BM_GETCHECK, 0, 0) = 0 do
    begin
      MmoAdd('CreateData:自动文件按钮第' + IntToStr(RetryTime) + '次操作...');
        //SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        //SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
      SendMessage(HwndAutoFile, BM_CLICK, 0, 0);
      Inc(RetryTime);
    end;
    if RetryTime > 6 then
    begin
      MmoAdd('CreateData:自动文件按钮无法点击，程序错误，请联系工程师处理！');
      Exit
    end;
    SendMessage(HwndWaferNumber, WM_SETTEXT, 255, LongInt(PChar(Trim(edtWaferID.Text))));
    MmoAdd('CreateData:wafernumber已经设置');
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONUP, 0, 0);
    PostMessage(HwndCreateEnter, BM_CLICK, 0, 0);
    MmoAdd('CreateNewData:确定按钮已发送点击...。');
    MmoAdd('CreateNewData:新数据文件已经设置完毕。');
    Result := True;
  end
  else
  begin
    //MmoAdd('未发现新数据文件窗体，准备前置主程序...');
    ShowMessage('未发现新数据文件窗体');
  end;

end;

procedure TForm1.DelayRun(MS: LongInt);
var
  FirstTickCount, Now: LongInt;
begin
  FirstTickCount := GetTickCount();
  repeat
    Application.ProcessMessages;
    Now := GetTickCount();
  until (Now - FirstTickCount >= MS) or (Now < FirstTickCount);
end;

procedure TForm1.AdjustBarcodePro;
var
  i: Integer;
begin
  if Trim(edtBarcode.Text) <> '' then
  begin
    for i := 0 to 24 do
    begin
      WaferIDArr[i] := '0';
    end;
    CHKAllDisable;
    edtPPID.Text := '';
    edtLotID.Text := '';
    edtWaferNumber.Text := '';
    edtWaferID.Text := '';
    Arr := TRegEx.Split(Trim(edtBarcode.Text), '\,');
    edtPPID.Text := Arr[0];
    edtLotID.Text := Arr[1];
    edtWaferNumber.Text := Arr[2];
    SplitWaferNumber(Arr[2]);
    edtWaferID.Text := Trim(edtWaferID.Text);
  end;
end;

procedure TForm1.edtBarcodeChange(Sender: TObject);
var
  Str: string;
begin
  Str := UpperCase(Trim(edtBarcode.Text));
  if Pos('}', Str) <> Length(Str) then
    Exit;
  if Pos('{', Str) <> 1 then
    Exit;
  AdjustBarcodeData;
  LockAllChk(WaferIDLock);
  edtCardName.SetFocus;

end;

procedure TForm1.edtBarcodeClick(Sender: TObject);
begin
  if edtBarcode.Text <> '' then
  begin
    edtBarcode.Text := '';
    ClearEdtPro;
  end;
end;

procedure TForm1.edtBarcodeDblClick(Sender: TObject);
begin
//  if edtBarcode.Text <> '' then
//  begin
//    edtBarcode.Text := '';
//    ClearEdtPro;
//  end;
end;

procedure TForm1.edtCardNameClick(Sender: TObject);
begin
  edtCardName.Text := '';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WhichStation := '';
  if edtBarcode.Text <> '' then
  begin
    edtBarcode.Text := '';
    ClearEdtPro;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  mmo1.Lines.Clear;
  LogDay := DateToStr(Now);
  Self.Caption := Self.Caption + JunoVersion;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FBarReader.Free;
end;

function TForm1.JunoAutoRunCore: Boolean;
begin
  Result := False;
  TimeNoShowLdPGForm := 0;
//EnumWindows(@EnumChildWndProcTitle, 0);
//ShellExecute(Handle, 'open', JunoPGPath, '-s', '', SW_SHOWNORMAL);
//SW_HIDE,SW_MAXIMIZE,SW_MINIMIZE,SW_RESTORE,SW_SHOW,SW_SHOWDEFAULT,SW_SHOWMAXIMIZED,SW_SHOWMINIMIZED,SW_SHOWMINNOACTIVE,SW_SHOWNA,SW_SHOWNOACTIVATE,SW_SHOWNORMAL
  try
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('JunoAutoRunCore:Juno主程序未启动,程序已退出！');
      Exit;
    end
    else
    begin
      BoolFindJunoHwnd := True;
      HwndJuno := FindWindow(nil, TitleJunoTitle);
    end;
    if FindWindow(nil, TitleJunoLoadProgram) > 0 then
    begin
      MmoAdd('JunoAutoRunCore:Juno测试文件加载窗体已经存在，准备关闭！');
      SendMessage(FindWindow(nil, TitleJunoLoadProgram), WM_CLOSE, 0, 0);
      MmoAdd('测试文件加载窗体存在，已关闭...');
    end;
    if FindWindow(nil, TitleJunoCreateTestData) > 0 then
    begin
      MmoAdd('JunoAutoRunCore:Juno新数据文件窗体已经存在，准备关闭！');
      SendMessage(FindWindow(nil, TitleJunoCreateTestData), WM_CLOSE, 0, 0);
      MmoAdd('新数据文件窗体存在，已关闭...');
    end;

  //最前段显示Juno主程序，否则热键无法使用F1、F5
    MmoAdd('JunoAutoRunCore:准备前置主程序...');
    SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJuno, SW_NORMAL);
    MmoAdd('JunoAutoRunCore:主程序已前置，准备启动热键...');
    keybd_event(VK_F1, 0, 0, 0);
    keybd_event(VK_F1, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('JunoAutoRunCore:F1已激活...');
  //热键F1按了后进行测试文件加载窗体的检测。
    MmoAdd('JunoAutoRunCore:倒计时开始...');
  //lblInterval.Caption := IntToStr(StrToInt(tmrRunLoadPG.Interval.ToString) div 1000);
    NextActionReadyTime(tmrRunLoadPG);
    Result := True;
  except
    on E: Exception do
      MmoAdd('JunoAutoRunCore:JunoAutoRunCore:程序错误...');
  end;

end;

function TForm1.JunoAutoRunCoreNew: Boolean;
var
  PPIDRetry: Integer;
  FormTag: TWindowInfo;
  child: HWND;
  TempTitle: array[0..254] of Char;
  ClassName, TitleName: string;
begin
  Result := False;
  TimeNoShowLdPGForm := 0;
//EnumWindows(@EnumChildWndProcTitle, 0);
//ShellExecute(Handle, 'open', JunoPGPath, '-s', '', SW_SHOWNORMAL);
//SW_HIDE,SW_MAXIMIZE,SW_MINIMIZE,SW_RESTORE,SW_SHOW,SW_SHOWDEFAULT,SW_SHOWMAXIMIZED,SW_SHOWMINIMIZED,SW_SHOWMINNOACTIVE,SW_SHOWNA,SW_SHOWNOACTIVATE,SW_SHOWNORMAL
  try
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('JunoAutoRunCoreNew:Juno主程序未启动,程序已退出！');
      Abort;
    end
    else
    begin
      BoolFindJunoHwnd := True;
      HwndJuno := FindWindow(nil, TitleJunoTitle);
    end;
    if FindWindow(nil, TitleJunoLoadProgram) > 0 then
    begin
      MmoAdd('JunoAutoRunCoreNew:Juno测试文件加载窗体已经存在，准备关闭！');
      SendMessage(FindWindow(nil, TitleJunoLoadProgram), WM_CLOSE, 0, 0);
      MmoAdd('JunoAutoRunCoreNew:测试文件加载窗体存在，已关闭...');
    end;
    if FindWindow(nil, TitleJunoCreateTestData) > 0 then
    begin
      MmoAdd('JunoAutoRunCore:Juno新数据文件窗体已经存在，准备关闭！');
      SendMessage(FindWindow(nil, TitleJunoCreateTestData), WM_CLOSE, 0, 0);
      MmoAdd('JunoAutoRunCoreNew:新数据文件窗体存在，已关闭...');
    end;

  //最前端显示Juno主程序，否则热键无法使用F1、F5
    MmoAdd('JunoAutoRunCore:准备前置主程序...');
    SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJuno, SW_NORMAL);
    MmoAdd('JunoAutoRunCoreNew:主程序已前置，准备启动热键...');
    keybd_event(VK_F1, 0, 0, 0);
    keybd_event(VK_F1, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('JunoAutoRunCoreNew:F1已激活...');
  //热键F1按了后进行测试文件加载窗体的检测。
    DelayRun(DelayInterval);
  //检测测试文件加载窗体
    MmoAdd('JunoAutoRunCoreNew:处理测试文件加载窗体...');
    PPIDRetry := 0; //初始化尝试值。
    while (FindWindow(nil, TitleJunoLoadProgram) = 0) do
    begin
      if PPIDRetry > PPIDInputRetryTime then
      begin
        MmoAdd('JunoAutoRunCoreNew:测试文件窗体40S检测超时...');
        Exit;
      end;
      //窗体未创建，等待下一次检测。
      MmoAdd('JunoAutoRunCoreNew:测试文件加载窗体窗体未创建，等待下一次检测...');
      DelayRun(DelayInterval);
      Inc(PPIDRetry);
    end;

    if FindWindow(nil, TitleJunoLoadProgram) > 0 then
    begin
     //处理PPID加测
      //处理窗口是否显示
//            GetWindowInfo(Handle, FormTag);
//      if (FormTag.dwStyle and WS_VISIBLE) = 0 then
//      begin
//
//      end;
      MmoAdd('JunoAutoRunCoreNew:测试文件加载窗体已创建...');
      PPIDRetry := 0; //初始化尝试值。

      while PPIDRetry <= PPIDInputRetryTime do
      begin
        GetWindowInfo(Handle, FormTag);
        if (FormTag.dwStyle and WS_VISIBLE) = 0 then
        begin
            //窗体未显示，继续等待。
          MmoAdd('JunoAutoRunCoreNew:测试文件加载窗体未显示，等待下一次检测...');
          DelayRun(DelayInterval);
        end
        else
        begin
          MmoAdd('JunoAutoRunCoreNew:测试文件加载窗体已经显示...');
          Break;
        end;
        Inc(PPIDRetry);
      end;

      DelayRun(DelayInterval);
      MmoAdd('JunoAutoRunCoreNew:发现测试文件加载窗体...');

      if not PPIDInputPro then
      begin
        MmoAdd('JunoAutoRunCoreNew:测试文件加载过程处理失败...');
        Exit;
      end;

       //处理2次弹窗，但是也有可能一次不用处理
      MmoAdd('JunoAutoRunCoreNew:处理测试文件加载窗体成功...');
      DelayRun(DelayInterval);
      MmoAdd('JunoAutoRunCoreNew:处理关闭窗口1...');
      LoadPGEndNew;
      DelayRun(DelayInterval);
        //如果还是有确定弹窗则需要再关闭一次。
//        if FindWindow(nil, TitleJunoLoadEnd) > 0 then
//        begin
//          DelayRun(DelayInterval);
//          LoadPGEndNewSec;
//
//          //第二个弹窗弹出来则表示需要关闭之前已经创建好的数据。
//          if FindWindow(nil, TitleJunoChooseStation) > 0 then
//          begin
//            //关闭选站关闭数据提示
//            DelayRun(DelayInterval);
//            CloseChooseSationFun;
//            //选站关闭数据
//            DelayRun(DelayInterval);
//            ChooseStationToClose;
//          end;
//        end;
      MmoAdd('JunoAutoRunCoreNew:处理关闭窗口2...');
      LoadPGEndNewSec; //处理第二次可能的弹窗
      DelayRun(DelayInterval * 2);
      MmoAdd('JunoAutoRunCoreNew:处理dts-logger提示...');
      CloseChooseSationFun; //处理dts-logger提示
      DelayRun(DelayInterval);
      MmoAdd('JunoAutoRunCoreNew:处理选站点清除数据窗口...');
      ChooseStationToClose; //处理选站点清除数据窗口
      DelayRun(DelayInterval * 2);

      MmoAdd('JunoAutoRunCoreNew:处理新创建数据文件窗体...');
          // 新数据文件窗体处理
      if FindWindow(nil, TitleJunoCreateTestData) > 0 then
      begin
            //新创建数据文件
        DelayRun(DelayInterval);
        CreateNewData;
      end
      else
      begin
          //前置JUNO主程序，模拟F5
        MmoAdd('JunoAutoRunCoreNew:未发现数据窗体，准备前置JUNO主程序...');
        HwndJuno := FindWindow(nil, TitleJunoTitle);
        SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
        SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
        ShowWindow(HwndJuno, SW_NORMAL);
        MmoAdd('JunoAutoRunCoreNew:主程序已前置，准备启动热键...');
        keybd_event(VK_F5, 0, 0, 0);
        keybd_event(VK_F5, 0, KEYEVENTF_KEYUP, 0);
            //处理新数据创建过程;
        MmoAdd('JunoAutoRunCoreNew:F5已激活...');
        MmoAdd('JunoAutoRunCoreNew:重新处理新创建数据文件窗体...');
        DelayRun(DelayInterval * 2);
        CreateNewData;
      end;

          //处理可能存在的数据重名窗体
      MmoAdd('JunoAutoRunCoreNew:处理数据重名窗体...');
      DelayRun(DelayInterval);
      if FindWindow(nil, TitleJunoChooseStation) > 0 then
      begin
        DelayRun(DelayInterval);
        CloseRepeatFileName;
      end;
        //Map窗体数据录入
        //前置JUNO Maping软件
      MmoAdd('JunoAutoRunCoreNew:处理Maping窗体...');
      // 寻找Map窗体


      if HwndJunoMap = 0 then
      begin
        MmoAdd('JunoAutoRunCoreNew:未发现JUNO Maping窗体...');
      end;
      //HwndJunoMap := FindWindow(nil, TitleJunoMap);
      SetWindowPos(HwndJunoMap, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
      SetWindowPos(HwndJunoMap, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
      ShowWindow(HwndJunoMap, SW_NORMAL);
      MmoAdd('JunoAutoRunCoreNew:主程序已前置，准备启动热键...');
        //alt+C
      keybd_event(VK_MENU, 0, 0, 0);
      keybd_event(67, 0, 0, 0);
      keybd_event(67, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
        //A站直接按enter按键
      if WhichStation = 'A' then
      begin
        keybd_event(VK_RETURN, 0, 0, 0);
        keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
      end;
        //B站需要按一次下箭头，再按enter按键
      if WhichStation = 'B' then
      begin
        keybd_event(VK_DOWN, 0, 0, 0);
        keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
        keybd_event(VK_RETURN, 0, 0, 0);
        keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
      end;
        //alt+e 打开设定项
      keybd_event(VK_MENU, 0, 0, 0);
      keybd_event(69, 0, 0, 0);
      keybd_event(69, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
        //7次下箭头
      keybd_event(VK_DOWN, 0, 0, 0);
      keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_DOWN, 0, 0, 0);
      keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_DOWN, 0, 0, 0);
      keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_DOWN, 0, 0, 0);
      keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_DOWN, 0, 0, 0);
      keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_DOWN, 0, 0, 0);
      keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_DOWN, 0, 0, 0);
      keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
        //enter 进入设定界面
      keybd_event(VK_RETURN, 0, 0, 0);
      keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
      DelayRun(DelayInterval);
        //修改界面数据
      MmoAdd('JunoAutoRunCoreNew:准备修改针卡界面数据...');
      if WhichStation = 'A' then
      begin
        HwndJunoMapSetup := FindWindow(nil, TitleJunoMapASetup);
      end;
      if WhichStation = 'B' then
      begin
        HwndJunoMapSetup := FindWindow(nil, TitleJunoMapBSetup);
      end;
      MmoAdd('JunoAutoRunCoreNew:获得设定界面句柄成功，寻找关键句柄...');

      if HwndJunoMapSetup > 0 then
      begin
        MapSetupPro;
      end;

      MmoAdd('JunoAutoRunCoreNew:Map设定完毕...');
        //ALT热键配合选站
        //Alt热键选中设定窗体
        //修改窗体值
      MmoAdd('****本次自动录入成功！');

    end;

    Result := True;
  except
    on E: Exception do
      MmoAdd('JunoAutoRunCore:JunoAutoRunCore:程序错误...');
  end;

end;

procedure TForm1.LoadPGEnd;

  function EnumChildWndProcForLoadPGEnd(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndCaption: array[0..254] of Char;
  begin
    GetWindowText(AhWnd, WndCaption, 254);
    if Pos('是', string(WndCaption)) > 0 then
    begin
      //MmoAdd('警告窗体按钮检测完毕。');
      HwndLoadEndYes := AhWnd;
      Result := False;
    end;
    Result := True;
  end;

var
  HwndTemp: HWND;
  FormTag: tagWINDOWINFO;
begin
  MmoAdd('LoadPGEnd:开始处理弹窗...', 2);

  if YESBtnClicked and (YesBtnClickTime = 2) then
  begin
    GetWindowInfo(FindWindow(nil, TitleJunoLoadEnd), FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
//      MmoAdd('LoadPGFun:发现测试文件加载窗体未显示,等待窗体显示中...');
//      tmrRunLoadPG.Enabled := True;
//      Inc(TimeNoShowLdPGForm);
//      Exit;
      MmoAdd('LoadPGEnd:弹窗处理成功。', 0);
      YesBtnClickTime := 0;
      Exit;
    end;

    MmoAdd('LoadPGEnd:弹窗处理成功。', 0);
    YesBtnClickTime := 0;
    Exit;
  end;

  //如果新测试数据窗体已经顺利打开，则会设置YESBtnClicked=true,关闭本过程。
  if (LoadEndRetryTime > 100) or YESBtnClicked then
  begin
    MmoAdd('LoadPGEnd:弹窗处理完毕。', 0);
  end;
  if LoadEndRetryTime <= 100 then
  begin
    Inc(LoadEndRetryTime);
    MmoAdd('LoadPGEnd:处理弹窗:第' + IntToStr(LoadEndRetryTime) + '次操作...', 2);
    HwndTemp := FindWindow(nil, TitleJunoLoadEnd);
    if HwndTemp > 0 then
    begin
      MmoAdd('LoadPGEnd:警告窗体存在。', 2);
      HwndLoadEndYes := 0;
      EnumChildWindows(HwndTemp, @EnumChildWndProcForLoadPGEnd, 2);
      MmoAdd('LoadPGEnd:警告窗体按钮检测完毕。', 2);
      if HwndLoadEndYes > 0 then
      begin
      //找到YES按钮，前置后发送点击命令。
        PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
        MmoAdd('LoadPGEnd:警告窗体YES按钮已点击。', 2);
        YESBtnClicked := True;
        Inc(YesBtnClickTime);
        LoadPGEnd; //确认警告窗体是否已经关闭成功！
      end
      else
      begin
        MmoAdd('LoadPGEnd:警告窗体YES按钮未找到，程序退出。', 0);
        Exit;
      end;
    end
    else
    begin
      MmoAdd('LoadPGEnd:[' + IntToStr(LoadEndRetryTime) + ']未检测到警告弹窗。', 2);
      MmoAdd('LoadPGEnd:重启窗体警告检测。', 2);
      tmrLoadEnd.Enabled := True;
    end;

  end;

end;

procedure TForm1.LoadPGEndNew;

  function EnumChildWndProcForLoadPGEnd(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndCaption: array[0..254] of Char;
  begin
    GetWindowText(AhWnd, WndCaption, 254);
    if Pos('是', string(WndCaption)) > 0 then
    begin
      //MmoAdd('警告窗体按钮检测完毕。');
      HwndLoadEndYes := AhWnd;
      Result := False;
    end;
    Result := True;
  end;

  function EnumWindowsFunc(Handle: THandle; List: TStringList): Boolean; stdcall;
  var
    Caption: array[0..256] of Char;
    FormTag: tagWINDOWINFO;
  begin
    if GetWindowText(Handle, Caption, SizeOf(Caption) - 1) <> 0 then
    begin
      List.Add(Caption);
      SetWindowText(Handle, PChar('About - ' + Caption));

      GetWindowInfo(Handle, FormTag);
      if (FormTag.dwStyle and WS_VISIBLE) = 0 then
      begin

      end;

    end;
  end;

var
  HwndTemp, HwndTemp2: HWND;
  FormTag: tagWINDOWINFO;
  Strlist: TStrings;
begin
   //Strlist:=TStringList.Create;
   //EnumWindows(@EnumWindowsFunc, LParam(Strlist));
  MmoAdd('LoadPGEndNew:开始处理弹窗...', 2);
  HwndTemp := FindWindow(nil, TitleJunoLoadEnd);

  if HwndTemp > 0 then
  begin
    HwndLoadEndYes := 0;
    EnumChildWindows(HwndTemp, @EnumChildWndProcForLoadPGEnd, 2);
    MmoAdd('LoadPGEndNew:警告窗体按钮检测完毕。', 2);
    if HwndLoadEndYes > 0 then
    begin
      //找到YES按钮，前置后发送点击命令。
      PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
      MmoAdd('LoadPGEndNew:警告窗体YES按钮已点击。', 2);
    end
  end;

  Exit;
  (*
  if YESBtnClicked and (YesBtnClickTime = 2) then
  begin
    GetWindowInfo(FindWindow(nil, TitleJunoLoadEnd), FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
//      MmoAdd('LoadPGFun:发现测试文件加载窗体未显示,等待窗体显示中...');
//      tmrRunLoadPG.Enabled := True;
//      Inc(TimeNoShowLdPGForm);
//      Exit;
      MmoAdd('LoadPGEnd:弹窗处理成功。', 0);
      YesBtnClickTime := 0;
      Exit;
    end;

    MmoAdd('LoadPGEnd:弹窗处理成功。', 0);
    YesBtnClickTime := 0;
    Exit;
  end;

  //如果新测试数据窗体已经顺利打开，则会设置YESBtnClicked=true,关闭本过程。
  if (LoadEndRetryTime > 100) or YESBtnClicked then
  begin
    MmoAdd('LoadPGEnd:弹窗处理完毕。', 0);
  end;
  if LoadEndRetryTime <= 100 then
  begin
    Inc(LoadEndRetryTime);
    MmoAdd('LoadPGEnd:处理弹窗:第' + IntToStr(LoadEndRetryTime) + '次操作...', 2);
    HwndTemp := FindWindow(nil, TitleJunoLoadEnd);
    if HwndTemp > 0 then
    begin
      MmoAdd('LoadPGEnd:警告窗体存在。', 2);
      HwndLoadEndYes := 0;
      EnumChildWindows(HwndTemp, @EnumChildWndProcForLoadPGEnd, 2);
      MmoAdd('LoadPGEnd:警告窗体按钮检测完毕。', 2);
      if HwndLoadEndYes > 0 then
      begin
      //找到YES按钮，前置后发送点击命令。
        PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
        MmoAdd('LoadPGEnd:警告窗体YES按钮已点击。', 2);
        YESBtnClicked := True;
        Inc(YesBtnClickTime);
        LoadPGEnd; //确认警告窗体是否已经关闭成功！
      end
      else
      begin
        MmoAdd('LoadPGEnd:警告窗体YES按钮未找到，程序退出。', 0);
        Exit;
      end;
    end
    else
    begin
      MmoAdd('LoadPGEnd:[' + IntToStr(LoadEndRetryTime) + ']未检测到警告弹窗。', 2);
      MmoAdd('LoadPGEnd:重启窗体警告检测。', 2);
      tmrLoadEnd.Enabled := True;
    end;

  end;
  *)

end;

procedure TForm1.LoadPGEndNewSec;

  function EnumChildWndProcForLoadPGEnd(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndCaption: array[0..254] of Char;
  begin
    GetWindowText(AhWnd, WndCaption, 254);

    if Pos('是', string(WndCaption)) > 0 then
    begin
      //MmoAdd('警告窗体按钮检测完毕。');
      HwndLoadEndYes := AhWnd;
      //Result := False;
    end;
    if Pos('xxx', string(WndCaption)) > 0 then
    begin
      //MmoAdd('警告窗体按钮检测完毕。');
      HwndLoadEndYes := AhWnd;
      Result := False;
    end;
    Result := True;
  end;

  function EnumWindowsFunc(Handle: THandle; List: TStringList): Boolean; stdcall;
  var
    Caption: array[0..256] of Char;
    FormTag: tagWINDOWINFO;
  begin
    //if GetWindowText(Handle, Caption, SizeOf(Caption) - 1) <> 0 then
    GetWindowText(Handle, Caption, SizeOf(Caption) - 1);
    //begin
    if Caption = TitleJunoLoadEnd then
    begin
        //List.Add(IntToStr(Handle));
      GetWindowInfo(Handle, FormTag);
      if not ((FormTag.dwStyle and WS_VISIBLE) = 0) then
      begin
        List.Add(IntToStr(Handle));
      end;
    end;
      //SetWindowText(Handle, PChar('About - ' + Caption));
    //end;

    Result := True;
  end;

var
  HwndTemp: HWND;
  List: TStrings;
begin
  List := TStringList.Create;
  MmoAdd('LoadPGEndNewSec:开始处理弹窗...', 2);
  EnumWindows(@EnumWindowsFunc, LPARAM(List));
  HwndTemp := StrToInt(List[0]);
  if HwndTemp > 0 then
  begin
    HwndLoadEndYes := 0;
    EnumChildWindows(HwndTemp, @EnumChildWndProcForLoadPGEnd, 2);
    MmoAdd('LoadPGEndNewSec:警告窗体按钮检测完毕。', 2);
    if HwndLoadEndYes > 0 then
    begin
      //找到YES按钮，前置后发送点击命令。
      PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
      MmoAdd('LoadPGEndNewSec:警告窗体YES按钮已点击。', 2);
    end;
  end;
end;

function TForm1.LoadPGFun: Boolean;

  function EnumChildWndProcForLoadPG(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndClassName: array[0..254] of Char;
    WndCaption: array[0..254] of Char;
    //Temp: array[0..255] of Char;
  begin
    GetClassName(AhWnd, WndClassName, 254);
    GetWindowText(AhWnd, WndCaption, 254);
    //SendMessage(AhWnd, WM_GETTEXT, 256, Integer(@Temp));
    HwndStr.Add(IntToStr(AhWnd));
    ClassStr.Add(string(WndClassName));
    TitleStr.Add(string(WndCaption));

    Result := True;
  end;

var
  I: Integer;
  EdtCount: Integer;
  FindCount: Integer;
  IsCheck: Cardinal;
  RetryTime: Integer;
  FormTag: tagWINDOWINFO;
  HwndTemp: HWND;
  BoolAStationFind, BoolBStationFind: Boolean;
begin
  Result := False;
  EdtCount := 0;
  IsCheck := 0; //检查是否点击有效
  FindCount := 0; //ABStation PPID 确定 四个句柄都需要找到。
  MmoAdd('LoadPGFun:开始处理自动加载PPID作业...');
  HwndTemp := FindWindow(nil, TitleJunoLoadProgram);
  if HwndTemp > 0 then
  begin
    HwndJunoLoadProgram := HwndTemp;
    MmoAdd('LoadPGFun:发现测试文件加载窗体...');
    if TimeNoShowLdPGForm > 10 then
    begin
      MmoAdd('LoadPGFun:超过十次未显示测试文件加载窗体，程序退出...');
      Exit;
    end;
    GetWindowInfo(HwndTemp, FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
      MmoAdd('LoadPGFun:发现测试文件加载窗体未显示,等待窗体显示中...');
      tmrRunLoadPG.Enabled := True;
      Inc(TimeNoShowLdPGForm);
      Exit;
    end;
    HwndStr := TStringList.Create;
    ClassStr := TStringList.Create;
    TitleStr := TStringList.Create;
    MmoAdd('LoadPGFun:前置Juno主程序...');
    ShowWindow(HwndJuno, SW_RESTORE);
    //ShowWindow(HwndJunoLoadProgram, SW_RESTORE);
    //遍历测试文件加载窗体寻找站点选项和PPID编辑窗口和确定按钮
    MmoAdd('LoadPGFun:检索测试文件加载窗体数列表...');
    EnumChildWindows(HwndJunoLoadProgram, @EnumChildWndProcForLoadPG, 1);
    MmoAdd('LoadPGFun:测试文件加载窗体数列表检索成功...');
    BoolAStationFind := False;
    BoolBStationFind := False;
    for I := 0 to HwndStr.Count - 1 do
    begin
      if not BoolAStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('A', TitleStr[I]) = 1) then
        begin
          HwndAStation := StrToInt64(HwndStr[I]);
          MmoAdd('LoadPGFun:找到A站句柄=' + HwndStr[I]);
          Inc(FindCount);
          BoolAStationFind := True;
        end;
      end;
      if not BoolBStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('B', TitleStr[I]) = 1) then
        begin
          HwndBStation := StrToInt64(HwndStr[I]);
          MmoAdd('LoadPGFun:找到B站句柄=' + HwndStr[I]);
          Inc(FindCount);
          BoolBStationFind := True;
        end;
      end;
      if Pos('Edit', ClassStr[I]) > 0 then
      begin
        Inc(EdtCount);
      end;
      if EdtCount = LoadPGPPIDEdtCount then
      begin
        HwndPPID := StrToInt64(HwndStr[I]);
        MmoAdd('LoadPGFun:找到PPID句柄=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if Pos('确定', TitleStr[I]) > 0 then
      begin
        HwndLoadPGEnter := StrToInt64(HwndStr[I]);
        MmoAdd('LoadPGFun:找到确定按钮句柄=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if FindCount = 4 then
        Break;
    end;
    if FindCount = 4 then
    begin
      MmoAdd('LoadPGFun:测试文件加载窗体必须句柄已获取。');
    end
    else
    begin
      MmoAdd('LoadPGFun:测试文件加载窗体必须句柄获取失败,程序错误，请联系工程师处理。');
      HwndStr.Clear;
      ClassStr.Clear;
      TitleStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(ClassStr);
      FreeAndNil(TitleStr);
      Exit;
    end;
    MmoAdd('LoadPGFun:测试文件句柄树已处理完毕。');
    HwndStr.Clear;
    ClassStr.Clear;
    TitleStr.Clear;
    FreeAndNil(HwndStr);
    FreeAndNil(ClassStr);
    FreeAndNil(TitleStr);
    MmoAdd('LoadPGFun:测试文件句柄树文件已初始化。');
    MmoAdd('LoadPGFun:测试文件自动录入开始。');
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStation, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('LoadPGFun:Station 勾选第' + IntToStr(RetryTime) + '次操作...');
        SendMessage(HwndAStation, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStation, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('LoadPGFun:Station 勾选操作失败，程序退出，请检查！');
        Exit;
      end;
    end
    else
    begin
      if WhichStation = 'B' then
      begin
        RetryTime := 0;
        while SendMessage(HwndBStation, BM_GETCHECK, 0, 0) = 0 do
        begin
          MmoAdd('LoadPGFun:Station 勾选第' + IntToStr(RetryTime) + '次操作...');
          SendMessage(HwndBStation, WM_LBUTTONDOWN, 0, 0);
          SendMessage(HwndBStation, WM_LBUTTONUP, 0, 0);
          Inc(RetryTime);
        end;
        if RetryTime > 6 then
        begin
          MmoAdd('LoadPGFun:Station 勾选操作失败，程序退出，请检查！');
          Exit;
        end;
      end;
    end;
    SendMessage(HwndPPID, WM_SETTEXT, 255, LongInt(PChar(edtPPID.Text)));
    MmoAdd('LoadPGFun:PPID已经设置');
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //PostMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONUP, 0, 0);
    MmoAdd('LoadPGFun:PPID确定按钮发送点击请求...');
    PostMessage(HwndLoadPGEnter, BM_CLICK, 0, 0);
    MmoAdd('LoadPGFun:PPID已加载完毕');
    Result := True;
    MmoAdd('LoadPGFun:测试数据文件自动程序已开启...');
    NextActionReadyTime(tmrCreateData);
  end
  else
  begin
    MmoAdd('LoadPGFun:F1激活后未发现测试文件加载窗体，重新检测中...');
    //此处需要判断Juno软件是否还存在！！！
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('LoadPGFun:JUNO主程序不存在请重新启动...');
      Exit;
    end;
    ShowWindow(HwndJuno, SW_RESTORE);
    MmoAdd('主程序已前置，准备启动热键...');
    keybd_event(VK_F1, 0, 0, 0);
    keybd_event(VK_F1, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('F1已激活...');
    NextActionReadyTime(tmrRunLoadPG);
    MmoAdd('倒计时检测测试文件加载窗体...');
  end;
end;

function TForm1.LoadPGFunNew: Boolean;

  function EnumChildWndProcForLoadPG(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndClassName: array[0..254] of Char;
    WndCaption: array[0..254] of Char;
    //Temp: array[0..255] of Char;
  begin
    GetClassName(AhWnd, WndClassName, 254);
    GetWindowText(AhWnd, WndCaption, 254);
    //SendMessage(AhWnd, WM_GETTEXT, 256, Integer(@Temp));
    HwndStr.Add(IntToStr(AhWnd));
    ClassStr.Add(string(WndClassName));
    TitleStr.Add(string(WndCaption));

    Result := True;
  end;

var
  I: Integer;
  EdtCount: Integer;
  FindCount: Integer;
  IsCheck: Cardinal;
  RetryTime: Integer;
  FormTag: tagWINDOWINFO;
  HwndTemp: HWND;
  BoolAStationFind, BoolBStationFind: Boolean;
begin
  Result := False;
  EdtCount := 0;
  IsCheck := 0; //检查是否点击有效
  FindCount := 0; //ABStation PPID 确定 四个句柄都需要找到。
  MmoAdd('LoadPGFunNew:开始处理自动加载PPID作业...');
  HwndTemp := FindWindow(nil, TitleJunoLoadProgram);
  if HwndTemp > 0 then
  begin
    HwndJunoLoadProgram := HwndTemp;
    MmoAdd('LoadPGFunNew:发现测试文件加载窗体...');
    if TimeNoShowLdPGForm > 10 then
    begin
      MmoAdd('LoadPGFunNew:超过十次未显示测试文件加载窗体，程序退出...');
      Exit;
    end;
    GetWindowInfo(HwndTemp, FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
      MmoAdd('LoadPGFunNew:发现测试文件加载窗体未显示,等待窗体显示中...');
      tmrRunLoadPG.Enabled := True;
      Inc(TimeNoShowLdPGForm);
      Exit;
    end;
    HwndStr := TStringList.Create;
    ClassStr := TStringList.Create;
    TitleStr := TStringList.Create;
    MmoAdd('LoadPGFun:前置Juno主程序...');
    ShowWindow(HwndJuno, SW_RESTORE);
    //ShowWindow(HwndJunoLoadProgram, SW_RESTORE);
    //遍历测试文件加载窗体寻找站点选项和PPID编辑窗口和确定按钮
    MmoAdd('LoadPGFunNew:检索测试文件加载窗体数列表...');
    EnumChildWindows(HwndJunoLoadProgram, @EnumChildWndProcForLoadPG, 1);
    MmoAdd('LoadPGFunNew:测试文件加载窗体数列表检索成功...');
    BoolAStationFind := False;
    BoolBStationFind := False;
    for I := 0 to HwndStr.Count - 1 do
    begin
      if not BoolAStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('A', TitleStr[I]) = 1) then
        begin
          HwndAStation := StrToInt64(HwndStr[I]);
          MmoAdd('LoadPGFunNew:找到A站句柄=' + HwndStr[I]);
          Inc(FindCount);
          BoolAStationFind := True;
        end;
      end;
      if not BoolBStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('B', TitleStr[I]) = 1) then
        begin
          HwndBStation := StrToInt64(HwndStr[I]);
          MmoAdd('LoadPGFunNew:找到B站句柄=' + HwndStr[I]);
          Inc(FindCount);
          BoolBStationFind := True;
        end;
      end;
      if Pos('Edit', ClassStr[I]) > 0 then
      begin
        Inc(EdtCount);
      end;
      if EdtCount = LoadPGPPIDEdtCount then
      begin
        HwndPPID := StrToInt64(HwndStr[I]);
        MmoAdd('LoadPGFunNew:找到PPID句柄=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if Pos('确定', TitleStr[I]) > 0 then
      begin
        HwndLoadPGEnter := StrToInt64(HwndStr[I]);
        MmoAdd('LoadPGFunNew:找到确定按钮句柄=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if FindCount = 4 then
        Break;
    end;
    if FindCount = 4 then
    begin
      MmoAdd('LoadPGFunNew:测试文件加载窗体必须句柄已获取。');
    end
    else
    begin
      MmoAdd('LoadPGFunNew:测试文件加载窗体必须句柄获取失败,程序错误，请联系工程师处理。');
      HwndStr.Clear;
      ClassStr.Clear;
      TitleStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(ClassStr);
      FreeAndNil(TitleStr);
      Exit;
    end;
    MmoAdd('LoadPGFunNew:测试文件句柄树已处理完毕。');
    HwndStr.Clear;
    ClassStr.Clear;
    TitleStr.Clear;
    FreeAndNil(HwndStr);
    FreeAndNil(ClassStr);
    FreeAndNil(TitleStr);
    MmoAdd('LoadPGFunNew:测试文件句柄树文件已初始化。');
    MmoAdd('LoadPGFunNew:测试文件自动录入开始。');
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStation, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('LoadPGFunNew:Station 勾选第' + IntToStr(RetryTime) + '次操作...');
        SendMessage(HwndAStation, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStation, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('LoadPGFunNew:Station 勾选操作失败，程序退出，请检查！');
        Exit;
      end;
    end
    else
    begin
      if WhichStation = 'B' then
      begin
        RetryTime := 0;
        while SendMessage(HwndBStation, BM_GETCHECK, 0, 0) = 0 do
        begin
          MmoAdd('LoadPGFunNew:Station 勾选第' + IntToStr(RetryTime) + '次操作...');
          SendMessage(HwndBStation, WM_LBUTTONDOWN, 0, 0);
          SendMessage(HwndBStation, WM_LBUTTONUP, 0, 0);
          Inc(RetryTime);
        end;
        if RetryTime > 6 then
        begin
          MmoAdd('LoadPGFunNew:Station 勾选操作失败，程序退出，请检查！');
          Exit;
        end;
      end;
    end;
    SendMessage(HwndPPID, WM_SETTEXT, 255, LongInt(PChar(edtPPID.Text)));
    MmoAdd('LoadPGFunNew:PPID已经设置');
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //PostMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONUP, 0, 0);
    MmoAdd('LoadPGFunNew:PPID确定按钮发送点击请求...');
    PostMessage(HwndLoadPGEnter, BM_CLICK, 0, 0);
    MmoAdd('LoadPGFunNew:PPID已加载完毕');
    Result := True;

  end;
  (*
  else
  begin
    MmoAdd('LoadPGFun:F1激活后未发现测试文件加载窗体，重新检测中...');
    //此处需要判断Juno软件是否还存在！！！
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('LoadPGFun:JUNO主程序不存在请重新启动...');
      Exit;
    end;
    ShowWindow(HwndJuno, SW_RESTORE);
    MmoAdd('主程序已前置，准备启动热键...');
    keybd_event(VK_F1, 0, 0, 0);
    keybd_event(VK_F1, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('F1已激活...');
    NextActionReadyTime(tmrRunLoadPG);
    MmoAdd('倒计时检测测试文件加载窗体...');
  end;
  *)
end;

procedure TForm1.LockAllChk(IsLock: Boolean);
begin
  if IsLock then
  begin
    chk1.Enabled := False;
    chk2.Enabled := False;
    chk3.Enabled := False;
    chk4.Enabled := False;
    chk5.Enabled := False;
    chk6.Enabled := False;
    chk7.Enabled := False;
    chk8.Enabled := False;
    chk9.Enabled := False;
    chk10.Enabled := False;
    chk11.Enabled := False;
    chk12.Enabled := False;
    chk13.Enabled := False;
    chk14.Enabled := False;
    chk15.Enabled := False;
    chk16.Enabled := False;
    chk17.Enabled := False;
    chk18.Enabled := False;
    chk19.Enabled := False;
    chk20.Enabled := False;
    chk21.Enabled := False;
    chk22.Enabled := False;
    chk23.Enabled := False;
    chk24.Enabled := False;
    chk25.Enabled := False;
  end
  else
  begin
    chk1.Enabled := True;
    chk2.Enabled := True;
    chk3.Enabled := True;
    chk4.Enabled := True;
    chk5.Enabled := True;
    chk6.Enabled := True;
    chk7.Enabled := True;
    chk8.Enabled := True;
    chk9.Enabled := True;
    chk10.Enabled := True;
    chk11.Enabled := True;
    chk12.Enabled := True;
    chk13.Enabled := True;
    chk14.Enabled := True;
    chk15.Enabled := True;
    chk16.Enabled := True;
    chk17.Enabled := True;
    chk18.Enabled := True;
    chk19.Enabled := True;
    chk20.Enabled := True;
    chk21.Enabled := True;
    chk22.Enabled := True;
    chk23.Enabled := True;
    chk24.Enabled := True;
    chk25.Enabled := True;
  end;
end;

procedure TForm1.MapManualSetup;

  function EnumChildWndProc(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndClassName: array[0..254] of Char;
    WndCaption: array[0..254] of Char;
    Temp: array[0..255] of Char;
    Length: Integer;
  begin
    GetWindowText(AhWnd, WndCaption, 254);
    //SendMessage(AhWnd, WM_GETTEXT, 256, Integer(@Temp));
    //Length := SendMessage(AhWnd, WM_GETTEXTLENGTH, 0, 0);

    if WndCaption <> '' then
    begin

      if Pos('JUNO Maping', string(WndCaption)) > 0 then
      begin
        MapBool := True;
        HwndJunoMap := AhWnd;
        Result := False;
      end;

    end;
    Result := True;
  end;

begin
  EnumChildWindows(0, @EnumChildWndProc, 0);
  if MapBool then
  begin
    if HwndJunoMap = 0 then
    begin
      MmoAdd('JunoAutoRunCoreNew:未发现JUNO Maping窗体...');
      ShowMessage('MAP设定打开失败，请手动打开！');
      Abort;
    end;
    SetWindowPos(HwndJunoMap, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJunoMap, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJunoMap, SW_MAXIMIZE);
    MmoAdd('JunoAutoRunCoreNew:主程序已前置，准备启动热键...');
        //alt+C
    keybd_event(VK_MENU, 0, 0, 0);
    keybd_event(67, 0, 0, 0);
    keybd_event(67, 0, KEYEVENTF_KEYUP, 0);
    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);


        //A站直接按enter按键
    if WhichStation = 'A' then
    begin
      keybd_event(VK_RETURN, 0, 0, 0);
      keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
    end;
        //B站需要按一次下箭头，再按enter按键
    if WhichStation = 'B' then
    begin
      keybd_event(VK_DOWN, 0, 0, 0);
      keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_RETURN, 0, 0, 0);
      keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
    end;

        //alt+e 打开设定项
    keybd_event(VK_MENU, 0, 0, 0);
    keybd_event(69, 0, 0, 0);
    keybd_event(69, 0, KEYEVENTF_KEYUP, 0);
    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
        //6次下箭头
    keybd_event(VK_DOWN, 0, 0, 0);
    keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
    keybd_event(VK_DOWN, 0, 0, 0);
    keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
    keybd_event(VK_DOWN, 0, 0, 0);
    keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
    keybd_event(VK_DOWN, 0, 0, 0);
    keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
    keybd_event(VK_DOWN, 0, 0, 0);
    keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
    keybd_event(VK_DOWN, 0, 0, 0);
    keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);

        //enter 进入设定界面
    keybd_event(VK_RETURN, 0, 0, 0);
    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
    DelayRun(DelayInterval div 15);

        //修改界面数据
    MmoAdd('JunoAutoRunCoreNew:准备修改针卡界面数据...');
    if WhichStation = 'A' then
    begin
      HwndJunoMapSetup := FindWindow(nil, TitleJunoMapASetup);
    end;
    if WhichStation = 'B' then
    begin
      HwndJunoMapSetup := FindWindow(nil, TitleJunoMapBSetup);
    end;
    MmoAdd('JunoAutoRunCoreNew:获得设定界面句柄成功，寻找关键句柄...');

    if HwndJunoMapSetup > 0 then
    begin
      //ShowWindow(HwndJunoMapSetup,SW_HIDE);
      MapSetupPro;
    end;

    MmoAdd('JunoAutoRunCoreNew:Map设定完毕...');
        //ALT热键配合选站
        //Alt热键选中设定窗体
        //修改窗体值
    MmoAdd('****本次自动录入成功！');

  end;

end;

procedure TForm1.MapSetupManualNew;
begin
  MmoAdd('JunoAutoRunCoreNew:准备修改针卡界面数据...');
  if WhichStation = 'A' then
  begin
    HwndJunoMapSetup := FindWindow(nil, TitleJunoMapASetup);
  end;
  if WhichStation = 'B' then
  begin
    HwndJunoMapSetup := FindWindow(nil, TitleJunoMapBSetup);
  end;
  MmoAdd('JunoAutoRunCoreNew:获得设定界面句柄成功，寻找关键句柄...');
  if HwndJunoMapSetup > 0 then
  begin
    MapSetupPro;
  end;

  MmoAdd('JunoAutoRunCoreNew:Map设定完毕...');
        //ALT热键配合选站
        //Alt热键选中设定窗体
        //修改窗体值
  MmoAdd('****本次自动录入成功！');
end;

function TForm1.MapSetupPro: Boolean;

  function EnumChildWndProcForMapSetup(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndClassName: array[0..254] of Char;
    WndCaption: array[0..254] of Char;
    //Temp: array[0..255] of Char;
  begin
    GetClassName(AhWnd, WndClassName, 254);
    GetWindowText(AhWnd, WndCaption, 254);
    HwndStr.Add(IntToStr(AhWnd));
    ClassStr.Add(string(WndClassName));
    TitleStr.Add(string(WndCaption));
    Result := True;
  end;

var
  I: Integer;
  Count: Integer;
  EdtCount: Integer; //Edt第三个为lotid位置
  RetryTime: Integer;
begin
  MmoAdd('MapSetupPro:Map设定处理开始...');
  Result := False;
  Count := 0;
  EdtCount := 0;

  if HwndJunoMapSetup > 0 then
  begin
    if HwndStr = nil then
    begin
      HwndStr := TStringList.Create;
    end
    else
    begin
      HwndStr.Clear;
    end;
    if ClassStr = nil then
    begin
      ClassStr := TStringList.Create;
    end
    else
    begin
      ClassStr.Clear;
    end;
    if TitleStr = nil then
    begin
      TitleStr := TStringList.Create;
    end
    else
    begin
      TitleStr.Clear;
    end;
    MmoAdd('MapSetupPro:初始化数据容器list完毕...');
    EnumChildWindows(HwndJunoMapSetup, @EnumChildWndProcForMapSetup, 1);
    MmoAdd('MapSetupPro:Map界面数据list收集完毕...');
    for I := 0 to HwndStr.Count - 1 do
    begin
      if (Pos('Stati', ClassStr[I]) > 0) or (Pos('Combo', ClassStr[I]) > 0) then
      begin
        Continue;
      end;

      if (Count < 6) and (Pos('Edit', ClassStr[I]) > 0) then
      begin
        Inc(EdtCount);
        case EdtCount of
          1:
            begin
              MmoAdd('MapSetupPro:发现OperatorID...');
              HwndMapOperatorID := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          3:
            begin
              MmoAdd('MapSetupPro:发现HwndMapLotID...');
              HwndMapLotID := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          13:
            begin
              MmoAdd('MapSetupPro:发现HwndMapPPID...');
              HwndMapPPID := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          14:
            begin
              MmoAdd('MapSetupPro:发现HwndMapEqID...');
              HwndMapEqID := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          15:
            begin
              MmoAdd('MapSetupPro:发现HwndMapTesterID...');
              HwndMapTesterID := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          16:
            begin
              MmoAdd('MapSetupPro:发现HwndMapCardName...');
              HwndMapCardName := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
        end;
        Continue;
      end;
      if Pos(TitleMapEnterBtn, TitleStr[I]) > 0 then
      begin
        //确定按钮
        MmoAdd('MapSetupPro:确定按钮获取成功...');
        Inc(Count);
        HwndMapYesBtn := StrToInt64(HwndStr[I]);
        //MmoAdd('btn'+HwndStr[I]);
      end;

      if Count = 7 then
      begin
        MmoAdd('MapSetupPro:Map设定窗体7项参数已经获取成功，退出循环...');
        Break;
      end;
    end;
    HwndStr.Clear;
    TitleStr.Clear;
    ClassStr.Clear;
    FreeAndNil(HwndStr);
    FreeAndNil(TitleStr);
    FreeAndNil(ClassStr);
    if Count <> 7 then
    begin
      MmoAdd('MapSetupPro:Map设定窗体7项参数获取失败。请联系工程师处理...');
      Exit;
    end
    else
    begin
      MmoAdd('MapSetupPro:Map设定窗体7项参数获取成功，准备录入数据...');
    end;

    MmoAdd('MapSetupPro:Map设定窗体OperatorID录入...' + edtOperator.Text);
    SendMessage(HwndMapOperatorID, WM_SETTEXT, 255, LongInt(PChar(edtOperator.Text)));
    MmoAdd('MapSetupPro:Map设定窗体LotID录入...' + edtLotID.Text);
    SendMessage(HwndMapLotID, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('MapSetupPro:Map设定窗体PPID录入...' + edtPPID.Text);
    SendMessage(HwndMapPPID, WM_SETTEXT, 255, LongInt(PChar(edtPPID.Text)));

    MmoAdd('MapSetupPro:Map设定窗体ProberID录入...' + edtProber.Text);
    SendMessage(HwndMapEqID, WM_SETTEXT, 255, LongInt(PChar(edtProber.Text)));
    MmoAdd('MapSetupPro:Map设定窗体Prober录入...' + edtTester.Text);
    SendMessage(HwndMapTesterID, WM_SETTEXT, 255, LongInt(PChar(edtTester.Text)));
    MmoAdd('MapSetupPro:Map设定窗体Tester录入...' + edtCardName.Text);
    SendMessage(HwndMapCardName, WM_SETTEXT, 255, LongInt(PChar(edtCardName.Text)));
    MmoAdd('MapSetupPro:Map设定窗体确定按键点击...');
    SendMessage(HwndMapYesBtn, BM_CLICK, 0, 0);
    MmoAdd('MapSetupPro:Map设定窗体设定完毕...');
    Result := True;

  end;


  (*
  if FindWindow(nil, TitleJunoCreateTestData) > 0 then
  begin
    MmoAdd('CreateData:发现新建测试数据窗体...');
    YESBtnClicked := True;
    MmoAdd('CreateData:已关闭新测试文件窗体警告检测...');
    if HwndStr = nil then
    begin
      HwndStr := TStringList.Create;
    end
    else
    begin
      HwndStr.Clear;
    end;
    if ClassStr = nil then
    begin
      ClassStr := TStringList.Create;
    end
    else
    begin
      ClassStr.Clear;
    end;
    if TitleStr = nil then
    begin
      TitleStr := TStringList.Create;
    end
    else
    begin
      TitleStr.Clear;
    end;
    MmoAdd('CreateData:初始化数据容器list完毕...');
    //ShowWindow(HwndJuno, SW_RESTORE);
    //ShowWindow(HwndJunoLoadProgram, SW_RESTORE);
    //遍历测试文件加载窗体寻找站点选项和PPID编辑窗口和确定按钮
    EnumChildWindows(FindWindow(nil, TitleJunoCreateTestData), @EnumChildWndProcForCreateData, 1);
    for I := 0 to HwndStr.Count - 1 do
    begin
      if Pos('&A', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateData:A站获取成功..');
        HwndAStationCreate := StrToInt64(HwndStr[I]);
        Inc(Count);
        Continue;
      end;
      if Pos('&B', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateData:B站获取成功...');
        HwndBStationCreate := StrToInt64(HwndStr[I]);
        Inc(Count);
        Continue;
      end;
      if Pos('Edit', ClassStr[I]) > 0 then
      begin
        Inc(EdtCount);

        case EdtCount of
          EdtCountFileName:
            begin
              MmoAdd('CreateData:lotname获取成功...');
              HwndFileName := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountWaferNumber:
            begin
              MmoAdd('CreateData:wafernumber获取成功...');
              HwndWaferNumber := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountOperator:
            begin
              MmoAdd('CreateData:OperatorID获取成功...');
              HwndOperator := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountTag:
            begin
              MmoAdd('CreateData:Commit获取成功...');
              HwndTag := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
        end;
      end;
      if Pos(TitleCreateAutoFile, TitleStr[I]) > 0 then
      begin
        //自动文件按钮
        MmoAdd('CreateData:自动文件按钮获取成功...');
        Inc(Count);
        HwndAutoFile := StrToInt64(HwndStr[I]);
      end;

      if Pos(TitleCreateEnterBtn, TitleStr[I]) > 0 then
      begin
        //确定按钮
        MmoAdd('CreateData:确定按钮获取成功...');
        Inc(Count);
        HwndCreateEnter := StrToInt64(HwndStr[I]);
      end;
      if Count = 8 then
      begin
        MmoAdd('CreateData:新数据文件窗体8项参数已经获取成功，退出循环...');
        Break;
      end;
    end;
    if Count <> 8 then
    begin
      MmoAdd('CreateData:新数据文件窗体8项参数获取失败。请联系工程师处理...');
      HwndStr.Clear;
      TitleStr.Clear;
      ClassStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(TitleStr);
      FreeAndNil(ClassStr);
      Exit;
    end
    else
    begin
      MmoAdd('CreateData:新数据文件窗体参数获取成功，准备录入数据...');
      HwndStr.Clear;
      TitleStr.Clear;
      ClassStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(TitleStr);
      FreeAndNil(ClassStr);
    end;
    //新数据文件窗体处理流程
    //station站选择
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateData:A-Station 勾选第' + IntToStr(RetryTime) + '次操作...');
        SendMessage(HwndAStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateData:A-Station勾选操作失败，程序退出，请检查！');
        Exit;
      end;
    end;
    if WhichStation = 'B' then
    begin
      RetryTime := 0;
      while SendMessage(HwndBStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateData:B-Station 勾选第' + IntToStr(RetryTime) + '次操作...');
        SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateData:B-Station 勾选操作失败，程序退出，请检查！');
        Exit;
      end;
    end;
    //lotid填入操作
    MmoAdd('CreateData:Station勾选操作成功...');
    MmoAdd('CreateData:准备填入数据...');
    SendMessage(HwndFileName, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateData:lotid已经设置');
    SendMessage(HwndTag, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateData:tag已经设置');
    SendMessage(HwndOperator, WM_SETTEXT, 255, LongInt(PChar(edtOperator.Text)));
    MmoAdd('CreateData:Operator已经设置');
    RetryTime := 0;
    while SendMessage(HwndAutoFile, BM_GETCHECK, 0, 0) = 0 do
    begin
      MmoAdd('CreateData:自动文件按钮第' + IntToStr(RetryTime) + '次操作...');
        //SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        //SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
      SendMessage(HwndAutoFile, BM_CLICK, 0, 0);
      Inc(RetryTime);
    end;
    if RetryTime > 6 then
    begin
      MmoAdd('CreateData:自动文件按钮无法点击，程序错误，请联系工程师处理！');
      Exit
    end;
    SendMessage(HwndWaferNumber, WM_SETTEXT, 255, LongInt(PChar(Trim(edtWaferID.Text))));
    MmoAdd('CreateData:wafernumber已经设置');
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONUP, 0, 0);
    SendMessage(HwndCreateEnter, BM_CLICK, 0, 0);
    MmoAdd('CreateData:确定按钮已发送点击...。');
    MmoAdd('CreateData:新数据文件已经设置完毕。');
    tmrCreateData.Enabled := False;
    Result := True;
  end
  else
  begin
    MmoAdd('未发现新数据文件窗体，准备前置主程序...');
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('CreateData:主程序未发现，请重启JUNO主程序...');
      Exit;
    end;
    MmoAdd('CreateData:主程序存在，准备前置JUNO主程序...');
    SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJuno, SW_NORMAL);
    MmoAdd('主程序已前置，准备启动热键...');
    keybd_event(VK_F5, 0, 0, 0);
    keybd_event(VK_F5, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('F5已激活...');
    NextActionReadyTime(tmrCreateData);
    MmoAdd('重新检测新数据文件窗体...');
  end;
  *)
end;

procedure TForm1.mmo1Change(Sender: TObject);
begin
//  if mmo1.Lines.Count > 400 then
//  begin
//    mmo1.Lines.Clear;
//  end;
end;

procedure TForm1.MmoAdd(Str: string; IsLog: Integer);
var
  Txt: TextFile;
begin
  case IsLog of
    0:
      begin
        mmo1.Lines.Add('=>' + Str + ' [' + TimeToStr(Now) + ']');
        if not FileExists(LogFilePath + LogDay + '.txt') then
        begin
          CreateDir(ExtractFilePath(ParamStr(0)) + '\Barlog');
          AssignFile(Txt, LogFilePath + LogDay + '.txt');
          Rewrite(Txt);
          CloseFile(Txt);
        end;
        AssignFile(Txt, LogFilePath + LogDay + '.txt');
        Append(Txt);
        Writeln(Txt, DateToStr(Now) + ' ' + TimeToStr(Now) + '=>' + Str);
        Flush(Txt);
        CloseFile(Txt);
      end;
    1:
      begin
        mmo1.Lines.Add('=>' + Str + ' [' + TimeToStr(Now) + ']');
      end;
    2:
      begin
        mmo1.Lines.Add('=>' + Str);
      end;

    3:
      begin
        mmo1.Lines.Add('=>' + Str);
        if not FileExists(LogFilePath + LogDay + '.txt') then
        begin
          CreateDir(ExtractFilePath(ParamStr(0)) + '\Barlog');
          AssignFile(Txt, LogFilePath + LogDay + '.txt');
          Rewrite(Txt);
          CloseFile(Txt);
        end;
        AssignFile(Txt, LogFilePath + LogDay + '.txt');
        Append(Txt);
        Writeln(Txt, DateToStr(Now) + ' ' + TimeToStr(Now) + '=>' + Str);
        Flush(Txt);
        CloseFile(Txt);
      end;
  end;

end;

procedure TForm1.MmoAdd(Str: string);
var
  Txt: TextFile;
  TempPath: string;
begin
  mmo1.Lines.Add('=>' + Str + ' [' + TimeToStr(Now) + ']');
  if chkSaveLog.Checked then
  begin
    if not FileExists(LogFilePath + LogDay + '.txt') then
    begin
      CreateDir(ExtractFilePath(ParamStr(0)) + '\Barlog');
      AssignFile(Txt, LogFilePath + LogDay + '.txt');
      Rewrite(Txt);
      CloseFile(Txt);
    end;
    AssignFile(Txt, LogFilePath + LogDay + '.txt');
    Append(Txt);
    Writeln(Txt, DateToStr(Now) + ' ' + TimeToStr(Now) + '=>' + Str);
    Flush(Txt);
    CloseFile(Txt);
  end;

end;

procedure TForm1.N1Click(Sender: TObject);
var
  i: Integer;
begin
  mmo1.Lines.Clear;
  edtBarcode.Text := '';
  edtPPID.Text := '';
  edtLotID.Text := '';
  edtWaferNumber.Text := '';
  edtWaferID.Text := '';
  for i := 0 to 24 do
  begin
    WaferIDArr[i] := '';
  end;
  RefreshWaferID;
  CHKAllDisable;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  CheckNewVersion;
end;

procedure TForm1.RefreshWaferID;
var
  I: Integer;
  Str: string;
  WaferID: string;
begin
  for I := 0 to 24 do
  begin
    WaferID := WaferIDArr[I];
    if WaferID <> '' then
    begin
      if StrToInt(WaferID) > 0 then
      begin
        Str := Str + IntToStr(StrToInt(WaferIDArr[I])) + ' ';
        case StrToInt(WaferID) of
          1:
            chk1.Checked := True;
          2:
            chk2.Checked := True;
          3:
            chk3.Checked := True;
          4:
            chk4.Checked := True;
          5:
            chk5.Checked := True;
          6:
            chk6.Checked := True;
          7:
            chk7.Checked := True;
          8:
            chk8.Checked := True;
          9:
            chk9.Checked := True;
          10:
            chk10.Checked := True;
          11:
            chk11.Checked := True;
          12:
            chk12.Checked := True;
          13:
            chk13.Checked := True;
          14:
            chk14.Checked := True;
          15:
            chk15.Checked := True;
          16:
            chk16.Checked := True;
          17:
            chk17.Checked := True;
          18:
            chk18.Checked := True;
          19:
            chk19.Checked := True;
          20:
            chk20.Checked := True;
          21:
            chk21.Checked := True;
          22:
            chk22.Checked := True;
          23:
            chk23.Checked := True;
          24:
            chk24.Checked := True;
          25:
            chk25.Checked := True;
        end;
      end;
    end;
  end;
  edtWaferID.Text := Str;
end;

procedure TForm1.RepeatFileNameClosePro;

  function EnumChildWndProcForRepeatFile(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndCaption: array[0..254] of Char;
  begin
    GetWindowText(AhWnd, WndCaption, 254);
    if Pos('是', string(WndCaption)) > 0 then
    begin
      //MmoAdd('警告窗体按钮检测完毕。');
      HwndRepeatFileYes := AhWnd;
      Result := False;
    end;
    Result := True;
  end;

var
  HwndTemp: HWND;
  FormTag: tagWINDOWINFO;
begin
  MmoAdd('RepeatFileNameClosePro:重名文件警告去除过程开启...');
  if RepeatFileYesBtnClicked then
  begin
    GetWindowInfo(FindWindow(nil, TitleRepeatFile), FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin

      MmoAdd('RepeatFileNameClosePro:弹窗处理成功。', 0);
      Exit;
    end;
  end;
  MmoAdd('RepeatFileRetryTime=' + IntToStr(RepeatFileRetryTime));
  if RepeatFileRetryTime > 100 then
  begin
    MmoAdd('RepeatFileNameClosePro:已重复检测30S，重名文件警告去除过程已经完成...');
    Exit;
  end;
  Inc(RepeatFileRetryTime);
  HwndTemp := FindWindow(nil, TitleRepeatFile);
  if (HwndTemp > 0) then
  begin
    MmoAdd('RepeatFileNameClosePro:重名警告窗体存在...');
    EnumChildWindows(HwndTemp, @EnumChildWndProcForRepeatFile, 1);
    if HwndRepeatFileYes > 0 then
    begin
      MmoAdd('RepeatFileNameClosePro:准备点击确定按钮...');
      PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
      MmoAdd('RepeatFileNameClosePro:已点击确定按钮...');
      RepeatFileYesBtnClicked := True;
      RepeatFileNameClosePro; //再检测一次是否关闭成功！
    end
    else
    begin
      MmoAdd('RepeatFileNameClosePro:重名警告窗体YES按钮检测失败，程序已退出...');
      Exit;
    end;

  end
  else
  begin
    MmoAdd('RepeatFileNameClosePro:未发现重名警告窗体，重复检测中...');
    tmrCloseRepeatDataFile.Enabled := True;
  end;

end;

procedure TForm1.SaveLotInfo;
begin
  MmoAdd('信息保存...');
  MmoAdd('barcode=' + edtBarcode.Text);
  MmoAdd('Cardname' + edtCardName.Text);
  MmoAdd('WaferID' + edtWaferID.Text);
end;

procedure TForm1.FKeyActivate(Key: Integer);
begin
  try
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('FKeyActivate:Juno主程序未启动,程序已退出！');
      Abort;
    end
    else
    begin
      //BoolFindJunoHwnd := True;
      HwndJuno := FindWindow(nil, TitleJunoTitle);
    end;
    if FindWindow(nil, TitleJunoLoadProgram) > 0 then
    begin
      MmoAdd('FKeyActivate:Juno测试文件加载窗体已经存在，准备关闭！');
      SendMessage(FindWindow(nil, TitleJunoLoadProgram), WM_CLOSE, 0, 0);
      MmoAdd('FKeyActivate:测试文件加载窗体存在，已关闭...');
    end;
    if FindWindow(nil, TitleJunoCreateTestData) > 0 then
    begin
      MmoAdd('FKeyActivate:Juno新数据文件窗体已经存在，准备关闭！');
      SendMessage(FindWindow(nil, TitleJunoCreateTestData), WM_CLOSE, 0, 0);
      MmoAdd('FKeyActivate:新数据文件窗体存在，已关闭...');
    end;
    //最前端显示Juno主程序，否则热键无法使用F1、F5
    MmoAdd('FKeyActivate:准备前置主程序...');
    SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJuno, SW_MAXIMIZE);
    MmoAdd('FKeyActivate:主程序已前置，准备启动热键...');
    keybd_event(Key, 0, 0, 0);
    keybd_event(Key, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('FKeyActivate:F1已激活...');
    Self.BringToFront;
  except
    MmoAdd('FKeyActivate:异常...');
  end;
end;

procedure TForm1.ShowMsg(Sender: TObject; Str: string);
begin
  MmoAdd(Str);
  edtBarcode.Text := Str;
end;

procedure TForm1.NextActionReadyTime(Time: TTimer);
begin
  lblInterval.Caption := IntToStr(StrToInt(Time.Interval.ToString) div 1000);
  if not tmrInterval.Enabled then
  begin
    tmrInterval.Enabled := True;
  end;
  Time.Enabled := True;
  MmoAdd('NextActionReadyTime:' + Time.Name + '已激活！');
end;

function TForm1.PPIDInputPro: Boolean;

  function EnumChildWndProcForLoadPG(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndClassName: array[0..254] of Char;
    WndCaption: array[0..254] of Char;
  begin
    GetClassName(AhWnd, WndClassName, 254);
    GetWindowText(AhWnd, WndCaption, 254);
    //SendMessage(AhWnd, WM_GETTEXT, 256, Integer(@Temp));
    HwndStr.Add(IntToStr(AhWnd));
    ClassStr.Add(string(WndClassName));
    TitleStr.Add(string(WndCaption));

    Result := True;
  end;

var
  I: Integer;
  EdtCount: Integer;
  FindCount: Integer;
  IsCheck: Cardinal;
  RetryTime: Integer;
  FormTag: tagWINDOWINFO;
  HwndTemp: HWND;
  BoolAStationFind, BoolBStationFind: Boolean;
begin
  Result := False;
  EdtCount := 0;
  IsCheck := 0; //检查是否点击有效
  FindCount := 0; //ABStation PPID 确定 四个句柄都需要找到。
  MmoAdd('PPIDInputPro:开始处理自动加载PPID作业...');
  HwndTemp := FindWindow(nil, TitleJunoLoadProgram);
  if HwndTemp > 0 then
  begin
    //HwndJunoLoadProgram := HwndTemp;
    MmoAdd('PPIDInputPro:发现测试文件加载窗体...');
    GetWindowInfo(HwndTemp, FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
      MmoAdd('PPIDInputPro:发现测试文件加载窗体但未显示,等待窗体显示中...');
      Exit;
    end;
    if HwndStr = nil then
    begin
      HwndStr := TStringList.Create;
    end
    else
    begin
      HwndStr.Clear;
    end;
    if ClassStr = nil then
    begin
      ClassStr := TStringList.Create;
    end
    else
    begin
      ClassStr.Clear;
    end;
    if TitleStr = nil then
    begin
      TitleStr := TStringList.Create;
    end
    else
    begin
      TitleStr.Clear;
    end;

    //遍历测试文件加载窗体寻找站点选项和PPID编辑窗口和确定按钮
    MmoAdd('PPIDInputPro:检索测试文件加载窗体数列表...');
    EnumChildWindows(HwndTemp, @EnumChildWndProcForLoadPG, 1);
    MmoAdd('PPIDInputPro:测试文件加载窗体数列表检索成功...');
    BoolAStationFind := False;
    BoolBStationFind := False;
    for I := 0 to HwndStr.Count - 1 do
    begin
      if not BoolAStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('A', TitleStr[I]) = 1) then
        begin
          HwndAStation := StrToInt64(HwndStr[I]);
          MmoAdd('PPIDInputPro:找到A站句柄=' + HwndStr[I]);
          Inc(FindCount);
          BoolAStationFind := True;
        end;
      end;
      if not BoolBStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('B', TitleStr[I]) = 1) then
        begin
          HwndBStation := StrToInt64(HwndStr[I]);
          MmoAdd('PPIDInputPro:找到B站句柄=' + HwndStr[I]);
          Inc(FindCount);
          BoolBStationFind := True;
        end;
      end;
      if Pos('Edit', ClassStr[I]) > 0 then
      begin
        Inc(EdtCount);
      end;
      if EdtCount = LoadPGPPIDEdtCount then
      begin
        HwndPPID := StrToInt64(HwndStr[I]);
        MmoAdd('PPIDInputPro:找到PPID句柄=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if Pos('确定', TitleStr[I]) > 0 then
      begin
        HwndLoadPGEnter := StrToInt64(HwndStr[I]);
        MmoAdd('PPIDInputPro:找到确定按钮句柄=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if FindCount = 4 then
        Break;
    end;
    if FindCount = 4 then
    begin
      MmoAdd('PPIDInputPro:测试文件加载窗体必须句柄已获取。');
    end
    else
    begin
      MmoAdd('PPIDInputPro:测试文件加载窗体必须句柄获取失败,程序错误，请联系工程师处理。');
      ShowMessage('测试文件加载窗体必须句柄获取失败,程序错误，请联系工程师处理!');
      HwndStr.Clear;
      ClassStr.Clear;
      TitleStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(ClassStr);
      FreeAndNil(TitleStr);
      Exit;
    end;
    MmoAdd('PPIDInputPro:测试文件句柄树已处理完毕。');
    HwndStr.Clear;
    ClassStr.Clear;
    TitleStr.Clear;
    FreeAndNil(HwndStr);
    FreeAndNil(ClassStr);
    FreeAndNil(TitleStr);
    MmoAdd('PPIDInputPro:测试文件句柄树文件已初始化。');
    MmoAdd('PPIDInputPro:测试文件自动录入开始。');
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStation, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('PPIDInputPro:Station 勾选第' + IntToStr(RetryTime) + '次操作...');
        SendMessage(HwndAStation, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStation, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);

        if RetryTime > 6 then
        begin
          MmoAdd('PPIDInputPro:Station 勾选操作失败，程序退出，请检查！');
          Exit;
        end;
      end;
    end
    else
    begin
      if WhichStation = 'B' then
      begin
        RetryTime := 0;
        while SendMessage(HwndBStation, BM_GETCHECK, 0, 0) = 0 do
        begin
          MmoAdd('PPIDInputPro:Station 勾选第' + IntToStr(RetryTime) + '次操作...');
          SendMessage(HwndBStation, WM_LBUTTONDOWN, 0, 0);
          SendMessage(HwndBStation, WM_LBUTTONUP, 0, 0);
          Inc(RetryTime);
        end;
        if RetryTime > 6 then
        begin
          MmoAdd('PPIDInputPro:Station 勾选操作失败，程序退出，请检查！');
          Exit;
        end;
      end;
    end;
    SendMessage(HwndPPID, WM_SETTEXT, 255, LongInt(PChar(edtPPID.Text)));
    MmoAdd('PPIDInputPro:PPID已经设置');
    PostMessage(HwndLoadPGEnter, BM_CLICK, 0, 0);
    MmoAdd('PPIDInputPro:确定按钮已经点击');
    MmoAdd('PPIDInputPro:测试文件已加载成功！');
    Result := True;
  end
  else
  begin
    ShowMessage('未发现测试文件加载窗体！');
    Exit;
  end;

end;

procedure TForm1.HookStart;
begin
  FBarReader := TBarcodeScanMonitor.GetInstance;
  FBarReader.RelayKeyPress := True;
  //按键被捕获后, 是否要继续将按键显示出来
  FBarReader.BarcodeLengths := '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,80,81,82,83';
  //条码可能的长度
  FBarReader.ScanMaxDurationSecond := 10;
  //扫描条码的最大耗时
  FBarReader.InputInterval := 1500;
  FBarReader.AlwaysDuplicatedRead := False;
  //防止条码值重复
  FBarReader.CheckPrefixStr := '';
  //前缀验证码
  FBarReader.CheckSuffixStr := '';
  //后缀验证码
  FBarReader.AutoRemoveCheckStr := True;
  FBarReader.HookedThreadId := 0;
  //0为OS级别的键盘hook
  FBarReader.OnScanFinished := Self.ShowMsg;
  //绑定一个扫描结束的事件
  if FBarReader.StartListenScan = False then
  //开始监听键盘
  begin
    ShowMessage('监听失败');
  end
  else
  begin
    MmoAdd('....');
  end;
end;

procedure TForm1.CHKAllAble;
begin
  chk1.Checked := True;
  chk2.Checked := True;
  chk3.Checked := True;
  chk4.Checked := True;
  chk5.Checked := True;
  chk6.Checked := True;
  chk7.Checked := True;
  chk8.Checked := True;
  chk9.Checked := True;
  chk10.Checked := True;
  chk11.Checked := True;
  chk12.Checked := True;
  chk13.Checked := True;
  chk14.Checked := True;
  chk15.Checked := True;
  chk16.Checked := True;
  chk17.Checked := True;
  chk18.Checked := True;
  chk19.Checked := True;
  chk20.Checked := True;
  chk21.Checked := True;
  chk22.Checked := True;
  chk23.Checked := True;
  chk24.Checked := True;
  chk25.Checked := True;
end;

procedure TForm1.CHKAllDisable;
begin
  chk1.Checked := False;
  chk2.Checked := False;
  chk3.Checked := False;
  chk4.Checked := False;
  chk5.Checked := False;
  chk6.Checked := False;
  chk7.Checked := False;
  chk8.Checked := False;
  chk9.Checked := False;
  chk10.Checked := False;
  chk11.Checked := False;
  chk12.Checked := False;
  chk13.Checked := False;
  chk14.Checked := False;
  chk15.Checked := False;
  chk16.Checked := False;
  chk17.Checked := False;
  chk18.Checked := False;
  chk19.Checked := False;
  chk20.Checked := False;
  chk21.Checked := False;
  chk22.Checked := False;
  chk23.Checked := False;
  chk24.Checked := False;
  chk25.Checked := False;
end;

procedure TForm1.chkLockClick(Sender: TObject);
begin
  WaferIDLock := not WaferIDLock;
  LockAllChk(WaferIDLock);
  chk26.Enabled := not WaferIDLock;
end;

procedure TForm1.ChooseStationToClose;

  function EnumChildWndProcForCloseData(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndCaption: array[0..254] of Char;
  begin
    GetWindowText(AhWnd, WndCaption, 254);
    if Pos('确定', string(WndCaption)) > 0 then
    begin
      HwndCloseDataYesBtn := AhWnd;
    end;
    if Pos('&A', string(WndCaption)) > 0 then
    begin
      HwndCloseDataAStation := AhWnd;
    end;
    if Pos('&B', string(WndCaption)) > 0 then
    begin
      HwndCloseDataBStation := AhWnd;
    end;
    Result := True;
  end;

var
  HwndTemp: HWND;
begin
  MmoAdd('ChooseStationToClose:开始处理关闭数据...', 2);
  HwndTemp := FindWindow(nil, TitleJunoCLoseData);
  if HwndTemp > 0 then
  begin
    HwndLoadEndYes := 0;
    EnumChildWindows(HwndTemp, @EnumChildWndProcForCloseData, 2);
    MmoAdd('ChooseStationToClose:关闭数据文件窗体检测完毕。', 2);
    if WhichStation = 'A' then
    begin
      SendMessage(HwndCloseDataAStation, WM_LBUTTONDOWN, 0, 0);
      SendMessage(HwndCloseDataAStation, WM_LBUTTONUP, 0, 0);
    end;
    if WhichStation = 'B' then
    begin
      SendMessage(HwndCloseDataBStation, WM_LBUTTONDOWN, 0, 0);
      SendMessage(HwndCloseDataBStation, WM_LBUTTONUP, 0, 0);
    end;

    if HwndCloseDataYesBtn > 0 then
    begin
      //找到YES按钮，前置后发送点击命令。
      PostMessage(HwndCloseDataYesBtn, BM_CLICK, 0, 0);
      MmoAdd('ChooseStationToClose:关闭数据文件窗体确定按键已点击。', 2);
    end
  end;

end;

procedure TForm1.CloseChooseSationFun;

  function EnumChildWndProcForChooseStation(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndCaption: array[0..254] of Char;
    YesBtn: Boolean;
    ChooseStationLabel: Boolean;
  begin
    GetWindowText(AhWnd, WndCaption, 254);
    if Pos('是', string(WndCaption)) > 0 then
    begin
      //MmoAdd('警告窗体按钮检测完毕。');
      HwndLoadEndYes := AhWnd;
      YesBtn := True;
      //Result := False;
    end;
    if Pos('请选择一个测试站', string(WndCaption)) > 0 then
    begin
      ChooseStationLabel := True;
      Result := False;
    end;
    Result := True;
  end;

var
  HwndTemp: HWND;
begin
  MmoAdd('CloseChooseSationFun:开始处理DTS Logger...', 2);
  HwndTemp := FindWindow(nil, TitleJunoChooseStation);
  if HwndTemp > 0 then
  begin
    HwndLoadEndYes := 0;
    EnumChildWindows(HwndTemp, @EnumChildWndProcForChooseStation, 2);
    MmoAdd('CloseChooseSationFun:选择弹窗按钮检测完毕。', 2);
    if HwndLoadEndYes > 0 then
    begin
      //找到YES按钮，前置后发送点击命令。
      PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
      MmoAdd('CloseChooseSationFun:选择弹窗YES按钮已点击。', 2);
    end
  end;

  Exit;

end;

procedure TForm1.CloseRepeatFileName;

  function EnumChildWndProcForRepeatFile(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndCaption: array[0..254] of Char;
  begin
    GetWindowText(AhWnd, WndCaption, 254);
    if Pos('是', string(WndCaption)) > 0 then
    begin
      //MmoAdd('警告窗体按钮检测完毕。');
      HwndRepeatFileYes := AhWnd;
      Result := False;
    end;
    Result := True;
  end;

var
  hwndTemp: HWND;
begin
  hwndTemp := FindWindow(nil, TitleJunoChooseStation);
  EnumChildWindows(hwndTemp, @EnumChildWndProcForRepeatFile, 1);
  if HwndRepeatFileYes > 0 then
  begin
    PostMessage(HwndRepeatFileYes, BM_CLICK, 0, 0);
    MmoAdd('CloseRepeatFileName:重复文件窗体确定按钮已经点击。');
  end;

end;

function TForm1.SplitWaferNumber(WaferStr: string): Boolean;
var
  I: Integer;
  //WaferID: string;
  WaferSlot: array[0..24] of Integer;
  TempStr, SampleWaferID: string;
  Arr: TArray<string>;
begin
  Result := False;
  SampleWaferID := '';
  if Length(WaferStr) = 0 then
  begin
    MmoAdd('片号信息错误！');
  end
  else
  begin
    try
      //Arr := WaferStr.Split([';']);
      Arr := TRegEx.Split(Trim(WaferStr), '\;');
      //Arr最后一个为空白字符串
      for I := 0 to Length(Arr) - 2 do
      begin
        if (StrToInt(Arr[I]) > 25) or (StrToInt(Arr[I]) < 0) then
        begin
          MmoAdd('??片号信息错误！');
          Exit;
        end;
        if Trim(Arr[I]) = '' then
          Continue;
        if Arr[I] <> '' then
        begin
          WaferIDArr[StrToInt(Arr[I]) - 1] := Arr[I];
          SampleWaferID := SampleWaferID + ' ' + IntToStr(StrToInt(Arr[I]));
        end;

      end;
      edtWaferID.Text := Trim(SampleWaferID);
      RefreshWaferID;
      Result := True;
    except
      on E: Exception do
        MmoAdd('片号信息错误！');
    end;
  end;

end;

procedure TForm1.tmrAutoCheckUpdateTimer(Sender: TObject);
begin
  NewVerCheck;
end;

procedure TForm1.tmrCloseRepeatDataFileTimer(Sender: TObject);
begin
  tmrCloseRepeatDataFile.Enabled := False;
  RepeatFileNameClosePro;
end;

procedure TForm1.tmrCreateDataTimer(Sender: TObject);
begin
  //此处需开启重名文件窗体检测
  MmoAdd('tmrCreateDataTimer:数据文件重名窗体处理已经开启...');
  RepeatFileRetryTime := 0;
  RepeatFileYesBtnClicked := False;
  if not tmrCloseRepeatDataFile.Enabled then
  begin
    tmrCloseRepeatDataFile.Enabled := True;
  end;
  CreateData;

end;

procedure TForm1.tmrDelayRunTimer(Sender: TObject);
var
  Temp: Integer;
begin
  Temp := StrToInt(tmrDelayRun.Interval.ToString) div 1000;
  lblInterval.Caption := IntToStr(Temp - 1);
  if not tmrInterval.Enabled then
  begin
    tmrInterval.Enabled := True;
    JunoMainPGShowCheck;
  end;

end;

procedure TForm1.tmrIntervalTimer(Sender: TObject);
var
  Interval: Integer;
begin

  Interval := StrToInt(lblInterval.Caption);
  Dec(Interval);
  lblInterval.Caption := IntToStr(Interval);
  if Interval <= 0 then
  begin
    tmrInterval.Enabled := False;
  end;

end;

procedure TForm1.tmrLoadEndTimer(Sender: TObject);
var
  Temp: Integer;
begin
  //加载测试文件确定后会弹出警告框，需要处理掉。
  tmrLoadEnd.Enabled := False;
  LoadPGEnd;
end;

procedure TForm1.tmrRunLoadPGTimer(Sender: TObject);
begin
  MmoAdd('tmrRunLoadPGTimer:确定窗体处理已经开启...');
  tmrRunLoadPG.Enabled := False;
  LoadEndRetryTime := 0;
  YESBtnClicked := False;
  if not tmrLoadEnd.Enabled then
  begin
    tmrLoadEnd.Enabled := True;
  end;
  LoadPGFun;
end;

procedure TForm1.UpdateProgram;
begin
   //
end;

function TForm1.NewVerCheck: Boolean;
var
  S: string;
begin
  Result := False;
  NewFileCheck('JunoBarcode', UpdatePath, S);
  if FileExists(S) then
  begin
    Result := True;
    N3.Enabled := True;

  end
  else
  begin
    N3.Enabled := False;
  end;
end;

procedure TForm1.CheckNewVersion;
var
  S: string;
  PrgPath: string;
  Path: string;
  Txt: TextFile;
begin
  //更新程序,从指定路径下载相同文件名
  if MessageDlg('确定更新程序？', TMsgDlgType.mtWarning, [mbYes, mbNo], 0) = mrNo then
    Abort;
  NewFileCheck('JunoBarcode', UpdatePath, S);
  if S = '' then
  begin
    ShowMessage('暂时无最新版本，请联系工程师确认！');
    Abort;
  end;
  //拷贝新文件至当前目录，生成新文件
  PrgPath := ExtractFileDir(ParamStr(0));
  Path := ExtractFileDir(ParamStr(0)) + NewVerPath;
  if not DirectoryExists(Path) then
  begin
    CreateDir(ExtractFileDir(ParamStr(0)) + NewVerPath);
    if MoveFile(PWideChar(S), PWideChar(PrgPath + '\' + ExtractFileName(S))) then
    begin
      ShowMessage('新程序拷贝成功！本程序将退出，立即启动新程序！');
    end;
    AssignFile(Txt, ExtractFileDir(ParamStr(0)) + NewVerPath + JunoConfig);
    Rewrite(Txt);
    Writeln(Txt, ParamStr(0));
    Flush(Txt);
    CloseFile(Txt);
  end
  else
  begin
    if MoveFile(PWideChar(S), PWideChar(PrgPath + '\' + ExtractFileName(S))) then
    begin
      ShowMessage('新程序拷贝成功！本程序将自动退出，并立即自动启动新程序！');
    end;
    AssignFile(Txt, ExtractFileDir(ParamStr(0)) + NewVerPath + JunoConfig);
    Rewrite(Txt);
    Writeln(Txt, ParamStr(0));
    Flush(Txt);
    CloseFile(Txt);
  end;
  //打开新程序，退出本程序。
  ShellExecute(Handle, 'open', PWideChar(PrgPath + '\' + ExtractFileName(S)), '-s', '', SW_SHOWNORMAL);
  Application.Terminate;
end;

end.

