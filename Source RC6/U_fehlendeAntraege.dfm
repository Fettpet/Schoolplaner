object Form11: TForm11
  Left = 516
  Top = 473
  Width = 453
  Height = 567
  Caption = 'Fehlende Antr'#228'ge'
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
  object SG_Uebersicht: TStringGrid
    Left = 8
    Top = 32
    Width = 421
    Height = 489
    ColCount = 3
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      137
      152
      125)
  end
  object CB_Jahreswahl: TComboBox
    Left = 88
    Top = 8
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = CB_JahreswahlChange
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 81
    Height = 20
    TabOrder = 2
    object Label2: TLabel
      Left = 3
      Top = 2
      Width = 73
      Height = 16
      Alignment = taCenter
      Caption = 'Jahreswahl'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
