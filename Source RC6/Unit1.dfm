object Form1: TForm1
  Left = 460
  Top = 163
  Width = 863
  Height = 722
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Urlaubsplanung create by 2svh v1.0.5 RC6'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LA_freitage: TLabel
    Left = 648
    Top = 312
    Width = 93
    Height = 19
    Caption = 'Freie Tage:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Auswahl: TPanel
    Left = 648
    Top = 96
    Width = 185
    Height = 177
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object RB_Urlaub: TRadioButton
      Left = 8
      Top = 32
      Width = 153
      Height = 25
      Caption = 'Urlaub'
      TabOrder = 0
    end
    object RB_Fortbildung: TRadioButton
      Left = 8
      Top = 8
      Width = 161
      Height = 25
      Caption = 'Fortbildung'
      TabOrder = 1
    end
    object RB_Pruefung: TRadioButton
      Left = 8
      Top = 56
      Width = 161
      Height = 25
      Caption = 'Pr'#252'fungskommision'
      TabOrder = 2
    end
    object RB_Lehrplan: TRadioButton
      Left = 8
      Top = 80
      Width = 161
      Height = 25
      Caption = 'Lehrplankommision'
      TabOrder = 3
    end
    object RB_Stundenplanbau: TRadioButton
      Left = 8
      Top = 104
      Width = 161
      Height = 25
      Caption = 'Stundenplanbau'
      TabOrder = 4
    end
    object RB_nichts: TRadioButton
      Left = 8
      Top = 152
      Width = 153
      Height = 17
      Caption = 'Nichts/L'#246'schen'
      Checked = True
      TabOrder = 5
      TabStop = True
    end
    object RB_einsatz: TRadioButton
      Left = 8
      Top = 128
      Width = 113
      Height = 17
      Caption = 'Einsatz'
      TabOrder = 6
    end
  end
  object Button2: TButton
    Left = 648
    Top = 344
    Width = 185
    Height = 25
    Caption = 'Antrag erstellen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Ferien: TPanel
    Left = 8
    Top = 8
    Width = 633
    Height = 641
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label_Herbst: TLabel
      Left = 8
      Top = 480
      Width = 119
      Height = 23
      Caption = 'Herbstferien'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label_Winter: TLabel
      Left = 8
      Top = 8
      Width = 120
      Height = 23
      Caption = 'Winterferien'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label_Weihnachten: TLabel
      Left = 262
      Top = 480
      Width = 167
      Height = 23
      Caption = 'Weihnachtsferien'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label_Ostern: TLabel
      Left = 384
      Top = 8
      Width = 107
      Height = 23
      Caption = 'Osterferien'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label_sommer: TLabel
      Left = 8
      Top = 168
      Width = 79
      Height = 23
      Caption = 'Sommer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 384
      Top = 168
      Width = 63
      Height = 23
      Caption = 'Zusatz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SG_hef_D1: TStringGrid
      Left = 8
      Top = 504
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 0
    end
    object SG_hef_D2: TStringGrid
      Left = 130
      Top = 504
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 1
    end
    object SG_hef_B1: TStringGrid
      Left = 96
      Top = 504
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 2
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_hef_B1MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_hef_B2: TStringGrid
      Left = 218
      Top = 504
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 3
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_hef_B2MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_WEf_D1: TStringGrid
      Left = 262
      Top = 504
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 4
    end
    object SG_WEF_D2: TStringGrid
      Left = 384
      Top = 504
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 5
    end
    object SG_WEF_B1: TStringGrid
      Left = 350
      Top = 504
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 6
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_WEF_B1MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_WEF_B2: TStringGrid
      Left = 472
      Top = 504
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 7
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_WEF_B2MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_WIF_D2: TStringGrid
      Left = 130
      Top = 32
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 10
    end
    object SG_WIF_B2: TStringGrid
      Left = 218
      Top = 32
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 11
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_WiF_B2MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_OSF_D1: TStringGrid
      Left = 384
      Top = 32
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 12
    end
    object SG_OSF_D2: TStringGrid
      Left = 506
      Top = 32
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 13
    end
    object SG_OSF_B1: TStringGrid
      Left = 472
      Top = 32
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 14
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_OSF_B1MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_OSF_B2: TStringGrid
      Left = 594
      Top = 32
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 15
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_OSF_B2MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_SOF_D1: TStringGrid
      Left = 8
      Top = 192
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 16
    end
    object SG_SOF_D2: TStringGrid
      Left = 130
      Top = 192
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 17
    end
    object SG_SOF_D3: TStringGrid
      Left = 252
      Top = 192
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 18
    end
    object SG_SOF_D4: TStringGrid
      Left = 8
      Top = 342
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 19
    end
    object SG_SOF_D5: TStringGrid
      Left = 130
      Top = 342
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 20
    end
    object SG_SOF_D6: TStringGrid
      Left = 252
      Top = 342
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 21
    end
    object SG_SOF_B1: TStringGrid
      Left = 96
      Top = 192
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 22
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_SOF_B1MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_SOF_B2: TStringGrid
      Left = 218
      Top = 192
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 23
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_SOF_B2MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_SOF_B3: TStringGrid
      Left = 340
      Top = 192
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 24
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_SOF_B3MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_SOF_B4: TStringGrid
      Left = 96
      Top = 342
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 25
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_SOF_B4MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_SOF_B5: TStringGrid
      Left = 218
      Top = 342
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 26
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_SOF_B5MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_SOF_B6: TStringGrid
      Left = 340
      Top = 342
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 27
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_SOF_B6MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_ZUF_D: TStringGrid
      Left = 384
      Top = 192
      Width = 214
      Height = 279
      ColCount = 2
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 12
      FixedRows = 11
      ScrollBars = ssNone
      TabOrder = 28
      ColWidths = (
        119
        91)
    end
    object SG_ZUF_B: TStringGrid
      Left = 594
      Top = 192
      Width = 33
      Height = 279
      ColCount = 1
      FixedCols = 0
      RowCount = 10
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 29
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_ZUF_BMouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_WEF_D3: TStringGrid
      Left = 506
      Top = 504
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 30
    end
    object SG_WEF_B3: TStringGrid
      Left = 594
      Top = 504
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 31
      Visible = False
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_WEF_B3MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
    object SG_WIF_D1: TStringGrid
      Left = 8
      Top = 32
      Width = 95
      Height = 129
      ColCount = 1
      DefaultColWidth = 90
      FixedCols = 0
      RowCount = 6
      FixedRows = 5
      ScrollBars = ssNone
      TabOrder = 8
    end
    object SG_WIF_B1: TStringGrid
      Left = 96
      Top = 32
      Width = 33
      Height = 129
      ColCount = 1
      FixedCols = 0
      FixedRows = 0
      ScrollBars = ssNone
      TabOrder = 9
      OnMouseDown = SG_hef_B1MouseDown
      OnMouseMove = SG_WIF_B1MouseMove
      OnMouseUp = SG_hef_B1MouseUp
    end
  end
  object Panel1: TPanel
    Left = 648
    Top = 8
    Width = 185
    Height = 82
    TabOrder = 4
    object Label_name: TLabel
      Left = 9
      Top = 6
      Width = 47
      Height = 19
      Caption = 'Name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label_vorname: TLabel
      Left = 9
      Top = 32
      Width = 70
      Height = 19
      Caption = 'Vorname:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label_geb: TLabel
      Left = 9
      Top = 56
      Width = 83
      Height = 19
      Caption = 'Geburtstag:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 648
    Top = 280
    Width = 49
    Height = 20
    TabOrder = 5
    object Label2: TLabel
      Left = 6
      Top = 0
      Width = 35
      Height = 19
      Caption = 'Jahr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object CB_Jahreswahl: TComboBox
    Left = 696
    Top = 280
    Width = 137
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    OnChange = CB_JahreswahlChange
  end
  object RG_bearbeiten: TRadioGroup
    Left = 640
    Top = 384
    Width = 185
    Height = 65
    Caption = 'Jahr Bearbeitbar'
    Items.Strings = (
      'Bearbeitbar'
      'Gesperrt')
    TabOrder = 6
    OnClick = RG_bearbeitenClick
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 40
    object Datei1: TMenuItem
      Caption = 'Datei'
      object Drucken1: TMenuItem
        Caption = 'Drucken'
        OnClick = Drucken1Click
      end
      object Speichern_click: TMenuItem
        Caption = 'Speichern'
        OnClick = Speichern_clickClick
      end
      object Beenden2: TMenuItem
        Caption = 'Beenden'
        OnClick = Beenden2Click
      end
    end
    object Bearbeiten: TMenuItem
      Caption = 'Bearbeiten'
      object NeuesJahranlegen1: TMenuItem
        Caption = 'Neues Jahr anlegen'
        OnClick = NeuesJahranlegen1Click
      end
      object NeuenLehreranlegen1: TMenuItem
        Caption = 'Neuen Lehrer anlegen'
        OnClick = NeuenLehreranlegen1Click
      end
      object Lehrer_delete: TMenuItem
        Caption = 'Lehrer Bearbeiten/L'#246'schen'
        OnClick = Lehrer_deleteClick
      end
      object Jahr_delete: TMenuItem
        Caption = 'Jahr L'#246'schen'
        OnClick = Jahr_deleteClick
      end
      object Urlaubstagendern1: TMenuItem
        Caption = 'Urlaubstage '#228'ndern'
        OnClick = Urlaubstagendern1Click
      end
      object Abgabedatumndern1: TMenuItem
        Caption = 'Abgabedatum '#228'ndern'
        OnClick = Abgabedatumndern1Click
      end
    end
    object Benutzer1: TMenuItem
      Caption = 'Benutzer'
      object Passwort: TMenuItem
        Caption = 'Passwort '#228'ndern'
        OnClick = PasswortClick
      end
    end
    object Hilfe1: TMenuItem
      Caption = 'Hilfe'
      object Anleitung: TMenuItem
        Caption = 'Anleitung'
      end
    end
    object Ansicht1: TMenuItem
      Caption = 'Ansicht'
      object Einsatzplan: TMenuItem
        Caption = 'Einsatzplan'
        OnClick = EinsatzplanClick
      end
      object Lehrerbersicht1: TMenuItem
        Caption = 'Lehrer'#252'bersicht'
        OnClick = Lehrerbersicht1Click
      end
      object FehlendeAntrge1: TMenuItem
        Caption = 'Fehlende Antr'#228'ge'
        OnClick = FehlendeAntrge1Click
      end
    end
  end
end
