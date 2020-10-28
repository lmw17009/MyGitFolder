unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.FileCtrl;

type
  TForm2 = class(TForm)
    edtFTI: TEdit;
    edtPPID: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FTIPathInput;
  end;

var
  Form2: TForm2;

implementation

uses
  Unit1;
{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
begin
  FTIPathInput;
end;

procedure TForm2.btn2Click(Sender: TObject);
var
  FPath: string;
begin
  if SelectDirectory('选择路径', 'C:\', FPath) then
  begin
    edtPPID.Text := FPath;
  end;
end;

procedure TForm2.btn3Click(Sender: TObject);
var
  Txt: TextFile;
  Path: string;
begin
  if (edtFTI.Text <> '') and (edtPPID.Text <> '') then
  begin
    Path := ExtractFilePath(ParamStr(0)) + 'path.txt';
    AssignFile(Txt, Path);
    Rewrite(Txt);
    //Reset(Txt);
    Writeln(Txt, edtFTI.Text);
    Writeln(Txt, edtPPID.Text);
    Flush(Txt);
    CloseFile(Txt);
    ShowMessage('路径保存完毕。[' + Path + ']');
    Self.Close;
    //Application.Terminate;
    if Form1.FTIPathInI and (AutoBarcodeMode = 1) then
    begin
      Form1.HookStart;
    end;
    Form1.Caption := Form1.Caption + version;
  end;

end;

procedure TForm2.FTIPathInput;
var
  Dlg: TOpenDialog;
begin
  try
    Dlg := TOpenDialog.Create(Self);
    Dlg.Filter := 'FTI生产测试软件(*.EXE)|*.EXE';
    Dlg.DefaultExt := '*.EXE';
    if Dlg.Execute then
    begin
      edtFTI.Text := Dlg.FileName;
    end;
  finally
    FreeAndNil(Dlg);
  end;
end;

end.

