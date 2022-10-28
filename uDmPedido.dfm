object DmPedido: TDmPedido
  OnCreate = DataModuleCreate
  Height = 329
  Width = 520
  object Conn: TFDConnection
    Params.Strings = (
      'Database=pedidos'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 32
  end
  object DSPProdutosVenda: TDataSetProvider
    DataSet = QryInserirProd
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 424
    Top = 214
  end
  object DsProdutosVenda: TDataSource
    DataSet = Cdsprodutosvenda
    Left = 288
    Top = 214
  end
  object Cdsprodutosvenda: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSPProdutosVenda'
    OnCalcFields = CdsprodutosvendaCalcFields
    Left = 288
    Top = 147
    object CdsprodutosvendaSequencia: TAutoIncField
      FieldName = 'Sequencia'
      Origin = 'Sequencia'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object Cdsprodutosvendanro_pedido: TIntegerField
      FieldName = 'nro_pedido'
      Origin = 'nro_pedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Cdsprodutosvendacod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      Required = True
    end
    object Cdsprodutosvendaqtd: TIntegerField
      FieldName = 'qtd'
      Origin = 'qtd'
      Required = True
    end
    object Cdsprodutosvendavl_unit: TFloatField
      FieldName = 'vl_unit'
      Origin = 'vl_unit'
      Required = True
    end
    object Cdsprodutosvendavl_total: TFloatField
      FieldName = 'vl_total'
      Origin = 'vl_total'
      Required = True
    end
    object CdsprodutosvendaNomeProd: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeProd'
      Size = 50
      Calculated = True
    end
    object CdsprodutosvendaTotalProd: TAggregateField
      FieldName = 'TotalProd'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(vl_total)'
    end
  end
  object QryPedido: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'select * from dados_gerais_pedidos where 1 = 2')
    Left = 136
    Top = 152
    object QryPedidoNro_pedido: TFDAutoIncField
      FieldName = 'Nro_pedido'
      Origin = 'Nro_pedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryPedidoDt_emiss: TDateField
      FieldName = 'Dt_emiss'
      Origin = 'Dt_emiss'
      Required = True
    end
    object QryPedidoCod_cliente: TIntegerField
      FieldName = 'Cod_cliente'
      Origin = 'Cod_cliente'
      Required = True
    end
    object QryPedidoValorTot: TFloatField
      FieldName = 'ValorTot'
      Origin = 'ValorTot'
      Required = True
    end
  end
  object DsPedido: TDataSource
    DataSet = QryPedido
    Left = 136
    Top = 224
  end
  object QryCliente: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'select nome from clientes where codigo = :codigo')
    Left = 40
    Top = 152
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryClientenome: TStringField
      FieldName = 'nome'
      Origin = 'Nome'
      Required = True
      Size = 100
    end
  end
  object QryInserirProd: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT * FROM prod_pedido where 1 = 2')
    Left = 424
    Top = 146
    object QryInserirProdSequencia: TFDAutoIncField
      FieldName = 'Sequencia'
      Origin = 'Sequencia'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryInserirProdnro_pedido: TIntegerField
      FieldName = 'nro_pedido'
      Origin = 'nro_pedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryInserirProdcod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      Required = True
    end
    object QryInserirProdqtd: TIntegerField
      FieldName = 'qtd'
      Origin = 'qtd'
      Required = True
    end
    object QryInserirProdvl_unit: TFloatField
      FieldName = 'vl_unit'
      Origin = 'vl_unit'
      Required = True
    end
    object QryInserirProdvl_total: TFloatField
      FieldName = 'vl_total'
      Origin = 'vl_total'
      Required = True
    end
  end
  object QryDetalhePedido: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT  c.Nome, p.* FROM dados_gerais_pedidos p '
      'inner join clientes c on (p.Cod_cliente = c.Codigo)'
      'where p.Nro_pedido = :nro_pedido')
    Left = 288
    Top = 56
    ParamData = <
      item
        Name = 'NRO_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryDetalhePedidoNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 100
    end
    object QryDetalhePedidoNro_pedido: TFDAutoIncField
      FieldName = 'Nro_pedido'
      Origin = 'Nro_pedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryDetalhePedidoDt_emiss: TDateField
      FieldName = 'Dt_emiss'
      Origin = 'Dt_emiss'
      Required = True
    end
    object QryDetalhePedidoCod_cliente: TIntegerField
      FieldName = 'Cod_cliente'
      Origin = 'Cod_cliente'
      Required = True
    end
    object QryDetalhePedidoValorTot: TFloatField
      FieldName = 'ValorTot'
      Origin = 'ValorTot'
      Required = True
    end
  end
  object QrySalvarProdutos: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT * FROM prod_pedido where 1 = 2')
    Left = 424
    Top = 58
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'Sequencia'
      Origin = 'Sequencia'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'nro_pedido'
      Origin = 'nro_pedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'qtd'
      Origin = 'qtd'
      Required = True
    end
    object FloatField1: TFloatField
      FieldName = 'vl_unit'
      Origin = 'vl_unit'
      Required = True
    end
    object FloatField2: TFloatField
      FieldName = 'vl_total'
      Origin = 'vl_total'
      Required = True
    end
  end
end
