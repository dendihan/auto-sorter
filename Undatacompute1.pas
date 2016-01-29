unit Undatacompute1;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxLabel;

type
  TFormdatacompute = class(TForm)
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Btnget: TButton;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1BARCODE: TcxGridDBColumn;
    cxGrid1DBTableView1FJDATE: TcxGridDBColumn;
    cxGrid1DBTableView1FROMDATE: TcxGridDBColumn;
    cxGrid1DBTableView1FROMNAME: TcxGridDBColumn;
    cxGrid1DBTableView1FROMADDR: TcxGridDBColumn;
    cxGrid1DBTableView1FROMCO: TcxGridDBColumn;
    cxGrid1DBTableView1FROMDETAIL: TcxGridDBColumn;
    cxGrid1DBTableView1FROMTEL: TcxGridDBColumn;
    cxGrid1DBTableView1FROMZIPCODE: TcxGridDBColumn;
    cxGrid1DBTableView1TONAME: TcxGridDBColumn;
    cxGrid1DBTableView1TOADDR: TcxGridDBColumn;
    cxGrid1DBTableView1TOCO: TcxGridDBColumn;
    cxGrid1DBTableView1TODETAIL: TcxGridDBColumn;
    cxGrid1DBTableView1TOTEL: TcxGridDBColumn;
    cxGrid1DBTableView1TOZIPCODE: TcxGridDBColumn;
    cxGrid1DBTableView1PNAME: TcxGridDBColumn;
    cxGrid1DBTableView1PNUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1PWEIGHT: TcxGridDBColumn;
    cxGrid1DBTableView1PLENGTH: TcxGridDBColumn;
    cxGrid1DBTableView1PWIDTH: TcxGridDBColumn;
    cxGrid1DBTableView1PHEIGHT: TcxGridDBColumn;
    cxGrid1DBTableView1VOLUME: TcxGridDBColumn;
    cxGrid1DBTableView1PCOST: TcxGridDBColumn;
    cxGrid1DBTableView1GUID: TcxGridDBColumn;
    cxGrid1DBTableView1PSTATE: TcxGridDBColumn;
    cxGrid1DBTableView1LabBarCode: TcxGridDBColumn;
    cxGrid1DBTableView1CODEIN: TcxGridDBColumn;
    cxGrid1DBTableView1USERCODE: TcxGridDBColumn;
    cxGrid1DBTableView1POUT2: TcxGridDBColumn;
    cxGrid1DBTableView1POUT: TcxGridDBColumn;
    cxGrid1DBTableView1USERNAME: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtngetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formdatacompute: TFormdatacompute;

implementation

{$R *.dfm}

uses UnDM, UnMain;

procedure TFormdatacompute.BtngetClick(Sender: TObject);
begin
  try
    with DM.ADO_VFJD_query do
      begin
        close;
        sql.Clear;
        sql.Add('select * from V_FJDATA where convert(varchar(10),FJDATE,23) between :fjdt1 and :fjdt2');
        Parameters.ParamByName('fjdt1').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker1.Date);
        Parameters.ParamByName('fjdt2').Value:=formatdatetime('yyyy-mm-dd',DateTimePicker2.Date);
        open;
       end;
  except
     Application.MessageBox('�޷��������ݿ�','��ʾ', MB_OK);
  end;
end;

procedure TFormdatacompute.Button2Click(Sender: TObject);
begin
  Formdatacompute.close;
end;

procedure TFormdatacompute.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formdatacompute.Free;
   Formdatacompute:=nil;
end;

procedure TFormdatacompute.FormCreate(Sender: TObject);
begin
//  DateTimePicker1.Date:=now();
//  DateTimePicker2.Date:=now();
end;

procedure TFormdatacompute.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=now();
  DateTimePicker2.Date:=now();
  Btnget.Click;
//  TDateTimefield(DM.ADO_VFJD_query.Fields[2]).displayformat:='yyyy-mm-dd';
end;

end.
