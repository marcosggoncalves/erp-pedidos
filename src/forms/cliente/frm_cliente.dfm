object Tfrm_cliente: TTfrm_cliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Clientes'
  ClientHeight = 484
  ClientWidth = 705
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  DockSite = True
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poNone
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object abas_navegacao: TPageControl
    Left = 0
    Top = 0
    Width = 705
    Height = 484
    ActivePage = aba_cadastro
    Align = alClient
    TabOrder = 0
    object aba_cadastro: TTabSheet
      Caption = 'Cadastro'
      object label_cadastro: TLabel
        Left = 201
        Top = 11
        Width = 110
        Height = 13
        Caption = 'FICHA CADASTRAL :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object label_cpf_cnpj_cliente: TLabel
        Left = 416
        Top = 30
        Width = 157
        Height = 13
        Caption = 'DOCUMENTO (CPF/OU CNPJ):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object label_id_cliente: TLabel
        Left = 200
        Top = 30
        Width = 16
        Height = 13
        Hint = 'Identificador registro'
        Caption = 'ID:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object label_nome_razao: TLabel
        Left = 202
        Top = 78
        Width = 133
        Height = 13
        Caption = 'Nome Completo/Raz'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object panel_btns: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 456
        Align = alLeft
        Color = clMenuBar
        ParentBackground = False
        TabOrder = 0
        object titulo_aba_cadastro: TLabel
          Left = 12
          Top = 11
          Width = 44
          Height = 13
          Caption = 'Op'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_limpar: TBitBtn
          Left = 12
          Top = 64
          Width = 161
          Height = 25
          Caption = 'Limpar'
          Glyph.Data = {
            52050000424D5205000000000000420000002800000012000000120000000100
            20000300000010050000000000000000000000000000000000000000FF0000FF
            0000FF0000000000000000000000000000000000000000000000000000000000
            000000000000B1764E0DB1764E0D000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000B1764827AE754B74AD7349A8AE7248C2AE7248C2AE7649A7AE774C72B176
            4E27000000000000000000000000000000000000000000000000000000000000
            000000000001AF774E76AE744AEDB57647FFB67647FFB7794CFFB7794CFFB676
            47FFB57547FFAE744AEDAF774E76000000000000000000000000000000000000
            00000000000000000000AF764C8CB4774AFFB57546FFBB8862FFD1AF96FFDEC8
            B8FFDEC8B7FFD1AF96FFBC8862FFB57546FFB4774AFFAE764C8A000000000000
            0000000000000000000000000000AE764D77B4774AFFB4764AFFCFAD94FFF6F0
            EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F0EBFFCFAD94FFB3774AFFB477
            4AFFAF774E76000000000000000000000000AA764E27AE744AEDB57546FFD0AD
            94FFFFFFFFFFFFFFFFFFF6EEEAFFE0CBBBFFE0CBBBFFF6EFEAFFFFFFFFFFFFFF
            FFFFCFAD94FFB57546FFAE7449ECAE794A260000000000000000B0754D74B576
            47FFBB8963FFF6F1ECFFFFFFFFFFE8D8CDFFB98763FFAB6F44FFAB6F44FFB988
            63FFE9D9CDFFFFFFFFFFF6F0EBFFBB8862FFB57647FFAE774C7200000000FFFF
            0001AE744AA9B67647FFD1B098FFFFFFFFFFF5EEEAFFB98762FFA76A3CFFAD72
            47FFAD7247FFA76A3BFFB98762FFF8F2EFFFFFFFFFFFD3B39AFFB67646FFAE75
            4AA6FFFF0001AA6A400CAE7247C2B7794CFFDEC8B7FFFFFFFFFFE0CBBBFFAB6F
            44FFAD7247FFAF764CFFAF764CFFAD7348FFAC7145FFDCC3B1FFFFFEFFFFD9BD
            AAFFB8794CFFAE7248C2AA6A400CAA6A400CAE7247C2B7794CFFDFC8B7FFFFFF
            FFFFE0CBBBFFAB6F44FFAD7348FFAF764CFFAE754AFFAF764CFFAE754AFFB47E
            56FFB98763FFB5805AFFBA7D51FFAF764BC2AA6A400CFFFF0001AE744AA9B676
            47FFD2B198FFFFFFFFFFF5EEE9FFB98661FFA86A3CFFAD7347FFAB7044FFAC72
            46FFAF764CFFAD7348FFAB6F44FFAE7348FFBB7E51FFB0774CA7FFFF00010000
            0000B1764A75B57647FFBB8963FFF7F1ECFFFFFFFFFFE8D8CBFFB7845DFFB37E
            56FFCCA78CFFB37D54FFA96D40FFAE754AFFAF764CFFB2784DFFB87C50FFAF76
            4B730000000000000000B1764E27AE744AEEB57546FFD0AD95FFFFFFFFFFFFFF
            FFFFF4ECE6FFE7D5C9FFFDFCFBFFE8D7CBFFBF9170FFAF764BFFAE754BFFBA7D
            51FFAF764CEDAE724A26000000000000000000000000AE774C78B4774AFFB376
            49FFD0AD95FFF7F1ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE0D7FFB784
            5EFFB27548FFB67A4EFFAE764B7700000000000000000000000000000000FF00
            0001AF774D8FB4774AFFB57546FFBB8963FFD0AE94FFE4D0C1FFFFFFFFFFEAD9
            CDFFC29472FFB97D50FFB5794DFFAF764B8C0000000000000000000000000000
            00000000000000000000FF00FF01B0774C78AE744AEEB57547FFB47343FFC087
            5DFFD7B093FFBE855AFFB37344FFAE754AEDB0764D7700000000000000000000
            0000000000000000000000000000000000000000000000000000B3794D28B176
            4A75AE744AA9AE7247C2AA6E40C2AB7042A9B0754D74AC794D28000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000AA6A400CAA552A0C00000000000000000000
            00000000000000000000000000000000000000000000}
          TabOrder = 0
          OnClick = btn_limpar_cadastro
        end
        object btn_salvar: TBitBtn
          Left = 12
          Top = 33
          Width = 161
          Height = 25
          Caption = 'Salvar'
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
          TabOrder = 1
          OnClick = btn_salvar_click
        end
        object btn_excluir: TBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 95
          Width = 161
          Height = 25
          Caption = 'Excluir'
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
          TabOrder = 2
          Visible = False
          OnClick = btn_excluir_click
        end
      end
      object edit_documento_cliente: TEdit
        Left = 416
        Top = 49
        Width = 257
        Height = 21
        Align = alCustom
        CharCase = ecUpperCase
        TabOrder = 1
        TextHint = 'Digite o documento informado'
        OnChange = edit_cliente_cpf_cnpj_mascara
      end
      object edit_id_cliente: TEdit
        Left = 200
        Top = 49
        Width = 201
        Height = 21
        Align = alCustom
        BiDiMode = bdLeftToRight
        Color = clBtnFace
        Ctl3D = True
        DoubleBuffered = True
        Enabled = False
        ImeMode = imAlpha
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        TextHint = 'Identificador Registro'
      end
      object edit_nome_cliente: TEdit
        Left = 201
        Top = 97
        Width = 472
        Height = 21
        Align = alCustom
        CharCase = ecUpperCase
        TabOrder = 3
        TextHint = 'Digite o nome ou raz'#227'o social'
      end
    end
    object aba_pesquisa: TTabSheet
      Caption = 'Pesquisa'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 456
        Align = alLeft
        BevelOuter = bvNone
        BiDiMode = bdLeftToRight
        Color = clMenuBar
        ParentBiDiMode = False
        ParentBackground = False
        TabOrder = 0
        object aba_titulo_pesquisa: TLabel
          Left = 11
          Top = 11
          Width = 44
          Height = 13
          Caption = 'Op'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object titulo_filtro_nome: TLabel
          Left = 12
          Top = 57
          Width = 36
          Height = 13
          Caption = 'Busca:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_pesquisar: TBitBtn
          Left = 12
          Top = 108
          Width = 161
          Height = 25
          Caption = 'Pesquisar'
          Glyph.Data = {
            52050000424D5205000000000000420000002800000012000000120000000100
            20000300000010050000000000000000000000000000000000000000FF0000FF
            0000FF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00044D2A3B2B9F30001000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000070065BA983E7FB6F0A8989EA8FFAF801000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000020060B59F27ACFEFF8EF1FFFF7ABADBF07089AE290000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000005BB19721A3F6FF9AF3FFFF97FAFFFF2AAE
            EF9D001AB30A0000000000000000000000000000000000000000000000000000
            000000000000000000000000000000126D0E0062B79F22A3F5FF96F0FFFF92F2
            FFFF29ACEDA6002AD40C00000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000058AB8229ADFEFF9BF5
            FFFF93F2FFFF23A7EA9F00000002000000000000000000000000000000000000
            0000714D532B8867697C8E7070AA977979A99F838577997C7C23763B270D5A72
            93B583D3FEFF90F7FFFF2BADEDA7000099050000000000000000000000000000
            0000000000037F5D6181947471EDB59D92EAD1C4BDD2D3C6C4D3C6B3ABE8B7A1
            9EE4B19A9CDCC8ABA7EB84A1B8B01D9FEA850040EA0C00000000000000000000
            000000000000000000007C5C607F9F766EFFDDB794BEFFFFD697FFFFFF92FFFF
            FF92FFFFE198E8D1B0BCD6BFB8FFCAB9BAF0E0A38F1900000000000000000000
            00000000000000000000000000006F526035926C65E6DC9869BDFFD9998EFFF1
            C496FFFFDC98FFFFE198FFF8CF96FFDFA08EEFB98FBACCB7B3E9BFACB9280000
            0000000000000000000000000000000000000000000084676D8FAE7259E0FF99
            4794FFB77294FDCC9496FFE0AD96FFE4B197FFD5A198FFBB7A92FD994C93DDB2
            9CE6C9C1C5770000000000000000000000000000000000000000000000009171
            73BBC56D40C6FF74128DFA944996FCAD6F9FFDBB7B9DFDB57695FCAD6A95FAA9
            65A4FFA359C1EEB68EEFCBBFC3A7000000000000000000000000000000000000
            000000000000957979BBC96F3EC8FF8832AEFDB777D4FECC94E3FED39DE0FED0
            98D2FDCC95D3FECE97EBFFC484F7F1BD97FACBC2C6A600000000000000000000
            00000000000000000000000000009279808DC38B6EF3FFC383F0FFD9A3FCFFE3
            B2FAFFECBFFBFFEFC4FCFFEEC1FCFFE7B6FAFFD39AF5EAC5ACFFD0C6CE780000
            0000000000000000000000000000000000000000000084728038B29088ECF1C0
            90FFFFE8B2F4FFF3C7F5FFF5D2F5FFF5D6F5FFF7D4F5FFF2C6F4F6D6ADFFDCC8
            C2EFCCCCD9280000000000000000000000000000000000000000000000000000
            0000A58E9285D2AFA0FFF4D7ADFFFFF5CEF6FFF9E0F5FFFBE7F5FFF8DDF6FAE5
            C5FFEED8CDFFD4C7CE7C00000000000000000000000000000000000000000000
            0000000000000000000055555506AE999F85C7AEA7ECE2CAB9FFEEDCCDFCEFE0
            D5FCE9D7CCFFDDCAC6E9D1C7CB7B555555030000000000000000000000000000
            0000000000000000000000000000000000000000000000000000A4929F38C2AE
            AF8DCCBAB9B9D1C0BFB7CEBFC188C2B8C2320000000000000000000000000000
            00000000000000000000000000000000000000000000}
          TabOrder = 0
          OnClick = btn_pesquisar_click
        end
        object selecionar_filtro_cliente: TComboBox
          Left = 11
          Top = 30
          Width = 161
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          Text = 'PESQUISAR POR?'
          OnChange = selecionar_tipo_filtro_change
          OnSelect = selecionar_tipo_filtro_change
          Items.Strings = (
            'NOME'
            'CPF_CNPJ')
        end
        object edit_filtro_search: TEdit
          Left = 12
          Top = 76
          Width = 161
          Height = 21
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 2
          TextHint = 'DIGITE SUA PESQUISA'
          OnChange = edit_filtro_search_change
        end
        object btn_limpar_pesquisa: TBitBtn
          Left = 11
          Top = 139
          Width = 161
          Height = 25
          Caption = 'Limpar'
          Enabled = False
          Glyph.Data = {
            52050000424D5205000000000000420000002800000012000000120000000100
            20000300000010050000000000000000000000000000000000000000FF0000FF
            0000FF0000000000000000000000000000000000000000000000000000000000
            000000000000B1764E0DB1764E0D000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000B1764827AE754B74AD7349A8AE7248C2AE7248C2AE7649A7AE774C72B176
            4E27000000000000000000000000000000000000000000000000000000000000
            000000000001AF774E76AE744AEDB57647FFB67647FFB7794CFFB7794CFFB676
            47FFB57547FFAE744AEDAF774E76000000000000000000000000000000000000
            00000000000000000000AF764C8CB4774AFFB57546FFBB8862FFD1AF96FFDEC8
            B8FFDEC8B7FFD1AF96FFBC8862FFB57546FFB4774AFFAE764C8A000000000000
            0000000000000000000000000000AE764D77B4774AFFB4764AFFCFAD94FFF6F0
            EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F0EBFFCFAD94FFB3774AFFB477
            4AFFAF774E76000000000000000000000000AA764E27AE744AEDB57546FFD0AD
            94FFFFFFFFFFFFFFFFFFF6EEEAFFE0CBBBFFE0CBBBFFF6EFEAFFFFFFFFFFFFFF
            FFFFCFAD94FFB57546FFAE7449ECAE794A260000000000000000B0754D74B576
            47FFBB8963FFF6F1ECFFFFFFFFFFE8D8CDFFB98763FFAB6F44FFAB6F44FFB988
            63FFE9D9CDFFFFFFFFFFF6F0EBFFBB8862FFB57647FFAE774C7200000000FFFF
            0001AE744AA9B67647FFD1B098FFFFFFFFFFF5EEEAFFB98762FFA76A3CFFAD72
            47FFAD7247FFA76A3BFFB98762FFF8F2EFFFFFFFFFFFD3B39AFFB67646FFAE75
            4AA6FFFF0001AA6A400CAE7247C2B7794CFFDEC8B7FFFFFFFFFFE0CBBBFFAB6F
            44FFAD7247FFAF764CFFAF764CFFAD7348FFAC7145FFDCC3B1FFFFFEFFFFD9BD
            AAFFB8794CFFAE7248C2AA6A400CAA6A400CAE7247C2B7794CFFDFC8B7FFFFFF
            FFFFE0CBBBFFAB6F44FFAD7348FFAF764CFFAE754AFFAF764CFFAE754AFFB47E
            56FFB98763FFB5805AFFBA7D51FFAF764BC2AA6A400CFFFF0001AE744AA9B676
            47FFD2B198FFFFFFFFFFF5EEE9FFB98661FFA86A3CFFAD7347FFAB7044FFAC72
            46FFAF764CFFAD7348FFAB6F44FFAE7348FFBB7E51FFB0774CA7FFFF00010000
            0000B1764A75B57647FFBB8963FFF7F1ECFFFFFFFFFFE8D8CBFFB7845DFFB37E
            56FFCCA78CFFB37D54FFA96D40FFAE754AFFAF764CFFB2784DFFB87C50FFAF76
            4B730000000000000000B1764E27AE744AEEB57546FFD0AD95FFFFFFFFFFFFFF
            FFFFF4ECE6FFE7D5C9FFFDFCFBFFE8D7CBFFBF9170FFAF764BFFAE754BFFBA7D
            51FFAF764CEDAE724A26000000000000000000000000AE774C78B4774AFFB376
            49FFD0AD95FFF7F1ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE0D7FFB784
            5EFFB27548FFB67A4EFFAE764B7700000000000000000000000000000000FF00
            0001AF774D8FB4774AFFB57546FFBB8963FFD0AE94FFE4D0C1FFFFFFFFFFEAD9
            CDFFC29472FFB97D50FFB5794DFFAF764B8C0000000000000000000000000000
            00000000000000000000FF00FF01B0774C78AE744AEEB57547FFB47343FFC087
            5DFFD7B093FFBE855AFFB37344FFAE754AEDB0764D7700000000000000000000
            0000000000000000000000000000000000000000000000000000B3794D28B176
            4A75AE744AA9AE7247C2AA6E40C2AB7042A9B0754D74AC794D28000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000AA6A400CAA552A0C00000000000000000000
            00000000000000000000000000000000000000000000}
          TabOrder = 3
          OnClick = btn_limpar_pesquisa_click
        end
      end
      object DBGrid1: TDBGrid
        Left = 185
        Top = 0
        Width = 512
        Height = 456
        Align = alClient
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbgridcell_selecionar
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 628
    Top = 416
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 628
    Top = 360
  end
end
