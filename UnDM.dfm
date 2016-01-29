object DMtest: TDMtest
  OldCreateOrder = False
  Height = 401
  Width = 833
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=yprproj;Data Source=YPR-PC\SQLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from USERSHOWCOL')
    Left = 48
    Top = 120
  end
  object ADO_VFJD_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = ADO_VFJD_queryAfterOpen
    OnCalcFields = ADO_VFJD_queryCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from V_FJDATA')
    Left = 48
    Top = 64
    object ADO_VFJD_queryBARCODE: TStringField
      FieldName = 'BARCODE'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryFJDATE: TDateTimeField
      FieldName = 'FJDATE'
      ReadOnly = True
      DisplayFormat = 'yyyy-mm-dd'
    end
    object ADO_VFJD_queryFROMDATE: TDateTimeField
      FieldName = 'FROMDATE'
      ReadOnly = True
      DisplayFormat = 'yyyy-mm-dd'
    end
    object ADO_VFJD_queryFROMNAME: TStringField
      FieldName = 'FROMNAME'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryFROMADDR: TStringField
      FieldName = 'FROMADDR'
      ReadOnly = True
      Size = 256
    end
    object ADO_VFJD_queryFROMCO: TStringField
      FieldName = 'FROMCO'
      ReadOnly = True
      Size = 256
    end
    object ADO_VFJD_queryFROMDETAIL: TStringField
      FieldName = 'FROMDETAIL'
      ReadOnly = True
      Size = 256
    end
    object ADO_VFJD_queryFROMTEL: TStringField
      FieldName = 'FROMTEL'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryFROMZIPCODE: TStringField
      FieldName = 'FROMZIPCODE'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryTONAME: TStringField
      FieldName = 'TONAME'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryTOADDR: TStringField
      FieldName = 'TOADDR'
      ReadOnly = True
      Size = 256
    end
    object ADO_VFJD_queryTOCO: TStringField
      FieldName = 'TOCO'
      ReadOnly = True
      Size = 256
    end
    object ADO_VFJD_queryTODETAIL: TStringField
      FieldName = 'TODETAIL'
      ReadOnly = True
      Size = 256
    end
    object ADO_VFJD_queryTOTEL: TStringField
      FieldName = 'TOTEL'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryTOZIPCODE: TStringField
      FieldName = 'TOZIPCODE'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryPNAME: TStringField
      FieldName = 'PNAME'
      ReadOnly = True
      Size = 128
    end
    object ADO_VFJD_queryPNUMBER: TIntegerField
      FieldName = 'PNUMBER'
      ReadOnly = True
    end
    object ADO_VFJD_queryPWEIGHT: TBCDField
      FieldName = 'PWEIGHT'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object ADO_VFJD_queryPLENGTH: TBCDField
      FieldName = 'PLENGTH'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object ADO_VFJD_queryPWIDTH: TBCDField
      FieldName = 'PWIDTH'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object ADO_VFJD_queryPHEIGHT: TBCDField
      FieldName = 'PHEIGHT'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object ADO_VFJD_queryVOLUME: TBCDField
      FieldName = 'VOLUME'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object ADO_VFJD_queryPCOST: TBCDField
      FieldName = 'PCOST'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object ADO_VFJD_queryGUID: TIntegerField
      FieldName = 'GUID'
      ReadOnly = True
    end
    object ADO_VFJD_queryPSTATE: TIntegerField
      FieldName = 'PSTATE'
      ReadOnly = True
      OnGetText = ADO_VFJD_queryPSTATEGetText
    end
    object ADO_VFJD_queryLabBarCode: TStringField
      FieldName = 'LabBarCode'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryCODEIN: TStringField
      FieldName = 'CODEIN'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryUSERCODE: TStringField
      FieldName = 'USERCODE'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryPOUT2: TStringField
      FieldName = 'POUT2'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryPOUT: TStringField
      FieldName = 'POUT'
      ReadOnly = True
      Size = 32
    end
    object ADO_VFJD_queryUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 64
    end
  end
  object DSvfjd: TDataSource
    DataSet = ADO_VFJD_query
    Left = 144
    Top = 64
  end
  object DScommon: TDataSource
    DataSet = ADOQuery1
    Left = 144
    Top = 120
  end
  object DSvfjd2: TDataSource
    DataSet = ADO_VFJD2_query
    Left = 144
    Top = 184
  end
  object ADO_VFJD2_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = ADO_VFJD_queryAfterOpen
    OnCalcFields = ADO_VFJD_queryCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from V_FJDATA')
    Left = 48
    Top = 184
    object StringField1: TStringField
      FieldName = 'BARCODE'
      ReadOnly = True
      Size = 32
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'FJDATE'
      ReadOnly = True
      DisplayFormat = 'yyyy-mm-dd'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'FROMDATE'
      ReadOnly = True
      DisplayFormat = 'yyyy-mm-dd'
    end
    object StringField2: TStringField
      FieldName = 'FROMNAME'
      ReadOnly = True
      Size = 32
    end
    object StringField3: TStringField
      FieldName = 'FROMADDR'
      ReadOnly = True
      Size = 256
    end
    object StringField4: TStringField
      FieldName = 'FROMCO'
      ReadOnly = True
      Size = 256
    end
    object StringField5: TStringField
      FieldName = 'FROMDETAIL'
      ReadOnly = True
      Size = 256
    end
    object StringField6: TStringField
      FieldName = 'FROMTEL'
      ReadOnly = True
      Size = 32
    end
    object StringField7: TStringField
      FieldName = 'FROMZIPCODE'
      ReadOnly = True
      Size = 32
    end
    object StringField8: TStringField
      FieldName = 'TONAME'
      ReadOnly = True
      Size = 32
    end
    object StringField9: TStringField
      FieldName = 'TOADDR'
      ReadOnly = True
      Size = 256
    end
    object StringField10: TStringField
      FieldName = 'TOCO'
      ReadOnly = True
      Size = 256
    end
    object StringField11: TStringField
      FieldName = 'TODETAIL'
      ReadOnly = True
      Size = 256
    end
    object StringField12: TStringField
      FieldName = 'TOTEL'
      ReadOnly = True
      Size = 32
    end
    object StringField13: TStringField
      FieldName = 'TOZIPCODE'
      ReadOnly = True
      Size = 32
    end
    object StringField14: TStringField
      FieldName = 'PNAME'
      ReadOnly = True
      Size = 128
    end
    object IntegerField1: TIntegerField
      FieldName = 'PNUMBER'
      ReadOnly = True
    end
    object BCDField1: TBCDField
      FieldName = 'PWEIGHT'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object BCDField2: TBCDField
      FieldName = 'PLENGTH'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object BCDField3: TBCDField
      FieldName = 'PWIDTH'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object BCDField4: TBCDField
      FieldName = 'PHEIGHT'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object BCDField5: TBCDField
      FieldName = 'VOLUME'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object BCDField6: TBCDField
      FieldName = 'PCOST'
      ReadOnly = True
      Precision = 8
      Size = 2
    end
    object IntegerField2: TIntegerField
      FieldName = 'GUID'
      ReadOnly = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'PSTATE'
      ReadOnly = True
      OnGetText = ADO_VFJD_queryPSTATEGetText
    end
    object StringField15: TStringField
      FieldName = 'LabBarCode'
      ReadOnly = True
      Size = 32
    end
    object StringField16: TStringField
      FieldName = 'CODEIN'
      ReadOnly = True
      Size = 32
    end
    object StringField17: TStringField
      FieldName = 'USERCODE'
      ReadOnly = True
      Size = 32
    end
    object StringField18: TStringField
      FieldName = 'POUT2'
      ReadOnly = True
      Size = 32
    end
    object StringField19: TStringField
      FieldName = 'POUT'
      ReadOnly = True
      Size = 32
    end
    object StringField20: TStringField
      FieldName = 'USERNAME'
      Size = 64
    end
  end
  object ADO_URLG_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from USERLOG')
    Left = 40
    Top = 248
  end
  object DSuserlog: TDataSource
    DataSet = ADO_URLG_query
    Left = 144
    Top = 248
  end
  object ADO_ERLG_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from VALARMS')
    Left = 40
    Top = 312
  end
  object DSerrorlog: TDataSource
    DataSet = ADO_ERLG_query
    Left = 136
    Top = 312
  end
  object ADO_URGP_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADO_URGP_queryAfterScroll
    OnWillMove = ADO_URGP_queryWillMove
    OnMoveComplete = ADO_URGP_queryMoveComplete
    Parameters = <>
    SQL.Strings = (
      'select * from USERGROUPS')
    Left = 312
    Top = 64
  end
  object DSrole: TDataSource
    DataSet = ADO_URGP_query
    Left = 408
    Top = 64
  end
  object ADO_USER_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select A.CODE00,A.NAME00,A.PASSWD,A.GROUP0,B.NAME00,DATE00 from ' +
        'USERS A LEFT JOIN USERGROUPS B on A.GROUP0=B.CODE00'
      '')
    Left = 304
    Top = 128
  end
  object DSuser: TDataSource
    DataSet = ADO_USER_query
    Left = 408
    Top = 128
  end
  object ADO_ACTI_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from GROUPACT')
    Left = 304
    Top = 200
  end
  object DSaction: TDataSource
    DataSet = ADO_ACTI_query
    Left = 408
    Top = 200
  end
  object ADO_POUT_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterScroll = ADO_POUT_queryAfterScroll
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select * from PARAMOUT')
    Left = 304
    Top = 256
  end
  object DSpout: TDataSource
    DataSet = ADO_POUT_query
    Left = 408
    Top = 248
  end
  object ADO_PROP_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from OUTPROPER')
    Left = 304
    Top = 312
  end
  object DSproper: TDataSource
    DataSet = ADO_PROP_query
    Left = 408
    Top = 312
  end
  object ADO_PARA_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from PARAMETER')
    Left = 528
    Top = 64
  end
  object DSparameter: TDataSource
    DataSet = ADO_PARA_query
    Left = 624
    Top = 64
  end
  object ADO_PAIN_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from PARAMIN')
    Left = 528
    Top = 136
  end
  object DSin: TDataSource
    DataSet = ADO_PAIN_query
    Left = 624
    Top = 136
  end
  object ADO_OUTA_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADO_OUTA_queryAfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'select distinct POUT2,labbarcode from V_FJDATA where POUT2 is no' +
        't null and LabBarCode is not null and PSTATE<3'
      '')
    Left = 528
    Top = 200
  end
  object DSoutdata1: TDataSource
    DataSet = ADO_OUTA_query
    Left = 616
    Top = 200
  end
  object ADO_OUTB_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from V_FJDATA where PSTATE<3'
      '')
    Left = 528
    Top = 264
  end
  object DSoutdata2: TDataSource
    DataSet = ADO_OUTB_query
    Left = 616
    Top = 264
  end
  object ADO_INDA_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from OUTPROPER'
      '')
    Left = 528
    Top = 328
  end
  object DSindata: TDataSource
    DataSet = ADO_INDA_query
    Left = 616
    Top = 328
  end
  object ADO_THRD_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select cou1,cou2 from (SELECT '#39'1'#39' id,count(BARCODE) cou1 FROM FJ' +
        'DATA where PSTATE>1) a,(SELECT '#39'1'#39' id,count(BARCODE) cou2 FROM F' +
        'JDATA) b where a.id=b.id'
      ''
      ''
      '')
    Left = 712
    Top = 64
  end
  object ADO_MONI_query: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from PARAMETER'
      ''
      ''
      '')
    Left = 712
    Top = 128
  end
end
