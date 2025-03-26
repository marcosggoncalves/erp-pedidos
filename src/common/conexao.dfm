object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 409
  Width = 643
  object FDConexao: TFDConnection
    Params.Strings = (
      'Port=3050'
      'User_Name=SYSDBA'
      'Password=masterkey'
      
        'Database=C:\Users\Marcos Lopes\Desktop\Projetos\erp-pedidos\data' +
        'base\dados\ERP.FDB'
      'Pooled='
      'DriverID=fB')
    Connected = True
    Left = 32
    Top = 48
  end
  object FDTransaction: TFDTransaction
    Connection = FDConexao
    Left = 120
    Top = 48
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Windows\System32\FBCLIENT.DLL'
    Left = 224
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 344
    Top = 48
  end
  object QryVendasRelatorio: TFDQuery
    Active = True
    Connection = FDConexao
    SQL.Strings = (
      'SELECT '
      '  C.NOME, '
      '  SUM(P.TOTAL) AS VALOR_GASTO,'
      '  COUNT(P.ID) AS QUANTIDADE_PEDIDOS,'
      '  U.USUARIO AS VENDEDOR'
      'FROM PEDIDO P'
      'INNER JOIN CLIENTE C ON C.ID = P.CLIENTE_ID'
      'INNER JOIN USUARIO U ON U.ID = P.USUARIO_ID'
      'GROUP BY C.ID, C.NOME, U.USUARIO;')
    Left = 40
    Top = 144
  end
  object VendasRelatorio: TDataSource
    DataSet = QryVendasRelatorio
    Left = 40
    Top = 232
  end
  object RelatorioVendas: TfrxReport
    Version = '2022.2.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45741.174707974500000000
    ReportOptions.LastChange = 45741.200174062500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 144
    Top = 152
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE VENDAS POR CLIENTE')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 64.252010000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'NOME')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 340.157700000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR GASTO')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 510.236550000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'PEDIDOS')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 650.079160000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'VENDEDOR')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1NOME: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = '@Malgun Gothic'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset1."NOME"]')
          ParentFont = False
        end
        object frxDBDataset1QUANTIDADE_PEDIDOS: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 510.236550000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'QUANTIDADE_PEDIDOS'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = '@Malgun Gothic'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."QUANTIDADE_PEDIDOS"]')
          ParentFont = False
        end
        object frxDBDataset1VALOR_GASTO: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 340.157700000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = '@Malgun Gothic'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."VALOR_GASTO"]')
          ParentFont = False
        end
        object frxDBDataset1VENDEDOR: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 650.079160000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = '@Malgun Gothic'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."VENDEDOR"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QryVendasRelatorio
    BCDToCurrency = False
    DataSetOptions = []
    Left = 144
    Top = 232
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 144
    Top = 312
  end
end
