object Form10: TForm10
  Left = 0
  Top = 0
  Caption = 'CP-Spec&Limit'
  ClientHeight = 432
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmo1: TMemo
    Left = 616
    Top = 272
    Width = 105
    Height = 33
    Lines.Strings = (
      'mmo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btn1: TButton
    Left = 135
    Top = 199
    Width = 75
    Height = 25
    Caption = #19968#38190#25913#21517
    TabOrder = 1
    OnClick = btn1Click
  end
  object mmo2: TMemo
    Left = 304
    Top = 216
    Width = 265
    Height = 185
    Lines.Strings = (
      'mmo2')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object edtPPIDName: TEdit
    Left = 8
    Top = 199
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object mmo3: TMemo
    Left = 8
    Top = 240
    Width = 89
    Height = 81
    Lines.Strings = (
      'mmo3')
    TabOrder = 4
  end
  object lv1: TListView
    Left = 8
    Top = 0
    Width = 786
    Height = 185
    Columns = <
      item
        Caption = 'FileName'
        Width = 200
      end
      item
        Alignment = taCenter
        Caption = 'PPID'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'LotID'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'ID'
        Width = 30
      end
      item
        Alignment = taCenter
        Caption = 'Tester'
        Width = 100
      end>
    GridLines = True
    TabOrder = 5
    ViewStyle = vsReport
  end
  object dlgOpen1: TOpenDialog
    Left = 152
    Top = 40
  end
  object Conn1: TFDConnection
    Params.Strings = (
      'Database=Excel files'
      'DataSource=Excel Files'
      'DriverID=ODBC')
    Left = 464
    Top = 88
  end
  object Qry1: TFDQuery
    Connection = Conn1
    Left = 504
    Top = 88
  end
  object fdphysdbcdrvrlnk1: TFDPhysODBCDriverLink
    Left = 464
    Top = 136
  end
  object mm1: TMainMenu
    Left = 128
    Top = 240
    object N1: TMenuItem
      Caption = #35774#32622
      OnClick = N1Click
    end
  end
end
