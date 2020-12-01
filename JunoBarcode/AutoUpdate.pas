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
  //更新程序,从指定路径下载相同文件名
  //if MessageDlg('确定更新程序？', TMsgDlgType.mtWarning, [mbYes, mbNo], 0) = mrNo then
  Abort;
  NewFileCheck('JunoBarcode', UpdatePath, S);
  if S = '' then
  begin
    ShowMessage('暂时无最新版本，请联系工程师确认！');
    Abort;
  end;
  //拷贝新文件至当前目录，生成新文件
  PrgPath := ExtractFileDir(ParamStr(0));
  Path := ExtractFileDir(ParamStr(0)) + NewVerPath;
  if not DirectoryExists(Path) then
  begin
    CreateDir(ExtractFileDir(ParamStr(0)) + NewVerPath);
    if MoveFile(PWideChar(S), PWideChar(PrgPath + '\' + ExtractFileName(S))) then
    begin
      ShowMessage('新程序拷贝成功！本程序将退出，立即启动新程序！');
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
      ShowMessage('新程序拷贝成功！本程序将自动退出，并立即自动启动新程序！');
    end;
    AssignFile(Txt, ExtractFileDir(ParamStr(0)) + NewVerPath + JunoConfig);
    Rewrite(Txt);
    Writeln(Txt, ParamStr(0));
    Flush(Txt);
    CloseFile(Txt);
  end;
  //打开新程序，退出本程序。
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
  //获得老的文件名
  NewFileNamePath := '';
  OldFileName := ChangeFileExt(ExtractFileName(Application.ExeName), '');
  FilterLength := Length(FileName);
  //比较自身文件名与文件名过滤词的长度
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

