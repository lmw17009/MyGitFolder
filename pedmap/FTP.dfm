object Form11: TForm11
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'WATFTP'
  ClientHeight = 385
  ClientWidth = 864
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 88
    Top = 12
    Width = 65
    Height = 13
    Caption = #20934#30830'TestPlan'
  end
  object lbl2: TLabel
    Left = 88
    Top = 50
    Width = 48
    Height = 13
    Caption = #26597#35810#39033#30446
  end
  object btnSearchFile: TButton
    Left = 297
    Top = 8
    Width = 75
    Height = 21
    Caption = #26597#35810#25991#20214
    Enabled = False
    TabOrder = 4
    OnClick = btnSearchFileClick
  end
  object mmo1: TMemo
    Left = 112
    Top = 128
    Width = 744
    Height = 233
    Lines.Strings = (
      'mmo1')
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object edtTstNumber: TEdit
    Left = 170
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtPPID: TEdit
    Left = 170
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnConnect: TButton
    Left = 8
    Top = 8
    Width = 49
    Height = 29
    Caption = #36830#25509
    TabOrder = 0
    OnClick = btnConnectClick
  end
  object stat1: TStatusBar
    Left = 0
    Top = 366
    Width = 864
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 200
      end>
  end
  object btnSearchSub: TButton
    Left = 297
    Top = 43
    Width = 75
    Height = 25
    Caption = #26597#35810#39033#30446
    Enabled = False
    TabOrder = 5
    OnClick = btnSearchSubClick
  end
  object btnDisConn: TButton
    Left = 8
    Top = 43
    Width = 49
    Height = 25
    Caption = #26029#24320
    Enabled = False
    TabOrder = 1
    OnClick = btnDisConnClick
  end
  object rbProd: TRadioButton
    Left = 242
    Top = 73
    Width = 57
    Height = 17
    Caption = 'Prod'
    Checked = True
    TabOrder = 8
    TabStop = True
  end
  object rbEng: TRadioButton
    Left = 170
    Top = 73
    Width = 57
    Height = 17
    Caption = 'Eng'
    TabOrder = 9
  end
  object lv1: TListView
    Left = 0
    Top = 128
    Width = 113
    Height = 232
    Columns = <
      item
        Caption = 'Name'
      end>
    GridLines = True
    TabOrder = 10
    ViewStyle = vsList
  end
  object btn1: TButton
    Left = 297
    Top = 72
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 11
    OnClick = btn1Click
  end
  object grp1: TGroupBox
    Left = 392
    Top = 8
    Width = 313
    Height = 114
    Caption = #27880#37322'TST'#25991#20214
    TabOrder = 12
    object rb1: TRadioButton
      Left = 16
      Top = 19
      Width = 49
      Height = 17
      Caption = 'Prod'
      TabOrder = 0
    end
    object rb2: TRadioButton
      Left = 16
      Top = 42
      Width = 49
      Height = 17
      Caption = 'Eng'
      TabOrder = 1
    end
    object edtNumberCommit: TEdit
      Left = 71
      Top = 17
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object btnLock: TButton
      Left = 117
      Top = 44
      Width = 75
      Height = 25
      Caption = #27880#37322
      TabOrder = 3
    end
    object btnUnlock: TButton
      Left = 198
      Top = 44
      Width = 75
      Height = 25
      Caption = #35299#38145
      TabOrder = 4
    end
    object btnUpload: TButton
      Left = 235
      Top = 86
      Width = 75
      Height = 25
      Caption = #19978#20256#25991#20214
      TabOrder = 5
    end
    object btnSearch: TButton
      Left = 198
      Top = 15
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 6
    end
  end
  object idftp2: TIdFTP
    IPVersion = Id_IPv4
    ConnectTimeout = 0
    TransferType = ftBinary
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 144
    Top = 128
  end
end
