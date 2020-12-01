program Project1;

uses
  Vcl.Forms,
  Winapi.Windows,
  System.SysUtils,
  UpdatePg in '..\UpdatePg.pas' {Form3};

{$R *.res}
var
  S1, S2: string;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  if ParamCount <> 2 then
    Application.Terminate;
  S1 := Copy(ParamStr(1), 2, Length(ParamStr(1)) - 1);
  S2 := Copy(ParamStr(2), 2, Length(ParamStr(1)) - 1);
  if not FileExists(S1) then
    Application.Terminate;
  if not FileExists(S2) then
    Application.Terminate;
  if not DirectoryExists(ExtractFileDir(ParamStr(0)) + '\JunoOld') then
  begin
    CreateDir(ExtractFileDir(ParamStr(0)) + '\JunoOld');
  end;
  MoveFile(PWideChar(S1), PWideChar(ExtractFileDir(ParamStr(0)) + '\JunoOld' + '\JunoBarcode' + DateTimeToStr(Now) + '.exe'));
  Application.Run;
end.

