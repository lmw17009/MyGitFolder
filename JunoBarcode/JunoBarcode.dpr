program JunoBarcode;

uses
  Vcl.Forms,
  Tool in 'Tool.pas' {Form2},
  Unit1 in 'Unit1.pas' {Form1},
  BarcodeHook in 'BarcodeHook.pas',
  JsonAdjust in 'JsonAdjust.pas',
  Global in 'Global.pas',
  AutoUpdate in 'AutoUpdate.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

