unit Unlogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormlogin = class(TForm)
    Label1: TLabel;
    Labelpswd: TLabel;
    Editpswd: TEdit;
    CBuser: TComboBox;
    BitBtnlogin: TBitBtn;
    BitBtncancel: TBitBtn;
    procedure BitBtncancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtnloginClick(Sender: TObject);
    procedure EditpswdKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formlogin: TFormlogin;
  pass:boolean;//use pass to indicate PASSWORD is TRUE and fix the bug when close form

implementation

{$R *.dfm}

uses UnMain, UnDM;

procedure TFormlogin.BitBtncancelClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFormlogin.BitBtnloginClick(Sender: TObject);
var
  user:string;
  password:string;
begin
  user:=CBuser.Text;
  password:=Editpswd.Text;

  try
    with DM.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from USERS where NAME00=:user and PASSWD=:password');
        Parameters.ParamByName('user').Value:=user;
        Parameters.ParamByName('password').Value:=password;
        open;

        if recordcount>0 then
          begin
            pass:=true;
            Formlogin.Close;
            UnMain.Globaluser:=user;
          end
        else
          begin
            pass:=false;
            Editpswd.Text:='';
            Application.MessageBox('密码错误','提示', MB_OK);
          end;

      end;
  except
     Application.MessageBox('无法连接数据库','提示', MB_OK);
  end;

end;

procedure TFormlogin.EditpswdKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    BitBtnlogin.Click;
end;

procedure TFormlogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not pass  then
    application.Terminate; //add pass to fix bug if NO PASSWORD will kill application
end;


procedure TFormlogin.FormShow(Sender: TObject);
var
  sqlstr:string;
  i:integer;
begin

  //to display all USERS in DB by combobox
  sqlstr:='select * from USERS';
  try
    with DM.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add(sqlstr);
        open;
        if recordcount>0 then
          begin
            for i := 1 to recordcount do
              begin
                CBuser.Items.Add(FieldByName('NAME00').AsString);
                Next;
              end;
          end;
        //CBuser.Text:='管理员';
        CBuser.Text:=CBuser.Items[0];
        //  CBuser.ItemIndex:=0;
      end;
  except
     Application.MessageBox('无法获取登录姓名！','提示', MB_OK);
  end;
end;

end.
