object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FTIBarcode-PED V'
  ClientHeight = 286
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
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
    Left = 7
    Top = 116
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
    Width = 64
    Height = 13
    Caption = #28857#20987#25195#30721'=>'
  end
  object lblProcess: TLabel
    Left = 556
    Top = 31
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lbl6: TLabel
    Left = 510
    Top = 31
    Width = 20
    Height = 13
    Caption = 'FTI:'
  end
  object mmo1: TMemo
    Left = 8
    Top = 135
    Width = 581
    Height = 143
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
    Width = 430
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edtLotID: TEdit
    Left = 74
    Top = 108
    Width = 430
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object edtPPIDPath: TEdit
    Left = 74
    Top = 81
    Width = 430
    Height = 21
    ReadOnly = True
    TabOrder = 2
    OnMouseEnter = edtPPIDPathMouseEnter
  end
  object edtProgramPath: TEdit
    Left = 74
    Top = 3
    Width = 430
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object btn2: TButton
    Left = 510
    Top = 4
    Width = 83
    Height = 21
    Hint = #21152#36733'FTI'#65288'FOCUS'#65289#29983#20135#36719#20214#31243#24207#36335#24452#12290
    Caption = #35774#32622
    TabOrder = 5
    OnClick = btn2Click
    OnMouseEnter = btn2MouseEnter
  end
  object edtEdtBQMSG: TEdit
    Left = 74
    Top = 30
    Width = 430
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 6
    OnChange = edtEdtBQMSGChange
    OnClick = edtEdtBQMSGClick
  end
  object chkHideWork: TCheckBox
    Left = 510
    Top = 118
    Width = 106
    Height = 17
    Hint = #31243#24207#26368#23567#21270#21518#26159#21542#32487#32493#30417#25511#38190#30424#25110#25195#25551#26538#21160#20316#65292#22914#38656#25805#20316#27492#30005#33041#65292#24314#35758#21462#28040#36873#20013#29366#24577#12290
    Caption = #26368#23567#21270#32487#32493#24037#20316
    Checked = True
    Enabled = False
    State = cbChecked
    TabOrder = 7
    Visible = False
    OnMouseEnter = chkHideWorkMouseEnter
  end
  object chkAutoClose: TCheckBox
    Left = 510
    Top = 95
    Width = 124
    Height = 17
    Hint = #25195#25551#26684#24335#27491#30830#21518#65292#22914#26524#25171#21246#27492#36873#39033#65292#21017#33258#21160#20851#38381#24050#32463#23384#22312#30340'FTI'#36719#20214#65292#19981#25171#21246#21017#20351#29992#20851#38381#25353#38062#25110#32773#25195#30721#20851#38381#12290
    Caption = #33258#21160#20851#38381#27979#35797#36719#20214
    Checked = True
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 8
    Visible = False
    OnMouseEnter = chkAutoCloseMouseEnter
  end
  object dlgOpen1: TOpenDialog
    Left = 392
    Top = 32
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 256
    Top = 32
  end
  object pm1: TPopupMenu
    Left = 424
    Top = 160
    object N1: TMenuItem
      Caption = #26174#31034#26085#24535#21306
      Checked = True
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #28165#29702#26085#24535#21306
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #24320#21551#25163#21160#25195#30721
      OnClick = N3Click
    end
  end
end
