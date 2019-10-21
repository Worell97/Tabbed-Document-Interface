object FMenu: TFMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 443
  ClientWidth = 1051
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 443
    Align = alLeft
    TabOrder = 0
    object Cadastro1: TBitBtn
      Left = 8
      Top = 30
      Width = 137
      Height = 49
      Caption = 'Tela 1'
      TabOrder = 0
      OnClick = Cadastro1Click
    end
    object Vendas1: TBitBtn
      Left = 8
      Top = 85
      Width = 137
      Height = 49
      Caption = 'Tela2'
      TabOrder = 1
      OnClick = Vendas1Click
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 140
      Width = 137
      Height = 49
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = Vendas1Click
    end
    object chk1: TCheckBox
      Left = 8
      Top = 200
      Width = 97
      Height = 17
      Caption = 'Multi-Instancia'
      TabOrder = 3
    end
  end
  object con1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      
        'Database=C:\Users\oscar.filho\OneDrive\ProjetoOscar\Parte 1\test' +
        'e.db')
    Connected = True
    LoginPrompt = False
    Left = 4
    Top = 217
  end
end
