object XlsFileRename: TXlsFileRename
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Xls'#22788#29702
  ClientHeight = 431
  ClientWidth = 761
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = -86
    Top = 333
    Width = 48
    Height = 13
    Caption = #20462#25913#21442#25968
  end
  object lv1: TListView
    Left = 0
    Top = 0
    Width = 744
    Height = 193
    Checkboxes = True
    Columns = <
      item
        Caption = 'Name'
        Width = 200
      end
      item
        Alignment = taCenter
        Caption = 'PPID'
        Width = 200
      end
      item
        Alignment = taCenter
        Caption = 'Lot'
        Width = 150
      end
      item
        Alignment = taCenter
        Caption = 'ID'
        Width = 80
      end
      item
        Alignment = taCenter
        Caption = 'Commit'
        Width = 80
      end>
    GridLines = True
    MultiSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object grp1: TGroupBox
    Left = 0
    Top = 199
    Width = 369
    Height = 177
    Caption = 'ACCO'
    TabOrder = 1
    object cbb1: TComboBox
      Left = 0
      Top = 14
      Width = 369
      Height = 21
      TabOrder = 0
      Text = #35831#36873#25321'ACCO-PPID'
      OnSelect = cbb1Select
    end
    object cbb2: TComboBox
      Left = 0
      Top = 41
      Width = 369
      Height = 21
      TabOrder = 1
      Text = #35831#36873#25321'ACCO-LotID'
      OnSelect = cbb2Select
    end
    object edtACCOLotID: TEdit
      Left = 0
      Top = 103
      Width = 369
      Height = 29
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnChange = edtACCOLotIDChange
    end
    object edtAccoPPID: TEdit
      Left = 0
      Top = 68
      Width = 369
      Height = 29
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnChange = edtAccoPPIDChange
    end
    object edtAdjPPID: TEdit
      Left = 0
      Top = 138
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object edtAdjLotID: TEdit
      Left = 127
      Top = 138
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
  end
  object grp2: TGroupBox
    Left = 375
    Top = 199
    Width = 369
    Height = 177
    Caption = #38750'ACCO'
    TabOrder = 2
    object cbb3: TComboBox
      Left = 0
      Top = 14
      Width = 369
      Height = 21
      TabOrder = 0
      Text = #35831#36873#25321#38750'ACCO-PPID'
      OnSelect = cbb3Select
    end
    object cbb4: TComboBox
      Left = 0
      Top = 41
      Width = 369
      Height = 21
      TabOrder = 1
      Text = #35831#36873#25321#38750'ACCO-LotID'
      OnSelect = cbb4Select
    end
    object edtNoACCOlotID: TEdit
      Left = 0
      Top = 103
      Width = 369
      Height = 29
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtNoACCOPPID: TEdit
      Left = 0
      Top = 68
      Width = 369
      Height = 29
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object btnYes: TButton
    Left = 310
    Top = 382
    Width = 115
    Height = 41
    Caption = #19968#38190#26356#25913
    TabOrder = 3
    OnClick = btnYesClick
  end
  object Conn1: TFDConnection
    Params.Strings = (
      'Database=d:\1.xls'
      'DataSource=Excel Files'
      'DriverID=ODBC')
    LoginPrompt = False
    Left = 424
    Top = 64
  end
  object Qry1: TFDQuery
    Connection = Conn1
    Left = 560
    Top = 72
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 496
    Top = 72
  end
  object fdphysdbcdrvrlnk1: TFDPhysODBCDriverLink
    Left = 296
    Top = 64
  end
  object mm1: TMainMenu
    Left = 616
    Top = 72
    object N1: TMenuItem
      Caption = #21152#36733#25991#20214
      OnClick = N1Click
    end
  end
  object dlgOpen1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 160
    Top = 72
  end
end
