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
    Left = 191
    Top = 15
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
      ImeMode = imOpen
      KeyField = 'ID'
      ListField = 'Nome'
      ListSource = DataSourceCliente
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
    object btn_finalizar_: TButton
      Left = 12
      Top = 413
      Width = 161
      Height = 25
      Caption = 'FINALIZAR PEDIDO'
      Enabled = False
      TabOrder = 7
      OnClick = btn_finalizar_click
    end
    object btn_cancelar_: TButton
      Left = 12
      Top = 444
      Width = 161
      Height = 25
      Caption = 'CANCELAR LAN'#199'AMENTO'
      Enabled = False
      TabOrder = 8
      OnClick = btn_limpar_click
    end
  end
  object dbgrid_lista_pedido: TDBGrid
    Left = 191
    Top = 34
    Width = 506
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
    Left = 321
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
      Color = clBlue
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
    Left = 512
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
