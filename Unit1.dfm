object Form1: TForm1
  Left = 342
  Top = 164
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 234
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 687
    Height = 58
    Caption = 
      'Obtenha a '#250'ltima vers'#227'o da classe TDI, bem como da aplica'#231#227'o de ' +
      'exemplo no site oficial do projeto Delphi-TDI.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 175
    Top = 104
    Width = 90
    Height = 20
    Alignment = taRightJustify
    Caption = 'Site oficial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 9
    Top = 136
    Width = 256
    Height = 20
    Alignment = taRightJustify
    Caption = 'Download da vers'#227'o atualizada:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit2: TEdit
    Left = 272
    Top = 134
    Width = 385
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = 'https://github.com/stavarengo/delphi-tdi/tags'
  end
  object Edit1: TEdit
    Left = 272
    Top = 102
    Width = 385
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = 'https://github.com/stavarengo/delphi-tdi'
  end
  object Button1: TButton
    Left = 624
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = Button1Click
  end
end
