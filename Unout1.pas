unit Unout1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Grids, Vcl.DBGrids,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxLabel, cxCheckBox;

type
  TFormout = class(TForm)
    Panel1: TPanel;
    Btnadd: TButton;
    Btnclose: TButton;
    Panel2: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Btnedit: TButton;
    Label1: TLabel;
    Label2: TLabel;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    Btndel: TButton;
    cxGrid1DBTableView1CODE00: TcxGridDBColumn;
    cxGrid1DBTableView1NAME00: TcxGridDBColumn;
    cxGrid1DBTableView1MAX000: TcxGridDBColumn;
    cxGrid1DBTableView1TYPE00: TcxGridDBColumn;
    cxGrid1DBTableView1STAT00: TcxGridDBColumn;
    cxGrid2DBTableView1PROPER: TcxGridDBColumn;
    cxGrid2DBTableView1DESC00: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtncloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid1DBTableView1FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure BtneditClick(Sender: TObject);
    procedure BtnaddClick(Sender: TObject);
    procedure BtndelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formout: TFormout;
  save:integer;

implementation

{$R *.dfm}

uses UnDM, UnMain, Unproperedit;

procedure TFormout.BtnaddClick(Sender: TObject);
begin
if (DM.ADO_POUT_query.FieldByName('TYPE00').AsString = '异常出口') then
  begin
    Application.MessageBox('异常出口，不需要设置特征码','提示',MB_OK);
    Exit;
  end;

DM.ADO_PROP_query.Append;
DM.ADO_PROP_query.FieldByName('OUT000').AsString:=DM.ADO_POUT_query.FieldByName('CODE00').AsString;
  if not assigned(Formproperedit) then
    begin
     Application.CreateForm(TFormproperedit, Formproperedit);
     Formproperedit.ShowModal;
    end
  else
    Formproperedit.ShowModal;
//    DM.ADO_URGP_query.Edit;
    //freeandnil(Formshowcol);
    if save=1 then
      FormMain.RecordLog('添加特征码:'+DM.ADO_PROP_query.FieldByName('PROPER').AsString);
    Formproperedit.Free;
    Formproperedit:=nil;

{
  try
      with DM.ADOQuery1 do
        begin
          close;
          sql.Clear;
          sql.Add('INSERT INTO GROUPACT(CODE00,ACTNAME,CNNAME,CHOOSE) SELECT ');
          sql.Add(':code1,ACTNAME,CNNAME,''1'' FROM  ACTIONS WHERE ACTNAME NOT IN(SELECT ACTNAME FROM GROUPACT WHERE CODE00=:code2)');
  //        sql.Add('select * from GROUPACT where CODE00=:code');
          Parameters.ParamByName('code1').Value:=DM.ADO_URGP_query.FieldByName('CODE00').AsString;
          Parameters.ParamByName('code2').Value:=DM.ADO_URGP_query.FieldByName('CODE00').AsString;
          ExecSQL;
         end;
    except
       Application.MessageBox('无法连接数据库3','提示', MB_OK);
    end;

    DM.ADO_ACTI_query.Close;
    DM.ADO_ACTI_query.Open;
  }
end;

procedure TFormout.BtncloseClick(Sender: TObject);
begin
//  Btnsave.Click;
  Formproper.close;
end;

procedure TFormout.BtndelClick(Sender: TObject);
begin
//
 if DM.ADO_PROP_query.RecordCount>0 then
    begin
      if Application.MessageBox('确定删除选定特征码？ ','确认',MB_YESNO) = 6 then
        begin

          Formmain.RecordLog('删除特征码:'+DM.ADO_PROP_query.FieldByName('PROPER').AsString);
          DM.ADO_PROP_query.Delete;

        end;
    end;

end;

procedure TFormout.BtneditClick(Sender: TObject);
begin
//  cxGrid2DBTableView1.DataController.FocusedRecordIndex := 1;
//  cxGrid2DBTableView1.DataController.FocusedRecordIndex := 0;
if DM.ADO_PROP_query.RecordCount>0 then
BEGIN
DM.ADO_PROP_query.Edit;
  if not assigned(Formproperedit) then
    begin
     Application.CreateForm(TFormproperedit, Formproperedit);
     Formproperedit.ShowModal;
    end
  else
    Formproperedit.ShowModal;
//    DM.ADO_URGP_query.Edit;
    //freeandnil(Formshowcol);
    if save=1 then
      FormMain.RecordLog('编辑特征码:'+DM.ADO_PROP_query.FieldByName('PROPER').AsString);
    Formproperedit.Free;
    Formproperedit:=nil;
END;
end;

procedure TFormout.cxGrid1DBTableView1FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
//  DM.ADO_ACTI_query.Close;
//  DM.ADO_ACTI_query.Parameters.ParamByName('code').Value:=DM.ADO_URGP_query.FieldByName('CODE00').AsString;
  //DM.ADO_ACTI_query.Close;
//  DM.ADO_ACTI_query.Open;
end;

procedure TFormout.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  //showmessage('1');
//  if DM.ADO_URGP_query.Active then
//    begin
//      DM.ADO_ACTI_query.Close;
//      DM.ADO_ACTI_query.Parameters.ParamByName('code').Value:=DM.ADO_URGP_query.FieldByName('CODE00').AsString;
//      //DM.ADO_ACTI_query.Close;
//      DM.ADO_ACTI_query.Open;
//    end;
end;

procedure TFormout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formproper.Free;
   Formproper:=nil;
end;

procedure TFormout.FormCreate(Sender: TObject);
begin
//  DateTimePicker1.Date:=now();
//  DateTimePicker2.Date:=now();
end;

procedure TFormout.FormShow(Sender: TObject);
begin
  if not DM.ADO_POUT_query.Active then
  begin
    try
      with DM.ADO_POUT_query do
        begin
          close;
//          sql.Clear;
  //        sql.Add('select * from VALARMS');
//          sql.Add('select * from USERGROUPS');
          open;
         end;
    except
       Application.MessageBox('无法连接数据库1','提示', MB_OK);
    end;
  end;

  try
      with DM.ADO_PROP_query do
        begin
          close;
  //        sql.Clear;
 //         sql.Add('select * from GROUPACT');
  //        sql.Add('select * from GROUPACT where CODE00=:code');
  //        Parameters.ParamByName('code').Value:=DM.ADO_URGP_query.FieldByName('CODE00').AsString;
          open;
         end;
    except
       Application.MessageBox('无法连接数据库2','提示', MB_OK);
    end;

//    cxGrid2DBTableView1.DataController.Filter.Root.Clear;
//    cxGrid2DBTableView1.DataController.Filter.Root.AddItem(cxGrid2DBTableView1.GetColumnByFieldName('CODE00'),folike,DM.ADO_URGP_query.FieldByName('CODE00').AsString,DM.ADO_URGP_query.FieldByName('CODE00').AsString);
//    cxGrid2DBTableView1.DataController.Filter.Active:=true;

//      DM.ADO_ACTI_query.Filter:='CODE00='+''''+DM.ADO_URGP_query.FieldByName('CODE00').AsString+'''';
//      DM.ADO_ACTI_query.Filtered:=true;

end;


end.
