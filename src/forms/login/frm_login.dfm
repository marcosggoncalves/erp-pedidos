object Tfrm_login: TTfrm_login
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Entrar'
  ClientHeight = 218
  ClientWidth = 243
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
  object edit_login_cpf: TEdit
    Left = 8
    Top = 75
    Width = 225
    Height = 21
    TabOrder = 0
    TextHint = 'Digite seu CPF'
    OnChange = edit_login_cpf_mascara
  end
  object edit_login_senha: TEdit
    Left = 8
    Top = 121
    Width = 225
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    TextHint = 'Digite sua senha'
  end
  object btn_fechar: TBitBtn
    Left = 144
    Top = 172
    Width = 89
    Height = 25
    Caption = 'Sair'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btn_fechar_click
  end
  object btn_entrar: TBitBtn
    Left = 8
    Top = 172
    Width = 89
    Height = 25
    Caption = 'Entrar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btn_entrar_click
  end
  object panel_login: TPanel
    Left = 0
    Top = 0
    Width = 243
    Height = 41
    Align = alTop
    Caption = 'ERP - PEDIDOS'
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
end
