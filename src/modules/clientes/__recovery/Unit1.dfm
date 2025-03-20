object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 437
  Width = 645
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=erp_pedidos'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Left = 56
    Top = 48
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 144
    Top = 48
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\Marcos Lopes\Desktop\Projetos\erp-pedidos\bin\libpq.dll'
    Left = 256
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 368
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 136
    Top = 160
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 56
    Top = 160
  end
end
