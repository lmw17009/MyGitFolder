object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'JunoBarcodeAuto'
  ClientHeight = 370
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = mm1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl3: TLabel
    Left = 14
    Top = 86
    Width = 24
    Height = 13
    Caption = #29255#21495
  end
  object lbl4: TLabel
    Left = 14
    Top = 11
    Width = 24
    Height = 13
    Caption = #25195#25551
  end
  object lblInterval: TLabel
    Left = 672
    Top = 3
    Width = 33
    Height = 129
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -107
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblLoadEnd: TLabel
    Left = 56
    Top = 151
    Width = 3
    Height = 13
  end
  object lblRepeatFile: TLabel
    Left = 62
    Top = 302
    Width = 3
    Height = 13
  end
  object lbl6: TLabel
    Left = 14
    Top = 35
    Width = 24
    Height = 13
    Caption = #38024#21345
  end
  object lbl7: TLabel
    Left = 14
    Top = 59
    Width = 48
    Height = 13
    Caption = #20854#20182#20449#24687
  end
  object lbl8: TLabel
    Left = 14
    Top = 108
    Width = 48
    Height = 13
    Caption = #29255#21495#35299#26512
  end
  object edtPPID: TEdit
    Left = 64
    Top = 56
    Width = 70
    Height = 21
    ImeMode = imClose
    ReadOnly = True
    TabOrder = 2
  end
  object edtLotID: TEdit
    Left = 133
    Top = 56
    Width = 105
    Height = 21
    ImeMode = imClose
    ReadOnly = True
    TabOrder = 3
  end
  object edtWaferNumber: TEdit
    Left = 64
    Top = 80
    Width = 345
    Height = 21
    ImeMode = imClose
    ReadOnly = True
    TabOrder = 4
  end
  object edtBarcode: TEdit
    Left = 64
    Top = 8
    Width = 345
    Height = 21
    ImeMode = imClose
    TabOrder = 0
    OnChange = edtBarcodeChange
    OnClick = edtBarcodeClick
    OnDblClick = edtBarcodeDblClick
  end
  object mmo1: TMemo
    Left = 8
    Top = 255
    Width = 394
    Height = 107
    Lines.Strings = (
      'mmo1')
    PopupMenu = pm1
    ScrollBars = ssVertical
    TabOrder = 5
    OnChange = mmo1Change
  end
  object edtWaferID: TEdit
    Left = 64
    Top = 104
    Width = 345
    Height = 21
    ImeMode = imClose
    ReadOnly = True
    TabOrder = 6
  end
  object edtOperator: TEdit
    Left = 349
    Top = 56
    Width = 60
    Height = 21
    ImeMode = imClose
    ReadOnly = True
    TabOrder = 7
  end
  object chk1: TCheckBox
    Left = 88
    Top = 137
    Width = 28
    Height = 17
    Caption = '1'
    TabOrder = 8
    OnClick = chk1Click
  end
  object chk2: TCheckBox
    Left = 118
    Top = 137
    Width = 28
    Height = 17
    Caption = '2'
    TabOrder = 9
    OnClick = chk2Click
  end
  object chk3: TCheckBox
    Left = 148
    Top = 137
    Width = 28
    Height = 17
    Caption = '3'
    TabOrder = 10
    OnClick = chk3Click
  end
  object chk4: TCheckBox
    Left = 179
    Top = 137
    Width = 28
    Height = 17
    Caption = '4'
    TabOrder = 11
    OnClick = chk4Click
  end
  object chk5: TCheckBox
    Left = 211
    Top = 137
    Width = 28
    Height = 17
    Caption = '5'
    TabOrder = 12
    OnClick = chk5Click
  end
  object chk6: TCheckBox
    Left = 88
    Top = 161
    Width = 28
    Height = 17
    Caption = '6'
    TabOrder = 13
    OnClick = chk6Click
  end
  object chk7: TCheckBox
    Left = 118
    Top = 161
    Width = 28
    Height = 17
    Caption = '7'
    TabOrder = 14
    OnClick = chk7Click
  end
  object chk8: TCheckBox
    Left = 148
    Top = 161
    Width = 28
    Height = 17
    Caption = '8'
    TabOrder = 15
    OnClick = chk8Click
  end
  object chk9: TCheckBox
    Left = 179
    Top = 161
    Width = 28
    Height = 17
    Caption = '9'
    TabOrder = 16
    OnClick = chk9Click
  end
  object chk10: TCheckBox
    Left = 211
    Top = 161
    Width = 28
    Height = 17
    Caption = '10'
    TabOrder = 17
    OnClick = chk10Click
  end
  object chk11: TCheckBox
    Left = 88
    Top = 184
    Width = 28
    Height = 17
    Caption = '11'
    TabOrder = 18
    OnClick = chk11Click
  end
  object chk12: TCheckBox
    Left = 118
    Top = 184
    Width = 28
    Height = 17
    Caption = '12'
    TabOrder = 19
    OnClick = chk12Click
  end
  object chk13: TCheckBox
    Left = 148
    Top = 184
    Width = 28
    Height = 17
    Caption = '13'
    TabOrder = 20
    OnClick = chk13Click
  end
  object chk14: TCheckBox
    Left = 179
    Top = 184
    Width = 28
    Height = 17
    Caption = '14'
    TabOrder = 21
    OnClick = chk14Click
  end
  object chk15: TCheckBox
    Left = 211
    Top = 184
    Width = 28
    Height = 17
    Caption = '15'
    TabOrder = 22
    OnClick = chk15Click
  end
  object chk16: TCheckBox
    Left = 88
    Top = 207
    Width = 28
    Height = 17
    Caption = '16'
    TabOrder = 23
    OnClick = chk16Click
  end
  object chk17: TCheckBox
    Left = 118
    Top = 207
    Width = 28
    Height = 17
    Caption = '17'
    TabOrder = 24
    OnClick = chk17Click
  end
  object chk18: TCheckBox
    Left = 148
    Top = 207
    Width = 28
    Height = 17
    Caption = '18'
    TabOrder = 25
    OnClick = chk18Click
  end
  object chk19: TCheckBox
    Left = 179
    Top = 207
    Width = 28
    Height = 17
    Caption = '19'
    TabOrder = 26
    OnClick = chk19Click
  end
  object chk20: TCheckBox
    Left = 211
    Top = 207
    Width = 28
    Height = 17
    Caption = '20'
    TabOrder = 27
    OnClick = chk20Click
  end
  object chk21: TCheckBox
    Left = 88
    Top = 232
    Width = 28
    Height = 17
    Caption = '21'
    TabOrder = 28
    OnClick = chk21Click
  end
  object chk22: TCheckBox
    Left = 118
    Top = 232
    Width = 28
    Height = 17
    Caption = '22'
    TabOrder = 29
    OnClick = chk22Click
  end
  object chk23: TCheckBox
    Left = 148
    Top = 232
    Width = 28
    Height = 17
    Caption = '23'
    TabOrder = 30
    OnClick = chk23Click
  end
  object chk24: TCheckBox
    Left = 179
    Top = 232
    Width = 28
    Height = 17
    Caption = '24'
    TabOrder = 31
    OnClick = chk24Click
  end
  object chk25: TCheckBox
    Left = 211
    Top = 232
    Width = 28
    Height = 17
    Caption = '25'
    TabOrder = 32
    OnClick = chk25Click
  end
  object btn5: TButton
    Left = 333
    Top = 134
    Width = 69
    Height = 30
    Caption = #26032#24314#31243#24207
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 33
    OnClick = btn5Click
  end
  object btn6: TButton
    Left = 334
    Top = 170
    Width = 68
    Height = 30
    Caption = #26032#25968#25454#25991#20214
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 34
    OnClick = btn6Click
  end
  object chk26: TCheckBox
    Left = 15
    Top = 134
    Width = 59
    Height = 17
    Caption = #20840#36873'/'#21542
    TabOrder = 35
    OnClick = chk26Click
  end
  object chkSaveLog: TCheckBox
    Left = 14
    Top = 176
    Width = 71
    Height = 17
    Caption = #20445#23384#26085#24535
    Checked = True
    State = cbChecked
    TabOrder = 36
  end
  object btn10: TButton
    Left = 245
    Top = 134
    Width = 16
    Height = 18
    Caption = 'A'#31449#33258#21160
    Enabled = False
    TabOrder = 37
    Visible = False
    OnClick = btn10Click
  end
  object btn11: TButton
    Left = 245
    Top = 161
    Width = 16
    Height = 18
    Caption = 'B'#31449#33258#21160
    Enabled = False
    TabOrder = 38
    Visible = False
    OnClick = btn11Click
  end
  object edtCardName: TEdit
    Left = 64
    Top = 32
    Width = 345
    Height = 21
    Hint = #35831#25195#25551#38024#21345#20449#24687#65281
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = edtCardNameClick
  end
  object edtProber: TEdit
    Left = 232
    Top = 56
    Width = 60
    Height = 21
    ReadOnly = True
    TabOrder = 39
  end
  object edtTester: TEdit
    Left = 291
    Top = 56
    Width = 60
    Height = 21
    ReadOnly = True
    TabOrder = 40
  end
  object btn2: TButton
    Left = 14
    Top = 224
    Width = 44
    Height = 25
    Caption = #28165#29702
    TabOrder = 41
    OnClick = btn2Click
  end
  object btnF1: TButton
    Left = 296
    Top = 134
    Width = 32
    Height = 30
    Caption = 'F1'
    TabOrder = 42
    OnClick = btnF1Click
  end
  object btnF5: TButton
    Left = 296
    Top = 170
    Width = 32
    Height = 30
    Caption = 'F5'
    TabOrder = 43
    OnClick = btnF5Click
  end
  object btnMap: TButton
    Left = 296
    Top = 206
    Width = 106
    Height = 30
    Caption = 'Map'#35774#23450
    TabOrder = 44
    OnClick = btnMapClick
  end
  object chkLock: TCheckBox
    Left = 15
    Top = 155
    Width = 59
    Height = 17
    Caption = #38145
    TabOrder = 45
    OnClick = chkLockClick
  end
  object tmrDelayRun: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = tmrDelayRunTimer
    Left = 272
    Top = 320
  end
  object tmrRunLoadPG: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmrRunLoadPGTimer
    Left = 88
    Top = 312
  end
  object tmrCreateData: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmrCreateDataTimer
    Left = 144
    Top = 312
  end
  object tmrLoadEnd: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrLoadEndTimer
    Left = 32
    Top = 312
  end
  object tmrInterval: TTimer
    Enabled = False
    OnTimer = tmrIntervalTimer
    Left = 216
    Top = 312
  end
  object pm1: TPopupMenu
    Left = 344
    Top = 296
    object N1: TMenuItem
      Caption = #28165#29702
      OnClick = N1Click
    end
  end
  object tmrCloseRepeatDataFile: TTimer
    Enabled = False
    Interval = 300
    OnTimer = tmrCloseRepeatDataFileTimer
    Left = 280
    Top = 280
  end
  object pm2: TPopupMenu
    Left = 200
    Top = 280
    object N2: TMenuItem
      Caption = #36864#20986
      OnClick = N2Click
    end
  end
  object mm1: TMainMenu
    Left = 272
    Top = 240
    object N3: TMenuItem
      Caption = #26816#26597#26356#26032
      OnClick = N3Click
    end
  end
  object tmrAutoCheckUpdate: TTimer
    Interval = 10000
    OnTimer = tmrAutoCheckUpdateTimer
    Left = 256
    Top = 184
  end
end
