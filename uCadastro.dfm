object FormCadProd: TFormCadProd
  Left = 0
  Top = 0
  Caption = 'Cadastro de produtos'
  ClientHeight = 205
  ClientWidth = 521
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
    Width = 521
    Height = 205
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 595
    ExplicitHeight = 315
    DesignSize = (
      521
      205)
    object btnClose: TSpeedButton
      Left = 498
      Top = -1
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000030000
        000B000000120000001300000013000000140000001400000014000000140000
        0014000000140000001500000015000000140000000D000000030000000B1C11
        6CC3261796FF271696FF261695FF261594FF251594FF251594FF241394FF2412
        93FF241292FF231292FF231192FF231191FF190C68C50000000C0000000F2B1C
        9BFF384AD3FF2637CEFF3042D2FF4254D9FF3646D4FF2437CCFF2434CCFF3444
        D3FF3C4ED6FF2A3ACEFF202FC9FF1E2CC9FF251595FF000000120000000F3121
        A0FF4356D7FF374BD5FF3F4BCBFF2827ABFF363CBEFF3E4FD6FF3D4ED5FF353A
        BEFF2827ABFF3B45C9FF2F41D0FF2332CCFF291A99FF000000120000000E3529
        A5FF4E62DBFF444FCCFF605DBDFFEDEDF8FF8B89CEFF383CBCFF383CBBFF8B89
        CEFFEDEDF8FF5F5DBDFF3D47C9FF293ACEFF2D1F9EFF000000110000000D392F
        ABFF596FDFFF2722A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1
        EDFFF3E9E2FFECE6EBFF2721A5FF2F42D1FF3326A3FF0000000F0000000C4036
        B1FF657AE2FF3135B7FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9
        E2FFEADAD1FF7F6FACFF2E31B6FF3549D5FF372CA9FF0000000E0000000B453D
        B6FF6E83E5FF485EDCFF393BB7FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EB
        E5FF897DB8FF3739B6FF4054D9FF3D51D7FF3C33AFFF0000000D0000000A4A44
        BCFF788FE8FF6077E3FF4B4BBBFF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7ED
        E8FF9087C5FF4949BAFF596FDFFF4359DAFF423AB4FF0000000C00000009504C
        C2FF92A7EEFF5655BCFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0
        EAFFFAF5F2FF8F89CAFF5453BCFF6278E2FF4943B9FF0000000B000000086B6A
        D0FFADC1F4FF2A1E9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDF
        D8FFF4ECE7FFE5D9DCFF2A1D9BFF8B9EEBFF6563C9FF0000000A000000077577
        D6FFB1C6F5FF6E77D1FF5747A1FFCCB6BCFF7A68A8FF4E4CB7FF4F4EB8FF7A68
        A8FFCBB5BCFF5746A1FF6B75D0FF8EA1ECFF706ED0FF0000000900000006797B
        DAFFB5CAF6FF93A7EEFF7079D2FF2E229BFF5453BBFF93A7EEFF93A7EEFF5555
        BCFF2E219BFF6F77D1FF91A4EDFF90A3EDFF7475D4FF00000008000000057D80
        DEFFB9CDF6FFB9CDF6FFB9CCF6FFB9CCF6FFB9CDF6FFB8CCF6FFB8CCF6FFB7CC
        F6FFB7CBF6FFB6CBF6FFB5C9F6FFB5C9F6FF787AD8FF00000006000000036062
        A6C08184E1FF8183E0FF8083E0FF7F83DFFF7F83DFFF7F82DFFF7E81DFFF7E81
        DEFF7D81DEFF7D80DEFF7D7FDEFF7C7FDDFF5C5EA3C100000004000000000000
        0002000000030000000400000004000000040000000400000004000000040000
        0004000000040000000400000005000000050000000300000001}
      OnClick = btnCloseClick
      ExplicitLeft = 569
    end
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
      Width = 84
      Height = 13
      Caption = 'Custo de compra:'
    end
    object Label1: TLabel
      Left = 1
      Top = 191
      Width = 519
      Height = 13
      Align = alBottom
      ExplicitTop = 301
      ExplicitWidth = 3
    end
    object Label3: TLabel
      Left = 49
      Top = 10
      Width = 42
      Height = 13
      Caption = 'Produto:'
    end
    object BtnGravar: TBitBtn
      Left = 405
      Top = 7
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = BtnGravarClick
      ExplicitLeft = 491
    end
    object EditNome: TEdit
      Left = 151
      Top = 7
      Width = 244
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitWidth = 330
    end
    object EditCusto: TEdit
      Left = 99
      Top = 82
      Width = 296
      Height = 22
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      ExplicitTop = 88
      ExplicitWidth = 382
    end
    object MemoDesc: TMemo
      Left = 99
      Top = 34
      Width = 296
      Height = 44
      Anchors = [akLeft, akTop, akRight, akBottom]
      ImeMode = imHanguel
      TabOrder = 3
      ExplicitWidth = 382
      ExplicitHeight = 50
    end
    object Edit1: TEdit
      Left = 99
      Top = 7
      Width = 47
      Height = 21
      TabOrder = 4
    end
    object BtnExcluir: TBitBtn
      Left = 405
      Top = 34
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = BtnGravarClick
      ExplicitLeft = 384
    end
    object BtnCancelar: TBitBtn
      Left = 405
      Top = 61
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 6
      OnClick = BtnGravarClick
      ExplicitLeft = 384
    end
  end
  object query: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 512
    Top = 360
  end
end
