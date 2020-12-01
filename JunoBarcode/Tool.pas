unit Tool;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Winapi.ShellAPI;

type
  TForm2 = class(TForm)
    btnBarcodSt: TButton;
    rb1: TRadioButton;
    rb2: TRadioButton;
    btn1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBarcodStClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    procedure PosIni;
    { Private declarations }
  public
    { Public declarations }
    procedure CreateVerIni;
    function CheckUpdate: Boolean;
  end;

var
  Form2: TForm2;

implementation

uses
  Unit1, Global, JsonAdjust;
{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
begin
  if (not rb1.Checked) and (not rb2.Checked) then
    Abort;

  if Form1.Showing then
    Abort;
  Form1.mmo1.Lines.Clear;
  if rb1.Checked then
  begin
    WhichStation := 'A';
    Form1.MmoAdd('你选择了A站');
  end;
  if rb2.Checked then
  begin
    WhichStation := 'B';
    Form1.MmoAdd('你选择了B站');
  end;
  if MessageDlg('请确认是否为' + WhichStation + '站(YES/NO)？' + #10 + '请确认是否为' + WhichStation + '站(YES/NO)？' + #10'请确认是否为' + WhichStation + '站(YES/NO)？', TMsgDlgType.mtWarning, [mbYes, mbNo], 0) = mrNo then
  begin
    rb1.Checked := False;
    rb2.Checked := False;
    Abort;
  end;
  Form1.Left := Self.Left - Form1.Width + 200 - 83;
  Form1.Show;
  Form1.edtBarcode.SetFocus;
  Self.Width := 83;
  PosIni;
  rb1.Checked := False;
  rb2.Checked := False;
end;

procedure TForm2.btnBarcodStClick(Sender: TObject);
begin
  //Form3.Show;
  if Form1.Showing then
    Abort;

  Self.Width := 200;
  PosIni;
end;

function TForm2.CheckUpdate: Boolean;
var
  Txt: TextFile;
  S: string;
  TempJsRd: UpdateJs;
  TempParaStr: string;
begin
  if FileExists(UpdatePath + UpdateIni) then
  begin
     //UpdateJsRead
    AssignFile(Txt, UpdatePath + UpdateIni);
    Reset(Txt);
    Readln(Txt, S);
    CloseFile(Txt);
    if UpdateJsRead(S, TempJsRd) then
    begin
      if StrToInt(TempJsRd.Ver) > StrToInt(JunoVersion) then
      begin
        //需要更新
        ShowMessage('发现新程序！');
        if MessageDlg('发现新版本，确定关闭程序进行更新？', TMsgDlgType.mtWarning, [mbYes, mbNo], 0) = mrYes then
        begin
          TempParaStr := '-' + Application.ExeName;
          TempParaStr := TempParaStr + ' -' + TempJsRd.UpdatePath + '\JunoBarcode.exe';
          TempParaStr := TempParaStr + ' -JunoBarcode';
          ShellExecute(0, 'open', PWideChar(ExtractFileDir(Application.ExeName) + '\Upload.exe'), PWideChar(TempParaStr), PWideChar(ExtractFileDir(Application.ExeName)), SW_SHOWNORMAL);
          //ShellExecute(0, 'open', PWideChar(ExtractFileDir(Application.ExeName) + '\Upload.exe'), '-s -x', '', SW_SHOWNORMAL);
          Application.Terminate;
        end;
      end;
    end;

  end;

end;

procedure TForm2.CreateVerIni;
var
  Txt: TextFile;
  SelfPath: string;
begin
  SelfPath := ExtractFileDir(ParamStr(0));
  if not FileExists(SelfPath + UpdateIni) then
  begin
    AssignFile(Txt, SelfPath + UpdateIni);
    Rewrite(Txt);
    Writeln(Txt, UpdateJsCreate.ToString);
    CloseFile(Txt);
  end
  else
  begin
    AssignFile(Txt, SelfPath + UpdateIni);
    Rewrite(Txt);
    Writeln(Txt, UpdateJsCreate.ToJSON);
    Flush(Txt);
    CloseFile(Txt);
  end;

end;

procedure TForm2.PosIni;
begin
  Self.Left := Screen.Width - Self.Width;
  Self.Top := (Screen.Height - Self.Height) div 2;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  txt: TextFile;
  s: string;
  Arr: TArray<string>;
  SelfPath: string;
begin
  Self.Width := 83;
  PosIni;
  CreateVerIni;
  CheckUpdate;
  Exit;
  if Form1.NewVerCheck then
  begin
    Form1.CheckNewVersion;
  end;
  Form1.DelayRun(2000);
  if FileExists(ExtractFileDir(ParamStr(0)) + NewVerPath + JunoConfig) then
  begin
    AssignFile(txt, ExtractFileDir(ParamStr(0)) + NewVerPath + JunoConfig);
    Reset(txt);
    Readln(txt, s);
    CloseFile(txt);
    if FileExists(s) then
    begin
      Arr := s.Split(['\']);
      SelfPath := ExtractFileDir(ParamStr(0));
      if not DirectoryExists(SelfPath + JunoOld) then
      begin
        CreateDir(SelfPath + JunoOld);
      end;
      if MoveFile(PWideChar(s), PWideChar(SelfPath + JunoOld + Arr[High(Arr)])) then
      begin
        DeleteFile(ExtractFileDir(ParamStr(0)) + NewVerPath + JunoConfig);
      end;
    end;
  end;

end;

end.

