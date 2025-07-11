object DM: TDM
  Height = 750
  Width = 1327
  PixelsPerInch = 120
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Jeferson\Desktop\FACULDADE\4'#186' PER'#205'ODO\IMPLEMENTA'#199#195'O DE ' +
      'SISTEMAS\SysVendas\libmysql.dll'
    Left = 224
    Top = 32
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=supermarket'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 32
  end
  object FDTableFuncionario: TFDTable
    Active = True
    IndexFieldNames = 'idFuncionario'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'funcionario'
    Left = 62
    Top = 124
    object FDTableFuncionarioidUsuario: TFDAutoIncField
      FieldName = 'idFuncionario'
      Origin = 'idFuncionario'
      ReadOnly = False
    end
    object FDTableFuncionarionome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 70
    end
    object FDTableFuncionariotelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 15
    end
    object FDTableFuncionarioemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 45
    end
    object FDTableFuncionarionascimento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'nascimento'
      Origin = 'nascimento'
    end
    object FDTableFuncionariosexo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'sexo'
      Origin = 'sexo'
      Size = 10
    end
    object FDTableFuncionariosenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      Size = 100
    end
    object FDTableFuncionariocpfl: TStringField
      FieldName = 'cpfl'
      Origin = 'cpfl'
      Required = True
      Size = 11
    end
    object FDTableFuncionariosalario: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'salario'
      Origin = 'salario'
      Precision = 10
      Size = 2
    end
    object FDTableFuncionariostatusPagamento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'statusPagamento'
      Origin = 'statusPagamento'
    end
    object FDTableFuncionariodataPagamento: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dataPagamento'
      Origin = 'dataPagamento'
    end
  end
  object DSFuncionario: TDataSource
    DataSet = FDTableFuncionario
    Left = 38
    Top = 368
  end
  object FDQueryLogin: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT * FROM funcionario WHERE email = :email AND senha = :senh' +
        'a;')
    Left = 23
    Top = 584
    ParamData = <
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        Name = 'SENHA'
        ParamType = ptInput
      end>
  end
  object FDQueryName: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT nome FROM funcionario;')
    Left = 239
    Top = 583
  end
  object FDTableCliente: TFDTable
    Active = True
    IndexFieldNames = 'idCliente'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'cliente'
    Left = 208
    Top = 123
    object FDTableClienteidCliente: TFDAutoIncField
      FieldName = 'idCliente'
      Origin = 'idCliente'
      ReadOnly = False
    end
    object FDTableClientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 70
    end
    object FDTableClientenascimento: TDateField
      FieldName = 'nascimento'
      Origin = 'nascimento'
      Required = True
    end
    object FDTableClientecpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
      Size = 11
    end
    object FDTableClienteemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Required = True
      Size = 45
    end
    object FDTableClientetelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object FDTableClientesexo: TStringField
      FieldName = 'sexo'
      Origin = 'sexo'
      Required = True
      Size = 45
    end
    object FDTableClienteestado: TStringField
      FieldName = 'estado'
      Origin = 'estado'
      Required = True
    end
    object FDTableClientecomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
      Required = True
      Size = 45
    end
    object FDTableClientecidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 45
    end
    object FDTableClientebairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 30
    end
    object FDTableClienterua: TStringField
      FieldName = 'rua'
      Origin = 'rua'
      Required = True
      Size = 45
    end
    object FDTableClientenumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Required = True
      Size = 8
    end
    object FDTableClientecep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Required = True
      Size = 10
    end
  end
  object DSCliente: TDataSource
    DataSet = FDTableCliente
    Left = 135
    Top = 367
  end
  object FDQueryCPF: TFDQuery
    Active = True
    MasterSource = DSCliente
    MasterFields = 'cpf'
    DetailFields = 'cpf'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * FROM Cliente WHERE CPF = :CPF;'
      ''
      '')
    Left = 129
    Top = 584
    ParamData = <
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = '12345678912'
      end>
  end
  object FDTableFornecedor: TFDTable
    Active = True
    IndexFieldNames = 'idFornecedor'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'supermarket.fornecedor'
    Left = 344
    Top = 122
    object FDTableFornecedoridFornecedor: TFDAutoIncField
      FieldName = 'idFornecedor'
      Origin = 'idFornecedor'
      ReadOnly = False
    end
    object FDTableFornecedornome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 45
    end
    object FDTableFornecedorcnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Required = True
      Size = 45
    end
    object FDTableFornecedortelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 45
    end
    object FDTableFornecedoremail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Required = True
      Size = 45
    end
  end
  object DSFornecedor: TDataSource
    DataSet = FDTableFornecedor
    Left = 233
    Top = 366
  end
  object FDTableProduto: TFDTable
    Active = True
    IndexFieldNames = 'idProduto;idFornecedorSK'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'produto'
    Left = 488
    Top = 122
  end
  object DSProduto: TDataSource
    DataSet = FDTableProduto
    Left = 333
    Top = 366
  end
  object FDTableTransportadora: TFDTable
    Active = True
    IndexFieldNames = 'idTransportador'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'supermarket.transportadora'
    Left = 643
    Top = 122
  end
  object DSTransportadora: TDataSource
    DataSet = FDTableTransportadora
    Left = 442
    Top = 366
  end
  object FDTableCaixa: TFDTable
    Active = True
    IndexFieldNames = 'idCaixa'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'caixa'
    Left = 59
    Top = 208
  end
  object DSCaixa: TDataSource
    DataSet = FDTableCaixa
    Left = 545
    Top = 365
  end
  object FDTableItensVenda: TFDTable
    Active = True
    IndexFieldNames = 'idItensVenda'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'itensvenda'
    Left = 187
    Top = 207
    object FDTableItensVendaidItensVenda: TFDAutoIncField
      FieldName = 'idItensVenda'
      Origin = 'idItensVenda'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object FDTableItensVendaQuantidade: TIntegerField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
      Required = True
    end
    object FDTableItensVendaProduto: TStringField
      FieldName = 'Produto'
      Origin = 'Produto'
      Required = True
      Size = 45
    end
    object FDTableItensVendaData: TDateField
      FieldName = 'Data'
      Origin = 'Data'
      Required = True
    end
    object FDTableItensVendaValor: TIntegerField
      FieldName = 'Valor'
      Origin = 'Valor'
      Required = True
    end
    object FDTableItensVendaidProdutoo: TIntegerField
      FieldName = 'idProdutoo'
      Origin = 'idProdutoo'
      Required = True
    end
    object FDTableItensVendaidFuncionariooo: TIntegerField
      FieldName = 'idFuncionariooo'
      Origin = 'idFuncionariooo'
      Required = True
    end
    object FDTableItensVendaidClientee: TIntegerField
      FieldName = 'idClientee'
      Origin = 'idClientee'
      Required = True
    end
    object FDTableItensVendaidCaixaaa: TIntegerField
      FieldName = 'idCaixaaa'
      Origin = 'idCaixaaa'
      Required = True
    end
    object FDTableItensVendaidVendaAtual: TIntegerField
      FieldName = 'idVendaAtual'
      Origin = 'idVendaAtual'
      Required = True
    end
    object FDTableItensVendaformapagamento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'formapagamento'
      Origin = 'formapagamento'
      Size = 45
    end
  end
  object DSItensVendas: TDataSource
    DataSet = FDTableItensVenda
    Left = 634
    Top = 364
  end
  object FDQueryFatura: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    supermarket.Caixa.Caixa AS LocaldasVendas,'
      
        '    MIN(supermarket.ItensVenda.Valor * supermarket.ItensVenda.Qu' +
        'antidade) AS ValordaMenorVenda,'
      
        '    MAX(supermarket.ItensVenda.Valor * supermarket.ItensVenda.Qu' +
        'antidade) AS ValordaMaiorVenda,'
      
        '    SUM(supermarket.ItensVenda.Valor * supermarket.ItensVenda.Qu' +
        'antidade) AS TotaldasVendas'
      'FROM '
      '    supermarket.CaixasVendas'
      'JOIN '
      
        '    supermarket.Caixa ON supermarket.CaixasVendas.idCaixaa = sup' +
        'ermarket.Caixa.idCaixa'
      'JOIN '
      
        '    supermarket.ItensVenda ON supermarket.ItensVenda.idCaixaaa =' +
        ' supermarket.CaixasVendas.idCaixaa'
      'GROUP BY '
      '    supermarket.Caixa.Caixa'
      'ORDER BY '
      '    supermarket.Caixa.Caixa;')
    Left = 353
    Top = 582
  end
  object DSFatura: TDataSource
    DataSet = FDQueryFatura
    Left = 26
    Top = 451
  end
  object FDQueryProdutoVend: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT supermarket.Produto.nome AS Produto, SUM(supermarket.Iten' +
        'sVenda.Quantidade) AS QuantidadeVendida'
      'FROM supermarket.ItensVenda'
      
        'JOIN supermarket.Produto ON supermarket.ItensVenda.idProdutoo = ' +
        'supermarket.Produto.idProduto'
      'GROUP BY supermarket.Produto.idProduto'
      'ORDER BY QuantidadeVendida DESC'
      'LIMIT 1;'
      '')
    Left = 490
    Top = 581
  end
  object DSProdutoVend: TDataSource
    DataSet = FDQueryProdutoVend
    Left = 122
    Top = 451
  end
  object FDQueryProdutoVend2: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    supermarket.Produto.nome AS Produto, '
      '    SUM(supermarket.ItensVenda.Quantidade) AS QuantidadeVendida'
      'FROM '
      '    supermarket.ItensVenda'
      'JOIN '
      
        '    supermarket.Produto ON supermarket.ItensVenda.idProdutoo = s' +
        'upermarket.Produto.idProduto'
      'GROUP BY '
      '    supermarket.Produto.idProduto'
      'ORDER BY '
      '    QuantidadeVendida ASC'
      'LIMIT 1;'
      '')
    Left = 652
    Top = 581
  end
  object DSProdutoVend2: TDataSource
    DataSet = FDQueryProdutoVend2
    Left = 250
    Top = 451
  end
  object FDQueryValorTotal: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT CONCAT('#39'R$ '#39', FORMAT(SUM(supermarket.ItensVenda.Quantidad' +
        'e * CAST(supermarket.ItensVenda.Valor AS DECIMAL(10,2))), 2)) AS' +
        ' ValorTotalVendas'
      'FROM supermarket.ItensVenda;'
      '')
    Left = 748
    Top = 669
  end
  object DSTotalVendas: TDataSource
    DataSet = FDQueryValorTotal
    Left = 370
    Top = 451
  end
  object FDQueryClienteMasc: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT supermarket.Cliente.nome AS Nome,supermarket.Cliente.nasc' +
        'imento AS Nascimento,supermarket.Cliente.cidade AS Cidade,'
      
        'supermarket.Cliente.bairro AS Bairro,CONCAT('#39'R$ '#39', FORMAT(SUM(CA' +
        'ST(supermarket.ItensVenda.Valor AS DECIMAL(10,2))), 2)) AS '#39'Valo' +
        'r Total Gasto'#39
      'FROM supermarket.Cliente'
      
        'JOIN supermarket.ItensVenda ON supermarket.Cliente.idCliente = s' +
        'upermarket.ItensVenda.idClientee'
      'WHERE supermarket.Cliente.sexo = '#39'M'#39
      'GROUP BY supermarket.Cliente.idCliente'
      
        'ORDER BY SUM(CAST(supermarket.ItensVenda.Valor AS DECIMAL(10,2))' +
        ') DESC'
      'LIMIT 1;')
    Left = 23
    Top = 672
  end
  object DSClienteMasc: TDataSource
    DataSet = FDQueryClienteMasc
    Left = 482
    Top = 451
  end
  object FDQueryClienteFemin: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT supermarket.Cliente.nome AS Nome,supermarket.Cliente.nasc' +
        'imento AS Nascimento,supermarket.Cliente.cidade AS Cidade,'
      
        'supermarket.Cliente.bairro AS Bairro,CONCAT('#39'R$ '#39', FORMAT(SUM(CA' +
        'ST(supermarket.ItensVenda.Valor AS DECIMAL(10,2))), 2)) AS '#39'Valo' +
        'r Total Gasto'#39
      'FROM supermarket.Cliente'
      
        'JOIN supermarket.ItensVenda ON supermarket.Cliente.idCliente = s' +
        'upermarket.ItensVenda.idClientee'
      'WHERE supermarket.Cliente.sexo = '#39'F'#39
      'GROUP BY supermarket.Cliente.idCliente'
      
        'ORDER BY SUM(CAST(supermarket.ItensVenda.Valor AS DECIMAL(10,2))' +
        ') DESC'
      'LIMIT 1;')
    Left = 175
    Top = 672
  end
  object DSClienteFemin: TDataSource
    DataSet = FDQueryClienteFemin
    Left = 600
    Top = 450
  end
  object FDQueryBestClients: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT supermarket.Cliente.nome AS Nome,'
      '       supermarket.Cliente.cidade AS Cidade,'
      
        '       CONCAT('#39'R$ '#39', FORMAT(SUM(CAST(supermarket.ItensVenda.Valo' +
        'r AS DECIMAL(10,2))), 2)) AS '#39'Gastos'#39
      'FROM supermarket.Cliente'
      
        'JOIN supermarket.ItensVenda ON supermarket.Cliente.idCliente = s' +
        'upermarket.ItensVenda.idClientee'
      'GROUP BY supermarket.Cliente.idCliente'
      
        'ORDER BY SUM(CAST(supermarket.ItensVenda.Valor AS DECIMAL(10,2))' +
        ') DESC'
      'LIMIT 10;'
      ''
      '')
    Left = 325
    Top = 671
  end
  object DSBests: TDataSource
    DataSet = FDQueryBestClients
    Left = 696
    Top = 448
  end
  object FDQuerySalario: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT supermarket.funcionario.cpfl AS CPF,'
      '       supermarket.funcionario.nome AS Nome,'
      '       supermarket.funcionario.email AS Email,'
      
        '       CONCAT('#39'R$ '#39', FORMAT(supermarket.funcionario.salario, 2))' +
        ' AS Salario,'
      '       supermarket.funcionario.statusPagamento AS Status,'
      '       supermarket.funcionario.dataPagamento AS Data'
      'FROM supermarket.funcionario;'
      ''
      '')
    Left = 455
    Top = 670
  end
  object DSSalario: TDataSource
    DataSet = FDQuerySalario
    Left = 728
    Top = 363
  end
  object FDTableCompraFornece: TFDTable
    Active = True
    IndexFieldNames = 'CodCompra'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'supermarket.comprafornecedor'
    Left = 351
    Top = 206
  end
  object DSCompFornece: TDataSource
    DataSet = FDTableCompraFornece
    Left = 829
    Top = 363
  end
  object FDQueryFornecimento: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    fornecedor.nome AS Fornecedor,'
      '    produto.nome AS Produto, '
      '    comprafornecedor.Quantidade AS Quantidade,'
      
        '    CONCAT('#39'R$ '#39', FORMAT((produto.preco * comprafornecedor.Quant' +
        'idade), 2, '#39'pt_BR'#39')) AS Valor,'
      '    comprafornecedor.Data AS Data,'
      '    funcionario.nome AS Usuario'
      'FROM '
      '    comprafornecedor'
      'LEFT JOIN '
      
        '    fornecedor ON comprafornecedor.idFornecedor1 = fornecedor.id' +
        'Fornecedor'
      'LEFT JOIN '
      '    produto ON comprafornecedor.idProduto3 = produto.idProduto'
      'LEFT JOIN '
      
        '    funcionario ON comprafornecedor.idFuncionario4 = funcionario' +
        '.idFuncionario;'
      '')
    Left = 595
    Top = 670
  end
  object DSFornecimento: TDataSource
    DataSet = FDQueryFornecimento
    Left = 792
    Top = 447
  end
  object FDTableLancamentos: TFDTable
    Active = True
    IndexFieldNames = 'idlancamento'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'lancamentos'
    Left = 519
    Top = 206
  end
  object DSLancamentos: TDataSource
    DataSet = FDTableLancamentos
    Left = 916
    Top = 447
  end
  object FDQueryLancamentos: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT supermarket.funcionario.cpfl AS Cpf, supermarket.funciona' +
        'rio.nome AS Funcion'#225'rio,'
      
        'supermarket.lancamentos.DataInicio AS '#39'Data In'#237'cio'#39', supermarket' +
        '.lancamentos.DataFim AS '#39'Data Fim'#39','
      'supermarket.lancamentos.Tipo AS Tipo'
      'FROM supermarket.lancamentos'
      
        'JOIN supermarket.funcionario ON supermarket.lancamentos.idFuncio' +
        'nario6 = supermarket.funcionario.idFuncionario;'
      '')
    Left = 820
    Top = 581
  end
  object DSLancFun: TDataSource
    DataSet = FDQueryLancamentos
    Left = 940
    Top = 363
  end
  object FDQueryMaxID: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT MAX(idVendaAtual) AS IdVenda'
      'FROM itensvenda;')
    Left = 964
    Top = 581
  end
end
