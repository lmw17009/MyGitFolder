unit AutoUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, System.RegularExpressions, SHELLAPI, Vcl.ExtCtrls, BarcodeHook,
  Vcl.Menus;

procedure NewFileCheck(FileName: string; Path: string; out NewFileNamePath: string);

procedure CheckNewVer(ExeName: string);

implementation

uses
  Unit1, Global;

procedure CheckNewVer(ExeName: string);
var
  S: string;
  PrgPath: string;
  Path: string;
  Txt: TextFile;
begin
  //���³���,��ָ��·��������ͬ�ļ���
  //if MessageDlg('ȷ�����³���', TMsgDlgType.mtWarning, [mbYes, mbNo], 0) = mrNo then
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
  //ShellExecute(Handle, 'open', PWideChar(PrgPath + '\' + ExtractFileName(S)), '-s', '', SW_SHOWNORMAL);
  Application.Terminate;
end;

procedure NewFileCheck(FileName: string; Path: string; out NewFileNamePath: string);
var
  Sr: TSearchRec;
  I: Integer;
  NewEstFile: string;
  OldFileName: string;
  FilterLength: Integer;
  SelfVersionIndex, VerIndex, MaxVerIndex: Integer;
begin
  //����ϵ��ļ���
  NewFileNamePath := '';
  OldFileName := ChangeFileExt(ExtractFileName(Application.ExeName), '');
  FilterLength := Length(FileName);
  //�Ƚ������ļ������ļ������˴ʵĳ���
  if Length(OldFileName) <= FilterLength then
    Abort;
  SelfVersionIndex := StrToInt(Copy(OldFileName, FilterLength + 1, Length(OldFileName) - FilterLength));
  MaxVerIndex := SelfVersionIndex;
  if FindFirst(Path + '\*', faAnyFile, Sr) = 0 then
  begin
    repeat
      if (Sr.Name = '.') or (Sr.Name = '..') then
        Continue;
      if Sr.Attr >= faDirectory then
      begin
        if Pos(FileName, Sr.Name) > 0 then
        begin
          VerIndex := StrToInt(Copy(ChangeFileExt(Sr.Name, ''), FilterLength + 1, Length(ChangeFileExt(Sr.Name, '')) - FilterLength));
          if VerIndex > MaxVerIndex then
          begin
            MaxVerIndex := VerIndex;
            NewEstFile := Path + '\' + FileName + IntToStr(MaxVerIndex) + '.exe';
          end;
        end;
      end;
    until (FindNext(Sr) <> 0);
  end;
  NewFileNamePath := NewEstFile;
end;

end.

