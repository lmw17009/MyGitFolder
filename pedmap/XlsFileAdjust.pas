unit XlsFileAdjust;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Winapi.ShellAPI,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.ERROR, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.VCLUI.Wait, FireDAC.Phys.ODBCDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.ODBC,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.Menus, RegularExpressions, System.StrUtils;

const
  XlsDiffTableName = 'Counter$';
  XlsDiffTablesNameAcco = 'Summary information$';

type
  TXls = record
    FilePath: string; //文件路径
    FileName: string; //文件名
    Tables: TStrings; //sheet 表名列表
    TablesCount: Integer; //sheet表数量
    PPID: string;    //PPID
    LotID: string; //LotID
    ID: string; //Wafer ID
    IsAccoType: Boolean; //xls是否是acco格式？
  end;

  pTXls = ^TXls;

  TXlsArr = array of TXls;

  pTXlsArr = ^TXlsArr;

  TXlsList = class(TObject)
  private
    FList: TXlsArr; //xls文件组
    FMaxCount: Integer; //最大列表数目
    FCount: Integer; //文件数目
    function Get(Index: Integer): pTXls;
    procedure SetMaxCount(Value: Integer);
    procedure InitialProcess;
    procedure Finalize;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(out Item: pTXls): Integer;
    procedure Clear;
    property MaxCount: Integer read FMaxCount write SetMaxCount;
    property Count: Integer read FCount;
    property Items[Index: Integer]: pTXls read Get; Default;
  end;

type
  TXlsFileRename = class(TForm)
    lv1: TListView;
    Conn1: TFDConnection;
    Qry1: TFDQuery;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    fdphysdbcdrvrlnk1: TFDPhysODBCDriverLink;
    cbb1: TComboBox;
    cbb2: TComboBox;
    edtAccoPPID: TEdit;
    edtACCOLotID: TEdit;
    lbl2: TLabel;
    cbb3: TComboBox;
    cbb4: TComboBox;
    edtNoACCOPPID: TEdit;
    edtNoACCOlotID: TEdit;
    grp1: TGroupBox;
    grp2: TGroupBox;
    btnYes: TButton;
    mm1: TMainMenu;
    N1: TMenuItem;
    dlgOpen1: TOpenDialog;
    edtAdjPPID: TEdit;
    edtAdjLotID: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbb1Select(Sender: TObject);
    procedure cbb2Select(Sender: TObject);
    procedure cbb3Select(Sender: TObject);
    procedure cbb4Select(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure edtAccoPPIDChange(Sender: TObject);
    procedure edtACCOLotIDChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DropFiles(var MSG: TMessage); message WM_DROPFILES;
    function XlsFileRead(FileList: TStrings): Boolean;
    //function GotXlsMsg(FilePath: string): Boolean;
    procedure TablesAdj(out Table: TStrings; out IsAcco: Boolean);
  end;

var
  XlsFileRename: TXlsFileRename;
  PedXlsList: TXlsList;

implementation

{$R *.dfm}

{ TXlsFileRename }

procedure TXlsFileRename.cbb1Select(Sender: TObject);
begin
  edtAccoPPID.Text := cbb1.Items[cbb1.ItemIndex];
end;

procedure TXlsFileRename.cbb2Select(Sender: TObject);
begin
  edtACCOLotID.Text := cbb2.Items[cbb2.ItemIndex];
end;

procedure TXlsFileRename.cbb3Select(Sender: TObject);
begin
  edtNoACCOPPID.Text := cbb3.Items[cbb3.ItemIndex];
end;

procedure TXlsFileRename.cbb4Select(Sender: TObject);
begin
  edtNoACCOlotID.Text := cbb4.Items[cbb4.ItemIndex];
end;

procedure TXlsFileRename.DropFiles(var MSG: TMessage);
var
  buffer: array[0..1024] of Char;
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
  for I := 0 to FileCount - 1 do
  begin
    buffer[0] := #0;
    DragQueryFile(MSG.WParam, I, buffer, SizeOf(buffer)); //第一个文件
    //ShowMessage('当前文件路径为：' + buffer);
    DragFileList.Add(buffer);
  end;

  XlsFileRead(DragFileList);
end;

procedure TXlsFileRename.edtACCOLotIDChange(Sender: TObject);
var
  Arr: TArray<string>;
begin
  try
    Arr := Trim(edtACCOLotID.Text).Split([':']);
    edtAdjLotID.Text := Arr[1];
  except

  end;

end;

procedure TXlsFileRename.edtAccoPPIDChange(Sender: TObject);
var
  Arr, Arr2: TArray<string>;
begin
  try
    //Arr := TRegEx.Split(Trim(edtAccoPPID.Text), ' \ ');
    //edtAdjPPID.Text := Arr[1];
    Arr := Trim(edtAccoPPID.Text).Split(['\ACCO\']);
    edtAdjPPID.Text := Arr[1].Split(['.'])[0];
  except

  end;
end;

procedure TXlsFileRename.FormCreate(Sender: TObject);
begin
  ChangeWindowMessageFilter(WM_DROPFILES, MSGFLT_ADD);
  ChangeWindowMessageFilter(WM_COPYDATA, MSGFLT_ADD);
  ChangeWindowMessageFilter(WM_COPYGLOBALDATA, MSGFLT_ADD);
  DragAcceptFiles(Handle, True); //第二个参数为False时，不启用文件拖放
  PedXlsList := TXlsList.Create;
end;

procedure TXlsFileRename.FormDestroy(Sender: TObject);
begin
  PedXlsList.Destroy;
end;

procedure TXlsFileRename.N1Click(Sender: TObject);
var
  Dlg: TOpenDialog;
  List: TStrings;
begin
  try
    Dlg := TOpenDialog.Create(Self);
    Dlg.Filter := '*.xls|*.xls;*.xlsx|*.xlsx';
    Dlg.Options := [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing];
    if Dlg.Execute then
    begin
      List := Dlg.Files;
      XlsFileRead(List);
    end;
  finally
    Dlg.Free;
  end;

end;

procedure TXlsFileRename.TablesAdj(out Table: TStrings; out IsAcco: Boolean);
var
  j, k: Integer;
  StrTemp, StrTempNew: string;
begin
  IsAcco := True;
  for j := 0 to Table.Count - 1 do
  begin
    StrTemp := Table[j];
    StrTempNew := '';

    for k := 1 to Length(StrTemp) do
    begin
      if (StrTemp[k] in ['0'..'9']) or (StrTemp[k] in ['a'..'z']) or (StrTemp[k] in ['A'..'Z']) or (StrTemp[k] in ['_', '-', '.', '#', ' ', '$']) then
      begin
        StrTempNew := StrTempNew + StrTemp[k];
      end;
    end;
    Table[j] := StrTempNew;
    if StrTempNew = XlsDiffTableName then
    begin
      IsAcco := False;
    end;

  end;
end;

function TXlsFileRename.XlsFileRead(FileList: TStrings): Boolean;
var
  I, J: Integer;
  XlsItem: pTXls;
  XlsTables: TStrings;
  QryTableName: string;
begin
  Result := False;

  XlsTables := TStringList.Create;
  for I := 0 to FileList.Count - 1 do
  begin
    if PedXlsList.Add(XlsItem) > 0 then
    begin
      XlsItem.FilePath := FileList[I];
      XlsItem.FileName := ExtractFileName(FileList[I]);

      try
        Conn1 := TFDConnection.Create(Self);
        Conn1.Params.DriverID := 'ODBC';
        Conn1.Params.Values['DataSource'] := 'Excel Files';
        Conn1.LoginPrompt := False;
        Conn1.Params.Add('DataBase=' + FileList[I]);
        Conn1.Connected := True;
        Conn1.GetTableNames('', '', '', XlsTables, [osMy, osSystem, osOther], [tkTable], False);
        TablesAdj(XlsTables, XlsItem.IsAccoType);
        XlsItem.Tables := XlsTables;
        XlsItem.TablesCount := XlsTables.Count;
        with lv1.Items.Add do
        begin
          Caption := XlsItem.FileName;
          Qry1 := TFDQuery.Create(Self);
          Qry1.Connection := Conn1;
          if (not XlsItem.IsAccoType) and (XlsItem.TablesCount <= 3) then
          begin
            for J := 0 to XlsItem.TablesCount - 1 do
            begin
              if XlsItem.Tables[J] <> XlsDiffTableName then
              begin
                QryTableName := XlsItem.Tables[J];
                with Qry1 do
                begin
              //ppid
                  Close;
                  SQL.Clear;
                  SQL.Text := 'select * from [' + QryTableName + 'B3:B4]';
                  Open;
                  if RecordCount > 0 then
                  begin
                    XlsItem.PPID := Fields[0].Value;
                  end;
                //lotid
                  Close;
                  SQL.Clear;
                  SQL.Text := 'select * from [' + QryTableName + 'G2:G3]';
                  Open;
                  if RecordCount > 0 then
                  begin
                    XlsItem.LotID := Fields[0].Value;
                  end;
                //WaferID
                  Close;
                  SQL.Clear;
                  SQL.Text := 'select * from [' + QryTableName + 'G3:G4]';
                  Open;
                  if RecordCount > 0 then
                  begin
                    XlsItem.ID := Fields[0].Value;
                  end;
                  SubItems.Add(XlsItem.PPID);
                  SubItems.Add(XlsItem.LotID);
                  SubItems.Add(XlsItem.ID);
                  SubItems.Add('NotAcco');
                end;
                Break;
              end;
            end;
          end
          else
          begin
            //acco xls file
            if XlsItem.IsAccoType then
            begin
              with Qry1 do
              begin
              //ppid
                Close;
                SQL.Clear;
                SQL.Text := 'Select * from [' + XlsDiffTablesNameAcco + 'A4:A5]';
                Open();
                if RecordCount > 0 then
                begin
                  XlsItem.PPID := Fields[0].Value;
                end;
              //Lotid
                Close;
                SQL.Clear;
                SQL.Text := 'Select * from [' + XlsDiffTablesNameAcco + 'A8:A9]';
                Open();
                if RecordCount > 0 then
                begin
                  XlsItem.LotID := Fields[0].Value;
                end;
              //waferid
                Close;
                SQL.Clear;
                SQL.Text := 'Select * from [' + XlsDiffTablesNameAcco + 'A7:A8]';
                Open();
                if RecordCount > 0 then
                begin
                  XlsItem.ID := Fields[0].Value;
                end;
                SubItems.Add(XlsItem.PPID);
                SubItems.Add(XlsItem.LotID);
                SubItems.Add(XlsItem.ID);
                SubItems.Add('Acco');
              end;
            end;
          end;

        end;

        Conn1.Close;
      finally
        Conn1.Free;
        Qry1.Free;

      end;
    end;

  end;
  for I := 0 to PedXlsList.Count - 1 do
  begin
    if PedXlsList[I].IsAccoType then
    begin
      cbb1.Items.Add(PedXlsList[I].PPID);
      cbb2.Items.Add(PedXlsList[I].LotID);
    end
    else
    begin
      cbb3.Items.Add(PedXlsList[I].PPID);
      cbb4.items.Add(PedXlsList[I].LotID);
    end;

  end;

  XlsTables.Clear;

end;

{ TXlsList }

function TXlsList.Add(out Item: pTXls): Integer;
var
  Index: Integer;
begin
  Result := -1;
  Index := FCount;
  if (Index >= 0) and (Index < FMaxCount) then
  begin
    Item := @FList[Index];
    Inc(FCount);
    Result := FCount;
  end;
end;

procedure TXlsList.Clear;
var
  Index: Integer;
begin
  for Index := 0 to FMaxCount - 1 do
  begin
    FList[Index].FilePath := '';
    FList[Index].FileName := '';
    FList[Index].Tables.Clear;
    FList[Index].TablesCount := 0;
    FList[Index].PPID := '';
    FList[Index].LotID := '';
    FList[Index].ID := '';
  end;

end;

constructor TXlsList.Create;
begin
  inherited;
  FCount := 0;
  FMaxCount := 100;
  SetLength(FList, FMaxCount);
  InitialProcess();
end;

destructor TXlsList.Destroy;
var
  Index: Integer;
begin
  for Index := 0 to FMaxCount - 1 do
  begin
    FList[Index].Tables.Clear;
  end;
  SetLength(FList, 0);
  inherited;
end;

procedure TXlsList.Finalize;
var
  Index: Integer;
begin
  for Index := 0 to FMaxCount - 1 do
  begin
    FList[Index].FilePath := '';
    FList[Index].FileName := '';
    FList[Index].Tables.Free;
    FList[Index].TablesCount := 0;
    FList[Index].PPID := '';
    FList[Index].LotID := '';
    FList[Index].ID := '';
  end;

end;

function TXlsList.Get(Index: Integer): pTXls;
begin
  if (Index >= 0) and (Index < FMaxCount) then
  begin
    Result := @FList[Index];
  end
  else
  begin
    Result := nil;
  end;
end;

procedure TXlsList.InitialProcess;
var
  Index: Integer;
begin
  for Index := 0 to FMaxCount - 1 do
  begin
    FList[Index].FilePath := '';
    FList[Index].FileName := '';
    FList[Index].Tables := TStringList.Create;
    FList[Index].TablesCount := 0;
    FList[Index].PPID := '';
    FList[Index].LotID := '';
    FList[Index].ID := '';
    FList[Index].IsAccoType := False;
  end;
end;

procedure TXlsList.SetMaxCount(Value: Integer);
begin
  if FMaxCount <> Value then
  begin
    Finalize;
    FMaxCount := Value;
    SetLength(FList, FMaxCount);
    InitialProcess;
  end;
end;

end.

