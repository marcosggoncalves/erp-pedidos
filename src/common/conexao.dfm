object dm: Tdm
  OldCreateOrder = False
  Height = 409
  Width = 643
  object FDConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Marcos Lopes\Desktop\Projetos\erp-pedidos\data' +
        'base\dados\ERP.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
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
end
