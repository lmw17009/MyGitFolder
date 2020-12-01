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
  HwndJuno: HWND; //������ľ��
  HwndJunoMap: HWND; //Map������
  HwndJunoMapSetup: HWND; //map�趨������
  HwndJunoLoadProgram: HWND; //�����ļ����ش���ľ��
  HwndJunoCreateTestData: HWND; //�½��������ݴ���ľ��
  HwndOKBtn: HWND; //ȷ����ť�ľ��
  //DeskFindHwndCount: LongInt;
  BoolFindJunoHwnd: Boolean; //�Ƿ��ҵ�������JUNO�ľ��
  BoolAlreadyShowLoadPG, BoolAlreadyShowCreateData: Boolean;
  JunoAutoRunTime: Integer;
  JunoLoadPGRunTime: Integer;
  JunoCreateDataRunTime: Integer;
  HwndStr, ClassStr, TitleStr: TStrings;
  HwndAStation, HwndBStation: HWND;
  HwndPPID, HwndLoadPGEnter: HWND;
  HwndAStationCreate, HwndBStationCreate: HWND;
  HwndMapOperatorID, HwndMapLotID, HwndMapPPID, HwndMapEqID, HwndMapTesterID, HwndMapCardName, HwndMapYesBtn: HWND; //Map�趨������
  HwndFileName, HwndOperator, HwndTag, HwndAutoFile, Hwnd1_25, Hwnd2_24, HwndWaferNumber, HwndCreateEnter: HWND;
  HwndCloseDataAStation, HwndCloseDataBStation, HwndCloseDataYesBtn: HWND; //�ر������ļ��������þ��

  LoadEndRetryTime: Integer; //����ppid�󵯳��Ĵ���
  RepeatFileRetryTime: Integer; //�������ļ�����������
  HwndLoadEndYes: HWND; //�²����ļ����洰��YES��ť
  HwndRepeatFileYes: HWND; //�����ļ��������洰��YES��ť
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
  TitleJunoLoadProgram = '�����ļ�����';
  TitleJunoCreateTestData = '�������ļ�';
  TitleJunoMapASetup = '�趨 - A';
  TitleJunoMapBSetup = '�趨 - B';
  TitleJunoLoadEnd = '�رմ���';
  TitleJunoChooseStation = 'DTS-Logger';
  TitleJunoCLoseData = '�ر������ļ�';
  TitleJunoLoadEndYesBtn = '��';
  TitleRepeatFile = 'DTS-Logger';
  TitleRepeatFileYesBtn = '��';
  TitleOKBtn = 'ȷ��';
  JunoPGPath = ''; //juno����·��
  LoadPGPPIDEdtCount = 2;
  LoadEndRetryTimeMax = 5; //����ppid�󵯳���ȷ�������������
  EdtCountFileName = 1; //lotIDλ��
  EdtCountOperator = 6; //����ԱID
  EdtCountTag = 8; //Tag
  EdtCountWaferNumber = 2; //waferID��
  TitleCreateAutoFile = '�Զ��ļ�';
  TitleCreateEnterBtn = 'ȷ��';
  TitleMapEnterBtn = 'ȷ��';
  LogFilePath = '.\Barlog\BarcodeLog';
  DelayInterval = 2000; //����������̼������ֹ����
  PPIDInputRetryTime = 10; //F1����PPID�����Ⳣ�Դ���

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
    Form1.MmoAdd('Juno���������ҵ�=' + IntToStr(AhWnd));
    HwndJuno := AhWnd;
    BoolFindJunoHwnd := True;
  end;
  if string(WndCaption) = TitleJunoLoadProgram then
  begin
    Form1.MmoAdd('=>�����ļ����ش����Ѵ���=' + IntToStr(AhWnd));
    HwndJunoLoadProgram := AhWnd;
    BoolAlreadyShowLoadPG := True;
  end;
  if string(WndCaption) = TitleJunoCreateTestData then
  begin
    Form1.MmoAdd('=>�½��������ݴ����Ѵ���=' + IntToStr(AhWnd));
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
  MmoAdd('AdjustBarcodeData:׼������Barcode��Ϣ��');
  ClearEdtPro;
  if Trim(edtBarcode.Text) = '' then
    Exit;
  if not JsonAdj(Trim(edtBarcode.Text), TempJs) then
  begin
    MmoAdd('AdjustBarcodeData:��ά������쳣��');
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

    MmoAdd('AdjustBarcodeData:������ɡ�');
  end;
//  Arr := TRegEx.Split(Trim(edtBarcode.Text), '\,');
//  try
//    edtPPID.Text := Arr[0];
//    if Pos('_', Arr[0]) <> 4 then
//    begin
//      MmoAdd('AdjustBarcodeData:PPID��Ϣ����');
//      Exit;
//    end;
//    edtLotID.Text := Arr[1];
//    edtWaferNumber.Text := Arr[2];
//    if SplitWaferNumber(Arr[2]) then
//    begin
//      MmoAdd('AdjustBarcodeData:AdjustBarcodeData:Barcode�����ɹ���');
//      //�˴����AB��ť����ʾ�������ɹ��Ż���ʾ��
//
//
//    end;
//  except
//    on E: Exception do
//      MmoAdd('AdjustBarcodeData:ɨ����Ϣ����..');
//  end;

end;

procedure TForm1.btn10Click(Sender: TObject);
begin
  WhichStation := 'A';
  MmoAdd('��ѡ��Aվ...');
  SaveLotInfo;
  AdjustBarcodePro;
  JunoAutoRunCoreNew;
end;

procedure TForm1.btn11Click(Sender: TObject);
begin
  WhichStation := 'B';
  MmoAdd('��ѡ��Bվ...');
  SaveLotInfo;
  AdjustBarcodePro;
  JunoAutoRunCoreNew;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  if WhichStation = '' then
  begin
    ShowMessage('��ѡ��վ��');
    Exit;
  end;

  if not CheckValue then
  begin
    MmoAdd('��Ҫ����ȱʧ��');
    ShowMessage('Lot��Ϣȱʧ�����ʵ��');
    Exit;
  end;
  MmoAdd('JunoAutoRunCoreNew:׼���޸��뿨��������...');
//  if WhichStation = 'A' then
//  begin
//    HwndJunoMapSetup := FindWindow(nil, TitleJunoMapASetup);
//  end;
//  if WhichStation = 'B' then
//  begin
//    HwndJunoMapSetup := FindWindow(nil, TitleJunoMapBSetup);
//  end;
//  MmoAdd('JunoAutoRunCoreNew:����趨�������ɹ���Ѱ�ҹؼ����...');
  MapSetupManualNew;
//
//  if HwndJunoMapSetup > 0 then
//  begin
//
//  end
//  else
//  begin
//    ShowMessage('δ����Map�趨����');
//    MmoAdd('mapһ���趨ʧ��...');
//    Exit;
//  end;

  MmoAdd('JunoAutoRunCoreNew:Map�趨���...');
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
  MmoAdd('��ѡ��Bվ...');
  JunoAutoRunCore;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  if WhichStation = '' then
  begin
    ShowMessage('��ѡ��վ��');
    Abort;
  end;
  if not CheckValue then
  begin
    MmoAdd('��Ҫ����ȱʧ��');
    ShowMessage('Lot��Ϣȱʧ��');
    Abort;
  end;
  if PPIDInputPro then
  begin
    MmoAdd('�����ļ����سɹ���');
    Self.BringToFront;
  end;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
  if not CheckValue then
  begin
    MmoAdd('��Ҫ����ȱʧ��');
    ShowMessage('Lot��Ϣȱʧ��');
    Abort;
  end;
  if CreateNewData then
  begin
    MmoAdd('���������ļ��½��ɹ���');
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
    MmoAdd('���ɨ��ǹ���.');
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
    MmoAdd('��Ҫ����ȱʧ��');
    ShowMessage('Lot��Ϣȱʧ��');
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
    MmoAdd('��EAS��Ʒ���ֶ�ѡ��Ƭ�š�');
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
    MmoAdd('��ɨ���뿨��Ϣ��');
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
      Form1.MmoAdd('Juno������������ҵ�=' + IntToStr(AhWnd));
      HwndJuno := AhWnd;
      Result := False;
    end;
    Result := True;
  end;

var
  HwndTemp: HWND;
  Tag: tagWINDOWINFO;
begin
  MmoAdd('Juno����������������...');
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
      MmoAdd('�����ļ����ش��廹δ��ʾ��������...');
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
  EdtCount: Integer; //Edt������Ϊlotidλ��
  RetryTime: Integer;
begin
  MmoAdd('CreateData:�������ļ���������...');
  Result := False;
  Count := 0;
  EdtCount := 0;
    //F5�½��������ݴ��幦��
    //����½��������ݴ����Ƿ���ڣ�������ǰ��Juno������ģ��F5f
  if FindWindow(nil, TitleJunoCreateTestData) > 0 then
  begin
    MmoAdd('CreateData:�����½��������ݴ���...');
    YESBtnClicked := True;
    MmoAdd('CreateData:�ѹر��²����ļ����徯����...');
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
    MmoAdd('CreateData:��ʼ����������list���...');
    //ShowWindow(HwndJuno, SW_RESTORE);
    //ShowWindow(HwndJunoLoadProgram, SW_RESTORE);
    //���������ļ����ش���Ѱ��վ��ѡ���PPID�༭���ں�ȷ����ť
    EnumChildWindows(FindWindow(nil, TitleJunoCreateTestData), @EnumChildWndProcForCreateData, 1);
    for I := 0 to HwndStr.Count - 1 do
    begin
      if Pos('&A', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateData:Aվ��ȡ�ɹ�..');
        HwndAStationCreate := StrToInt64(HwndStr[I]);
        Inc(Count);
        Continue;
      end;
      if Pos('&B', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateData:Bվ��ȡ�ɹ�...');
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
              MmoAdd('CreateData:lotname��ȡ�ɹ�...');
              HwndFileName := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountWaferNumber:
            begin
              MmoAdd('CreateData:wafernumber��ȡ�ɹ�...');
              HwndWaferNumber := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountOperator:
            begin
              MmoAdd('CreateData:OperatorID��ȡ�ɹ�...');
              HwndOperator := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountTag:
            begin
              MmoAdd('CreateData:Commit��ȡ�ɹ�...');
              HwndTag := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
        end;
      end;
      if Pos(TitleCreateAutoFile, TitleStr[I]) > 0 then
      begin
        //�Զ��ļ���ť
        MmoAdd('CreateData:�Զ��ļ���ť��ȡ�ɹ�...');
        Inc(Count);
        HwndAutoFile := StrToInt64(HwndStr[I]);
      end;

      if Pos(TitleCreateEnterBtn, TitleStr[I]) > 0 then
      begin
        //ȷ����ť
        MmoAdd('CreateData:ȷ����ť��ȡ�ɹ�...');
        Inc(Count);
        HwndCreateEnter := StrToInt64(HwndStr[I]);
      end;
      if Count = 8 then
      begin
        MmoAdd('CreateData:�������ļ�����8������Ѿ���ȡ�ɹ����˳�ѭ��...');
        Break;
      end;
    end;
    if Count <> 8 then
    begin
      MmoAdd('CreateData:�������ļ�����8�������ȡʧ�ܡ�����ϵ����ʦ����...');
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
      MmoAdd('CreateData:�������ļ����������ȡ�ɹ���׼��¼������...');
      HwndStr.Clear;
      TitleStr.Clear;
      ClassStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(TitleStr);
      FreeAndNil(ClassStr);
    end;
    //�������ļ����崦������
    //stationվѡ��
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateData:A-Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
        SendMessage(HwndAStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateData:A-Station��ѡ����ʧ�ܣ������˳������飡');
        Exit;
      end;
    end;
    if WhichStation = 'B' then
    begin
      RetryTime := 0;
      while SendMessage(HwndBStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateData:B-Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
        SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateData:B-Station ��ѡ����ʧ�ܣ������˳������飡');
        Exit;
      end;
    end;
    //lotid�������
    MmoAdd('CreateData:Station��ѡ�����ɹ�...');
    MmoAdd('CreateData:׼����������...');
    SendMessage(HwndFileName, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateData:lotid�Ѿ�����');
    SendMessage(HwndTag, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateData:tag�Ѿ�����');
    SendMessage(HwndOperator, WM_SETTEXT, 255, LongInt(PChar(edtOperator.Text)));
    MmoAdd('CreateData:Operator�Ѿ�����');
    RetryTime := 0;
    while SendMessage(HwndAutoFile, BM_GETCHECK, 0, 0) = 0 do
    begin
      MmoAdd('CreateData:�Զ��ļ���ť��' + IntToStr(RetryTime) + '�β���...');
        //SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        //SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
      SendMessage(HwndAutoFile, BM_CLICK, 0, 0);
      Inc(RetryTime);
    end;
    if RetryTime > 6 then
    begin
      MmoAdd('CreateData:�Զ��ļ���ť�޷�����������������ϵ����ʦ����');
      Exit
    end;
    SendMessage(HwndWaferNumber, WM_SETTEXT, 255, LongInt(PChar(Trim(edtWaferID.Text))));
    MmoAdd('CreateData:wafernumber�Ѿ�����');
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONUP, 0, 0);
    SendMessage(HwndCreateEnter, BM_CLICK, 0, 0);
    MmoAdd('CreateData:ȷ����ť�ѷ��͵��...��');
    MmoAdd('CreateData:�������ļ��Ѿ�������ϡ�');
    tmrCreateData.Enabled := False;
    Result := True;
  end
  else
  begin
    MmoAdd('δ�����������ļ����壬׼��ǰ��������...');
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('CreateData:������δ���֣�������JUNO������...');
      Exit;
    end;
    MmoAdd('CreateData:��������ڣ�׼��ǰ��JUNO������...');
    SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJuno, SW_NORMAL);
    MmoAdd('��������ǰ�ã�׼�������ȼ�...');
    keybd_event(VK_F5, 0, 0, 0);
    keybd_event(VK_F5, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('F5�Ѽ���...');
    NextActionReadyTime(tmrCreateData);
    MmoAdd('���¼���������ļ�����...');
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
  EdtCount: Integer; //Edt������Ϊlotidλ��
  RetryTime: Integer;
  HwndTemp: HWND;
  FormTag: tagWINDOWINFO;
begin
  MmoAdd('CreateNewData:�������ļ���������...');
  Result := False;
  Count := 0;
  EdtCount := 0;
    //F5�½��������ݴ��幦��
    //����½��������ݴ����Ƿ���ڣ�������ǰ��Juno������ģ��F5
  HwndTemp := FindWindow(nil, TitleJunoCreateTestData);
  if HwndTemp > 0 then
  begin
    MmoAdd('CreateNewData:�����½��������ݴ���...');
    GetWindowInfo(HwndTemp, FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
      MmoAdd('CreateNewData:���ֲ����ļ����ش��嵫δ��ʾ,�ȴ�������ʾ��...');
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
    MmoAdd('CreateNewData:��ʼ����������list���...');
    //ShowWindow(HwndJuno, SW_RESTORE);
    //ShowWindow(HwndJunoLoadProgram, SW_RESTORE);
    //���������ļ����ش���Ѱ��վ��ѡ���PPID�༭���ں�ȷ����ť
    EnumChildWindows(HwndTemp, @EnumChildWndProcForCreateData, 1);
    for I := 0 to HwndStr.Count - 1 do
    begin
      if Pos('&A', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateNewData:Aվ��ȡ�ɹ�..');
        HwndAStationCreate := StrToInt64(HwndStr[I]);
        Inc(Count);
        Continue;
      end;
      if Pos('&B', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateNewData:Bվ��ȡ�ɹ�...');
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
              MmoAdd('CreateNewData:lotname��ȡ�ɹ�...');
              HwndFileName := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountWaferNumber:
            begin
              MmoAdd('CreateNewData:wafernumber��ȡ�ɹ�...');
              HwndWaferNumber := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountOperator:
            begin
              MmoAdd('CreateNewData:OperatorID��ȡ�ɹ�...');
              HwndOperator := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountTag:
            begin
              MmoAdd('CreateNewData:Commit��ȡ�ɹ�...');
              HwndTag := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
        end;
      end;
      if Pos(TitleCreateAutoFile, TitleStr[I]) > 0 then
      begin
        //�Զ��ļ���ť
        MmoAdd('CreateNewData:�Զ��ļ���ť��ȡ�ɹ�...');
        Inc(Count);
        HwndAutoFile := StrToInt64(HwndStr[I]);
      end;

      if Pos(TitleCreateEnterBtn, TitleStr[I]) > 0 then
      begin
        //ȷ����ť
        MmoAdd('CreateNewData:ȷ����ť��ȡ�ɹ�...');
        Inc(Count);
        HwndCreateEnter := StrToInt64(HwndStr[I]);
      end;
      if Count = 8 then
      begin
        MmoAdd('CreateNewData:�������ļ�����8������Ѿ���ȡ�ɹ����˳�ѭ��...');
        Break;
      end;
    end;
    if Count <> 8 then
    begin
      MmoAdd('CreateNewData:�������ļ�����8�������ȡʧ�ܡ�����ϵ����ʦ����...');
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
      MmoAdd('CreateNewData:�������ļ����������ȡ�ɹ���׼��¼������...');
      HwndStr.Clear;
      TitleStr.Clear;
      ClassStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(TitleStr);
      FreeAndNil(ClassStr);
    end;
    //�������ļ����崦������
    //stationվѡ��
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateNewData:A-Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
        SendMessage(HwndAStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateNewData:A-Station��ѡ����ʧ�ܣ������˳������飡');
        Exit;
      end;
    end;
    if WhichStation = 'B' then
    begin
      RetryTime := 0;
      while SendMessage(HwndBStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateNewData:B-Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
        SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateNewData:B-Station ��ѡ����ʧ�ܣ������˳������飡');
        Exit;
      end;
    end;
    //lotid�������
    MmoAdd('CreateNewData:Station��ѡ�����ɹ�...');
    MmoAdd('CreateNewData:׼����������...');
    SendMessage(HwndFileName, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateNewData:lotid�Ѿ�����');
    SendMessage(HwndTag, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateNewData:tag�Ѿ�����');
    SendMessage(HwndOperator, WM_SETTEXT, 255, LongInt(PChar(edtOperator.Text)));
    MmoAdd('CreateNewData:Operator�Ѿ�����');
    RetryTime := 0;
    while SendMessage(HwndAutoFile, BM_GETCHECK, 0, 0) = 0 do
    begin
      MmoAdd('CreateData:�Զ��ļ���ť��' + IntToStr(RetryTime) + '�β���...');
        //SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        //SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
      SendMessage(HwndAutoFile, BM_CLICK, 0, 0);
      Inc(RetryTime);
    end;
    if RetryTime > 6 then
    begin
      MmoAdd('CreateData:�Զ��ļ���ť�޷�����������������ϵ����ʦ����');
      Exit
    end;
    SendMessage(HwndWaferNumber, WM_SETTEXT, 255, LongInt(PChar(Trim(edtWaferID.Text))));
    MmoAdd('CreateData:wafernumber�Ѿ�����');
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONUP, 0, 0);
    PostMessage(HwndCreateEnter, BM_CLICK, 0, 0);
    MmoAdd('CreateNewData:ȷ����ť�ѷ��͵��...��');
    MmoAdd('CreateNewData:�������ļ��Ѿ�������ϡ�');
    Result := True;
  end
  else
  begin
    //MmoAdd('δ�����������ļ����壬׼��ǰ��������...');
    ShowMessage('δ�����������ļ�����');
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
      MmoAdd('JunoAutoRunCore:Juno������δ����,�������˳���');
      Exit;
    end
    else
    begin
      BoolFindJunoHwnd := True;
      HwndJuno := FindWindow(nil, TitleJunoTitle);
    end;
    if FindWindow(nil, TitleJunoLoadProgram) > 0 then
    begin
      MmoAdd('JunoAutoRunCore:Juno�����ļ����ش����Ѿ����ڣ�׼���رգ�');
      SendMessage(FindWindow(nil, TitleJunoLoadProgram), WM_CLOSE, 0, 0);
      MmoAdd('�����ļ����ش�����ڣ��ѹر�...');
    end;
    if FindWindow(nil, TitleJunoCreateTestData) > 0 then
    begin
      MmoAdd('JunoAutoRunCore:Juno�������ļ������Ѿ����ڣ�׼���رգ�');
      SendMessage(FindWindow(nil, TitleJunoCreateTestData), WM_CLOSE, 0, 0);
      MmoAdd('�������ļ�������ڣ��ѹر�...');
    end;

  //��ǰ����ʾJuno�����򣬷����ȼ��޷�ʹ��F1��F5
    MmoAdd('JunoAutoRunCore:׼��ǰ��������...');
    SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJuno, SW_NORMAL);
    MmoAdd('JunoAutoRunCore:��������ǰ�ã�׼�������ȼ�...');
    keybd_event(VK_F1, 0, 0, 0);
    keybd_event(VK_F1, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('JunoAutoRunCore:F1�Ѽ���...');
  //�ȼ�F1���˺���в����ļ����ش���ļ�⡣
    MmoAdd('JunoAutoRunCore:����ʱ��ʼ...');
  //lblInterval.Caption := IntToStr(StrToInt(tmrRunLoadPG.Interval.ToString) div 1000);
    NextActionReadyTime(tmrRunLoadPG);
    Result := True;
  except
    on E: Exception do
      MmoAdd('JunoAutoRunCore:JunoAutoRunCore:�������...');
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
      MmoAdd('JunoAutoRunCoreNew:Juno������δ����,�������˳���');
      Abort;
    end
    else
    begin
      BoolFindJunoHwnd := True;
      HwndJuno := FindWindow(nil, TitleJunoTitle);
    end;
    if FindWindow(nil, TitleJunoLoadProgram) > 0 then
    begin
      MmoAdd('JunoAutoRunCoreNew:Juno�����ļ����ش����Ѿ����ڣ�׼���رգ�');
      SendMessage(FindWindow(nil, TitleJunoLoadProgram), WM_CLOSE, 0, 0);
      MmoAdd('JunoAutoRunCoreNew:�����ļ����ش�����ڣ��ѹر�...');
    end;
    if FindWindow(nil, TitleJunoCreateTestData) > 0 then
    begin
      MmoAdd('JunoAutoRunCore:Juno�������ļ������Ѿ����ڣ�׼���رգ�');
      SendMessage(FindWindow(nil, TitleJunoCreateTestData), WM_CLOSE, 0, 0);
      MmoAdd('JunoAutoRunCoreNew:�������ļ�������ڣ��ѹر�...');
    end;

  //��ǰ����ʾJuno�����򣬷����ȼ��޷�ʹ��F1��F5
    MmoAdd('JunoAutoRunCore:׼��ǰ��������...');
    SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJuno, SW_NORMAL);
    MmoAdd('JunoAutoRunCoreNew:��������ǰ�ã�׼�������ȼ�...');
    keybd_event(VK_F1, 0, 0, 0);
    keybd_event(VK_F1, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('JunoAutoRunCoreNew:F1�Ѽ���...');
  //�ȼ�F1���˺���в����ļ����ش���ļ�⡣
    DelayRun(DelayInterval);
  //�������ļ����ش���
    MmoAdd('JunoAutoRunCoreNew:��������ļ����ش���...');
    PPIDRetry := 0; //��ʼ������ֵ��
    while (FindWindow(nil, TitleJunoLoadProgram) = 0) do
    begin
      if PPIDRetry > PPIDInputRetryTime then
      begin
        MmoAdd('JunoAutoRunCoreNew:�����ļ�����40S��ⳬʱ...');
        Exit;
      end;
      //����δ�������ȴ���һ�μ�⡣
      MmoAdd('JunoAutoRunCoreNew:�����ļ����ش��崰��δ�������ȴ���һ�μ��...');
      DelayRun(DelayInterval);
      Inc(PPIDRetry);
    end;

    if FindWindow(nil, TitleJunoLoadProgram) > 0 then
    begin
     //����PPID�Ӳ�
      //�������Ƿ���ʾ
//            GetWindowInfo(Handle, FormTag);
//      if (FormTag.dwStyle and WS_VISIBLE) = 0 then
//      begin
//
//      end;
      MmoAdd('JunoAutoRunCoreNew:�����ļ����ش����Ѵ���...');
      PPIDRetry := 0; //��ʼ������ֵ��

      while PPIDRetry <= PPIDInputRetryTime do
      begin
        GetWindowInfo(Handle, FormTag);
        if (FormTag.dwStyle and WS_VISIBLE) = 0 then
        begin
            //����δ��ʾ�������ȴ���
          MmoAdd('JunoAutoRunCoreNew:�����ļ����ش���δ��ʾ���ȴ���һ�μ��...');
          DelayRun(DelayInterval);
        end
        else
        begin
          MmoAdd('JunoAutoRunCoreNew:�����ļ����ش����Ѿ���ʾ...');
          Break;
        end;
        Inc(PPIDRetry);
      end;

      DelayRun(DelayInterval);
      MmoAdd('JunoAutoRunCoreNew:���ֲ����ļ����ش���...');

      if not PPIDInputPro then
      begin
        MmoAdd('JunoAutoRunCoreNew:�����ļ����ع��̴���ʧ��...');
        Exit;
      end;

       //����2�ε���������Ҳ�п���һ�β��ô���
      MmoAdd('JunoAutoRunCoreNew:��������ļ����ش���ɹ�...');
      DelayRun(DelayInterval);
      MmoAdd('JunoAutoRunCoreNew:����رմ���1...');
      LoadPGEndNew;
      DelayRun(DelayInterval);
        //���������ȷ����������Ҫ�ٹر�һ�Ρ�
//        if FindWindow(nil, TitleJunoLoadEnd) > 0 then
//        begin
//          DelayRun(DelayInterval);
//          LoadPGEndNewSec;
//
//          //�ڶ����������������ʾ��Ҫ�ر�֮ǰ�Ѿ������õ����ݡ�
//          if FindWindow(nil, TitleJunoChooseStation) > 0 then
//          begin
//            //�ر�ѡվ�ر�������ʾ
//            DelayRun(DelayInterval);
//            CloseChooseSationFun;
//            //ѡվ�ر�����
//            DelayRun(DelayInterval);
//            ChooseStationToClose;
//          end;
//        end;
      MmoAdd('JunoAutoRunCoreNew:����رմ���2...');
      LoadPGEndNewSec; //����ڶ��ο��ܵĵ���
      DelayRun(DelayInterval * 2);
      MmoAdd('JunoAutoRunCoreNew:����dts-logger��ʾ...');
      CloseChooseSationFun; //����dts-logger��ʾ
      DelayRun(DelayInterval);
      MmoAdd('JunoAutoRunCoreNew:����ѡվ��������ݴ���...');
      ChooseStationToClose; //����ѡվ��������ݴ���
      DelayRun(DelayInterval * 2);

      MmoAdd('JunoAutoRunCoreNew:�����´��������ļ�����...');
          // �������ļ����崦��
      if FindWindow(nil, TitleJunoCreateTestData) > 0 then
      begin
            //�´��������ļ�
        DelayRun(DelayInterval);
        CreateNewData;
      end
      else
      begin
          //ǰ��JUNO������ģ��F5
        MmoAdd('JunoAutoRunCoreNew:δ�������ݴ��壬׼��ǰ��JUNO������...');
        HwndJuno := FindWindow(nil, TitleJunoTitle);
        SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
        SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
        ShowWindow(HwndJuno, SW_NORMAL);
        MmoAdd('JunoAutoRunCoreNew:��������ǰ�ã�׼�������ȼ�...');
        keybd_event(VK_F5, 0, 0, 0);
        keybd_event(VK_F5, 0, KEYEVENTF_KEYUP, 0);
            //���������ݴ�������;
        MmoAdd('JunoAutoRunCoreNew:F5�Ѽ���...');
        MmoAdd('JunoAutoRunCoreNew:���´����´��������ļ�����...');
        DelayRun(DelayInterval * 2);
        CreateNewData;
      end;

          //������ܴ��ڵ�������������
      MmoAdd('JunoAutoRunCoreNew:����������������...');
      DelayRun(DelayInterval);
      if FindWindow(nil, TitleJunoChooseStation) > 0 then
      begin
        DelayRun(DelayInterval);
        CloseRepeatFileName;
      end;
        //Map��������¼��
        //ǰ��JUNO Maping���
      MmoAdd('JunoAutoRunCoreNew:����Maping����...');
      // Ѱ��Map����


      if HwndJunoMap = 0 then
      begin
        MmoAdd('JunoAutoRunCoreNew:δ����JUNO Maping����...');
      end;
      //HwndJunoMap := FindWindow(nil, TitleJunoMap);
      SetWindowPos(HwndJunoMap, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
      SetWindowPos(HwndJunoMap, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
      ShowWindow(HwndJunoMap, SW_NORMAL);
      MmoAdd('JunoAutoRunCoreNew:��������ǰ�ã�׼�������ȼ�...');
        //alt+C
      keybd_event(VK_MENU, 0, 0, 0);
      keybd_event(67, 0, 0, 0);
      keybd_event(67, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
        //Aվֱ�Ӱ�enter����
      if WhichStation = 'A' then
      begin
        keybd_event(VK_RETURN, 0, 0, 0);
        keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
      end;
        //Bվ��Ҫ��һ���¼�ͷ���ٰ�enter����
      if WhichStation = 'B' then
      begin
        keybd_event(VK_DOWN, 0, 0, 0);
        keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
        keybd_event(VK_RETURN, 0, 0, 0);
        keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
      end;
        //alt+e ���趨��
      keybd_event(VK_MENU, 0, 0, 0);
      keybd_event(69, 0, 0, 0);
      keybd_event(69, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
        //7���¼�ͷ
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
        //enter �����趨����
      keybd_event(VK_RETURN, 0, 0, 0);
      keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
      DelayRun(DelayInterval);
        //�޸Ľ�������
      MmoAdd('JunoAutoRunCoreNew:׼���޸��뿨��������...');
      if WhichStation = 'A' then
      begin
        HwndJunoMapSetup := FindWindow(nil, TitleJunoMapASetup);
      end;
      if WhichStation = 'B' then
      begin
        HwndJunoMapSetup := FindWindow(nil, TitleJunoMapBSetup);
      end;
      MmoAdd('JunoAutoRunCoreNew:����趨�������ɹ���Ѱ�ҹؼ����...');

      if HwndJunoMapSetup > 0 then
      begin
        MapSetupPro;
      end;

      MmoAdd('JunoAutoRunCoreNew:Map�趨���...');
        //ALT�ȼ����ѡվ
        //Alt�ȼ�ѡ���趨����
        //�޸Ĵ���ֵ
      MmoAdd('****�����Զ�¼��ɹ���');

    end;

    Result := True;
  except
    on E: Exception do
      MmoAdd('JunoAutoRunCore:JunoAutoRunCore:�������...');
  end;

end;

procedure TForm1.LoadPGEnd;

  function EnumChildWndProcForLoadPGEnd(AhWnd: LongInt; AlParam: LPARAM): Boolean; stdcall;
  var
    WndCaption: array[0..254] of Char;
  begin
    GetWindowText(AhWnd, WndCaption, 254);
    if Pos('��', string(WndCaption)) > 0 then
    begin
      //MmoAdd('���洰�尴ť�����ϡ�');
      HwndLoadEndYes := AhWnd;
      Result := False;
    end;
    Result := True;
  end;

var
  HwndTemp: HWND;
  FormTag: tagWINDOWINFO;
begin
  MmoAdd('LoadPGEnd:��ʼ������...', 2);

  if YESBtnClicked and (YesBtnClickTime = 2) then
  begin
    GetWindowInfo(FindWindow(nil, TitleJunoLoadEnd), FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
//      MmoAdd('LoadPGFun:���ֲ����ļ����ش���δ��ʾ,�ȴ�������ʾ��...');
//      tmrRunLoadPG.Enabled := True;
//      Inc(TimeNoShowLdPGForm);
//      Exit;
      MmoAdd('LoadPGEnd:��������ɹ���', 0);
      YesBtnClickTime := 0;
      Exit;
    end;

    MmoAdd('LoadPGEnd:��������ɹ���', 0);
    YesBtnClickTime := 0;
    Exit;
  end;

  //����²������ݴ����Ѿ�˳���򿪣��������YESBtnClicked=true,�رձ����̡�
  if (LoadEndRetryTime > 100) or YESBtnClicked then
  begin
    MmoAdd('LoadPGEnd:����������ϡ�', 0);
  end;
  if LoadEndRetryTime <= 100 then
  begin
    Inc(LoadEndRetryTime);
    MmoAdd('LoadPGEnd:������:��' + IntToStr(LoadEndRetryTime) + '�β���...', 2);
    HwndTemp := FindWindow(nil, TitleJunoLoadEnd);
    if HwndTemp > 0 then
    begin
      MmoAdd('LoadPGEnd:���洰����ڡ�', 2);
      HwndLoadEndYes := 0;
      EnumChildWindows(HwndTemp, @EnumChildWndProcForLoadPGEnd, 2);
      MmoAdd('LoadPGEnd:���洰�尴ť�����ϡ�', 2);
      if HwndLoadEndYes > 0 then
      begin
      //�ҵ�YES��ť��ǰ�ú��͵�����
        PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
        MmoAdd('LoadPGEnd:���洰��YES��ť�ѵ����', 2);
        YESBtnClicked := True;
        Inc(YesBtnClickTime);
        LoadPGEnd; //ȷ�Ͼ��洰���Ƿ��Ѿ��رճɹ���
      end
      else
      begin
        MmoAdd('LoadPGEnd:���洰��YES��ťδ�ҵ��������˳���', 0);
        Exit;
      end;
    end
    else
    begin
      MmoAdd('LoadPGEnd:[' + IntToStr(LoadEndRetryTime) + ']δ��⵽���浯����', 2);
      MmoAdd('LoadPGEnd:�������徯���⡣', 2);
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
    if Pos('��', string(WndCaption)) > 0 then
    begin
      //MmoAdd('���洰�尴ť�����ϡ�');
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
  MmoAdd('LoadPGEndNew:��ʼ������...', 2);
  HwndTemp := FindWindow(nil, TitleJunoLoadEnd);

  if HwndTemp > 0 then
  begin
    HwndLoadEndYes := 0;
    EnumChildWindows(HwndTemp, @EnumChildWndProcForLoadPGEnd, 2);
    MmoAdd('LoadPGEndNew:���洰�尴ť�����ϡ�', 2);
    if HwndLoadEndYes > 0 then
    begin
      //�ҵ�YES��ť��ǰ�ú��͵�����
      PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
      MmoAdd('LoadPGEndNew:���洰��YES��ť�ѵ����', 2);
    end
  end;

  Exit;
  (*
  if YESBtnClicked and (YesBtnClickTime = 2) then
  begin
    GetWindowInfo(FindWindow(nil, TitleJunoLoadEnd), FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
//      MmoAdd('LoadPGFun:���ֲ����ļ����ش���δ��ʾ,�ȴ�������ʾ��...');
//      tmrRunLoadPG.Enabled := True;
//      Inc(TimeNoShowLdPGForm);
//      Exit;
      MmoAdd('LoadPGEnd:��������ɹ���', 0);
      YesBtnClickTime := 0;
      Exit;
    end;

    MmoAdd('LoadPGEnd:��������ɹ���', 0);
    YesBtnClickTime := 0;
    Exit;
  end;

  //����²������ݴ����Ѿ�˳���򿪣��������YESBtnClicked=true,�رձ����̡�
  if (LoadEndRetryTime > 100) or YESBtnClicked then
  begin
    MmoAdd('LoadPGEnd:����������ϡ�', 0);
  end;
  if LoadEndRetryTime <= 100 then
  begin
    Inc(LoadEndRetryTime);
    MmoAdd('LoadPGEnd:������:��' + IntToStr(LoadEndRetryTime) + '�β���...', 2);
    HwndTemp := FindWindow(nil, TitleJunoLoadEnd);
    if HwndTemp > 0 then
    begin
      MmoAdd('LoadPGEnd:���洰����ڡ�', 2);
      HwndLoadEndYes := 0;
      EnumChildWindows(HwndTemp, @EnumChildWndProcForLoadPGEnd, 2);
      MmoAdd('LoadPGEnd:���洰�尴ť�����ϡ�', 2);
      if HwndLoadEndYes > 0 then
      begin
      //�ҵ�YES��ť��ǰ�ú��͵�����
        PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
        MmoAdd('LoadPGEnd:���洰��YES��ť�ѵ����', 2);
        YESBtnClicked := True;
        Inc(YesBtnClickTime);
        LoadPGEnd; //ȷ�Ͼ��洰���Ƿ��Ѿ��رճɹ���
      end
      else
      begin
        MmoAdd('LoadPGEnd:���洰��YES��ťδ�ҵ��������˳���', 0);
        Exit;
      end;
    end
    else
    begin
      MmoAdd('LoadPGEnd:[' + IntToStr(LoadEndRetryTime) + ']δ��⵽���浯����', 2);
      MmoAdd('LoadPGEnd:�������徯���⡣', 2);
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

    if Pos('��', string(WndCaption)) > 0 then
    begin
      //MmoAdd('���洰�尴ť�����ϡ�');
      HwndLoadEndYes := AhWnd;
      //Result := False;
    end;
    if Pos('xxx', string(WndCaption)) > 0 then
    begin
      //MmoAdd('���洰�尴ť�����ϡ�');
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
  MmoAdd('LoadPGEndNewSec:��ʼ������...', 2);
  EnumWindows(@EnumWindowsFunc, LPARAM(List));
  HwndTemp := StrToInt(List[0]);
  if HwndTemp > 0 then
  begin
    HwndLoadEndYes := 0;
    EnumChildWindows(HwndTemp, @EnumChildWndProcForLoadPGEnd, 2);
    MmoAdd('LoadPGEndNewSec:���洰�尴ť�����ϡ�', 2);
    if HwndLoadEndYes > 0 then
    begin
      //�ҵ�YES��ť��ǰ�ú��͵�����
      PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
      MmoAdd('LoadPGEndNewSec:���洰��YES��ť�ѵ����', 2);
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
  IsCheck := 0; //����Ƿ�����Ч
  FindCount := 0; //ABStation PPID ȷ�� �ĸ��������Ҫ�ҵ���
  MmoAdd('LoadPGFun:��ʼ�����Զ�����PPID��ҵ...');
  HwndTemp := FindWindow(nil, TitleJunoLoadProgram);
  if HwndTemp > 0 then
  begin
    HwndJunoLoadProgram := HwndTemp;
    MmoAdd('LoadPGFun:���ֲ����ļ����ش���...');
    if TimeNoShowLdPGForm > 10 then
    begin
      MmoAdd('LoadPGFun:����ʮ��δ��ʾ�����ļ����ش��壬�����˳�...');
      Exit;
    end;
    GetWindowInfo(HwndTemp, FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
      MmoAdd('LoadPGFun:���ֲ����ļ����ش���δ��ʾ,�ȴ�������ʾ��...');
      tmrRunLoadPG.Enabled := True;
      Inc(TimeNoShowLdPGForm);
      Exit;
    end;
    HwndStr := TStringList.Create;
    ClassStr := TStringList.Create;
    TitleStr := TStringList.Create;
    MmoAdd('LoadPGFun:ǰ��Juno������...');
    ShowWindow(HwndJuno, SW_RESTORE);
    //ShowWindow(HwndJunoLoadProgram, SW_RESTORE);
    //���������ļ����ش���Ѱ��վ��ѡ���PPID�༭���ں�ȷ����ť
    MmoAdd('LoadPGFun:���������ļ����ش������б�...');
    EnumChildWindows(HwndJunoLoadProgram, @EnumChildWndProcForLoadPG, 1);
    MmoAdd('LoadPGFun:�����ļ����ش������б�����ɹ�...');
    BoolAStationFind := False;
    BoolBStationFind := False;
    for I := 0 to HwndStr.Count - 1 do
    begin
      if not BoolAStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('A', TitleStr[I]) = 1) then
        begin
          HwndAStation := StrToInt64(HwndStr[I]);
          MmoAdd('LoadPGFun:�ҵ�Aվ���=' + HwndStr[I]);
          Inc(FindCount);
          BoolAStationFind := True;
        end;
      end;
      if not BoolBStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('B', TitleStr[I]) = 1) then
        begin
          HwndBStation := StrToInt64(HwndStr[I]);
          MmoAdd('LoadPGFun:�ҵ�Bվ���=' + HwndStr[I]);
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
        MmoAdd('LoadPGFun:�ҵ�PPID���=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if Pos('ȷ��', TitleStr[I]) > 0 then
      begin
        HwndLoadPGEnter := StrToInt64(HwndStr[I]);
        MmoAdd('LoadPGFun:�ҵ�ȷ����ť���=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if FindCount = 4 then
        Break;
    end;
    if FindCount = 4 then
    begin
      MmoAdd('LoadPGFun:�����ļ����ش���������ѻ�ȡ��');
    end
    else
    begin
      MmoAdd('LoadPGFun:�����ļ����ش����������ȡʧ��,�����������ϵ����ʦ����');
      HwndStr.Clear;
      ClassStr.Clear;
      TitleStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(ClassStr);
      FreeAndNil(TitleStr);
      Exit;
    end;
    MmoAdd('LoadPGFun:�����ļ�������Ѵ�����ϡ�');
    HwndStr.Clear;
    ClassStr.Clear;
    TitleStr.Clear;
    FreeAndNil(HwndStr);
    FreeAndNil(ClassStr);
    FreeAndNil(TitleStr);
    MmoAdd('LoadPGFun:�����ļ�������ļ��ѳ�ʼ����');
    MmoAdd('LoadPGFun:�����ļ��Զ�¼�뿪ʼ��');
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStation, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('LoadPGFun:Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
        SendMessage(HwndAStation, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStation, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('LoadPGFun:Station ��ѡ����ʧ�ܣ������˳������飡');
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
          MmoAdd('LoadPGFun:Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
          SendMessage(HwndBStation, WM_LBUTTONDOWN, 0, 0);
          SendMessage(HwndBStation, WM_LBUTTONUP, 0, 0);
          Inc(RetryTime);
        end;
        if RetryTime > 6 then
        begin
          MmoAdd('LoadPGFun:Station ��ѡ����ʧ�ܣ������˳������飡');
          Exit;
        end;
      end;
    end;
    SendMessage(HwndPPID, WM_SETTEXT, 255, LongInt(PChar(edtPPID.Text)));
    MmoAdd('LoadPGFun:PPID�Ѿ�����');
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //PostMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONUP, 0, 0);
    MmoAdd('LoadPGFun:PPIDȷ����ť���͵������...');
    PostMessage(HwndLoadPGEnter, BM_CLICK, 0, 0);
    MmoAdd('LoadPGFun:PPID�Ѽ������');
    Result := True;
    MmoAdd('LoadPGFun:���������ļ��Զ������ѿ���...');
    NextActionReadyTime(tmrCreateData);
  end
  else
  begin
    MmoAdd('LoadPGFun:F1�����δ���ֲ����ļ����ش��壬���¼����...');
    //�˴���Ҫ�ж�Juno����Ƿ񻹴��ڣ�����
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('LoadPGFun:JUNO�����򲻴�������������...');
      Exit;
    end;
    ShowWindow(HwndJuno, SW_RESTORE);
    MmoAdd('��������ǰ�ã�׼�������ȼ�...');
    keybd_event(VK_F1, 0, 0, 0);
    keybd_event(VK_F1, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('F1�Ѽ���...');
    NextActionReadyTime(tmrRunLoadPG);
    MmoAdd('����ʱ�������ļ����ش���...');
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
  IsCheck := 0; //����Ƿ�����Ч
  FindCount := 0; //ABStation PPID ȷ�� �ĸ��������Ҫ�ҵ���
  MmoAdd('LoadPGFunNew:��ʼ�����Զ�����PPID��ҵ...');
  HwndTemp := FindWindow(nil, TitleJunoLoadProgram);
  if HwndTemp > 0 then
  begin
    HwndJunoLoadProgram := HwndTemp;
    MmoAdd('LoadPGFunNew:���ֲ����ļ����ش���...');
    if TimeNoShowLdPGForm > 10 then
    begin
      MmoAdd('LoadPGFunNew:����ʮ��δ��ʾ�����ļ����ش��壬�����˳�...');
      Exit;
    end;
    GetWindowInfo(HwndTemp, FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
      MmoAdd('LoadPGFunNew:���ֲ����ļ����ش���δ��ʾ,�ȴ�������ʾ��...');
      tmrRunLoadPG.Enabled := True;
      Inc(TimeNoShowLdPGForm);
      Exit;
    end;
    HwndStr := TStringList.Create;
    ClassStr := TStringList.Create;
    TitleStr := TStringList.Create;
    MmoAdd('LoadPGFun:ǰ��Juno������...');
    ShowWindow(HwndJuno, SW_RESTORE);
    //ShowWindow(HwndJunoLoadProgram, SW_RESTORE);
    //���������ļ����ش���Ѱ��վ��ѡ���PPID�༭���ں�ȷ����ť
    MmoAdd('LoadPGFunNew:���������ļ����ش������б�...');
    EnumChildWindows(HwndJunoLoadProgram, @EnumChildWndProcForLoadPG, 1);
    MmoAdd('LoadPGFunNew:�����ļ����ش������б�����ɹ�...');
    BoolAStationFind := False;
    BoolBStationFind := False;
    for I := 0 to HwndStr.Count - 1 do
    begin
      if not BoolAStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('A', TitleStr[I]) = 1) then
        begin
          HwndAStation := StrToInt64(HwndStr[I]);
          MmoAdd('LoadPGFunNew:�ҵ�Aվ���=' + HwndStr[I]);
          Inc(FindCount);
          BoolAStationFind := True;
        end;
      end;
      if not BoolBStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('B', TitleStr[I]) = 1) then
        begin
          HwndBStation := StrToInt64(HwndStr[I]);
          MmoAdd('LoadPGFunNew:�ҵ�Bվ���=' + HwndStr[I]);
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
        MmoAdd('LoadPGFunNew:�ҵ�PPID���=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if Pos('ȷ��', TitleStr[I]) > 0 then
      begin
        HwndLoadPGEnter := StrToInt64(HwndStr[I]);
        MmoAdd('LoadPGFunNew:�ҵ�ȷ����ť���=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if FindCount = 4 then
        Break;
    end;
    if FindCount = 4 then
    begin
      MmoAdd('LoadPGFunNew:�����ļ����ش���������ѻ�ȡ��');
    end
    else
    begin
      MmoAdd('LoadPGFunNew:�����ļ����ش����������ȡʧ��,�����������ϵ����ʦ����');
      HwndStr.Clear;
      ClassStr.Clear;
      TitleStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(ClassStr);
      FreeAndNil(TitleStr);
      Exit;
    end;
    MmoAdd('LoadPGFunNew:�����ļ�������Ѵ�����ϡ�');
    HwndStr.Clear;
    ClassStr.Clear;
    TitleStr.Clear;
    FreeAndNil(HwndStr);
    FreeAndNil(ClassStr);
    FreeAndNil(TitleStr);
    MmoAdd('LoadPGFunNew:�����ļ�������ļ��ѳ�ʼ����');
    MmoAdd('LoadPGFunNew:�����ļ��Զ�¼�뿪ʼ��');
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStation, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('LoadPGFunNew:Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
        SendMessage(HwndAStation, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStation, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('LoadPGFunNew:Station ��ѡ����ʧ�ܣ������˳������飡');
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
          MmoAdd('LoadPGFunNew:Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
          SendMessage(HwndBStation, WM_LBUTTONDOWN, 0, 0);
          SendMessage(HwndBStation, WM_LBUTTONUP, 0, 0);
          Inc(RetryTime);
        end;
        if RetryTime > 6 then
        begin
          MmoAdd('LoadPGFunNew:Station ��ѡ����ʧ�ܣ������˳������飡');
          Exit;
        end;
      end;
    end;
    SendMessage(HwndPPID, WM_SETTEXT, 255, LongInt(PChar(edtPPID.Text)));
    MmoAdd('LoadPGFunNew:PPID�Ѿ�����');
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //PostMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONUP, 0, 0);
    MmoAdd('LoadPGFunNew:PPIDȷ����ť���͵������...');
    PostMessage(HwndLoadPGEnter, BM_CLICK, 0, 0);
    MmoAdd('LoadPGFunNew:PPID�Ѽ������');
    Result := True;

  end;
  (*
  else
  begin
    MmoAdd('LoadPGFun:F1�����δ���ֲ����ļ����ش��壬���¼����...');
    //�˴���Ҫ�ж�Juno����Ƿ񻹴��ڣ�����
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('LoadPGFun:JUNO�����򲻴�������������...');
      Exit;
    end;
    ShowWindow(HwndJuno, SW_RESTORE);
    MmoAdd('��������ǰ�ã�׼�������ȼ�...');
    keybd_event(VK_F1, 0, 0, 0);
    keybd_event(VK_F1, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('F1�Ѽ���...');
    NextActionReadyTime(tmrRunLoadPG);
    MmoAdd('����ʱ�������ļ����ش���...');
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
      MmoAdd('JunoAutoRunCoreNew:δ����JUNO Maping����...');
      ShowMessage('MAP�趨��ʧ�ܣ����ֶ��򿪣�');
      Abort;
    end;
    SetWindowPos(HwndJunoMap, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJunoMap, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJunoMap, SW_MAXIMIZE);
    MmoAdd('JunoAutoRunCoreNew:��������ǰ�ã�׼�������ȼ�...');
        //alt+C
    keybd_event(VK_MENU, 0, 0, 0);
    keybd_event(67, 0, 0, 0);
    keybd_event(67, 0, KEYEVENTF_KEYUP, 0);
    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);


        //Aվֱ�Ӱ�enter����
    if WhichStation = 'A' then
    begin
      keybd_event(VK_RETURN, 0, 0, 0);
      keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
    end;
        //Bվ��Ҫ��һ���¼�ͷ���ٰ�enter����
    if WhichStation = 'B' then
    begin
      keybd_event(VK_DOWN, 0, 0, 0);
      keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_RETURN, 0, 0, 0);
      keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
    end;

        //alt+e ���趨��
    keybd_event(VK_MENU, 0, 0, 0);
    keybd_event(69, 0, 0, 0);
    keybd_event(69, 0, KEYEVENTF_KEYUP, 0);
    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
        //6���¼�ͷ
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

        //enter �����趨����
    keybd_event(VK_RETURN, 0, 0, 0);
    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
    DelayRun(DelayInterval div 15);

        //�޸Ľ�������
    MmoAdd('JunoAutoRunCoreNew:׼���޸��뿨��������...');
    if WhichStation = 'A' then
    begin
      HwndJunoMapSetup := FindWindow(nil, TitleJunoMapASetup);
    end;
    if WhichStation = 'B' then
    begin
      HwndJunoMapSetup := FindWindow(nil, TitleJunoMapBSetup);
    end;
    MmoAdd('JunoAutoRunCoreNew:����趨�������ɹ���Ѱ�ҹؼ����...');

    if HwndJunoMapSetup > 0 then
    begin
      //ShowWindow(HwndJunoMapSetup,SW_HIDE);
      MapSetupPro;
    end;

    MmoAdd('JunoAutoRunCoreNew:Map�趨���...');
        //ALT�ȼ����ѡվ
        //Alt�ȼ�ѡ���趨����
        //�޸Ĵ���ֵ
    MmoAdd('****�����Զ�¼��ɹ���');

  end;

end;

procedure TForm1.MapSetupManualNew;
begin
  MmoAdd('JunoAutoRunCoreNew:׼���޸��뿨��������...');
  if WhichStation = 'A' then
  begin
    HwndJunoMapSetup := FindWindow(nil, TitleJunoMapASetup);
  end;
  if WhichStation = 'B' then
  begin
    HwndJunoMapSetup := FindWindow(nil, TitleJunoMapBSetup);
  end;
  MmoAdd('JunoAutoRunCoreNew:����趨�������ɹ���Ѱ�ҹؼ����...');
  if HwndJunoMapSetup > 0 then
  begin
    MapSetupPro;
  end;

  MmoAdd('JunoAutoRunCoreNew:Map�趨���...');
        //ALT�ȼ����ѡվ
        //Alt�ȼ�ѡ���趨����
        //�޸Ĵ���ֵ
  MmoAdd('****�����Զ�¼��ɹ���');
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
  EdtCount: Integer; //Edt������Ϊlotidλ��
  RetryTime: Integer;
begin
  MmoAdd('MapSetupPro:Map�趨����ʼ...');
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
    MmoAdd('MapSetupPro:��ʼ����������list���...');
    EnumChildWindows(HwndJunoMapSetup, @EnumChildWndProcForMapSetup, 1);
    MmoAdd('MapSetupPro:Map��������list�ռ����...');
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
              MmoAdd('MapSetupPro:����OperatorID...');
              HwndMapOperatorID := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          3:
            begin
              MmoAdd('MapSetupPro:����HwndMapLotID...');
              HwndMapLotID := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          13:
            begin
              MmoAdd('MapSetupPro:����HwndMapPPID...');
              HwndMapPPID := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          14:
            begin
              MmoAdd('MapSetupPro:����HwndMapEqID...');
              HwndMapEqID := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          15:
            begin
              MmoAdd('MapSetupPro:����HwndMapTesterID...');
              HwndMapTesterID := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          16:
            begin
              MmoAdd('MapSetupPro:����HwndMapCardName...');
              HwndMapCardName := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
        end;
        Continue;
      end;
      if Pos(TitleMapEnterBtn, TitleStr[I]) > 0 then
      begin
        //ȷ����ť
        MmoAdd('MapSetupPro:ȷ����ť��ȡ�ɹ�...');
        Inc(Count);
        HwndMapYesBtn := StrToInt64(HwndStr[I]);
        //MmoAdd('btn'+HwndStr[I]);
      end;

      if Count = 7 then
      begin
        MmoAdd('MapSetupPro:Map�趨����7������Ѿ���ȡ�ɹ����˳�ѭ��...');
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
      MmoAdd('MapSetupPro:Map�趨����7�������ȡʧ�ܡ�����ϵ����ʦ����...');
      Exit;
    end
    else
    begin
      MmoAdd('MapSetupPro:Map�趨����7�������ȡ�ɹ���׼��¼������...');
    end;

    MmoAdd('MapSetupPro:Map�趨����OperatorID¼��...' + edtOperator.Text);
    SendMessage(HwndMapOperatorID, WM_SETTEXT, 255, LongInt(PChar(edtOperator.Text)));
    MmoAdd('MapSetupPro:Map�趨����LotID¼��...' + edtLotID.Text);
    SendMessage(HwndMapLotID, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('MapSetupPro:Map�趨����PPID¼��...' + edtPPID.Text);
    SendMessage(HwndMapPPID, WM_SETTEXT, 255, LongInt(PChar(edtPPID.Text)));

    MmoAdd('MapSetupPro:Map�趨����ProberID¼��...' + edtProber.Text);
    SendMessage(HwndMapEqID, WM_SETTEXT, 255, LongInt(PChar(edtProber.Text)));
    MmoAdd('MapSetupPro:Map�趨����Prober¼��...' + edtTester.Text);
    SendMessage(HwndMapTesterID, WM_SETTEXT, 255, LongInt(PChar(edtTester.Text)));
    MmoAdd('MapSetupPro:Map�趨����Tester¼��...' + edtCardName.Text);
    SendMessage(HwndMapCardName, WM_SETTEXT, 255, LongInt(PChar(edtCardName.Text)));
    MmoAdd('MapSetupPro:Map�趨����ȷ���������...');
    SendMessage(HwndMapYesBtn, BM_CLICK, 0, 0);
    MmoAdd('MapSetupPro:Map�趨�����趨���...');
    Result := True;

  end;


  (*
  if FindWindow(nil, TitleJunoCreateTestData) > 0 then
  begin
    MmoAdd('CreateData:�����½��������ݴ���...');
    YESBtnClicked := True;
    MmoAdd('CreateData:�ѹر��²����ļ����徯����...');
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
    MmoAdd('CreateData:��ʼ����������list���...');
    //ShowWindow(HwndJuno, SW_RESTORE);
    //ShowWindow(HwndJunoLoadProgram, SW_RESTORE);
    //���������ļ����ش���Ѱ��վ��ѡ���PPID�༭���ں�ȷ����ť
    EnumChildWindows(FindWindow(nil, TitleJunoCreateTestData), @EnumChildWndProcForCreateData, 1);
    for I := 0 to HwndStr.Count - 1 do
    begin
      if Pos('&A', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateData:Aվ��ȡ�ɹ�..');
        HwndAStationCreate := StrToInt64(HwndStr[I]);
        Inc(Count);
        Continue;
      end;
      if Pos('&B', TitleStr[I]) > 0 then
      begin
        MmoAdd('CreateData:Bվ��ȡ�ɹ�...');
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
              MmoAdd('CreateData:lotname��ȡ�ɹ�...');
              HwndFileName := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountWaferNumber:
            begin
              MmoAdd('CreateData:wafernumber��ȡ�ɹ�...');
              HwndWaferNumber := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountOperator:
            begin
              MmoAdd('CreateData:OperatorID��ȡ�ɹ�...');
              HwndOperator := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
          EdtCountTag:
            begin
              MmoAdd('CreateData:Commit��ȡ�ɹ�...');
              HwndTag := StrToInt64(HwndStr[I]);
              Inc(Count);
            end;
        end;
      end;
      if Pos(TitleCreateAutoFile, TitleStr[I]) > 0 then
      begin
        //�Զ��ļ���ť
        MmoAdd('CreateData:�Զ��ļ���ť��ȡ�ɹ�...');
        Inc(Count);
        HwndAutoFile := StrToInt64(HwndStr[I]);
      end;

      if Pos(TitleCreateEnterBtn, TitleStr[I]) > 0 then
      begin
        //ȷ����ť
        MmoAdd('CreateData:ȷ����ť��ȡ�ɹ�...');
        Inc(Count);
        HwndCreateEnter := StrToInt64(HwndStr[I]);
      end;
      if Count = 8 then
      begin
        MmoAdd('CreateData:�������ļ�����8������Ѿ���ȡ�ɹ����˳�ѭ��...');
        Break;
      end;
    end;
    if Count <> 8 then
    begin
      MmoAdd('CreateData:�������ļ�����8�������ȡʧ�ܡ�����ϵ����ʦ����...');
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
      MmoAdd('CreateData:�������ļ����������ȡ�ɹ���׼��¼������...');
      HwndStr.Clear;
      TitleStr.Clear;
      ClassStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(TitleStr);
      FreeAndNil(ClassStr);
    end;
    //�������ļ����崦������
    //stationվѡ��
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateData:A-Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
        SendMessage(HwndAStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateData:A-Station��ѡ����ʧ�ܣ������˳������飡');
        Exit;
      end;
    end;
    if WhichStation = 'B' then
    begin
      RetryTime := 0;
      while SendMessage(HwndBStationCreate, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('CreateData:B-Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
        SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);
      end;
      if RetryTime > 6 then
      begin
        MmoAdd('CreateData:B-Station ��ѡ����ʧ�ܣ������˳������飡');
        Exit;
      end;
    end;
    //lotid�������
    MmoAdd('CreateData:Station��ѡ�����ɹ�...');
    MmoAdd('CreateData:׼����������...');
    SendMessage(HwndFileName, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateData:lotid�Ѿ�����');
    SendMessage(HwndTag, WM_SETTEXT, 255, LongInt(PChar(edtLotID.Text)));
    MmoAdd('CreateData:tag�Ѿ�����');
    SendMessage(HwndOperator, WM_SETTEXT, 255, LongInt(PChar(edtOperator.Text)));
    MmoAdd('CreateData:Operator�Ѿ�����');
    RetryTime := 0;
    while SendMessage(HwndAutoFile, BM_GETCHECK, 0, 0) = 0 do
    begin
      MmoAdd('CreateData:�Զ��ļ���ť��' + IntToStr(RetryTime) + '�β���...');
        //SendMessage(HwndBStationCreate, WM_LBUTTONDOWN, 0, 0);
        //SendMessage(HwndBStationCreate, WM_LBUTTONUP, 0, 0);
      SendMessage(HwndAutoFile, BM_CLICK, 0, 0);
      Inc(RetryTime);
    end;
    if RetryTime > 6 then
    begin
      MmoAdd('CreateData:�Զ��ļ���ť�޷�����������������ϵ����ʦ����');
      Exit
    end;
    SendMessage(HwndWaferNumber, WM_SETTEXT, 255, LongInt(PChar(Trim(edtWaferID.Text))));
    MmoAdd('CreateData:wafernumber�Ѿ�����');
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONDOWN, 0, 0);
    //SendMessage(HwndLoadPGEnter, WM_LBUTTONUP, 0, 0);
    SendMessage(HwndCreateEnter, BM_CLICK, 0, 0);
    MmoAdd('CreateData:ȷ����ť�ѷ��͵��...��');
    MmoAdd('CreateData:�������ļ��Ѿ�������ϡ�');
    tmrCreateData.Enabled := False;
    Result := True;
  end
  else
  begin
    MmoAdd('δ�����������ļ����壬׼��ǰ��������...');
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('CreateData:������δ���֣�������JUNO������...');
      Exit;
    end;
    MmoAdd('CreateData:��������ڣ�׼��ǰ��JUNO������...');
    SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJuno, SW_NORMAL);
    MmoAdd('��������ǰ�ã�׼�������ȼ�...');
    keybd_event(VK_F5, 0, 0, 0);
    keybd_event(VK_F5, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('F5�Ѽ���...');
    NextActionReadyTime(tmrCreateData);
    MmoAdd('���¼���������ļ�����...');
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
    if Pos('��', string(WndCaption)) > 0 then
    begin
      //MmoAdd('���洰�尴ť�����ϡ�');
      HwndRepeatFileYes := AhWnd;
      Result := False;
    end;
    Result := True;
  end;

var
  HwndTemp: HWND;
  FormTag: tagWINDOWINFO;
begin
  MmoAdd('RepeatFileNameClosePro:�����ļ�����ȥ�����̿���...');
  if RepeatFileYesBtnClicked then
  begin
    GetWindowInfo(FindWindow(nil, TitleRepeatFile), FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin

      MmoAdd('RepeatFileNameClosePro:��������ɹ���', 0);
      Exit;
    end;
  end;
  MmoAdd('RepeatFileRetryTime=' + IntToStr(RepeatFileRetryTime));
  if RepeatFileRetryTime > 100 then
  begin
    MmoAdd('RepeatFileNameClosePro:���ظ����30S�������ļ�����ȥ�������Ѿ����...');
    Exit;
  end;
  Inc(RepeatFileRetryTime);
  HwndTemp := FindWindow(nil, TitleRepeatFile);
  if (HwndTemp > 0) then
  begin
    MmoAdd('RepeatFileNameClosePro:�������洰�����...');
    EnumChildWindows(HwndTemp, @EnumChildWndProcForRepeatFile, 1);
    if HwndRepeatFileYes > 0 then
    begin
      MmoAdd('RepeatFileNameClosePro:׼�����ȷ����ť...');
      PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
      MmoAdd('RepeatFileNameClosePro:�ѵ��ȷ����ť...');
      RepeatFileYesBtnClicked := True;
      RepeatFileNameClosePro; //�ټ��һ���Ƿ�رճɹ���
    end
    else
    begin
      MmoAdd('RepeatFileNameClosePro:�������洰��YES��ť���ʧ�ܣ��������˳�...');
      Exit;
    end;

  end
  else
  begin
    MmoAdd('RepeatFileNameClosePro:δ�����������洰�壬�ظ������...');
    tmrCloseRepeatDataFile.Enabled := True;
  end;

end;

procedure TForm1.SaveLotInfo;
begin
  MmoAdd('��Ϣ����...');
  MmoAdd('barcode=' + edtBarcode.Text);
  MmoAdd('Cardname' + edtCardName.Text);
  MmoAdd('WaferID' + edtWaferID.Text);
end;

procedure TForm1.FKeyActivate(Key: Integer);
begin
  try
    if FindWindow(nil, TitleJunoTitle) = 0 then
    begin
      MmoAdd('FKeyActivate:Juno������δ����,�������˳���');
      Abort;
    end
    else
    begin
      //BoolFindJunoHwnd := True;
      HwndJuno := FindWindow(nil, TitleJunoTitle);
    end;
    if FindWindow(nil, TitleJunoLoadProgram) > 0 then
    begin
      MmoAdd('FKeyActivate:Juno�����ļ����ش����Ѿ����ڣ�׼���رգ�');
      SendMessage(FindWindow(nil, TitleJunoLoadProgram), WM_CLOSE, 0, 0);
      MmoAdd('FKeyActivate:�����ļ����ش�����ڣ��ѹر�...');
    end;
    if FindWindow(nil, TitleJunoCreateTestData) > 0 then
    begin
      MmoAdd('FKeyActivate:Juno�������ļ������Ѿ����ڣ�׼���رգ�');
      SendMessage(FindWindow(nil, TitleJunoCreateTestData), WM_CLOSE, 0, 0);
      MmoAdd('FKeyActivate:�������ļ�������ڣ��ѹر�...');
    end;
    //��ǰ����ʾJuno�����򣬷����ȼ��޷�ʹ��F1��F5
    MmoAdd('FKeyActivate:׼��ǰ��������...');
    SetWindowPos(HwndJuno, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    SetWindowPos(HwndJuno, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
    ShowWindow(HwndJuno, SW_MAXIMIZE);
    MmoAdd('FKeyActivate:��������ǰ�ã�׼�������ȼ�...');
    keybd_event(Key, 0, 0, 0);
    keybd_event(Key, 0, KEYEVENTF_KEYUP, 0);
    MmoAdd('FKeyActivate:F1�Ѽ���...');
    Self.BringToFront;
  except
    MmoAdd('FKeyActivate:�쳣...');
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
  MmoAdd('NextActionReadyTime:' + Time.Name + '�Ѽ��');
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
  IsCheck := 0; //����Ƿ�����Ч
  FindCount := 0; //ABStation PPID ȷ�� �ĸ��������Ҫ�ҵ���
  MmoAdd('PPIDInputPro:��ʼ�����Զ�����PPID��ҵ...');
  HwndTemp := FindWindow(nil, TitleJunoLoadProgram);
  if HwndTemp > 0 then
  begin
    //HwndJunoLoadProgram := HwndTemp;
    MmoAdd('PPIDInputPro:���ֲ����ļ����ش���...');
    GetWindowInfo(HwndTemp, FormTag);
    if (FormTag.dwStyle and WS_VISIBLE) = 0 then
    begin
      MmoAdd('PPIDInputPro:���ֲ����ļ����ش��嵫δ��ʾ,�ȴ�������ʾ��...');
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

    //���������ļ����ش���Ѱ��վ��ѡ���PPID�༭���ں�ȷ����ť
    MmoAdd('PPIDInputPro:���������ļ����ش������б�...');
    EnumChildWindows(HwndTemp, @EnumChildWndProcForLoadPG, 1);
    MmoAdd('PPIDInputPro:�����ļ����ش������б�����ɹ�...');
    BoolAStationFind := False;
    BoolBStationFind := False;
    for I := 0 to HwndStr.Count - 1 do
    begin
      if not BoolAStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('A', TitleStr[I]) = 1) then
        begin
          HwndAStation := StrToInt64(HwndStr[I]);
          MmoAdd('PPIDInputPro:�ҵ�Aվ���=' + HwndStr[I]);
          Inc(FindCount);
          BoolAStationFind := True;
        end;
      end;
      if not BoolBStationFind then
      begin
        if (Pos('Button', ClassStr[I]) > 0) and (Pos('B', TitleStr[I]) = 1) then
        begin
          HwndBStation := StrToInt64(HwndStr[I]);
          MmoAdd('PPIDInputPro:�ҵ�Bվ���=' + HwndStr[I]);
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
        MmoAdd('PPIDInputPro:�ҵ�PPID���=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if Pos('ȷ��', TitleStr[I]) > 0 then
      begin
        HwndLoadPGEnter := StrToInt64(HwndStr[I]);
        MmoAdd('PPIDInputPro:�ҵ�ȷ����ť���=' + HwndStr[I]);
        Inc(FindCount);
      end;
      if FindCount = 4 then
        Break;
    end;
    if FindCount = 4 then
    begin
      MmoAdd('PPIDInputPro:�����ļ����ش���������ѻ�ȡ��');
    end
    else
    begin
      MmoAdd('PPIDInputPro:�����ļ����ش����������ȡʧ��,�����������ϵ����ʦ����');
      ShowMessage('�����ļ����ش����������ȡʧ��,�����������ϵ����ʦ����!');
      HwndStr.Clear;
      ClassStr.Clear;
      TitleStr.Clear;
      FreeAndNil(HwndStr);
      FreeAndNil(ClassStr);
      FreeAndNil(TitleStr);
      Exit;
    end;
    MmoAdd('PPIDInputPro:�����ļ�������Ѵ�����ϡ�');
    HwndStr.Clear;
    ClassStr.Clear;
    TitleStr.Clear;
    FreeAndNil(HwndStr);
    FreeAndNil(ClassStr);
    FreeAndNil(TitleStr);
    MmoAdd('PPIDInputPro:�����ļ�������ļ��ѳ�ʼ����');
    MmoAdd('PPIDInputPro:�����ļ��Զ�¼�뿪ʼ��');
    if WhichStation = 'A' then
    begin
      RetryTime := 0;
      while SendMessage(HwndAStation, BM_GETCHECK, 0, 0) = 0 do
      begin
        MmoAdd('PPIDInputPro:Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
        SendMessage(HwndAStation, WM_LBUTTONDOWN, 0, 0);
        SendMessage(HwndAStation, WM_LBUTTONUP, 0, 0);
        Inc(RetryTime);

        if RetryTime > 6 then
        begin
          MmoAdd('PPIDInputPro:Station ��ѡ����ʧ�ܣ������˳������飡');
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
          MmoAdd('PPIDInputPro:Station ��ѡ��' + IntToStr(RetryTime) + '�β���...');
          SendMessage(HwndBStation, WM_LBUTTONDOWN, 0, 0);
          SendMessage(HwndBStation, WM_LBUTTONUP, 0, 0);
          Inc(RetryTime);
        end;
        if RetryTime > 6 then
        begin
          MmoAdd('PPIDInputPro:Station ��ѡ����ʧ�ܣ������˳������飡');
          Exit;
        end;
      end;
    end;
    SendMessage(HwndPPID, WM_SETTEXT, 255, LongInt(PChar(edtPPID.Text)));
    MmoAdd('PPIDInputPro:PPID�Ѿ�����');
    PostMessage(HwndLoadPGEnter, BM_CLICK, 0, 0);
    MmoAdd('PPIDInputPro:ȷ����ť�Ѿ����');
    MmoAdd('PPIDInputPro:�����ļ��Ѽ��سɹ���');
    Result := True;
  end
  else
  begin
    ShowMessage('δ���ֲ����ļ����ش��壡');
    Exit;
  end;

end;

procedure TForm1.HookStart;
begin
  FBarReader := TBarcodeScanMonitor.GetInstance;
  FBarReader.RelayKeyPress := True;
  //�����������, �Ƿ�Ҫ������������ʾ����
  FBarReader.BarcodeLengths := '3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,80,81,82,83';
  //������ܵĳ���
  FBarReader.ScanMaxDurationSecond := 10;
  //ɨ�����������ʱ
  FBarReader.InputInterval := 1500;
  FBarReader.AlwaysDuplicatedRead := False;
  //��ֹ����ֵ�ظ�
  FBarReader.CheckPrefixStr := '';
  //ǰ׺��֤��
  FBarReader.CheckSuffixStr := '';
  //��׺��֤��
  FBarReader.AutoRemoveCheckStr := True;
  FBarReader.HookedThreadId := 0;
  //0ΪOS����ļ���hook
  FBarReader.OnScanFinished := Self.ShowMsg;
  //��һ��ɨ��������¼�
  if FBarReader.StartListenScan = False then
  //��ʼ��������
  begin
    ShowMessage('����ʧ��');
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
    if Pos('ȷ��', string(WndCaption)) > 0 then
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
  MmoAdd('ChooseStationToClose:��ʼ����ر�����...', 2);
  HwndTemp := FindWindow(nil, TitleJunoCLoseData);
  if HwndTemp > 0 then
  begin
    HwndLoadEndYes := 0;
    EnumChildWindows(HwndTemp, @EnumChildWndProcForCloseData, 2);
    MmoAdd('ChooseStationToClose:�ر������ļ���������ϡ�', 2);
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
      //�ҵ�YES��ť��ǰ�ú��͵�����
      PostMessage(HwndCloseDataYesBtn, BM_CLICK, 0, 0);
      MmoAdd('ChooseStationToClose:�ر������ļ�����ȷ�������ѵ����', 2);
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
    if Pos('��', string(WndCaption)) > 0 then
    begin
      //MmoAdd('���洰�尴ť�����ϡ�');
      HwndLoadEndYes := AhWnd;
      YesBtn := True;
      //Result := False;
    end;
    if Pos('��ѡ��һ������վ', string(WndCaption)) > 0 then
    begin
      ChooseStationLabel := True;
      Result := False;
    end;
    Result := True;
  end;

var
  HwndTemp: HWND;
begin
  MmoAdd('CloseChooseSationFun:��ʼ����DTS Logger...', 2);
  HwndTemp := FindWindow(nil, TitleJunoChooseStation);
  if HwndTemp > 0 then
  begin
    HwndLoadEndYes := 0;
    EnumChildWindows(HwndTemp, @EnumChildWndProcForChooseStation, 2);
    MmoAdd('CloseChooseSationFun:ѡ�񵯴���ť�����ϡ�', 2);
    if HwndLoadEndYes > 0 then
    begin
      //�ҵ�YES��ť��ǰ�ú��͵�����
      PostMessage(HwndLoadEndYes, BM_CLICK, 0, 0);
      MmoAdd('CloseChooseSationFun:ѡ�񵯴�YES��ť�ѵ����', 2);
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
    if Pos('��', string(WndCaption)) > 0 then
    begin
      //MmoAdd('���洰�尴ť�����ϡ�');
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
    MmoAdd('CloseRepeatFileName:�ظ��ļ�����ȷ����ť�Ѿ������');
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
    MmoAdd('Ƭ����Ϣ����');
  end
  else
  begin
    try
      //Arr := WaferStr.Split([';']);
      Arr := TRegEx.Split(Trim(WaferStr), '\;');
      //Arr���һ��Ϊ�հ��ַ���
      for I := 0 to Length(Arr) - 2 do
      begin
        if (StrToInt(Arr[I]) > 25) or (StrToInt(Arr[I]) < 0) then
        begin
          MmoAdd('??Ƭ����Ϣ����');
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
        MmoAdd('Ƭ����Ϣ����');
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
  //�˴��迪�������ļ�������
  MmoAdd('tmrCreateDataTimer:�����ļ��������崦���Ѿ�����...');
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
  //���ز����ļ�ȷ����ᵯ���������Ҫ�������
  tmrLoadEnd.Enabled := False;
  LoadPGEnd;
end;

procedure TForm1.tmrRunLoadPGTimer(Sender: TObject);
begin
  MmoAdd('tmrRunLoadPGTimer:ȷ�����崦���Ѿ�����...');
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
  //���³���,��ָ��·��������ͬ�ļ���
  if MessageDlg('ȷ�����³���', TMsgDlgType.mtWarning, [mbYes, mbNo], 0) = mrNo then
    Abort;
  NewFileCheck('JunoBarcode', UpdatePath, S);
  if S = '' then
  begin
    ShowMessage('��ʱ�����°汾������ϵ����ʦȷ�ϣ�');
    Abort;
  end;
  //�������ļ�����ǰĿ¼���������ļ�
  PrgPath := ExtractFileDir(ParamStr(0));
  Path := ExtractFileDir(ParamStr(0)) + NewVerPath;
  if not DirectoryExists(Path) then
  begin
    CreateDir(ExtractFileDir(ParamStr(0)) + NewVerPath);
    if MoveFile(PWideChar(S), PWideChar(PrgPath + '\' + ExtractFileName(S))) then
    begin
      ShowMessage('�³��򿽱��ɹ����������˳������������³���');
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
      ShowMessage('�³��򿽱��ɹ����������Զ��˳����������Զ������³���');
    end;
    AssignFile(Txt, ExtractFileDir(ParamStr(0)) + NewVerPath + JunoConfig);
    Rewrite(Txt);
    Writeln(Txt, ParamStr(0));
    Flush(Txt);
    CloseFile(Txt);
  end;
  //���³����˳�������
  ShellExecute(Handle, 'open', PWideChar(PrgPath + '\' + ExtractFileName(S)), '-s', '', SW_SHOWNORMAL);
  Application.Terminate;
end;

end.

