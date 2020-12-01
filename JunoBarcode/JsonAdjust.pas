unit JsonAdjust;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.JSON;

type
  BarcodeJs = record
    PPID: string;
    LotID: string;
    WaferNumber: string;
    UserID: string;
    EqID: string;
    ProberID: string;
    TesterID: string;
    CardName: string;
  end;

  UpdateJs = record
    Ver: string;
    UpdatePath: string;
    JunoOldPath: string;
  end;

function JsonAdj(JSBarcodeStr: string; out JsBack: BarcodeJs): Boolean;

function UpdateJsCreate: TJSONObject;

function UpdateJsRead(UpJs: string; out JsBack: UpdateJs): Boolean;

implementation

uses
  Global;

function UpdateJsRead(UpJs: string; out JsBack: UpdateJs): Boolean;
var
  JsObj: TJSONObject;
begin
  Result := False;
  if Length(UpJs) = 0 then
    Exit;
  //UpJs := UpperCase(UpJs);
  JsObj := TJSONObject.ParseJSONValue(UpJs) as TJSONObject;
  if JsObj = nil then
  begin
    Exit;
  end;
  if JsObj.Count > 0 then
  begin
    JsBack.Ver := JsObj.Values['VER'].Value;
    JsBack.UpdatePath := JsObj.Values['UPDATEPATH'].Value;
    JsBack.JunoOldPath := JsObj.Values['JUNOOLDPATH'].Value;
    Result := True;
  end;
end;

function UpdateJsCreate: TJSONObject;
var
  UpJs: UpdateJs;
  JsObj: TJSONObject;
begin
  Result := nil;
  JsObj := TJSONObject.Create;
  JsObj.AddPair('VER', JunoVersion);
  JsObj.AddPair('UPDATEPATH', UpdatePath);
  JsObj.AddPair('JUNOOLDPATH', JunoOld);
  Result := JsObj;
end;

function JsonAdj(JSBarcodeStr: string; out JSBack: BarcodeJs): Boolean;
var
  JsonObject: TJSONObject;
  I: Integer;
  Temp: BarcodeJs;
  TempArr: TArray<string>;
begin
  Result := False;
  if Length(JSBarcodeStr) > 0 then
  begin
    JsonObject := nil;
    JSBarcodeStr := UpperCase(JSBarcodeStr);
    JsonObject := TJSONObject.ParseJSONValue(JSBarcodeStr) as TJSONObject;
    if JsonObject = nil then
    begin
      Exit;
    end;
    if JsonObject.Count > 0 then
    begin
      Temp.PPID := JsonObject.Values['PPID'].Value;
      Temp.LotID := JsonObject.Values['LOTID'].Value;
      Temp.WaferNumber := JsonObject.Values['WAFERIDS'].Value;
      Temp.UserID := JsonObject.Values['USER'].Value;
      Temp.EqID := JsonObject.Values['EQPID'].Value;
      TempArr := Temp.EqID.Split([';']);
      Temp.ProberID := TempArr[0];
      Temp.TesterID := TempArr[1];
      JSBack := Temp;
      Result := True;
    end;
  end;

end;

end.

