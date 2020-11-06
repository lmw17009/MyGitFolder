object XlsFileRename: TXlsFileRename
  Left = 0
  Top = 0
  Caption = 'Xls'#22788#29702
  ClientHeight = 401
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 162
    Top = 210
    Width = 48
    Height = 13
    Caption = #36873#25321#25968#25454
  end
  object lbl2: TLabel
    Left = 162
    Top = 237
    Width = 48
    Height = 13
    Caption = #26356#25913#25968#25454
  end
  object lv1: TListView
    Left = 8
    Top = 8
    Width = 709
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
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'ID'
      end
      item
        Alignment = taCenter
        Caption = 'Commit'
        Width = 100
      end>
    GridLines = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object cbb1: TComboBox
    Left = 216
    Top = 207
    Width = 193
    Height = 21
    TabOrder = 1
    Text = #35831#36873#25321'PPID'
    OnSelect = cbb1Select
  end
  object cbb2: TComboBox
    Left = 408
    Top = 207
    Width = 105
    Height = 21
    TabOrder = 2
    Text = #35831#36873#25321'LotID'
    OnSelect = cbb2Select
  end
  object edt1: TEdit
    Left = 216
    Top = 234
    Width = 193
    Height = 21
    TabOrder = 3
  end
  object edt2: TEdit
    Left = 415
    Top = 234
    Width = 98
    Height = 21
    TabOrder = 4
  end
  object Conn1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\pq03947\Desktop\3.xls'
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
end
