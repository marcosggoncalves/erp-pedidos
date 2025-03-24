object Tfrm_login: TTfrm_login
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Acessar sistema'
  ClientHeight = 204
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  PixelsPerInch = 96
  TextHeight = 13
  object label_login_cpf: TLabel
    Left = 8
    Top = 56
    Width = 23
    Height = 13
    Caption = 'CPF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object label_login_senha: TLabel
    Left = 8
    Top = 102
    Width = 38
    Height = 13
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edit_login_usuario: TEdit
    Left = 8
    Top = 75
    Width = 225
    Height = 21
    TabOrder = 0
    TextHint = 'Digite seu CPF'
  end
  object edit_login_senha: TEdit
    Left = 8
    Top = 121
    Width = 225
    Height = 21
    TabOrder = 1
    TextHint = 'Digite sua senha'
  end
  object btn_entrar: TBitBtn
    Left = 41
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
  end
  object btn_cancelar: TBitBtn
    Left = 122
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
  end
  object panel_login: TPanel
    Left = 0
    Top = 0
    Width = 241
    Height = 41
    Align = alTop
    Caption = 'ERP - PEDIDOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    ExplicitLeft = 8
    ExplicitTop = 1
    ExplicitWidth = 185
  end
end
