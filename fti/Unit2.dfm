object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #36335#24452#28155#21152
  ClientHeight = 90
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 13
    Caption = 'FTI'#36335#24452
  end
  object lbl2: TLabel
    Left = 8
    Top = 38
    Width = 47
    Height = 13
    Caption = 'PPID'#36335#24452
  end
  object edtFTI: TEdit
    Left = 64
    Top = 8
    Width = 361
    Height = 21
    TabOrder = 0
  end
  object edtPPID: TEdit
    Left = 64
    Top = 35
    Width = 361
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 431
    Top = 8
    Width = 26
    Height = 21
    Caption = '+'
    TabOrder = 2
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 431
    Top = 35
    Width = 26
    Height = 21
    Caption = '+'
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 382
    Top = 62
    Width = 75
    Height = 25
    Caption = #20445#23384#36335#24452
    TabOrder = 4
    OnClick = btn3Click
  end
end
