object Form10: TForm10
  Left = 482
  Top = 332
  Width = 333
  Height = 69
  Caption = 'Abgabedatum'
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
  object CB_Tag: TComboBox
    Left = 8
    Top = 8
    Width = 89
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ItemIndex = 0
    ParentFont = False
    TabOrder = 0
    Text = '1'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20'
      '21'
      '22'
      '23'
      '24'
      '25'
      '26'
      '27'
      '28'
      '29'
      '30'
      '31')
  end
  object CB_Monat: TComboBox
    Left = 104
    Top = 8
    Width = 97
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ItemIndex = 0
    ParentFont = False
    TabOrder = 1
    Text = 'Januar'
    Items.Strings = (
      'Januar'
      'Februar'
      'M'#228'rz'
      'April'
      'Mai'
      'Juni'
      'Juli'
      'August'
      'September'
      'Oktober'
      'November'
      'Dezember')
  end
  object Button1: TButton
    Left = 208
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Speichern'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
end
