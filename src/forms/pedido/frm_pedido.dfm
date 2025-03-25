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
    object btn_adicionar: TButton
      Left = 113
      Top = 173
      Width = 61
      Height = 21
      Caption = 'ADICIONAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btn_adicionar_click
    end
    object btn_finalizar_: TBitBtn
      Left = 12
      Top = 413
      Width = 161
      Height = 25
      Caption = '&FINALIZAR PEDIDO'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btn_finalizar_click
    end
    object btn_cancelar: TBitBtn
      Left = 12
      Top = 444
      Width = 161
      Height = 25
      Caption = '&CANCELAR LAN'#199'AMENTO'
      Kind = bkNo
      NumGlyphs = 2
      TabOrder = 6
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
      TabOrder = 7
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
      TabOrder = 8
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
