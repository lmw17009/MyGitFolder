(*
FTI专用程序参数启动程序，使用了BarcodeHook系统级别的键盘钩子。
可实现扫码启动程序。
扫码包含PPID和LOTID
格式=>"PPID,PPID"
支持扫码退出程序。
程序原理：利用CreateProcess函数为启动程序添加启动Parameter，进程会被保存，如果保存的进程存在则支持扫码退出程序。
目前支持录入后时间定时检测，如果前后二个字符串的生成时间超过了设定值则自动停止此次录入。
2020-11-09 修改UI 去除自动扫码模式 ，修改部分逻辑
2020-11-27 更换logo
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
    MmoAdd('BarcodeCheck:准备解析Barcode数据...');
    if not JsonAdj(BarcodeString, TempJs) then
    begin
      MmoAdd('BarcodeCheck:Jscon格式错误。');
      Exit;
    end
    else
    begin
      MmoAdd('PPID=' + TempJs.PPID);
    end;

//    if BarcodeString = 'QQQQ' then
//    begin
//      CloseProgram;
//      MmoAdd('已经卸载FTI软件');
//      Exit;
//    end;

    case WorkMode of
      0:
        begin
          PPID := BarcodeString;
          if Length(PPID) < 3 then
          begin
            MmoAdd('BarcodeCheck:PPID数据段长度异常。');
            EdtClearPro;
            Exit;
          end;
          LotID := '';
        end;
      1:
        begin
          MmoAdd('BarcodeCheck:进入启动进程...');
//          if not JsonAdjust(BarcodeString, TempJs) then
//          begin
//            MmoAdd('BarcodeCheck:JSON解析异常...');
//            EdtClearPro;
//            Exit;
//          end;

          (*
          ArrStr := BarcodeString.Split([FstSpltStr]);
          MmoAdd('BarcodeCheck:解析成功...');
          if Length(ArrStr) > 1 then
          begin
            MmoAdd('BarcodeCheck:数据段长度为' + IntToStr(Length(ArrStr)));
          end
          else
          begin
            MmoAdd('BarcodeCheck:数据段长度异常。');
            EdtClearPro;
            Exit;
          end;
          PPID := ArrStr[0];
          LotID := ArrStr[1];

          if Length(PPID) < 3 then
          begin
            MmoAdd('BarcodeCheck:PPID数据段长度异常。');
            EdtClearPro;
            Exit;
          end;
          if Length(LotID) < 3 then
          begin
            MmoAdd('BarcodeCheck:LotID数据段长度异常。');
            EdtClearPro;
            Exit;
          end;
              //此处需判断是否使用了LOTID

          edtLotID.Text := LotID;
          *)

        end;

    end;
    edtPPID.Text := PPID;
    edtPPIDPath.Text := PPIDPathFileGet + '\' + PPID + '.xml';
    PPIDFileName := PPIDPathFileGet + '\' + PPID + '.xml';
    if not FileExists(PPIDFileName) then
    begin
      //ShowMessage('此PPID不存在，请检查PPID路径！');
      MmoAdd('BarcodeCheck:PPID程序不存在...' + PPIDFileName);
      EdtClearPro;
      Exit;
    end;

    MmoAdd('BarcodeCheck:数据赋值成功。');
    ConfigFilePathTemp := '';
    ConfigFilePathTemp := CreateConfigFile(LotID);
    if Trim(edtProgramPath.Text) = '' then
    begin
      MmoAdd('BarcodeCheck:程序路径异常。');
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
      //MmoAdd('BarcodeCheck:命令行创建成功。');

      //MmoAdd(ParamaLineStr);
    if {chkAutoClose.Checked or } (lblProcess.Caption <> '0') then
    begin
      CloseProgram;
    end;
    FindProcess(FTIProcessName); //关闭FTI进程
    if not CreateProcess(nil, PWideChar(ParamaLineStr), nil, nil, True, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, StInfo, PInfo) then
    begin
      MmoAdd('BarcodeCheck:程序启动失败。');
      EdtClearPro;
      Exit;
    end;
    MmoAdd('BarcodeCheck:等待程序启动...');
    WaitForInputIdle(PInfo.hProcess, 5000);
    MmoAdd('BarcodeCheck:检测程序进程...');
      //WinHandle := GetProcessWindow(PInfo.dwProcessID);
    WinHandle := OpenProcess(PROCESS_ALL_ACCESS, False, PInfo.dwProcessId);

      //WinHandle := GetProcessId(PInfo.dwProcessID);
    if WinHandle > 0 then
    begin
      MmoAdd('BarcodeCheck:程序启动成功...');
      lblProcess.Caption := IntToStr(WinHandle);
      edtEdtBQMSG.Visible := False;
    end
    else
    begin
      MmoAdd('BarcodeCheck:程序启动失败。');
      EdtClearPro;
      Exit;
    end;
    FTIStALready := True;

//    end
//    else
//    begin
//      MmoAdd('BarcodeCheck:ConfigFile获取失败。');
//      EdtClearPro;
//      Exit;
//    end;

  except

    MmoAdd('BarcodeCheck:程序启动异常...');
    EdtClearPro;

  end;

end;

procedure TForm1.BarcodeStartCheck(Sender: TObject; Number: Integer);
begin
  //开启时间检测，检测扫描开始后interval内字符串是否有增加，如果未增加，则关闭barcode此次内容
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
      MmoAdd('CloseProgram:准备关闭程序...');
      MmoAdd('CloseProgram:获取FTI进程...');
      MyHandle := OpenProcess(PROCESS_ALL_ACCESS, False, PInfo.dwProcessId);
      if (MyHandle = 0) and (StrToInt(lblProcess.Caption) <> 0) then
      begin
        MyHandle := StrToInt(lblProcess.Caption);
      end;

      if MyHandle > 0 then
      begin
        MmoAdd('CloseProgram:进程获取成功=' + IntToStr(MyHandle));
      end
      else
      begin
        MmoAdd('CloseProgram:获取FTI进程失败...');
        EdtClearPro;
        Exit;
      end;

      if TerminateProcess(MyHandle, 0) then
      begin
        MmoAdd('CloseProgram:FTI测试软件关闭成功，可切换PPID...');
        FillChar(StInfo, SizeOf(StInfo), 0);
        FillChar(PInfo, SizeOf(PInfo), 0);
        FTIStALready := False;
        lblProcess.Caption := '0';
        Result := True;
      end
      else
      begin
        MmoAdd('CloseProgram:程序关闭失败...');
        EdtClearPro;
        Result := False;
      end;
    except
      on E: Exception do
      begin
        MmoAdd('CloseProgram:程序关闭失败...');
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
    MmoAdd('CreateConfigFile:路径检测中...');
    if not DirectoryExists(ConfigFilePath) then
    begin
      //创建目录
      ForceDirectories(ConfigFilePath);
    end;
    ConfigFileName := ConfigFilePath + LotIDStr + FormatDateTime('yyyy-mm-dd-hh-mm-ss', Now) + '.txt';
    if FileExists(ConfigFileName) then
    begin
      DeleteFile(ConfigFileName);
      MmoAdd('CreateConfigFile:删除相同文件...');
    end;
    MmoAdd('CreateConfigFile:路径检测完毕...');
    MmoAdd('CreateConfigFile:config文件创建成功...');
    AssignFile(Txt, ConfigFileName);
    Rewrite(Txt);
    Writeln(Txt, 'Lot_ID=' + LotIDStr);
    Flush(Txt);
    CloseFile(Txt);
    MmoAdd('CreateConfigFile:config文件数据添加成功...');
    Result := ConfigFileName;
  except
    Result := '';
    EdtClearPro;
    MmoAdd('CreateConfigFile:config文件创建过程失败...');
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
    MmoAdd('BarcodeManualInput:Json解析完毕...');
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
  hSnapshot: THandle; //用于获得进程列表
  lppe: TProcessEntry32; //用于查找进程
  Found: Boolean; //用于判断进程遍历是否完成
  KillHandle: THandle; //用于杀死进程
  ProcesStr, ProcesStr1: string;
begin
  Result := False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0); //获得系统进程列表
  lppe.dwSize := SizeOf(TProcessEntry32); //在调用Process32First API之前，需要初始化lppe记录的大小
  Found := Process32First(hSnapshot, lppe); //将进程列表的第一个进程信息读入ppe记录中
  while Found do
  begin
    ProcesStr := UpperCase(ExtractFileName(lppe.szExeFile));
    ProcesStr1 := UpperCase(lppe.szExeFile);
    //MmoAdd(ProcesStr + '/' + ProcesStr1);
    //if ((UpperCase(ExtractFileName(lppe.szExeFile)) = UpperCase(ProcessName)) or (UpperCase(lppe.szExeFile) = UpperCase(ProcessName))) then
    if (Pos(ProcessName, ProcesStr) > 0) or (Pos(ProcessName, ProcesStr1) > 0) then
    begin
      if MessageDlg('发现已打开FTI程序,是否将其关闭?', TMsgDlgType.mtWarning, [mbYes, mbNo], 0) = mrYes then
      begin
      //由于我的操作系统是xp，所以在调用TerminateProcess API之前
      //我必须先获得关闭进程的权限,如果操作系统是NT以下可以直接中止进程
        KillHandle := OpenProcess(PROCESS_TERMINATE, False, lppe.th32ProcessID);
        TerminateProcess(KillHandle, 0); //强制关闭进程
        CloseHandle(KillHandle);
      end;
      Result := True;
    end;
    Found := Process32Next(hSnapshot, lppe); //将进程列表的下一个进程信息读入lppe记录中
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
//   //不开启自动hook模式
//
//      end;
//    1:
//      begin
//  //开启自动Hook模式
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
    ShowMessage('未发现FTI进程。');
  end;
end;

function TForm1.FTIPathInI: Boolean;
var
  FTIPath, PPIDDir, Path: string;
  Txt: TextFile;
begin
  Result := True;
  try
    Path := ExtractFilePath(ParamStr(0)); //获取程序路径
    if not DirectoryExists(Path + '\FTI') then
    begin
      CreateDir(Path + 'FTI');
    end;
    if not FileExists(Path + 'Path.txt') then
    begin
      ShowMessage('请点击设置添加路径，完成后务必重启软件！！！');
    end
    else
    begin
    //加载路径TXT文件到编辑框
      AssignFile(Txt, Path + 'path.txt');
      Reset(Txt);
      Readln(Txt, FTIPath);
      Readln(Txt, PPIDDir);
      CloseFile(Txt);
      if FileExists(FTIPath) then
      begin
        edtProgramPath.Text := FTIPath;
        mmo1.Lines.Add('>已经获取FTI路径！');
      //btn2.Enabled := False;
      end
      else
      begin
        mmo1.Lines.Add('>路径文件获取程序路径不正确！');
        mmo1.Lines.Add('>请重新设置加载FTI生产模式程序路径！');
        Result := False;
      end;
      if DirectoryExists(PPIDDir) then
      begin
        PPIDPathFileGet := PPIDDir;
        mmo1.Lines.Add('=>已经获取PPPID路径！');
        mmo1.Lines.Add('=>PPID:' + PPIDDir);
      end
      else
      begin
        mmo1.Lines.Add('>路径文件获取程序路径不正确！');
        mmo1.Lines.Add('>请点击设置加载路径！');
        Result := False;
      end;

    end;
  except
    mmo1.Lines.Add('>Path路径文件内容错误！');

  end;

end;

procedure TForm1.HookStart;
begin
  FBarReader := TBarcodeScanMonitor.GetInstance;
  FBarReader.RelayKeyPress := True;
  //按键被捕获后, 是否要继续将按键显示出来
  FBarReader.BarcodeLengths := '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33';
  //条码可能的长度
  FBarReader.ScanMaxDurationSecond := 10;
  //扫描条码的最大耗时
  FBarReader.InputInterval := 1500;
  //二次扫描之间最大间隔时间ms
  tmr1.Interval := FBarReader.InputInterval;
  //扫描开始后多少时间内无数据会直接初始化barcode
  FBarReader.AlwaysDuplicatedRead := False;
  //防止条码值重复
  FBarReader.CheckPrefixStr := '';
  //前缀验证码
  FBarReader.CheckSuffixStr := '';
  //后缀验证码
  FBarReader.HideNoMonitor := True;
  //最小化
  FBarReader.AutoRemoveCheckStr := True;
  FBarReader.HookedThreadId := 0;
  //0为OS级别的键盘hook
  FBarReader.OnScanFinished := Self.BarcodeCheck;
  //绑定一个扫描结束的事件
  FBarReader.OnScanStart := Self.BarcodeStartCheck;
  //绑定一个扫描开始事件

  if FBarReader.StartListenScan = False then
  //开始监听键盘
  begin
    ShowMessage('监听失败');
  end
  else
  begin
    MmoAdd('Barcode监控开始...');
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
        //保存在程序自身路径
          Path := ExtractFilePath(ParamStr(0)) + FileName;
          AssignFile(Txt, Path);
          Rewrite(Txt);
          Writeln(Txt, SavePath);
          Flush(Txt); //确保文本被写入成功。
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

