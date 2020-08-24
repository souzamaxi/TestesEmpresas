object dmPessoas: TdmPessoas
  OldCreateOrder = False
  Height = 454
  Width = 681
  object sqlPqPessoas: TSQLDataSet
    CommandText = 
      'SELECT TIT.IDTITULAR, TIT.NMTITULAR, TIT.NOCNPJCPF, TIT.STATIVO,' +
      ' EMP.NMEMPRESA FROM CADTITULAR TIT'#13#10'LEFT JOIN CADEMPRESA EMP ON ' +
      '(TIT.IDEMPRESA = EMP.IDEMPRESA)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.Conexao
    Left = 64
    Top = 16
  end
  object dspPqPessoas: TDataSetProvider
    DataSet = sqlPqPessoas
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 16
  end
  object cdsPqPessoas: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT TIT.IDTITULAR, TIT.NMTITULAR, TIT.NOCNPJCPF, TIT.STATIVO,' +
      ' EMP.NMEMPRESA FROM CADTITULAR TIT'#13#10'LEFT JOIN CADEMPRESA EMP ON ' +
      '(TIT.IDEMPRESA = EMP.IDEMPRESA)'
    Params = <>
    ProviderName = 'dspPqPessoas'
    Left = 336
    Top = 16
    object cdsPqPessoasIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
      Required = True
    end
    object cdsPqPessoasNMTITULAR: TStringField
      FieldName = 'NMTITULAR'
      Size = 100
    end
    object cdsPqPessoasNOCNPJCPF: TStringField
      FieldName = 'NOCNPJCPF'
      Size = 18
    end
    object cdsPqPessoasSTATIVO: TStringField
      FieldName = 'STATIVO'
      OnGetText = cdsPqPessoasSTATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsPqPessoasNMEMPRESA: TStringField
      FieldName = 'NMEMPRESA'
      Size = 100
    end
  end
  object dspCadPessoa: TDataSetProvider
    DataSet = sqlCadPessoa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 72
  end
  object cdsCadPessoa: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CADTITULAR WHERE IDTITULAR = :IDTITULAR'
    Params = <
      item
        DataType = ftWideString
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '-1'
      end>
    ProviderName = 'dspCadPessoa'
    AfterOpen = cdsCadPessoaAfterOpen
    AfterClose = cdsCadPessoaAfterClose
    AfterPost = cdsCadPessoaAfterPost
    Left = 336
    Top = 72
    object cdsCadPessoaIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
    end
    object cdsCadPessoaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Required = True
    end
    object cdsCadPessoaNMTITULAR: TStringField
      FieldName = 'NMTITULAR'
      Size = 100
    end
    object cdsCadPessoaNOCNPJCPF: TStringField
      FieldName = 'NOCNPJCPF'
      OnGetText = cdsCadPessoaNOCNPJCPFGetText
      Size = 18
    end
    object cdsCadPessoaNOINCRICAORG: TStringField
      FieldName = 'NOINCRICAORG'
      Size = 15
    end
    object cdsCadPessoaDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsCadPessoaDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsCadPessoaTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Size = 100
    end
    object cdsCadPessoaTXOBS: TStringField
      FieldName = 'TXOBS'
      Size = 1000
    end
    object cdsCadPessoaTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      OnGetText = cdsCadPessoaTLRESIDENCIALGetText
      Size = 15
    end
    object cdsCadPessoaTLCOMERCIAL: TStringField
      FieldName = 'TLCOMERCIAL'
      OnGetText = cdsCadPessoaTLCOMERCIALGetText
      Size = 15
    end
    object cdsCadPessoaTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      OnGetText = cdsCadPessoaTLCELULARGetText
      Size = 15
    end
    object cdsCadPessoaTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      OnGetText = cdsCadPessoaTLCONTATOGetText
      Size = 15
    end
    object cdsCadPessoaNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Size = 50
    end
    object cdsCadPessoaSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object cdsCadPessoaDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
    object cdsCadPessoaSTATIVO: TStringField
      FieldName = 'STATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object sqlCadPessoa: TSQLDataSet
    CommandText = 'SELECT * FROM CADTITULAR WHERE IDTITULAR = :IDTITULAR'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Name = 'IDTITULAR'
        ParamType = ptInput
        Value = '-1'
      end>
    SQLConnection = dmPrincipal.Conexao
    Left = 64
    Top = 72
    object sqlCadPessoaIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCadPessoaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Required = True
    end
    object sqlCadPessoaNMTITULAR: TStringField
      FieldName = 'NMTITULAR'
      Size = 100
    end
    object sqlCadPessoaNOCNPJCPF: TStringField
      FieldName = 'NOCNPJCPF'
      Size = 18
    end
    object sqlCadPessoaNOINCRICAORG: TStringField
      FieldName = 'NOINCRICAORG'
      Size = 15
    end
    object sqlCadPessoaDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object sqlCadPessoaDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object sqlCadPessoaTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Size = 100
    end
    object sqlCadPessoaTXOBS: TStringField
      FieldName = 'TXOBS'
      Size = 1000
    end
    object sqlCadPessoaTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      Size = 15
    end
    object sqlCadPessoaTLCOMERCIAL: TStringField
      FieldName = 'TLCOMERCIAL'
      Size = 15
    end
    object sqlCadPessoaTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Size = 15
    end
    object sqlCadPessoaTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      Size = 15
    end
    object sqlCadPessoaNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Size = 50
    end
    object sqlCadPessoaSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object sqlCadPessoaDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
    object sqlCadPessoaSTATIVO: TStringField
      FieldName = 'STATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dspComboEmpresa: TDataSetProvider
    DataSet = sqlComboEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 128
  end
  object cdsComboEmpresa: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT EMP.IDEMPRESA, EMP.NMEMPRESA FROM CADEMPRESA EMP ORDER BY' +
      ' EMP.NMEMPRESA'
    Params = <>
    ProviderName = 'dspComboEmpresa'
    Left = 336
    Top = 128
    object cdsComboEmpresaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Required = True
    end
    object cdsComboEmpresaNMEMPRESA: TStringField
      FieldName = 'NMEMPRESA'
      Size = 100
    end
  end
  object sqlComboEmpresa: TSQLDataSet
    CommandText = 
      'SELECT EMP.IDEMPRESA, EMP.NMEMPRESA FROM CADEMPRESA EMP ORDER BY' +
      ' EMP.NMEMPRESA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.Conexao
    Left = 64
    Top = 128
  end
  object sqlDetEndereco: TSQLDataSet
    CommandText = 
      'SELECT ENDE.IDENDERECO, ENDE.NMENDERECO, ENDE.NOENDERECO, ENDE.N' +
      'OCEP, CID.NMCIDADE, UF.SGESTADO FROM CADENDERECOS ENDE'#13#10'LEFT JOI' +
      'N CADCIDADE CID ON (ENDE.IDCIDADE = CID.IDCIDADE)'#13#10'LEFT JOIN CAD' +
      'UF UF ON (ENDE.IDUF = UF.IDUF)'#13#10'WHERE ENDE.IDTITULAR = :IDTITULA' +
      'R'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Name = 'IDTITULAR'
        ParamType = ptInput
        Value = '-1'
      end>
    SQLConnection = dmPrincipal.Conexao
    Left = 64
    Top = 184
  end
  object sqlCadEndereco: TSQLDataSet
    CommandText = 'SELECT * FROM CADENDERECOS WHERE IDENDERECO = :IDENDERECO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Name = 'IDENDERECO'
        ParamType = ptInput
        Value = '-1'
      end>
    SQLConnection = dmPrincipal.Conexao
    Left = 64
    Top = 240
    object sqlCadEnderecoIDENDERECO: TIntegerField
      FieldName = 'IDENDERECO'
    end
    object sqlCadEnderecoIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
    end
    object sqlCadEnderecoNMENDERECO: TStringField
      FieldName = 'NMENDERECO'
      Size = 100
    end
    object sqlCadEnderecoNOENDERECO: TStringField
      FieldName = 'NOENDERECO'
      Size = 10
    end
    object sqlCadEnderecoNMBAIRRO: TStringField
      FieldName = 'NMBAIRRO'
      Size = 50
    end
    object sqlCadEnderecoIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object sqlCadEnderecoIDUF: TIntegerField
      FieldName = 'IDUF'
    end
    object sqlCadEnderecoNOCEP: TStringField
      FieldName = 'NOCEP'
      Size = 10
    end
    object sqlCadEnderecoSTATIVO: TStringField
      FieldName = 'STATIVO'
      FixedChar = True
      Size = 1
    end
    object sqlCadEnderecoSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object sqlCadEnderecoDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
    object sqlCadEnderecoTPCADASTRO: TStringField
      FieldName = 'TPCADASTRO'
      FixedChar = True
      Size = 1
    end
    object sqlCadEnderecoIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
    end
  end
  object dspDetEndereco: TDataSetProvider
    DataSet = sqlDetEndereco
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 184
  end
  object dspCadEndereco: TDataSetProvider
    DataSet = sqlCadEndereco
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 240
  end
  object cdsDetEndereco: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT ENDE.IDENDERECO, ENDE.NMENDERECO, ENDE.NOENDERECO, ENDE.N' +
      'OCEP, CID.NMCIDADE, UF.SGESTADO FROM CADENDERECOS ENDE'#13#10'LEFT JOI' +
      'N CADCIDADE CID ON (ENDE.IDCIDADE = CID.IDCIDADE)'#13#10'LEFT JOIN CAD' +
      'UF UF ON (ENDE.IDUF = UF.IDUF)'#13#10'WHERE ENDE.IDTITULAR = :IDTITULA' +
      'R AND (ENDE.STEXCLUIDO = '#39'N'#39' OR ENDE.STEXCLUIDO IS NULL) AND END' +
      'E.TPCADASTRO = '#39'P'#39
    Params = <
      item
        DataType = ftWideString
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '-1'
      end>
    ProviderName = 'dspDetEndereco'
    Left = 336
    Top = 184
    object cdsDetEnderecoNMENDERECO: TStringField
      FieldName = 'NMENDERECO'
      Size = 100
    end
    object cdsDetEnderecoNOENDERECO: TStringField
      FieldName = 'NOENDERECO'
      Size = 10
    end
    object cdsDetEnderecoNOCEP: TStringField
      FieldName = 'NOCEP'
      Size = 10
    end
    object cdsDetEnderecoNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Size = 100
    end
    object cdsDetEnderecoSGESTADO: TStringField
      FieldName = 'SGESTADO'
      FixedChar = True
      Size = 3
    end
    object cdsDetEnderecoIDENDERECO: TIntegerField
      FieldName = 'IDENDERECO'
      Required = True
    end
  end
  object cdsCadEnderecoPessoa: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CADENDERECOS WHERE IDENDERECO = :IDENDERECO'
    Params = <
      item
        DataType = ftWideString
        Name = 'IDENDERECO'
        ParamType = ptUnknown
        Value = '-1'
      end>
    ProviderName = 'dspCadEndereco'
    AfterOpen = cdsCadEnderecoPessoaAfterOpen
    Left = 336
    Top = 240
    object cdsCadEnderecoPessoaIDENDERECO: TIntegerField
      FieldName = 'IDENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsCadEnderecoPessoaIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
    end
    object cdsCadEnderecoPessoaNMENDERECO: TStringField
      FieldName = 'NMENDERECO'
      Size = 100
    end
    object cdsCadEnderecoPessoaNOENDERECO: TStringField
      FieldName = 'NOENDERECO'
      Size = 10
    end
    object cdsCadEnderecoPessoaNMBAIRRO: TStringField
      FieldName = 'NMBAIRRO'
      Size = 50
    end
    object cdsCadEnderecoPessoaIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object cdsCadEnderecoPessoaIDUF: TIntegerField
      FieldName = 'IDUF'
    end
    object cdsCadEnderecoPessoaNOCEP: TStringField
      FieldName = 'NOCEP'
      Size = 10
    end
    object cdsCadEnderecoPessoaSTATIVO: TStringField
      FieldName = 'STATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsCadEnderecoPessoaSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object cdsCadEnderecoPessoaDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
    object cdsCadEnderecoPessoaTPCADASTRO: TStringField
      FieldName = 'TPCADASTRO'
      FixedChar = True
      Size = 1
    end
    object cdsCadEnderecoPessoaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
    end
  end
  object dspComboCidade: TDataSetProvider
    DataSet = sqlComboCidade
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 296
  end
  object dspComboUF: TDataSetProvider
    DataSet = sqlComboUF
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 352
  end
  object cdsComboCidade: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CADCIDADE CID ORDER BY CID.NMCIDADE'
    Params = <>
    ProviderName = 'dspComboCidade'
    Left = 336
    Top = 296
    object cdsComboCidadeIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Required = True
    end
    object cdsComboCidadeNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Size = 100
    end
    object cdsComboCidadeIDUF: TIntegerField
      FieldName = 'IDUF'
      Required = True
    end
    object cdsComboCidadeNOIBGE: TStringField
      FieldName = 'NOIBGE'
      Size = 7
    end
  end
  object cdsComboUF: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CADUF EST ORDER BY EST.SGESTADO'
    Params = <>
    ProviderName = 'dspComboUF'
    Left = 336
    Top = 352
    object cdsComboUFIDUF: TIntegerField
      FieldName = 'IDUF'
      Required = True
    end
    object cdsComboUFNMESTADO: TStringField
      FieldName = 'NMESTADO'
      Size = 50
    end
    object cdsComboUFSGESTADO: TStringField
      FieldName = 'SGESTADO'
      FixedChar = True
      Size = 3
    end
  end
  object sqlComboCidade: TSQLDataSet
    CommandText = 'SELECT * FROM CADCIDADE CID ORDER BY CID.NMCIDADE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.Conexao
    Left = 64
    Top = 296
  end
  object sqlComboUF: TSQLDataSet
    CommandText = 'SELECT * FROM CADUF EST ORDER BY EST.SGESTADO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.Conexao
    Left = 64
    Top = 352
  end
end
