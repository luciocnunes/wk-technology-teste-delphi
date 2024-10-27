object DMConexao: TDMConexao
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=wkdelphi112'
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 56
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\wkteste\libmysql.dll'
    Left = 160
    Top = 16
  end
end
