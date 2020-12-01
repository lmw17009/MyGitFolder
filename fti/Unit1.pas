(*
FTIר�ó��������������ʹ����BarcodeHookϵͳ����ļ��̹��ӡ�
��ʵ��ɨ����������
ɨ�����PPID��LOTID
��ʽ=>"PPID,PPID"
֧��ɨ���˳�����
����ԭ������CreateProcess����Ϊ���������������Parameter�����̻ᱻ���棬�������Ľ��̴�����֧��ɨ���˳�����
Ŀǰ֧��¼���ʱ�䶨ʱ��⣬���ǰ������ַ���������ʱ�䳬�����趨ֵ���Զ�ֹͣ�˴�¼�롣
2020-11-09 �޸�UI ȥ���Զ�ɨ��ģʽ ���޸Ĳ����߼�
2020-11-27 ����logo
*)
unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  BarcodeHook, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls, System.JSON,
  Winapi.TlHelp32, JsonAdjust;

const
  FstSpltStr = ',';
  PPIDPathHead = '\\10.9.64.72\cp\CP TEST PLAN\test plan\FOCUS\16-sites\';
  ConfigFilePath = 'C:\ProgramConfigFileFolder\';
  AutoBarcodeMode = 0; //0= not autohook,1=auto hook
  WorkMode = 1; //0=PPID;1=json
  version = '20201116';
  FTIProcessName = 'FTISTUDIOPRODUCTION';

type
  TForm1 = class(TForm)
    mmo1: TMemo;
    edtPPID: TEdit;
    edtLotID: TEdit;
    edtPPIDPath: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtProgramPath: TEdit;
    lbl4: TLabel;
    dlgOpen1: TOpenDialog;
    edtEdtBQMSG: TEdit;
    lbl5: TLabel;
    tmr1: TTimer;
    chkHideWork: TCheckBox;
    chkAutoClose: TCheckBox;
    lblProcess: TLabel;
    lbl6: TLabel;
    pm1: TPopupMenu;
    N2: TMenuItem;
    FTI1: TMenuItem;
    btnLockBarcode: TButton;
    mm1: TMainMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure mmo1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure chkAutoCloseMouseEnter(Sender: TObject);
    procedure chkHideWorkMouseEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtEdtBQMSGChange(Sender: TObject);
    procedure edtEdtBQMSGClick(Sender: TObject);
    procedure edtPPIDPathMouseEnter(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FTI1Click(Sender: TObject);
    procedure btnLockBarcodeClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    procedure EdtClearPro;
    procedure BarcodeManualInput;
    procedure PosFun;
    procedure SaveLog(Lines: Integer);

    { Private declarations }
  public
    { Public declarations }
    procedure HookStart;
    procedure BarcodeCheck(Sender: TObject; BarcodeString: string);
    procedure BarcodeStartCheck(Sender: TObject; Number: Integer);
    procedure MmoAdd(Str: string);
    function CreateConfigFile(LotIDStr: string): string;
    function CloseProgram: Boolean;
    function FTIPathInI: Boolean;
    function SaveFTIPath2TXT(SavePos: Integer; FileName, SavePath: string): Boolean;
    procedure DelayRun(MS: LongInt);
    function FindProcess(ProcessName: string): Boolean;
  end;

var
  Form1: TForm1;
  FBarReader: TBarcodeScanMonitor;
  PPID, LotID: string;
  StInfo: STARTUPINFO;
  PInfo: PROCESS_INFORMATION;
  FTIStALready: Boolean;
  LastBarcodeLength: Integer;
  PPIDPathFileGet: string;

implementation

uses
  Unit2;
{$R *.dfm}
{$R uac.res}

{ TForm1 }

procedure TForm1.BarcodeCheck(Sender: TObject; BarcodeString: string);
var
  ArrStr: TArray<string>;
  I: Integer;
  ParamaLineStr, PPIDFileName: string;
  ConfigFilePathTemp: string;
  WinHandle: Cardinal;
  TempJs: BarcodeJs;
begin

  MmoAdd('BarcodeCheck:' + BarcodeString);
  try
    MmoAdd('BarcodeCheck:׼������Barcode����...');
    if not JsonAdj(BarcodeString, TempJs) then
    begin
      MmoAdd('BarcodeCheck:Jscon��ʽ����');
      Exit;
    end
    else
    begin
      MmoAdd('PPID=' + TempJs.PPID);
    end;

//    if BarcodeString = 'QQQQ' then
//    begin
//      CloseProgram;
//      MmoAdd('�Ѿ�ж��FTI���');
//      Exit;
//    end;

    case WorkMode of
      0:
        begin
          PPID := BarcodeString;
          if Length(PPID) < 3 then
          begin
            MmoAdd('BarcodeCheck:PPID���ݶγ����쳣��');
            EdtClearPro;
            Exit;
          end;
          LotID := '';
        end;
      1:
        begin
          MmoAdd('BarcodeCheck:������������...');
//          if not JsonAdjust(BarcodeString, TempJs) then
//          begin
//            MmoAdd('BarcodeCheck:JSON�����쳣...');
//            EdtClearPro;
//            Exit;
//          end;

          (*
          ArrStr := BarcodeString.Split([FstSpltStr]);
          MmoAdd('BarcodeCheck:�����ɹ�...');
          if Length(ArrStr) > 1 then
          begin
            MmoAdd('BarcodeCheck:���ݶγ���Ϊ' + IntToStr(Length(ArrStr)));
          end
          else
          begin
            MmoAdd('BarcodeCheck:���ݶγ����쳣��');
            EdtClearPro;
            Exit;
          end;
          PPID := ArrStr[0];
          LotID := ArrStr[1];

          if Length(PPID) < 3 then
          begin
            MmoAdd('BarcodeCheck:PPID���ݶγ����쳣��');
            EdtClearPro;
            Exit;
          end;
          if Length(LotID) < 3 then
          begin
            MmoAdd('BarcodeCheck:LotID���ݶγ����쳣��');
            EdtClearPro;
            Exit;
          end;
              //�˴����ж��Ƿ�ʹ����LOTID

          edtLotID.Text := LotID;
          *)

        end;

    end;
    edtPPID.Text := PPID;
    edtPPIDPath.Text := PPIDPathFileGet + '\' + PPID + '.xml';
    PPIDFileName := PPIDPathFileGet + '\' + PPID + '.xml';
    if not FileExists(PPIDFileName) then
    begin
      //ShowMessage('��PPID�����ڣ�����PPID·����');
      MmoAdd('BarcodeCheck:PPID���򲻴���...' + PPIDFileName);
      EdtClearPro;
      Exit;
    end;

    MmoAdd('BarcodeCheck:���ݸ�ֵ�ɹ���');
    ConfigFilePathTemp := '';
    ConfigFilePathTemp := CreateConfigFile(LotID);
    if Trim(edtProgramPath.Text) = '' then
    begin
      MmoAdd('BarcodeCheck:����·���쳣��');
      EdtClearPro;
      Exit;
    end;
    if ConfigFilePathTemp <> '' then
    begin
      ParamaLineStr := edtProgramPath.Text + ' -program "' + PPIDFileName + '"' + ' -configFile "' + ConfigFilePathTemp + '"';
      MmoAdd('BarcodeCheck:PPID=' + PPIDFileName);
      MmoAdd('BarcodeCheck:configFile=' + ConfigFilePathTemp);
    end
    else
    begin
      ParamaLineStr := edtProgramPath.Text + ' -program "' + PPIDFileName + '"';
      MmoAdd('BarcodeCheck:PPID=' + PPIDFileName);
    end;


//    if ConfigFilePathTemp <> '' then
//    begin
      //ParamaLineStr := edtProgramPath.Text + ' -program "' + PPIDFileName + '"' + ' -configFile "' + ConfigFilePathTemp + '"';
    FillChar(StInfo, SizeOf(StInfo), 0);
    FillChar(PInfo, SizeOf(PInfo), 0);
    StInfo.cb := SizeOf(StInfo);
      //MmoAdd('BarcodeCheck:�����д����ɹ���');

      //MmoAdd(ParamaLineStr);
    if {chkAutoClose.Checked or } (lblProcess.Caption <> '0') then
    begin
      CloseProgram;
    end;
    FindProcess(FTIProcessName); //�ر�FTI����
    if not CreateProcess(nil, PWideChar(ParamaLineStr), nil, nil, True, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, StInfo, PInfo) then
    begin
      MmoAdd('BarcodeCheck:��������ʧ�ܡ�');
      EdtClearPro;
      Exit;
    end;
    MmoAdd('BarcodeCheck:�ȴ���������...');
    WaitForInputIdle(PInfo.hProcess, 5000);
    MmoAdd('BarcodeCheck:���������...');
      //WinHandle := GetProcessWindow(PInfo.dwProcessID);
    WinHandle := OpenProcess(PROCESS_ALL_ACCESS, False, PInfo.dwProcessId);

      //WinHandle := GetProcessId(PInfo.dwProcessID);
    if WinHandle > 0 then
    begin
      MmoAdd('BarcodeCheck:���������ɹ�...');
      lblProcess.Caption := IntToStr(WinHandle);
      edtEdtBQMSG.Visible := False;
    end
    else
    begin
      MmoAdd('BarcodeCheck:��������ʧ�ܡ�');
      EdtClearPro;
      Exit;
    end;
    FTIStALready := True;

//    end
//    else
//    begin
//      MmoAdd('BarcodeCheck:ConfigFile��ȡʧ�ܡ�');
//      EdtClearPro;
//      Exit;
//    end;

  except

    MmoAdd('BarcodeCheck:���������쳣...');
    EdtClearPro;

  end;

end;

procedure TForm1.BarcodeStartCheck(Sender: TObject; Number: Integer);
begin
  //����ʱ���⣬���ɨ�迪ʼ��interval���ַ����Ƿ������ӣ����δ���ӣ���ر�barcode�˴�����
  //mmo1.Lines.Add('BarcodeStartCheck=st...');
  tmr1.Enabled := True;
end;

procedure TForm1.btnLockBarcodeClick(Sender: TObject);
begin
  edtEdtBQMSG.Visible := True;
  edtEdtBQMSG.SetFocus;
  edtEdtBQMSG.Text := '';
end;

procedure TForm1.chkAutoCloseMouseEnter(Sender: TObject);
begin
  chkAutoClose.ShowHint := True;

end;

procedure TForm1.chkHideWorkMouseEnter(Sender: TObject);
begin
  //chkHideWork.ShowHint := True;
end;

function TForm1.CloseProgram: Boolean;
var
  MyHandle: HWND;
begin
  Result := False;
  if FTIStALready then
  begin
    try
      MmoAdd('CloseProgram:׼���رճ���...');
      MmoAdd('CloseProgram:��ȡFTI����...');
      MyHandle := OpenProcess(PROCESS_ALL_ACCESS, False, PInfo.dwProcessId);
      if (MyHandle = 0) and (StrToInt(lblProcess.Caption) <> 0) then
      begin
        MyHandle := StrToInt(lblProcess.Caption);
      end;

      if MyHandle > 0 then
      begin
        MmoAdd('CloseProgram:���̻�ȡ�ɹ�=' + IntToStr(MyHandle));
      end
      else
      begin
        MmoAdd('CloseProgram:��ȡFTI����ʧ��...');
        EdtClearPro;
        Exit;
      end;

      if TerminateProcess(MyHandle, 0) then
      begin
        MmoAdd('CloseProgram:FTI��������رճɹ������л�PPID...');
        FillChar(StInfo, SizeOf(StInfo), 0);
        FillChar(PInfo, SizeOf(PInfo), 0);
        FTIStALready := False;
        lblProcess.Caption := '0';
        Result := True;
      end
      else
      begin
        MmoAdd('CloseProgram:����ر�ʧ��...');
        EdtClearPro;
        Result := False;
      end;
    except
      on E: Exception do
      begin
        MmoAdd('CloseProgram:����ر�ʧ��...');
        EdtClearPro;
        Result := False;
      end;
    end;
  end;
end;

procedure TForm1.EdtClearPro;
begin
  PPID := '';
  LotID := '';
  edtPPID.Text := '';
  edtLotID.Text := '';
  edtPPIDPath.Text := '';
  edtEdtBQMSG.Text := '';
end;

procedure TForm1.edtEdtBQMSGChange(Sender: TObject);
begin
  BarcodeManualInput;
end;

procedure TForm1.edtEdtBQMSGClick(Sender: TObject);
begin
  if edtEdtBQMSG.Text <> '' then
  begin
    edtEdtBQMSG.Text := '';
    edtPPID.Text := '';
    edtLotID.Text := '';
    edtPPIDPath.Text := '';
  end;
end;

procedure TForm1.edtPPIDPathMouseEnter(Sender: TObject);
begin
  edtPPIDPath.Hint := PPIDPathFileGet;
  edtPPIDPath.ShowHint := True;
end;

function TForm1.CreateConfigFile(LotIDStr: string): string;
var
  ConfigFileName: string;
  Txt: TextFile;
begin
  Result := '';
  try
    if Trim(LotIDStr) = '' then
    begin
      EdtClearPro;
      Exit;
    end;
    MmoAdd('CreateConfigFile:·�������...');
    if not DirectoryExists(ConfigFilePath) then
    begin
      //����Ŀ¼
      ForceDirectories(ConfigFilePath);
    end;
    ConfigFileName := ConfigFilePath + LotIDStr + FormatDateTime('yyyy-mm-dd-hh-mm-ss', Now) + '.txt';
    if FileExists(ConfigFileName) then
    begin
      DeleteFile(ConfigFileName);
      MmoAdd('CreateConfigFile:ɾ����ͬ�ļ�...');
    end;
    MmoAdd('CreateConfigFile:·��������...');
    MmoAdd('CreateConfigFile:config�ļ������ɹ�...');
    AssignFile(Txt, ConfigFileName);
    Rewrite(Txt);
    Writeln(Txt, 'Lot_ID=' + LotIDStr);
    Flush(Txt);
    CloseFile(Txt);
    MmoAdd('CreateConfigFile:config�ļ�������ӳɹ�...');
    Result := ConfigFileName;
  except
    Result := '';
    EdtClearPro;
    MmoAdd('CreateConfigFile:config�ļ���������ʧ��...');
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

procedure TForm1.PosFun;
var
  W: Integer;
  H: Integer;
  Posx: Integer;
  PoxY: Integer;
begin
  W := Self.Width;
  H := Self.Height;
  Posx := Screen.Width - W;
  PoxY := Screen.Height - H;
  Self.Left := Posx;
  //Self.Top := PoxY div 2;
end;

procedure TForm1.BarcodeManualInput;
var
  Str: string;
  Temp: BarcodeJs;
  MyHwnd: HWND;
begin
  Str := UpperCase(Trim(edtEdtBQMSG.Text));
  if Pos('}', Str) <> Length(Str) then
    Exit;
  if Pos('{', Str) <> 1 then
    Exit;
  if JsonAdj(Str, Temp) then
  begin
    MmoAdd('BarcodeManualInput:Json�������...');
    PPID := Temp.PPID;
    LotID := '';
    BarcodeCheck(nil, Str);

    //MyHwnd := FindWindow(nil, PWideChar(Self.Caption));
//    if MyHwnd <> 0 then
//    begin
//      SetWindowPos(MyHwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE);
//      //SetWindowPos(MyHwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE);
//    end;
    PosFun;
  end;

end;

function TForm1.FindProcess(ProcessName: string): Boolean;
var
  hSnapshot: THandle; //���ڻ�ý����б�
  lppe: TProcessEntry32; //���ڲ��ҽ���
  Found: Boolean; //�����жϽ��̱����Ƿ����
  KillHandle: THandle; //����ɱ������
  ProcesStr, ProcesStr1: string;
begin
  Result := False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0); //���ϵͳ�����б�
  lppe.dwSize := SizeOf(TProcessEntry32); //�ڵ���Process32First API֮ǰ����Ҫ��ʼ��lppe��¼�Ĵ�С
  Found := Process32First(hSnapshot, lppe); //�������б�ĵ�һ��������Ϣ����ppe��¼��
  while Found do
  begin
    ProcesStr := UpperCase(ExtractFileName(lppe.szExeFile));
    ProcesStr1 := UpperCase(lppe.szExeFile);
    //MmoAdd(ProcesStr + '/' + ProcesStr1);
    //if ((UpperCase(ExtractFileName(lppe.szExeFile)) = UpperCase(ProcessName)) or (UpperCase(lppe.szExeFile) = UpperCase(ProcessName))) then
    if (Pos(ProcessName, ProcesStr) > 0) or (Pos(ProcessName, ProcesStr1) > 0) then
    begin
      if MessageDlg('�����Ѵ�FTI����,�Ƿ���ر�?', TMsgDlgType.mtWarning, [mbYes, mbNo], 0) = mrYes then
      begin
      //�����ҵĲ���ϵͳ��xp�������ڵ���TerminateProcess API֮ǰ
      //�ұ����Ȼ�ùرս��̵�Ȩ��,�������ϵͳ��NT���¿���ֱ����ֹ����
        KillHandle := OpenProcess(PROCESS_TERMINATE, False, lppe.th32ProcessID);
        TerminateProcess(KillHandle, 0); //ǿ�ƹرս���
        CloseHandle(KillHandle);
      end;
      Result := True;
    end;
    Found := Process32Next(hSnapshot, lppe); //�������б����һ��������Ϣ����lppe��¼��
  end;
end;

procedure TForm1.SaveLog(Lines: Integer);
var
  LogName: string;
  Path: string;
begin
  if mmo1.Lines.Count > Lines then
  begin
    LogName := FormatDateTime('yyyymmddhhmmnn', Now);
    Path := ExtractFilePath(ParamStr(0)) + '\FTI';
    mmo1.Lines.SaveToFile(Path + '\FTLog' + LogName + '.txt');
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //FreeAndNil(FBarReader);
  SaveLog(0);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  mmo1.Lines.Clear;
//  case AutoBarcodeMode of
//    0:
//      begin
//   //�������Զ�hookģʽ
//
//      end;
//    1:
//      begin
//  //�����Զ�Hookģʽ
//
//      end;
//  end;

  if FTIPathInI and (AutoBarcodeMode = 1) then
  begin
    HookStart;
  end;
  Self.Caption := Self.Caption + version;
  PosFun;

end;

procedure TForm1.FormResize(Sender: TObject);
begin
//  if (Self.WindowState = wsMinimized) and (FBarReader <> nil) then
//  begin
//    if not chkHideWork.Checked then
//    begin
//      mmo1.Lines.Add('hide');
//      FBarReader.HideNoMonitor := True;
//    end;
//  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if FBarReader <> nil then
  begin
    FBarReader.HideNoMonitor := False;
  end;
end;

procedure TForm1.FTI1Click(Sender: TObject);
begin
  if not FindProcess(FTIProcessName) then
  begin
    ShowMessage('δ����FTI���̡�');
  end;
end;

function TForm1.FTIPathInI: Boolean;
var
  FTIPath, PPIDDir, Path: string;
  Txt: TextFile;
begin
  Result := True;
  try
    Path := ExtractFilePath(ParamStr(0)); //��ȡ����·��
    if not DirectoryExists(Path + '\FTI') then
    begin
      CreateDir(Path + 'FTI');
    end;
    if not FileExists(Path + 'Path.txt') then
    begin
      ShowMessage('�����������·������ɺ�����������������');
    end
    else
    begin
    //����·��TXT�ļ����༭��
      AssignFile(Txt, Path + 'path.txt');
      Reset(Txt);
      Readln(Txt, FTIPath);
      Readln(Txt, PPIDDir);
      CloseFile(Txt);
      if FileExists(FTIPath) then
      begin
        edtProgramPath.Text := FTIPath;
        mmo1.Lines.Add('>�Ѿ���ȡFTI·����');
      //btn2.Enabled := False;
      end
      else
      begin
        mmo1.Lines.Add('>·���ļ���ȡ����·������ȷ��');
        mmo1.Lines.Add('>���������ü���FTI����ģʽ����·����');
        Result := False;
      end;
      if DirectoryExists(PPIDDir) then
      begin
        PPIDPathFileGet := PPIDDir;
        mmo1.Lines.Add('=>�Ѿ���ȡPPPID·����');
        mmo1.Lines.Add('=>PPID:' + PPIDDir);
      end
      else
      begin
        mmo1.Lines.Add('>·���ļ���ȡ����·������ȷ��');
        mmo1.Lines.Add('>�������ü���·����');
        Result := False;
      end;

    end;
  except
    mmo1.Lines.Add('>Path·���ļ����ݴ���');

  end;

end;

procedure TForm1.HookStart;
begin
  FBarReader := TBarcodeScanMonitor.GetInstance;
  FBarReader.RelayKeyPress := True;
  //�����������, �Ƿ�Ҫ������������ʾ����
  FBarReader.BarcodeLengths := '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33';
  //������ܵĳ���
  FBarReader.ScanMaxDurationSecond := 10;
  //ɨ�����������ʱ
  FBarReader.InputInterval := 1500;
  //����ɨ��֮�������ʱ��ms
  tmr1.Interval := FBarReader.InputInterval;
  //ɨ�迪ʼ�����ʱ���������ݻ�ֱ�ӳ�ʼ��barcode
  FBarReader.AlwaysDuplicatedRead := False;
  //��ֹ����ֵ�ظ�
  FBarReader.CheckPrefixStr := '';
  //ǰ׺��֤��
  FBarReader.CheckSuffixStr := '';
  //��׺��֤��
  FBarReader.HideNoMonitor := True;
  //��С��
  FBarReader.AutoRemoveCheckStr := True;
  FBarReader.HookedThreadId := 0;
  //0ΪOS����ļ���hook
  FBarReader.OnScanFinished := Self.BarcodeCheck;
  //��һ��ɨ��������¼�
  FBarReader.OnScanStart := Self.BarcodeStartCheck;
  //��һ��ɨ�迪ʼ�¼�

  if FBarReader.StartListenScan = False then
  //��ʼ��������
  begin
    ShowMessage('����ʧ��');
  end
  else
  begin
    MmoAdd('Barcode��ؿ�ʼ...');
  end;
end;

procedure TForm1.mmo1Change(Sender: TObject);
begin
  SaveLog(300);
end;

procedure TForm1.MmoAdd(Str: string);
begin
  mmo1.Lines.Add('>' + Str);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  mmo1.Lines.Clear;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  if not Form2.Showing then
  begin
    Form2.Show;
  end;
end;

function TForm1.SaveFTIPath2TXT(SavePos: Integer; FileName, SavePath: string): Boolean;
var
  Path: string;
  Txt: TextFile;
begin
  Result := True;
  try
    case SavePos of
      0:
        begin
        //�����ڳ�������·��
          Path := ExtractFilePath(ParamStr(0)) + FileName;
          AssignFile(Txt, Path);
          Rewrite(Txt);
          Writeln(Txt, SavePath);
          Flush(Txt); //ȷ���ı���д��ɹ���
          CloseFile(Txt);

        end;

    end;

  except
    Result := False;
  end;

end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  if FBarReader.StartRecord and (GetTickCount64 - FBarReader.FrontKeyTick > FBarReader.InputInterval) then
  begin
    FBarReader.BarcodeFinish;
  end;
  tmr1.Enabled := False;

end;

end.

