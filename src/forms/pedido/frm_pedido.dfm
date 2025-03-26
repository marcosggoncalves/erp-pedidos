object TFrm_lancar_pedido: TTFrm_lancar_pedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'ar novo pedido'
  ClientHeight = 484
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  OnActivate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object label_listagem_produtos: TLabel
    Left = 203
    Top = 13
    Width = 54
    Height = 13
    Caption = 'Produtos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object panel_info_pedido: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 484
    Align = alLeft
    BevelOuter = bvNone
    Color = clMenuBar
    ParentBackground = False
    TabOrder = 0
    object label_pedido_usuario: TLabel
      Left = 12
      Top = 15
      Width = 46
      Height = 13
      Caption = 'Usu'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object label_pedido_data: TLabel
      Left = 377
      Top = 13
      Width = 71
      Height = 13
      Caption = 'Data Pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object label_cliente: TLabel
      Left = 12
      Top = 62
      Width = 42
      Height = 13
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object label_selecionar_produto: TLabel
      Left = 12
      Top = 108
      Width = 54
      Height = 13
      Caption = 'Produtos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object label_produto_quantidade: TLabel
      Left = 12
      Top = 154
      Width = 68
      Height = 13
      Caption = 'Quantidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edit_pedido_usuario: TEdit
      Left = 12
      Top = 34
      Width = 161
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object date_time_pedido: TDateTimePicker
      Left = 377
      Top = 32
      Width = 152
      Height = 21
      Date = 45740.000000000000000000
      Time = 0.093396423610101920
      TabOrder = 1
    end
    object btn_finalizar: TBitBtn
      Left = 535
      Top = 30
      Width = 99
      Height = 25
      Caption = 'FINALIZAR'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 2
    end
    object edit_produto_quantidade: TEdit
      Left = 12
      Top = 173
      Width = 95
      Height = 21
      NumbersOnly = True
      TabOrder = 3
      TextHint = 'Ex: 10'
    end
    object combo_produtos: TDBLookupComboBox
      Left = 12
      Top = 127
      Width = 161
      Height = 21
      ImeMode = imOpen
      KeyField = 'ID'
      ListField = 'Nome'
      ListSource = DataSourceProduto
      TabOrder = 4
    end
    object combo_clientes: TDBLookupComboBox
      Left = 12
      Top = 81
      Width = 161
      Height = 21
      Hint = 'Selecione um cliente'
      ImeMode = imOpen
      KeyField = 'ID'
      ListField = 'Nome'
      ListSource = DataSourceCliente
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object BitBtn1: TBitBtn
      Left = 113
      Top = 168
      Width = 60
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        52050000424D5205000000000000420000002800000012000000120000000100
        20000300000010050000000000000000000000000000000000000000FF0000FF
        0000FF00000000000000000000000000000000000000CC663305B3792754B67C
        27ABB67C26E6B67D26FFB67C26FFB57C26E7B37D27ACB67C2754996633050000
        0000000000000000000000000000000000000000000000000000B5802530B67C
        25B1B57C26F8B97F27FFB77D26FFB47A22FFB47A22FFB77D26FFBA7F27FFB57C
        26F9B67C25B1B37D262F0000000000000000000000000000000000000000B77C
        274EB57C26EAC48629FFBB8027FFB67D27FFB57B25FFB37920FFB37920FFB57B
        25FFB67D27FFBB8027FFC48629FFB57C26E8B37B284D00000000000000000000
        0000B5802530B57C26E9C28529FFB67D26FFB57C26FFB3771FFFBB8637FFDEC5
        9EFFDEC59EFFBB8637FFB3771FFFB57C26FFB67D26FFC28529FFB57C26E9B57A
        253000000000BF802008B67C25B1C48629FFB67D26FFB57C26FFB57C26FFB074
        19FFC09046FFFEFEFDFFFEFEFDFFC09046FFB07419FFB57C26FFB57C26FFB67D
        26FFC48729FFB57D26B0BF804008B67C2754B57C26F9BB8027FFB57C26FFB57C
        26FFB57C26FFB07419FFC08F45FFFBF8F3FFFBF8F3FFC08F45FFB07419FFB57C
        26FFB57C26FFB57C26FFBB8027FFB57C26F8B27B2553B57C24AFB97F27FFB67D
        27FFB3771FFFB07419FFB07419FFAC6C0CFFBB8839FFFAF6F0FFFAF6F0FFBB88
        39FFAC6C0CFFB07419FFB07419FFB3771FFFB67D27FFBA7F27FFB47C25ABB57C
        26E8B77D26FFB57B25FFBB8637FFC09046FFC08F45FFBB8839FFC89E5EFFFBF8
        F3FFFBF8F3FFC89E5EFFBB8839FFC08F45FFC09046FFBB8637FFB57B25FFB77D
        26FFB67C26E5B67C26FFB47A22FFB37920FFDDC49DFFFEFEFDFFFBF8F3FFFAF6
        F0FFFBF8F3FFFFFFFEFFFFFFFEFFFBF8F3FFFAF6F0FFFBF8F3FFFEFEFDFFDDC4
        9DFFB37920FFB47A22FFB67C26FFB67C26FFB47A22FFB37920FFDDC49DFFFEFE
        FDFFFBF8F3FFFAF6F0FFFBF8F3FFFFFFFEFFFFFFFEFFFBF8F3FFFAF6F0FFFBF8
        F3FFFEFEFDFFDDC49DFFB37920FFB47A22FFB67D26FFB57C26E8B77D26FFB57B
        25FFBB8637FFC09046FFC08F45FFBB8839FFC89E5EFFFBF8F3FFFBF8F3FFC89E
        5EFFBB8839FFC08F45FFC09046FFBB8637FFB57B25FFB77D26FFB57C26E6B67D
        26AEB97F27FFB67D27FFB3771FFFB07419FFB07419FFAC6C0CFFBB8839FFFAF6
        F0FFFAF6F0FFBB8839FFAC6C0CFFB07419FFB07419FFB3771FFFB67D27FFB97F
        27FFB47C25ABB67C2754B57C26F9BB8027FFB57C26FFB57C26FFB57C26FFB074
        19FFC08F45FFFBF8F3FFFBF8F3FFC08F45FFB07419FFB57C26FFB57C26FFB57C
        26FFBB8027FFB57C26F8B27B2553AA711C09B57B27B2C48629FFB67D26FFB57C
        26FFB57C26FFB07419FFC09046FFFEFEFDFFFEFEFDFFC09046FFB07419FFB57C
        26FFB57C26FFB67D26FFC48629FFB67C25B1BF80200800000000B67D2431B57C
        26EBC28529FFB67D26FFB57C26FFB3771FFFBB8637FFDEC59EFFDEC59EFFBB86
        37FFB3771FFFB57C26FFB67D26FFC28529FFB57C26EAB67D2431000000000000
        000000000000B37B2651B57C26EBC48629FFBB8027FFB67D27FFB57B25FFB379
        20FFB37920FFB57B25FFB67D27FFBB8027FFC48629FFB57C26EAB77C274E0000
        000000000000000000000000000000000000B17D2431B57D27B2B57C26F9B97F
        27FFB77D26FFB47A22FFB47A22FFB77D26FFB97F27FFB57C26F9B57D27B2B57A
        253000000000000000000000000000000000000000000000000000000000CC99
        3305B47E2755B67D26AEB57C26E8B67D26FFB67C26FFB57C26E8B57C24AFB47B
        27559966330500000000000000000000000000000000}
      ParentFont = False
      TabOrder = 6
      OnClick = btn_adicionar_click
    end
    object btn_cancelar_: TBitBtn
      Left = 12
      Top = 444
      Width = 161
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      Glyph.Data = {
        52050000424D5205000000000000420000002800000012000000120000000100
        20000300000010050000000000000000000000000000000000000000FF0000FF
        0000FF0000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000808A5220F0FB2781010B67E1111
        B87A1111B87A1111B87A1111B87A1111B87A1111B87A1111B87A1111B87A1111
        B87A1111B87A1010B67E0F0FB5780808A52200000000000000000F0FB27A1315
        E5FF1415E7FF1415E2FF1112E2FF1213E2FF1415E2FF1315E2FF1315E2FF1415
        E2FF1213E2FF1112E2FF1415E2FF1415E7FF1315E5FF0F0FB379000000000000
        00000E10B57F1415E6FF1516E7FF0E0FE2FF0406DFFF090AE0FF1314E1FF1415
        E1FF1415E1FF1314E1FF090AE0FF0406DFFF0E0FE1FF1516E6FF1415E5FF1010
        B77F00000000000000000F11B47B1314DEFF0D0EDEFF1D1EDDFF7E7FEBFF4747
        E2FF0304D7FF1112D9FF1112D9FF0304D6FF4748E1FF7E7FEBFF1D1EDBFF0D0E
        DCFF1314DCFF0F0FB27B00000000000000000F0FB27B1011DAFF0304D8FF7E7E
        E7FFFFFFFFFFE7E7FBFF3A3BDDFF0000D3FF0000D3FF3A3BDDFFE7E7FBFFFFFF
        FFFF7D7EE7FF0304D7FF1011D9FF0F11B27B00000000000000000F0FB07B1112
        D8FF0809D6FF4546CCFFE7E7EFFFFFFFFFFFD9D9F8FF2A2AD7FF2A2AD7FFD9D9
        F8FFFFFFFFFFE6E6EFFF4446CCFF0809D5FF1113D7FF0F11B07B000000000000
        00000F0FB07B1314D5FF1213D6FF0203C9FF3939C3FFD9D9ECFFFFFFFFFFD8D8
        F7FFD8D8F7FFFFFFFFFFD8D9ECFF3839C3FF0102C9FF1213D4FF1213D3FF0F0F
        AE7B00000000000000000C0FAE7B1113D1FF1213D0FF1011CFFF0000C6FF2829
        BEFFD7D8EDFFFFFFFFFFFFFFFFFFD7D7EDFF2728BEFF0000C5FF1011CEFF1213
        CFFF1112D0FF0C0FAE7B00000000000000000C0FAC7B1112CFFF1213CEFF0F10
        C9FF0000C6FF2929CCFFD8D8F2FFFFFFFFFFFFFFFFFFD7D7F2FF2829CCFF0000
        C5FF0F10C9FF1213CCFF1112CDFF0C0FAC7B00000000000000000C0FAA7B1113
        CCFF1011CAFF0102C3FF393ACFFFD9DAF7FFFFFFFFFFD7D7EDFFD7D7EDFFFFFF
        FFFFD9D9F7FF393ACFFF0102C2FF1111C9FF1113CAFF0C0FAA7B000000000000
        00000C0FAA7B1011C8FF0607C4FF4647D1FFE7E8FAFFFFFFFFFFD8D8EDFF2728
        B8FF2728B8FFD8D8EDFFFFFFFFFFE7E7FAFF4546D1FF0607C3FF0F11C7FF0C0F
        AA7B00000000000000000C0CAA7B0E0FC4FF0102BFFF7C7ED7FFFFFFFFFFE6E6
        F2FF3738BBFF0000B9FF0000B9FF3738BBFFE6E7F2FFFFFFFFFF7C7CD6FF0102
        BEFF0E0FC3FF0C0FA87B00000000000000000C0CA87B1011C2FF0B0CBFFF1A1B
        B8FF7B7CCBFF4345BEFF0001B6FF0F10BDFF0F10BDFF0001B6FF4345BEFF7B7C
        CBFF1A1BB8FF0B0CBFFF1012C1FF0C0FA67B00000000000000000C0CA77F1111
        C2FF1213C0FF0B0CBBFF0102B3FF0607B7FF0F10BDFF1112BCFF1112BBFF0F10
        BCFF0607B6FF0102B2FF0B0CBAFF1213BFFF1112C1FF0C0EA77F000000000000
        00000D0FA37A1012C1FF1011BFFF1010BCFF0D0EBCFF0E0FBCFF1011BCFF1010
        BBFF1010BBFF1011BBFF0E0FBBFF0D0EBCFF1010BBFF1011BFFF1012C0FF0D0F
        A279000000000000000008089E220D0FA2790C0CA57F0C0CA47B0C0CA47B0C0C
        A47B0C0CA47B0C0CA47B0C0CA47B0C0CA47B0C0CA47B0C0CA47B0C0CA47B0C0C
        A57F0D0FA27908089E2200000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000}
      TabOrder = 7
      OnClick = btn_limpar_click
    end
    object btn_finalizar_: TBitBtn
      Left = 12
      Top = 413
      Width = 161
      Height = 25
      Caption = 'Finalizar'
      Enabled = False
      Glyph.Data = {
        52050000424D5205000000000000420000002800000012000000120000000100
        20000300000010050000000000000000000000000000000000000000FF0000FF
        0000FF000000000000008F7D6739907D69838C75617E9C90827CD6D6D67CCACE
        D07CC1C3C57CD2D2D27CDADADA7CCECECE7CCED0D07CD8DADA7C9A8E867C735D
        4A7C7E6A587F7D69587C695A503396836D44A18B78DBAD9681FFA28A74FFBDAE
        A1FFEBE9E6FFBCB1A9FFC6BFB9FFF7F7F8FFFFFFFFFFF4F4F4FFF4F4F5FFFFFF
        FFFFB8AB9FFF8B725DFF98816DFF97806CFF7B69587CA28C77BBAE9783FFA58E
        7BFF9F8773FFBFB1A5FFD9D4CFFF8C7562FFA7988BFFF0F1F1FFFFFFFFFFF3F2
        F2FFEEEFEFFFF9FAFBFFB6A99EFF89725DFF967F6CFF98816DFF7C6A5A7FA48E
        7ABEA99480FFA58F7BFF9F8773FFBDB0A4FFD8D3CFFF8D7765FFA99A8EFFEFEF
        EFFFFDFDFEFFF2F2F2FFECECECFFF5F6F7FFB4A79CFF88705BFF947E6BFF9781
        6CFF806D5A7CA48F7BB9AA9481FFA6917DFFA08974FFBFB2A6FFD9D4CFFF8971
        5EFFA9998CFFF2F3F5FFFFFFFFFFFAFAFBFFF4F4F5FFF9FAFCFFB4A89EFF8770
        5BFF947F6CFF99826EFF826D5D7CA58F7CB9AB9582FFA8927EFFA18B76FFBBAE
        A1FFE4E1E0FFB0A49AFFBDB4ADFFEFF0F0FFFDFEFFFFFAFBFCFFF5F6F7FFF8F9
        FBFFB3A69CFF876F5BFF957F6CFF9A8370FF826D5F7CB09A86B9B09A86FFA58F
        7AFFA08873FFA18C78FFB1A091FFB1A294FFAA9B8CFFAB9B8BFFAD9E8FFFAD9D
        8EFFAB9C8CFFAB9A8CFF96816FFF8A735EFF96806DFF9C8571FF826F5F7CB6A1
        8DB9B8A28EFFB09E8EFFB7A79AFFB5A596FFB09F90FFB1A091FFB09F90FFAD9B
        8DFFAB9A8BFFAA988AFFAA9889FFA89788FFAC9B8DFFAD9C8FFFA08C7AFF9B85
        70FF846F5F7CB69F8BB9B7A18DFFD6CFCBFFF6F9FFFFF4F6FCFFF3F5FAFFF3F5
        FAFFF3F5FAFFF3F5FAFFF3F5FAFFF3F5FAFFF3F5FAFFF3F5FAFFF5F7FDFFF5F8
        FEFFB9ABA0FF98806CFF826F5F7CB79F8AB9B7A18CFFDDD7D3FFFDFFFFFFFBFD
        FFFFFAFCFFFFFAFCFFFFFAFCFFFFFAFCFFFFFAFDFFFFFAFDFFFFFAFDFFFFFAFD
        FFFFFCFFFFFFFDFFFFFFBEB0A6FF99816CFF846F617CB7A08AB9B8A28EFFD8D2
        D0FFF5FAFFFFF3F6FEFFF2F6FDFFF2F6FDFFF2F6FDFFF2F6FDFFF2F6FDFFF2F6
        FDFFF2F6FDFFF2F6FDFFF4F8FFFFF5F8FFFFBCAFA5FF9B836EFF866F617CB7A1
        8BB9B8A28EFFDAD4D0FFF8FCFFFFF5F8FEFFF5F7FDFFF5F7FDFFF5F7FDFFF5F7
        FDFFF5F7FDFFF5F7FDFFF5F7FDFFF5F7FDFFF7F9FFFFF7FAFFFFBDB0A5FF9D84
        6FFF8671617CB7A18DB9B9A38FFFDBD4D1FFF9FCFFFFF6F8FEFFF5F8FDFFF5F8
        FDFFF5F8FDFFF5F8FDFFF5F8FDFFF5F8FDFFF5F8FDFFF5F8FDFFF7FAFFFFF8FB
        FFFFBFB1A6FF9D8671FF8673637CB9A38DB9BAA490FFD9D3D1FFF5FAFFFFF3F6
        FEFFF2F6FDFFF2F6FDFFF2F6FDFFF2F6FDFFF2F6FDFFF2F6FDFFF2F6FDFFF2F6
        FDFFF4F8FFFFF5F8FFFFBEB1A7FF9F8772FF8873637CBAA38FBABFA894FFDDD7
        D2FFFBFEFFFFF9FBFFFFF8FAFEFFF8FAFEFFF8FAFEFFF8FAFEFFF8FAFEFFF8FA
        FEFFF8FAFEFFF8FAFEFFFAFCFFFFFAFDFFFFC1B4A8FFA08974FF8875637CB8A1
        8CB3B8A18DEDD9D4D2FEF6FBFFFFF3F7FFFFF3F6FEFFF3F6FEFFF3F6FEFFF3F6
        FEFFF3F6FEFFF3F6FEFFF3F6FEFFF3F6FEFFF4F8FFFFF5F9FFFFBFB3A8FFA48B
        75FF8D78687DB29B83A5AB9784BAC3C4D3FAD6E4FFFFD2DFFFFFD1DEFFFFD1DE
        FFFFD1DEFFFFD1DEFFFFD2DEFFFFD2DEFFFFD2DEFFFFD2DEFFFFD3E0FFFFD4E1
        FFFFB1A7A6FFA0876FFF94806D7EB49C8674AF9A84B5B3B2C0B9BAC5EAB9B9C2
        E6B9B9C2E3B9B9C2E3B9B9C2E3B9B7C2E3B9B7C1E3B9B7C0E3B9B6C0E2B9B6C0
        E3B9B7C2E5B9B7C2E6B9A49B99BC967F6AB98A75684C}
      TabOrder = 8
      OnClick = btn_finalizar_click
    end
  end
  object dbgrid_lista_pedido: TDBGrid
    Left = 203
    Top = 32
    Width = 486
    Height = 395
    DataSource = DataSourcePedido
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrid_remover_item_click
  end
  object panel_total_itens: TPanel
    Left = 313
    Top = 435
    Width = 185
    Height = 41
    TabOrder = 2
    object labe_escrita_unidades: TLabel
      Left = 32
      Top = 16
      Width = 67
      Height = 13
      Caption = 'UNIDADE(S)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object label_qtd_total: TLabel
      Left = 124
      Top = 8
      Width = 13
      Height = 24
      Caption = '0'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object panel_total: TPanel
    Left = 504
    Top = 435
    Width = 185
    Height = 41
    ParentBackground = False
    TabOrder = 3
    object label_total: TLabel
      Left = 59
      Top = 8
      Width = 45
      Height = 24
      Caption = '0,00'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object label_escrita_total: TLabel
      Left = 8
      Top = 16
      Width = 22
      Height = 16
      Caption = 'R$:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DataSourceCliente: TDataSource
    DataSet = ClientSetClientes
    Left = 600
    Top = 288
  end
  object ClientSetClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 360
  end
  object ClientSetProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 360
  end
  object DataSourceProduto: TDataSource
    DataSet = ClientSetProduto
    Left = 480
    Top = 288
  end
  object DataSourcePedido: TDataSource
    DataSet = ClientSetPedido
    Left = 360
    Top = 288
  end
  object ClientSetPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 360
  end
end
