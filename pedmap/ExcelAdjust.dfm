object ExcelAdj: TExcelAdj
  Left = 0
  Top = 0
  Caption = 'Excel'
  ClientHeight = 428
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmo1: TMemo
    Left = 8
    Top = 168
    Width = 465
    Height = 145
    Lines.Strings = (
      'mmo1')
    TabOrder = 0
  end
  object btn1: TButton
    Left = 642
    Top = 164
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
  object lv1: TListView
    Left = 8
    Top = 8
    Width = 709
    Height = 150
    Columns = <>
    TabOrder = 2
  end
end
