program Upload;

uses
  Vcl.Forms,
  Winapi.ShellAPI,
  Winapi.Windows,
  Vcl.Dialogs,
  Vcl.Graphics,
  System.SysUtils,
  UpdatePg in '..\UpdatePg.pas' {Form3};

{$R *.res}
var
  S1, S2, S3: string;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  if ParamCount <> 3 then
  begin
    ShowMessage('未更新成功请联系管理员。');
    Application.Terminate;
  end;
  S1 := Copy(ParamStr(1), 2, Length(ParamStr(1)) - 1);
  S2 := Copy(ParamStr(2), 2, Length(ParamStr(2)) - 1);
  S3 := Copy(ParamStr(3), 2, Length(ParamStr(3)) - 1);
  if not FileExists(S1) then
  begin
    Application.Terminate;
  end;
  if not FileExists(S2) then
  begin
    Application.Terminate;
  end;
  if not DirectoryExists(ExtractFileDir(ParamStr(0)) + '\BarcodeOld') then
  begin
    CreateDir(ExtractFileDir(ParamStr(0)) + '\BarcodeOld');
  end;
  if MoveFile(PWideChar(S1), PWideChar(ExtractFileDir(ParamStr(0)) + '\BarcodeOld' + '\' + S3 + FormatDateTime('yyyymmddhhmmss', Now) + '.exe')) then
  begin
    Sleep(2000);
    MoveFile(PWideChar(S2), PWideChar(ExtractFileDir(ParamStr(0)) + '\' + S3 + '.exe'));
    Sleep(2000);
    ShellExecute(0, 'open', PWideChar(S1), '-s', PWideChar(ExtractFileDir(Application.ExeName)), SW_SHOWNORMAL);
    Sleep(1000);
    ShowMessage('更新成功。');
    Application.Terminate;
  end
  else
  begin
    ShowMessage('未更新成功请联系管理员。');
    Application.Terminate;
  end;
  Application.Terminate;
end.

