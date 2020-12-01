object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'FTIBarcode-PED V'
  ClientHeight = 178
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Menu = mm1
  OldCreateOrder = False
  PopupMenu = pm1
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 7
    Top = 62
    Width = 23
    Height = 13
    Caption = 'PPID'
  end
  object lbl2: TLabel
    Left = 7
    Top = 89
    Width = 47
    Height = 13
    Caption = 'PPID'#36335#24452
  end
  object lbl3: TLabel
    Left = 151
    Top = 62
    Width = 26
    Height = 13
    Caption = 'LotID'
  end
  object lbl4: TLabel
    Left = 8
    Top = 6
    Width = 40
    Height = 13
    Caption = 'FTI'#36335#24452
  end
  object lbl5: TLabel
    Left = 8
    Top = 35
    Width = 36
    Height = 13
    Caption = #25195#30721#21306
  end
  object lblProcess: TLabel
    Left = 326
    Top = 70
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lbl6: TLabel
    Left = 280
    Top = 70
    Width = 20
    Height = 13
    Caption = 'FTI:'
  end
  object mmo1: TMemo
    Left = 8
    Top = 112
    Width = 368
    Height = 65
    Lines.Strings = (
      'mmo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
    OnChange = mmo1Change
  end
  object edtPPID: TEdit
    Left = 74
    Top = 54
    Width = 71
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object edtLotID: TEdit
    Left = 183
    Top = 54
    Width = 91
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object edtPPIDPath: TEdit
    Left = 74
    Top = 81
    Width = 200
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 2
    OnMouseEnter = edtPPIDPathMouseEnter
  end
  object edtProgramPath: TEdit
    Left = 74
    Top = 3
    Width = 200
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object edtEdtBQMSG: TEdit
    Left = 74
    Top = 30
    Width = 200
    Height = 21
    TabOrder = 5
    Visible = False
    OnChange = edtEdtBQMSGChange
    OnClick = edtEdtBQMSGClick
  end
  object chkHideWork: TCheckBox
    Left = 280
    Top = 112
    Width = 83
    Height = 17
    Hint = #31243#24207#26368#23567#21270#21518#26159#21542#32487#32493#30417#25511#38190#30424#25110#25195#25551#26538#21160#20316#65292#22914#38656#25805#20316#27492#30005#33041#65292#24314#35758#21462#28040#36873#20013#29366#24577#12290
    Caption = #26368#23567#21270#24037#20316
    Checked = True
    Enabled = False
    State = cbChecked
    TabOrder = 6
    Visible = False
    OnMouseEnter = chkHideWorkMouseEnter
  end
  object chkAutoClose: TCheckBox
    Left = 280
    Top = 89
    Width = 83
    Height = 17
    Hint = #25195#25551#26684#24335#27491#30830#21518#65292#22914#26524#25171#21246#27492#36873#39033#65292#21017#33258#21160#20851#38381#24050#32463#23384#22312#30340'FTI'#36719#20214#65292#19981#25171#21246#21017#20351#29992#20851#38381#25353#38062#25110#32773#25195#30721#20851#38381#12290
    Caption = #33258#21160#20851#38381
    Checked = True
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 7
    Visible = False
    OnMouseEnter = chkAutoCloseMouseEnter
  end
  object btnLockBarcode: TButton
    Left = 280
    Top = 3
    Width = 96
    Height = 61
    Caption = #28857#25105#28608#27963#25195#30721#26694
    TabOrder = 8
    OnClick = btnLockBarcodeClick
  end
  object dlgOpen1: TOpenDialog
    Left = 64
    Top = 120
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 136
    Top = 120
  end
  object pm1: TPopupMenu
    Left = 104
    Top = 120
    object N2: TMenuItem
      Caption = #28165#29702#26085#24535#21306
      OnClick = N2Click
    end
    object FTI1: TMenuItem
      Caption = #20851#38381'FTI'#36827#31243
      OnClick = FTI1Click
    end
    object N5: TMenuItem
      Caption = #36864#20986#31243#24207
      OnClick = N5Click
    end
  end
  object mm1: TMainMenu
    Left = 176
    Top = 120
    object N4: TMenuItem
      Caption = #36873#39033'(&O)'
      Default = True
      object N7: TMenuItem
        Caption = #35774#32622'(&S)'
        OnClick = N7Click
      end
      object N6: TMenuItem
        Caption = #36864#20986'(&E)'
        OnClick = N6Click
      end
    end
  end
end
