unit UnMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, Vcl.ActnMan, Vcl.ActnCtrls, IdBaseComponent, IdComponent,
  IdIPWatch, IdIPAddrMon, IdCustomTCPServer, IdTCPServer,Data.DB, Data.Win.ADODB, shellapi,
  System.Actions, Vcl.ActnList, IdAntiFreezeBase, Vcl.IdAntiFreeze,winspool;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    TBgetdate: TToolButton;
    ToolButton2: TToolButton;
    TBmonitor: TToolButton;
    ToolButton4: TToolButton;
    TBinner: TToolButton;
    ToolButton6: TToolButton;
    TBouter: TToolButton;
    ToolButton8: TToolButton;
    TBdatacompute: TToolButton;
    StatusBar1: TStatusBar;
    IdIPWatch1: TIdIPWatch;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N12: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    ActionList1: TActionList;
    Actgetdata: TAction;
    Actmonitor: TAction;
    Actin: TAction;
    Actout: TAction;
    Actquery: TAction;
    Actevent: TAction;
    Actalert: TAction;
    Actrole: TAction;
    Actuser: TAction;
    ActPermission: TAction;
    Actparam: TAction;
    Acthelp: TAction;
    IdAntiFreeze1: TIdAntiFreeze;
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TBgetdateClick(Sender: TObject);
    procedure TBmonitorClick(Sender: TObject);
    procedure TBinnerClick(Sender: TObject);
    procedure TBouterClick(Sender: TObject);
    procedure TBdatacomputeClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N15Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure RecordLog(loginfo: string);
    procedure ErrorLog(loginfo: string);
    procedure enableaction;

end;


function WriteRawStringToPrinter(PrinterName: String; S: String) : integer;
function PrtChnStr(x, y: Integer; fontname: ansistring; height, xmf, ymf: Integer; chnstr: ansistring): ansistring;
function MakeZPLCode(code128, dest, pcs, origin: ansistring): ansistring;
function GETFONTHEX(chnstr: ansistring; fontname: ansistring; orient: Integer; height: Integer; width: Integer;
  bold: Integer; italic: Integer; hexbuf: ansistring): Integer; stdcall; external 'fnthex32.dll';

var
  FormMain: TFormMain;
  Globaluser:string;
  connstr:string;
  GlobalXMLFile:string;
  GloballocalIP:string;
  GlobalCtrlIP:string;
  GlobalBarCode :string;
  GlobalLength :string;
  GlobalWidth :string;
  GlobalHeight :string;
  GlobalVolume :string;
  Globalindex :string;
  GlobalBarCodeIn :string;
  GlobalOPCItemIn :string;
  GlobalGuid :string;
  GlobalOuter :string;
  GlobalRec :string;
  GlobalScanIP :string;
  GlobalPrint_origin:string;
  GlobalPrint_pcs :string;
  GlobalPrint_dest :string;
  GlobalPrint_barcode :string;
  GlobalPrint_out :string;
  GlobalPrint_ip: string;
  GlobalScanPort :integer;
  GlobalIsBarCodeRead :integer;
  GlobalPort:integer;
  Encoding: TEncoding;

implementation
{$R *.dfm}


uses
  Unlogin,UnDM,Ungetdata, Undatacompute, Unuserlog, Unerrorlog, Unrole, Unuser,
  Unpermission, Unproper, Unparam, Unout, Unin, Unmonitor;
//---------------------printer-------------------------
function WriteRawStringToPrinter(PrinterName: String; S: String) : integer;
var
  Handle: THandle;
  n: DWORD;
  DocInfo1: TDocInfo1;
  PS: ansistring;
begin
  PS := S;
  if not OpenPrinter(PChar(PrinterName), Handle, nil) then
    begin
      Result := -1;
    end;
  with DocInfo1 do
    begin
      pDocName := PChar('PrintLabel');
      pOutputFile := nil;
      pDataType := 'RAW';
    end;
  StartDocPrinter(Handle, 1, @DocInfo1);
  StartPagePrinter(Handle);
  WritePrinter(Handle, PAnsiChar(PS), Length(PS), n);
  EndPagePrinter(Handle);
  EndDocPrinter(Handle);
  ClosePrinter(Handle);
  Result := 0;
end;
// use GETFONTHEX in 'fnthex32.dll' to print chinese
function PrtChnStr(x, y: Integer; fontname: ansistring; height, xmf, ymf: Integer; chnstr: ansistring): ansistring;
var
  ret: ansistring;
  count: Integer;
  buf: ansistring;
//  dataname: ansistring;
begin
//  dataname:='OUTSTR01';
  result := '';
  if chnstr <> '' then
  begin
    setlength(buf, 21 * 1024);//must be allocate first add by dendi
    count := GETFONTHEX(chnstr, fontname,0, height, 0, 1, 0, buf);
    //orient=0 height=height width=0 bold=1 italic=0 buf=buf
    if count > 0 then //count>0 means success
    begin
      ret := Copy(buf, 1, count);
      result := ret + '^FO' + inttostr(x) + ',' + inttostr(y) + '^XGOUTSTR01,' + inttostr(xmf) + ',' +
        inttostr(ymf) + '^FS';
    end;
  end;
end;

function MakeZPLCode(code128, dest, pcs, origin: ansistring): ansistring;
var
  prtstr, tempstr, code: ansistring;
  fontname: ansistring;
  fontsize1, fontsize2: Integer;
begin
  // 字体
  fontname := '黑体';
  fontsize1 := 22;
  fontsize2 := 45;
  // 128码
  prtstr := '^XA^LL540^PW1080^IA6^XZ^FS^XA^FS^MD10^BY3,3^LH20,23^FS';
      // ^XA^LL540^PW1080^IA6^XZ setting printer
  tempstr := '^FO400,50^BC,150^FD';
  prtstr := prtstr + tempstr;
  tempstr := code128 + '^FS';
  prtstr := prtstr + tempstr;

  tempstr := '^FO400,280^BC,150^FD';
  prtstr := prtstr + tempstr;
  tempstr := code128 + '^FS';
  prtstr := prtstr + tempstr;

  prtstr := prtstr + PrtChnStr(50, 50, fontname, fontsize1, 1, 2, '目的地');
  prtstr := prtstr + PrtChnStr(50, 120, fontname, fontsize1, 1, 2, 'Destination');
  prtstr := prtstr + PrtChnStr(180, 50, fontname, fontsize2, 1, 2, dest);

  prtstr := prtstr + PrtChnStr(50, 280, fontname, fontsize1, 1, 2, '件数');
  prtstr := prtstr + PrtChnStr(50, 320, fontname, fontsize1, 1, 2, 'Pcs');
  prtstr := prtstr + PrtChnStr(180, 280, fontname, fontsize2, 1, 2, pcs);

  prtstr := prtstr + PrtChnStr(50, 400, fontname, fontsize1, 1, 2, '始发地');
  prtstr := prtstr + PrtChnStr(50, 450, fontname, fontsize1, 1, 2, 'Origin');
  prtstr := prtstr + PrtChnStr(180, 400, fontname, fontsize2, 1, 2, origin);

  tempstr := '^PQ1^FS'; // 打印1份
  prtstr := prtstr + tempstr;

  tempstr := '^PRC^FS^XZ^FS^XA^EG^XZ'; // 打印结束
  prtstr := prtstr + tempstr;

  result := prtstr;
end;

//------------------showaction below------------
//check whcih action is enable in DB
//use actionlist to manage
procedure TFormMain.enableaction;
var
  group:string;
  i: Integer;
begin
    group:=DM.ADOQuery1.FieldByName('CODE00').AsString;
//    group:='SYS';
//    showmessage(inttostr(DM.ADOQuery1.RecordCount));
    try
    with DM.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from GROUPACT where CODE00=:group');
        Parameters.ParamByName('group').Value:=group;
        open;
      end;
    except
      Application.MessageBox('无法连接数据库服务器！','提示', MB_OK);
    end;

//    showmessage(inttostr(DM.ADOQuery1.RecordCount));

    for i := 0 to actionlist1.ActionCount-1 do
      begin
        TAction( actionlist1.Actions[i]).enabled:=false;

        if DM.ADOQuery1.Locate('ACTNAME',TAction( actionlist1.Actions[i]).Name,[locaseinsensitive])=true  then
          begin
             if DM.ADOQuery1.FieldByName('CHOOSE').AsInteger=1 then
              begin
                TAction( actionlist1.Actions[i]).enabled:=true;
              end;
          end;
      end;
end;
//this function is used to record USER'S action
procedure TFormMain.RecordLog(loginfo: string);
begin
  try
    with DM.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into USERLOG(USER00,DATE00,OPERAT) values(:user,:date,:operat)');
        Parameters.ParamByName('user').Value:=Globaluser;
        Parameters.ParamByName('date').Value:=now();
        Parameters.ParamByName('operat').Value:=loginfo;
        ExecSQL;
      end;

  except
    Application.MessageBox('无法连接数据库服务器！','提示', MB_OK);
  end;
end;
//this function is used to record error in application
procedure TFormMain.ErrorLog(loginfo: string);
begin
  try
    with DM.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('insert into USERLOG(USER00,DATE00,OPERAT) values(:user,:date,:operat)');
        Parameters.ParamByName('user').Value:=Globaluser;
        Parameters.ParamByName('date').Value:=now();
        Parameters.ParamByName('operat').Value:=loginfo;
        ExecSQL;
      end;

  except
    Application.MessageBox('无法连接数据库服务器！','提示', MB_OK);
  end;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RecordLog('用户退出');
//  Application.Terminate;
end;

procedure TFormMain.FormShow(Sender: TObject);
var
  TextFileVar:Textfile ;
//  connstr:string;
begin
  //XML file path
  //GlobalXMLFile:=extractfilepath(application.ExeName)+'XML\FJDATA.XML';
  GlobalXMLFile:='XML\FJDATA.XML';
  GloballocalIP:=IdIPWatch1.LocalIP;
//  showmessage(GlobalXMLFile);
  //SQL connect
//load SQL connstring in para.ini
  try
    AssignFile(TextFileVar,'Para.ini');
    Reset(TextFileVar);
    Readln(TextFileVar,connstr);
  finally
    CloseFile(TextFileVar);
  end;

//   showmessage(connstr);
//  Application.CreateForm(TDMtest,DM);
  DM:=TDMtest.Create(nil);
  try
    DM.ADOConnection1.ConnectionString:=connstr;
    DM.ADOConnection1.Open;
    DM.ADOQuery1.Open;
//    DM.ADO_VFJD_query.Open;
  except
    Application.MessageBox('无法连接数据库服务器！','提示', MB_OK);
  end;

  //login form create
  Application.CreateForm(Tformlogin,formlogin);
  formlogin.ShowModal;
  formlogin.Free;
  formlogin:=nil;
  if pass then
    begin
      enableaction;
      RecordLog('用户登录');
  //use statusbar to display IP,USER and date by dendi
      statusbar1.Panels[1].Text:=GloballocalIP;
      statusbar1.Panels[3].Text:=Globaluser;
      statusbar1.Panels[5].Text:=Datetimetostr(now());

      try
        with DM.ADOQuery1 do
          begin
            close;
            sql.Clear;
            sql.Add('select * from PARAMETER');
            open;
            GlobalCtrlIP := FieldByName('CTRLIP').AsString;
            GlobalPort := FieldByName('PORT00').AsInteger;
            GlobalScanIP := FieldByName('BARCODEIP').AsString;;
            GlobalScanPort := FieldByName('BARCODEPORT').AsInteger;
            GlobalPrint_origin:=FieldByName('ADDRESS').AsString;;
          end;
      except
        Application.MessageBox('无法连接数据库服务器！','提示', MB_OK);
    end;
    end;

end;
//menu setting below
procedure TFormMain.N12Click(Sender: TObject);
begin
  RecordLog('查看事件日志');
  if not assigned(Formuserlog) then
    Application.CreateForm(TFormuserlog, Formuserlog)
  else
    Formuserlog.Show;
end;

procedure TFormMain.N13Click(Sender: TObject);
begin
  //TBouter.Down:=true;
  //TBouter.Click;
end;

procedure TFormMain.N14Click(Sender: TObject);
begin
//  TBdatacompute.Down:=true;
//  TBdatacompute.Click;
end;

procedure TFormMain.N15Click(Sender: TObject);
begin
  RecordLog('查看报警信息');
  if not assigned(Formerrorlog) then
    Application.CreateForm(TFormerrorlog, Formerrorlog)
  else
    Formerrorlog.Show;
end;

procedure TFormMain.N18Click(Sender: TObject);
begin
  RecordLog('查看维护指引');
  try
    ShellExecute(application.Handle,nil,'智能自动化分拣信息系统使用说明书.chm',nil,nil,sw_shownormal);
  except
    Application.MessageBox('无法打开帮助文档，文件正在被使用！','提示', MB_OK);
  end;

end;

procedure TFormMain.N19Click(Sender: TObject);
begin
  RecordLog('打开 出口特征 页面');
  if not assigned(Formproper) then
    Application.CreateForm(TFormproper, Formproper)
  else
    Formproper.Show;
end;

procedure TFormMain.N20Click(Sender: TObject);
begin
  RecordLog('打开 参数设置 页面');
  if not assigned(Formparam) then
    Application.CreateForm(TFormparam, Formparam)
  else
    Formparam.Show;
end;

procedure TFormMain.N21Click(Sender: TObject);
begin
  RecordLog('打开 权限管理 页面');
  if not assigned(Formpermission) then
    Application.CreateForm(TFormpermission, Formpermission)
  else
    Formpermission.Show;
end;

procedure TFormMain.N22Click(Sender: TObject);
begin
  RecordLog('打开 用户管理 页面');
  if not assigned(Formuser) then
    Application.CreateForm(TFormuser, Formuser)
  else
    Formuser.Show;
end;

procedure TFormMain.N23Click(Sender: TObject);
begin
  RecordLog('打开 角色管理 页面');
  if not assigned(Formrole) then
    Application.CreateForm(TFormrole, Formrole)
  else
    Formrole.Show;
end;

procedure TFormMain.N4Click(Sender: TObject);
begin
  RecordLog('用户退出');
  application.Terminate;
end;

procedure TFormMain.N5Click(Sender: TObject);
begin
//    TBgetdate.Down:=true;
//    TBgetdate.Click;
end;

procedure TFormMain.N7Click(Sender: TObject);
begin
//  TBmonitor.Down:=true;
//  TBmonitor.Click;
end;

procedure TFormMain.N9Click(Sender: TObject);
begin
//  TBinner.Down:=true;
//  TBinner.Click;
end;
//toolbar setting below
procedure TFormMain.TBgetdateClick(Sender: TObject);
begin
//
   // showmessage('getdata');
   //formgetdata.show;
  TBgetdate.Down:=true;
  RecordLog('打开 数据获取 页面');
  if not assigned(Formgetdata) then
    Application.CreateForm(TFormgetdata, Formgetdata)
  else
    Formgetdata.Show;

end;

procedure TFormMain.TBinnerClick(Sender: TObject);
begin
//
  TBinner.Down:=true;
  RecordLog('打开 入口操作 页面');
  //showmessage('inner');
  if not assigned(Formin) then
    Application.CreateForm(TFormin, Formin)
  else
    Formin.Show;
end;

procedure TFormMain.TBmonitorClick(Sender: TObject);
begin
//
  TBmonitor.Down:=true;
  RecordLog('打开 分拣监控 页面');
   if not assigned(Formmonitor) then
    Application.CreateForm(TFormmonitor, Formmonitor)
  else
    Formmonitor.Show;
  //showmessage('monitor');
end;

procedure TFormMain.TBouterClick(Sender: TObject);
begin
//
  TBouter.Down:=true;
  RecordLog('打开 出口管理 页面');
  if not assigned(Formout) then
    Application.CreateForm(TFormout, Formout)
  else
    Formout.Show;
//  showmessage('outer');
end;

procedure TFormMain.TBdatacomputeClick(Sender: TObject);
begin
  TBdatacompute.Down:=true;
  RecordLog('打开 数据统计 页面');
//
//  showmessage('datacompute');
  if not assigned(Formdatacompute) then
    Application.CreateForm(TFormdatacompute, Formdatacompute)
  else
    Formdatacompute.Show;
end;

end.
