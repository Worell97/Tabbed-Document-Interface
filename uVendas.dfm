object FormVendas: TFormVendas
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 551
  ClientWidth = 861
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
  object Label3: TLabel
    Left = 8
    Top = 36
    Width = 63
    Height = 19
    Caption = 'Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 861
    Height = 551
    Align = alClient
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Panel1
        Row = 0
      end
      item
        Column = 0
        Control = Panel2
        Row = 1
      end>
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 0
    ExplicitLeft = 520
    ExplicitTop = 5
    ExplicitWidth = 561
    ExplicitHeight = 443
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 859
      Height = 274
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 136
      ExplicitTop = 104
      ExplicitWidth = 185
      ExplicitHeight = 41
      DesignSize = (
        859
        274)
      object Label2: TLabel
        Left = 22
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Despesas'
      end
      object Label5: TLabel
        Left = 162
        Top = 16
        Width = 13
        Height = 13
        Caption = 'R$'
      end
      object Label6: TLabel
        Left = 238
        Top = 16
        Width = 79
        Height = 13
        Caption = 'Margem de lucro'
      end
      object Label7: TLabel
        Left = 373
        Top = 16
        Width = 11
        Height = 13
        Caption = '%'
      end
      object EditDespesas: TEdit
        Left = 81
        Top = 13
        Width = 75
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        Text = '400'
        OnExit = EditDespesasExit
      end
      object EditMargemLucro: TEdit
        Left = 323
        Top = 13
        Width = 45
        Height = 21
        NumbersOnly = True
        TabOrder = 1
        Text = '0'
        OnExit = EditMargemLucroExit
      end
      object DBGrid1: TDBGrid
        Left = 22
        Top = 60
        Width = 731
        Height = 170
        Anchors = [akLeft, akTop, akRight, akBottom]
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'produto'
            Title.Caption = 'Produto'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 299
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'vlrTotal'
            Title.Caption = 'Pre'#231'o de venda'
            Width = 82
            Visible = True
          end>
      end
      object BtnAdicionar: TBitBtn
        Left = 22
        Top = 239
        Width = 75
        Height = 23
        Anchors = [akLeft, akBottom]
        Caption = 'Adicionar'
        TabOrder = 3
        OnClick = BtnAdicionarClick
        ExplicitTop = 208
      end
      object BtnExcluir: TBitBtn
        Left = 103
        Top = 239
        Width = 75
        Height = 23
        Anchors = [akLeft, akBottom]
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = BtnExcluirClick
        ExplicitTop = 208
      end
      object btnClose: TBitBtn
        Left = 835
        Top = -1
        Width = 24
        Height = 20
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Anchors = [akTop, akRight]
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
        TabOrder = 5
        OnClick = btnCloseClick
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 275
      Width = 859
      Height = 275
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 120
      ExplicitTop = 312
      ExplicitWidth = 185
      ExplicitHeight = 41
      DesignSize = (
        859
        275)
      object Label1: TLabel
        Left = 7
        Top = 12
        Width = 61
        Height = 19
        Caption = 'Carrinho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBGrid2: TDBGrid
        Left = 22
        Top = 37
        Width = 731
        Height = 170
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataSource2
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'produto'
            Title.Caption = 'Produto'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 260
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'vlrTotal'
            Title.Caption = 'Total'
            Width = 60
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'qtde'
            Title.Caption = 'Quantidade'
            Visible = True
          end>
      end
      object EditTotal: TEdit
        Left = 416
        Top = 147
        Width = 83
        Height = 21
        Alignment = taRightJustify
        NumbersOnly = True
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
      object BtnFinalizar: TBitBtn
        Left = 763
        Top = 71
        Width = 90
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Finalizar compra'
        TabOrder = 2
        OnClick = BtnFinalizarClick
        ExplicitLeft = 510
        ExplicitTop = 21
      end
      object BitBtn1: TBitBtn
        Left = 763
        Top = 102
        Width = 90
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Cancelar'
        TabOrder = 3
        OnClick = BtnFinalizarClick
        ExplicitLeft = 510
        ExplicitTop = 52
      end
    end
  end
  object TesteConnection: TSQLConnection
    ConnectionName = 'teste'
    DriverName = 'Sqlite'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Sqlite'
      'DriverUnit=Data.DbxSqlite'
      
        'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver260.bp' +
        'l'
      
        'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite' +
        'Driver260.bpl'
      'FailIfMissing=True'
      'Database=C:\teste.db'
      'HostName=localhost')
    Left = 390
    Top = 12
  end
  object queryProdutos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = TesteConnection
    Left = 456
    Top = 13
  end
  object DataSource1: TDataSource
    Left = 360
    Top = 190
  end
  object DataSource2: TDataSource
    Left = 72
    Top = 390
  end
end
