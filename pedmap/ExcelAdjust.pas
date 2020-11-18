unit ExcelAdjust;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Winapi.ShellAPI, Vcl.StdCtrls, System.Win.ComObj, Vcl.ComCtrls;

type
  TExcelAdj = class(TForm)
    mmo1: TMemo;
    btn1: TButton;
    lv1: TListView;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DropFiles(var MSG: TMessage); message WM_DROPFILES;
  end;

var
  ExcelAdj: TExcelAdj;
  XlsPathList: TStrings;

implementation

uses
  Global;
{$R *.dfm}

procedure TExcelAdj.btn1Click(Sender: TObject);
var
  ExApp: Variant;
begin
  ExApp := CreateOleObject('Excel.Application');
  ExApp.Visible := True;
  ExApp.Caption := '123123123';
  ExApp.WorkBooks.add(XlsPathList[0]);
  ExApp.WorkSheets[1].Activate;
  mmo1.Lines.Add(IntToStr(ExApp.worksheets.count));
  ExApp.Close;

end;

procedure TExcelAdj.DropFiles(var MSG: TMessage);
var
  Buffer: array[0..1024] of Char;
  FileCount: Integer;
  I: Integer;
  DragFileList: TStrings;
begin
  inherited;
  FileCount := DragQueryFile(MSG.WParam, $FFFFFFFF, nil, 0);
  if FileCount > 0 then
  begin
    DragFileList := TStringList.Create;
  end;
  if XlsPathList = nil then
  begin
    XlsPathList := TStringList.Create;
  end
  else
  begin
    XlsPathList.Clear;
  end;
  for I := 0 to FileCount - 1 do
  begin
    Buffer[0] := #0;
    DragQueryFile(MSG.WParam, I, Buffer, SizeOf(Buffer)); //第一个文件
    //ShowMessage('当前文件路径为：' + buffer);
    DragFileList.Add(Buffer);
    XlsPathList.Add(Buffer)
  end;
  mmo1.Lines.AddStrings(DragFileList);

end;

procedure TExcelAdj.FormCreate(Sender: TObject);
begin
  mmo1.Lines.Clear;
  Self.Caption := Self.Caption + SubVer_Excel;
  ChangeWindowMessageFilter(WM_DROPFILES, MSGFLT_ADD);
  ChangeWindowMessageFilter(WM_COPYDATA, MSGFLT_ADD);
  ChangeWindowMessageFilter(WM_COPYGLOBALDATA, MSGFLT_ADD);
  DragAcceptFiles(Handle, True); //第二个参数为False时，不启用文件拖放
end;

end.

