unit UnDM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ProjYPR_TLB, StdVcl, Data.DB, Data.Win.ADODB;

type
  TDMtest = class(TRemoteDataModule, IDMtest)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADO_VFJD_query: TADOQuery;
    DSvfjd: TDataSource;
    ADO_VFJD_queryBARCODE: TStringField;
    ADO_VFJD_queryFJDATE: TDateTimeField;
    ADO_VFJD_queryFROMDATE: TDateTimeField;
    ADO_VFJD_queryFROMNAME: TStringField;
    ADO_VFJD_queryFROMADDR: TStringField;
    ADO_VFJD_queryFROMCO: TStringField;
    ADO_VFJD_queryFROMDETAIL: TStringField;
    ADO_VFJD_queryFROMTEL: TStringField;
    ADO_VFJD_queryFROMZIPCODE: TStringField;
    ADO_VFJD_queryTONAME: TStringField;
    ADO_VFJD_queryTOADDR: TStringField;
    ADO_VFJD_queryTOCO: TStringField;
    ADO_VFJD_queryTODETAIL: TStringField;
    ADO_VFJD_queryTOTEL: TStringField;
    ADO_VFJD_queryTOZIPCODE: TStringField;
    ADO_VFJD_queryPNAME: TStringField;
    ADO_VFJD_queryPNUMBER: TIntegerField;
    ADO_VFJD_queryPWEIGHT: TBCDField;
    ADO_VFJD_queryPLENGTH: TBCDField;
    ADO_VFJD_queryPWIDTH: TBCDField;
    ADO_VFJD_queryPHEIGHT: TBCDField;
    ADO_VFJD_queryVOLUME: TBCDField;
    ADO_VFJD_queryPCOST: TBCDField;
    ADO_VFJD_queryGUID: TIntegerField;
    ADO_VFJD_queryPSTATE: TIntegerField;
    ADO_VFJD_queryLabBarCode: TStringField;
    ADO_VFJD_queryCODEIN: TStringField;
    ADO_VFJD_queryUSERCODE: TStringField;
    ADO_VFJD_queryPOUT2: TStringField;
    ADO_VFJD_queryPOUT: TStringField;
    ADO_VFJD_queryUSERNAME: TStringField;
    DScommon: TDataSource;
    DSvfjd2: TDataSource;
    ADO_VFJD2_query: TADOQuery;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    IntegerField1: TIntegerField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    ADO_URLG_query: TADOQuery;
    DSuserlog: TDataSource;
    ADO_ERLG_query: TADOQuery;
    DSerrorlog: TDataSource;
    ADO_URGP_query: TADOQuery;
    DSrole: TDataSource;
    ADO_USER_query: TADOQuery;
    DSuser: TDataSource;
    ADO_ACTI_query: TADOQuery;
    DSaction: TDataSource;
    ADO_POUT_query: TADOQuery;
    DSpout: TDataSource;
    ADO_PROP_query: TADOQuery;
    DSproper: TDataSource;
    ADO_PARA_query: TADOQuery;
    DSparameter: TDataSource;
    ADO_PAIN_query: TADOQuery;
    DSin: TDataSource;
    ADO_OUTA_query: TADOQuery;
    DSoutdata1: TDataSource;
    ADO_OUTB_query: TADOQuery;
    DSoutdata2: TDataSource;
    ADO_INDA_query: TADOQuery;
    DSindata: TDataSource;
    ADO_THRD_query: TADOQuery;
    ADO_MONI_query: TADOQuery;
    procedure ADO_VFJD_queryBeforeOpen(DataSet: TDataSet);
    procedure ADO_VFJD_queryAfterOpen(DataSet: TDataSet);
    procedure ADO_VFJD_queryCalcFields(DataSet: TDataSet);
    procedure ADO_VFJD_queryPSTATEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADO_SC_querySHOW00GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADO_URGP_queryMoveComplete(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const Error: Error;
      var EventStatus: TEventStatus);
    procedure ADO_URGP_queryWillMove(DataSet: TCustomADODataSet;
      const Reason: TEventReason; var EventStatus: TEventStatus);
    procedure ADO_URGP_queryAfterScroll(DataSet: TDataSet);
    procedure ADO_POUT_queryAfterScroll(DataSet: TDataSet);
    procedure ADO_OUTA_queryAfterScroll(DataSet: TDataSet);
    private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;
var
  DM:TDMtest;
implementation

{$R *.DFM}

procedure TDMtest.ADO_OUTA_queryAfterScroll(DataSet: TDataSet);
begin
  //use Fliter to show
  ADO_OUTB_query.Filter:='labbarcode='+''''+ADO_OUTA_query.FieldByName('labbarcode').AsString+'''';
end;

procedure TDMtest.ADO_POUT_queryAfterScroll(DataSet: TDataSet);
begin
  ADO_PROP_query.Filter:='OUT000='+''''+ADO_POUT_query.FieldByName('CODE00').AsString+'''';
end;

procedure TDMtest.ADO_SC_querySHOW00GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
//  if sender.AsInteger=0 then
//    DisplayText:=false
//  else if sender.AsInteger=1 then
//    DisplayText:=true
end;

procedure TDMtest.ADO_URGP_queryAfterScroll(DataSet: TDataSet);
begin
  ADO_ACTI_query.Filter:='CODE00='+''''+ADO_URGP_query.FieldByName('CODE00').AsString+'''';
end;

procedure TDMtest.ADO_URGP_queryMoveComplete(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const Error: Error;
  var EventStatus: TEventStatus);
begin
//ADO_ACTI_query.Filter:='CODE00='+''''+ADO_URGP_query.FieldByName('CODE00').AsString+'''';
end;

procedure TDMtest.ADO_URGP_queryWillMove(DataSet: TCustomADODataSet;
  const Reason: TEventReason; var EventStatus: TEventStatus);
begin
//ADO_ACTI_query.Filter:='CODE00='+''''+ADO_URGP_query.FieldByName('CODE00').AsString+'''';
end;

procedure TDMtest.ADO_VFJD_queryAfterOpen(DataSet: TDataSet);
begin

//  TDateTimefield(ADO_VFJD_query.Fields[2]).displayformat:='yyyy-mm-dd';
//  TDateTimefield(ADO_VFJD_query.Fields[1]).displayformat:='yyyy-mm-dd';
end;

procedure TDMtest.ADO_VFJD_queryBeforeOpen(DataSet: TDataSet);
begin
//  TDateTimefield(ADO_VFJD_query.Fields[2]).displayformat:='yyyy-mm-dd';
//  TDateTimefield(ADO_VFJD_query.Fields[1]).displayformat:='yyyy-mm-dd';
end;

procedure TDMtest.ADO_VFJD_queryCalcFields(DataSet: TDataSet);
begin
//  if ADO_VFJD_query.Fields[24].Value=1 then
//     ADO_VFJD_query.Fields[24].Value:='a';
end;

procedure TDMtest.ADO_VFJD_queryPSTATEGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  //in DB the value may be 0,1,2 and so on
  //in GRID we want to dispaly string like 'begin' 'end' 'go on'
  // use GETTEST to change display as follow
  // add by dendi 2016/2/1

  if sender.AsInteger=0 then
    text:='未开始'
  else if sender.AsInteger=1 then
    text:='已扫描'
  else if sender.AsInteger=2 then
    text:='已分拣'
  else
    text:='已打印'


end;

class procedure TDMtest.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TDMtest,
    Class_DMtest, ciMultiInstance, tmApartment);
end.
