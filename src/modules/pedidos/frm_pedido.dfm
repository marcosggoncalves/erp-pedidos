object TFrm_lancar_pedido: TTFrm_lancar_pedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'ar novo pedido'
  ClientHeight = 363
  ClientWidth = 691
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
    Left = 208
    Top = 8
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
    Width = 201
    Height = 363
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 446
    object label_pedido_usuario: TLabel
      Left = 7
      Top = 13
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
      Left = 7
      Top = 61
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
      Left = 8
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
      Left = 7
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
      Left = 7
      Top = 32
      Width = 180
      Height = 21
      Enabled = False
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
    object ComboBox1: TComboBox
      Left = 7
      Top = 127
      Width = 179
      Height = 21
      TabOrder = 4
      TextHint = 'Selecione um produto'
    end
    object edit_produto_quantidade: TEdit
      Left = 7
      Top = 173
      Width = 98
      Height = 21
      NumbersOnly = True
      TabOrder = 5
      TextHint = 'Ex: 10'
    end
    object btn_adicionar: TButton
      Left = 111
      Top = 171
      Width = 75
      Height = 25
      Caption = 'ADICIONAR'
      TabOrder = 6
    end
    object btn_finalizar_: TBitBtn
      Left = 8
      Top = 296
      Width = 179
      Height = 25
      Caption = '&FINALIZAR PEDIDO'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 7
    end
    object btn_cancelar: TBitBtn
      Left = 8
      Top = 327
      Width = 179
      Height = 25
      Caption = '&CANCELAR LAN'#199'AMENTO'
      Kind = bkNo
      NumGlyphs = 2
      TabOrder = 8
    end
    object db_combobox_cliente: TDBComboBox
      AlignWithMargins = True
      Left = 7
      Top = 80
      Width = 179
      Height = 21
      Style = csDropDownList
      AutoDropDown = True
      CharCase = ecUpperCase
      DataField = 'ID'
      DragMode = dmAutomatic
      TabOrder = 3
    end
  end
  object DBGrid1: TDBGrid
    Left = 207
    Top = 27
    Width = 476
    Height = 281
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object panel_total_itens: TPanel
    Left = 307
    Top = 314
    Width = 185
    Height = 41
    TabOrder = 2
    object labe_escrita_unidades: TLabel
      Left = 32
      Top = 16
      Width = 70
      Height = 13
      Caption = 'UNIDADE(S):'
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
      Width = 11
      Height = 24
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object panel_total: TPanel
    Left = 498
    Top = 314
    Width = 185
    Height = 41
    TabOrder = 3
    object label_total: TLabel
      Left = 124
      Top = 8
      Width = 39
      Height = 24
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_escrita_total: TLabel
      Left = 40
      Top = 16
      Width = 61
      Height = 13
      Caption = 'SUBTOTAL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
