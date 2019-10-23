object FormCadProd: TFormCadProd
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Cadastro de produtos'
  ClientHeight = 347
  ClientWidth = 597
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
    Top = 25
    Width = 597
    Height = 322
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 581
    ExplicitHeight = 283
    DesignSize = (
      597
      322)
    object Label2: TLabel
      Left = 42
      Top = 39
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object LabelCustoCompra: TLabel
      Left = 7
      Top = 83
      Width = 85
      Height = 13
      Caption = 'Custo de compra:'
    end
    object Label3: TLabel
      Left = 49
      Top = 10
      Width = 42
      Height = 13
      Caption = 'Produto:'
    end
    object BtnGravar: TBitBtn
      Left = 493
      Top = 34
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = BtnGravarClick
      ExplicitLeft = 477
    end
    object EditNome: TEdit
      Left = 151
      Top = 7
      Width = 320
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitWidth = 304
    end
    object EditCusto: TEdit
      Left = 99
      Top = 81
      Width = 123
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitWidth = 107
    end
    object MemoDesc: TMemo
      Left = 99
      Top = 34
      Width = 372
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      ImeMode = imHanguel
      TabOrder = 3
      ExplicitWidth = 356
    end
    object EditID: TEdit
      Left = 99
      Top = 7
      Width = 47
      Height = 21
      TabOrder = 4
      OnExit = EditIDExit
    end
    object BtnExcluir: TBitBtn
      Left = 493
      Top = 61
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Excluir'
      TabOrder = 5
      ExplicitLeft = 477
    end
    object BtnCancelar: TBitBtn
      Left = 493
      Top = 88
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 6
      ExplicitLeft = 477
    end
    object BtnPesquisar: TBitBtn
      Left = 493
      Top = 7
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      TabOrder = 7
      ExplicitLeft = 477
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 597
    Height = 25
    Align = alTop
    Caption = 'Cadastro de produtos'
    TabOrder = 1
    ExplicitWidth = 581
    DesignSize = (
      597
      25)
    object btnClose: TSpeedButton
      AlignWithMargins = True
      Left = 574
      Top = 1
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000002525
        25473A3A3A700000000000000000000000000000000000000000000000000000
        00000000000000000000000000003D3D3D752525254700000000252525477F7F
        7FF6848484FF3C3C3C7300000000000000000000000000000000000000000000
        000000000000000000003E3E3E77848484FF808080F7252525474040407B8484
        84FF848484FF848484FF3C3C3C73000000000000000000000000000000000000
        0000000000003E3E3E77848484FF848484FF848484FF3F3F3F7A000000004242
        427F848484FF848484FF848484FF3C3C3C730000000000000000000000000000
        00003E3E3E77848484FF848484FF848484FF4141417E00000000000000000000
        00004242427F848484FF848484FF848484FF3C3C3C7300000000000000003E3E
        3E77848484FF848484FF848484FF4141417E0000000000000000000000000000
        0000000000004242427F848484FF848484FF848484FF3C3C3C733E3E3E778484
        84FF848484FF848484FF4141417E000000000000000000000000000000000000
        000000000000000000004242427F848484FF848484FF848484FF848484FF8484
        84FF848484FF4141417E00000000000000000000000000000000000000000000
        00000000000000000000000000004242427F848484FF848484FF848484FF8484
        84FF4141417E0000000000000000000000000000000000000000000000000000
        00000000000000000000000000003E3E3E77848484FF848484FF848484FF8484
        84FF3C3C3C740000000000000000000000000000000000000000000000000000
        000000000000000000003E3E3E77848484FF848484FF848484FF848484FF8484
        84FF848484FF3C3C3C7400000000000000000000000000000000000000000000
        0000000000003E3E3E77848484FF848484FF848484FF4141417E4242427F8484
        84FF848484FF848484FF3C3C3C74000000000000000000000000000000000000
        00003E3E3E77848484FF848484FF848484FF4141417D00000000000000004242
        427F848484FF848484FF848484FF3C3C3C740000000000000000000000003E3E
        3E77848484FF848484FF848484FF4141417D0000000000000000000000000000
        00004242427F848484FF848484FF848484FF3C3C3C74000000003D3D3D758484
        84FF848484FF848484FF4141417D000000000000000000000000000000000000
        0000000000004242427F848484FF848484FF848484FF3B3B3B722828284D8181
        81F9848484FF4141417D00000000000000000000000000000000000000000000
        000000000000000000004242427F848484FF818181F92828284E000000002828
        284D3F3F3F7A0000000000000000000000000000000000000000000000000000
        00000000000000000000000000004040407B2828284D00000000}
      OnClick = btnCloseClick
      ExplicitLeft = 555
    end
  end
  object query: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 512
    Top = 360
  end
end
