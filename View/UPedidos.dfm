object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  Caption = 
    'Gest'#227'o de Pedidos - Candidato: LUCIO CAMPOS NUNES - https://www.' +
    'linkedin.com/in/lucio-campos-nunes/'
  ClientHeight = 562
  ClientWidth = 885
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clRed
  Font.Height = -11
  Font.Name = 'Roboto'
  Font.Style = []
  Font.Quality = fqProof
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label5: TLabel
    Left = 55
    Top = 29
    Width = 55
    Height = 18
    Caption = 'Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    Font.Quality = fqProof
    ParentFont = False
  end
  object pnDados: TPanel
    Left = 0
    Top = 59
    Width = 857
    Height = 481
    BevelOuter = bvNone
    TabOrder = 1
    object Label9: TLabel
      Left = 620
      Top = 432
      Width = 61
      Height = 33
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = []
      Font.Quality = fqProof
      ParentFont = False
    end
    object Label10: TLabel
      Left = 47
      Top = 6
      Width = 68
      Height = 18
      Caption = 'Emiss'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      Font.Quality = fqProof
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 38
      Top = 36
      Width = 537
      Height = 107
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      Font.Quality = fqProof
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 56
        Height = 18
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 29
        Top = 66
        Width = 49
        Height = 18
        Caption = 'Local:'
      end
      object lbCliente: TLabel
        Left = 181
        Top = 32
        Width = 111
        Height = 18
        Caption = 'Nome Cliente'
      end
      object lbLocalizacao: TLabel
        Left = 82
        Top = 66
        Width = 94
        Height = 18
        Caption = 'Localiza'#231#227'o'
      end
      object EdtCodCliente: TEdit
        Left = 78
        Top = 29
        Width = 83
        Height = 26
        TabOrder = 0
        OnChange = EdtCodClienteChange
        OnExit = EdtCodClienteExit
        OnKeyPress = EdtCodClienteKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 38
      Top = 154
      Width = 795
      Height = 90
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      Font.Quality = fqProof
      ParentFont = False
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 25
        Width = 56
        Height = 18
        Caption = 'C'#243'digo'
      end
      object Label4: TLabel
        Left = 113
        Top = 25
        Width = 78
        Height = 18
        Caption = 'Descri'#231#227'o'
      end
      object lbdescricao: TLabel
        Left = 111
        Top = 54
        Width = 91
        Height = 18
        Caption = 'lbdescricao'
      end
      object Label6: TLabel
        Left = 400
        Top = 25
        Width = 56
        Height = 18
        Caption = 'Quant.'
      end
      object Label7: TLabel
        Left = 495
        Top = 27
        Width = 62
        Height = 18
        Caption = 'Vlr Unit'
      end
      object Label8: TLabel
        Left = 611
        Top = 29
        Width = 40
        Height = 18
        Caption = 'Total'
      end
      object lbValorTotal: TLabel
        Left = 613
        Top = 54
        Width = 36
        Height = 18
        Caption = '0,00'
      end
      object edtCodProduto: TEdit
        Left = 8
        Top = 51
        Width = 60
        Height = 26
        TabOrder = 0
        OnExit = edtCodProdutoExit
        OnKeyPress = edtCodProdutoKeyPress
      end
      object edtQuantidade: TEdit
        Left = 400
        Top = 51
        Width = 60
        Height = 26
        NumbersOnly = True
        TabOrder = 1
        OnExit = edtQuantidadeExit
      end
      object btInserirProduto: TBitBtn
        Left = 706
        Top = 38
        Width = 75
        Height = 39
        Caption = 'Inserir'
        TabOrder = 3
        OnClick = btInserirProdutoClick
      end
      object edtValorUni: TEdit
        Left = 490
        Top = 51
        Width = 75
        Height = 26
        TabOrder = 2
        Text = '0,00'
        OnExit = edtValorUniExit
        OnKeyPress = edtValorUniKeyPress
      end
    end
    object DBGrid1: TDBGrid
      Left = 38
      Top = 243
      Width = 795
      Height = 172
      DataSource = DSItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Font.Quality = fqProof
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clRed
      TitleFont.Height = -11
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
      TitleFont.Quality = fqProof
      OnKeyPress = DBGrid1KeyPress
      OnKeyUp = DBGrid1KeyUp
      Columns = <
        item
          Expanded = False
          FieldName = 'codproduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          Font.Quality = fqProof
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -19
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Title.Font.Quality = fqProof
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          Font.Quality = fqProof
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o do Produto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -19
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Title.Font.Quality = fqProof
          Width = 371
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          Font.Quality = fqProof
          Title.Alignment = taCenter
          Title.Caption = 'Quant.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -19
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Title.Font.Quality = fqProof
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorunitario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          Font.Quality = fqProof
          Title.Alignment = taCenter
          Title.Caption = 'Vlr Unit'#225'rio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -19
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Title.Font.Quality = fqProof
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valortotal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          Font.Quality = fqProof
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -19
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Title.Font.Quality = fqProof
          Width = 107
          Visible = True
        end>
    end
    object DBETotal: TDBEdit
      Left = 712
      Top = 430
      Width = 121
      Height = 37
      DataField = 'totalpedido'
      DataSource = DSItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Roboto'
      Font.Style = []
      Font.Quality = fqProof
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object BtGravar: TBitBtn
      Left = 38
      Top = 421
      Width = 139
      Height = 44
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      Font.Quality = fqProof
      ParentFont = False
      TabOrder = 5
      OnClick = BtGravarClick
    end
    object dtEmissao: TDateTimePicker
      Left = 117
      Top = 3
      Width = 175
      Height = 27
      Date = 45590.000000000000000000
      Time = 0.845913217592169500
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Font.Quality = fqProof
      ParentFont = False
      TabOrder = 0
    end
  end
  object EdtPedido: TEdit
    Left = 117
    Top = 26
    Width = 73
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    Font.Quality = fqProof
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
    OnChange = EdtPedidoChange
    OnExit = EdtPedidoExit
    OnKeyPress = EdtPedidoKeyPress
  end
  object btConsultar: TBitBtn
    Left = 196
    Top = 26
    Width = 96
    Height = 25
    Caption = 'Consultar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -17
    Font.Name = 'Roboto'
    Font.Style = []
    Font.Quality = fqProof
    ParentFont = False
    TabOrder = 2
    OnClick = btConsultarClick
  end
  object btCancelar: TBitBtn
    Left = 301
    Top = 26
    Width = 96
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    Font.Quality = fqProof
    ParentFont = False
    TabOrder = 3
    OnClick = btCancelarClick
  end
  object FDMTItens: TFDMemTable
    Active = True
    BeforeDelete = FDMTItensBeforeDelete
    OnCalcFields = FDMTItensCalcFields
    FieldDefs = <
      item
        Name = 'codproduto'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'quantidade'
        DataType = ftInteger
      end
      item
        Name = 'valorunitario'
        DataType = ftFloat
      end>
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvEDelete, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 720
    Top = 328
    Content = {
      414442531000000041020000FF00010001FF02FF03040012000000460044004D
      0054004900740065006E007300050012000000460044004D0054004900740065
      006E007300060000000000070000080032000000090000FF0AFF0B0400140000
      0063006F006400700072006F006400750074006F0005001400000063006F0064
      00700072006F006400750074006F000C00010000000E000D000F000110000111
      000112000113000114000115001400000063006F006400700072006F00640075
      0074006F00FEFF0B040012000000640065007300630072006900630061006F00
      050012000000640065007300630072006900630061006F000C00020000000E00
      16001700640000000F0001100001110001120001130001140001150012000000
      640065007300630072006900630061006F00180064000000FEFF0B0400140000
      007100750061006E007400690064006100640065000500140000007100750061
      006E007400690064006100640065000C00030000000E000D000F000110000111
      00011200011300011400011500140000007100750061006E0074006900640061
      0064006500FEFF0B04001A000000760061006C006F00720075006E0069007400
      6100720069006F0005001A000000760061006C006F00720075006E0069007400
      6100720069006F000C00040000000E0019000F00011000011100011200011300
      0114000115001A000000760061006C006F00720075006E006900740061007200
      69006F00FEFEFF1AFEFF1BFEFF1CFEFEFEFF1DFEFF1E1F0005000000FF20FEFE
      FE0E004D0061006E0061006700650072001E0055007000640061007400650073
      005200650067006900730074007200790012005400610062006C0065004C0069
      00730074000A005400610062006C00650008004E0061006D006500140053006F
      0075007200630065004E0061006D0065000A0054006100620049004400240045
      006E0066006F0072006300650043006F006E00730074007200610069006E0074
      0073001E004D0069006E0069006D0075006D0043006100700061006300690074
      007900180043006800650063006B004E006F0074004E0075006C006C00140043
      006F006C0075006D006E004C006900730074000C0043006F006C0075006D006E
      00100053006F007500720063006500490044000E006400740049006E00740033
      0032001000440061007400610054007900700065001400530065006100720063
      006800610062006C006500120041006C006C006F0077004E0075006C006C0008
      00420061007300650014004F0041006C006C006F0077004E0075006C006C0012
      004F0049006E0055007000640061007400650010004F0049006E005700680065
      00720065001A004F0072006900670069006E0043006F006C004E0061006D0065
      0018006400740041006E007300690053007400720069006E0067000800530069
      007A006500140053006F007500720063006500530069007A0065001000640074
      0044006F00750062006C0065001C0043006F006E00730074007200610069006E
      0074004C00690073007400100056006900650077004C006900730074000E0052
      006F0077004C006900730074001800520065006C006100740069006F006E004C
      006900730074001C0055007000640061007400650073004A006F00750072006E
      0061006C001200530061007600650050006F0069006E0074000E004300680061
      006E00670065007300}
    object FDMTItenscodproduto: TIntegerField
      FieldName = 'codproduto'
    end
    object FDMTItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object FDMTItensquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object FDMTItensvalorunitario: TFloatField
      FieldName = 'valorunitario'
      currency = True
    end
    object FDMTItensvalortotal: TFloatField
      DefaultExpression = 'quantidade*valorunitario'
      FieldKind = fkCalculated
      FieldName = 'valortotal'
      currency = True
      Calculated = True
    end
    object FDMTItenstotalpedido: TAggregateField
      DefaultExpression = 'sum(valorunitario*quantidade)'
      FieldName = 'totalpedido'
      ReadOnly = True
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valorunitario*quantidade)'
    end
  end
  object DSItens: TDataSource
    DataSet = FDMTItens
    Left = 784
    Top = 320
  end
end
