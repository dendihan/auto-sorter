Unit UnRecContextData;

interface

uses
  System.Classes,
  SyncObjs, System.Variants,
  SysUtils, StrUtils,
  IdContext, Data.Win.ADODB, DB, Generics.Collections, System.Generics.Defaults,
  IdSync;

type
  TRecContextData = class;

  TMsgAvail = procedure(Sender: TRecContextData) of object;
  TUserNameSet = procedure(Sender: TRecContextData; var UserName: string)
    of object;

  TRecContextData = class(TObject)
  private
    FLock: TCriticalSection;
    FCurMsg: TStringList;
    FOnMsgAvail: TMsgAvail;
    FContext: TIdContext;
    FUserName: string;
    FOnUserNameSet: TUserNameSet;
    function GetCurMsg: string;

    procedure CheckForMsg;
    procedure SetOnMsgAvail(const Value: TMsgAvail);
    function GetContext: TIdContext;
    procedure SetUserName(const Value: string);
    procedure SetOnUserNameSet(const Value: TUserNameSet);

    procedure MainShow;

  public
    property CurMsg: string read GetCurMsg;
    function Pop: string;
    constructor Create;
    destructor Destroy; override;
    procedure CheckMsg(AContext: TIdContext);
    property OnMsgAvail: TMsgAvail read FOnMsgAvail write SetOnMsgAvail;
    property Context: TIdContext read GetContext;
    property UserName: string read FUserName write SetUserName;
    property OnUserNameSet: TUserNameSet read FOnUserNameSet
      write SetOnUserNameSet;
  end;

implementation

{ TRecContextData }

uses
  UnDM, Unmain,UnMonitor;

procedure TRecContextData.MainShow;
begin
  // ��ʾ��ҳ��
  FormMonitor.WriteMemo(GlobalRec);
end;

procedure TRecContextData.CheckForMsg;
var
  sCommand, msg, tmpStr: string;
  p1, p2, p3: Integer;
begin
  Encoding := TEncoding.Default;
  // if FCurMsg.Count > 0 then
  while FCurMsg.Count > 0 do
  begin
    sCommand := Pop;
    GlobalRec := '���գ�' + sCommand;
    // TIdSync.SynchronizeMethod(MainShow);
    MainShow;
    // ������������Ϣ�� [STX]���룬���ȣ���ȣ��߶ȣ����[ETX]    [STX]NoRead[ETX]
    // ��ڷ�����Ϣ��   [STX]BC:����[ETX]
    p1 := sCommand.IndexOf('[STX]');
    p2 := sCommand.IndexOf('[ETX]');
    if ((p1 > 0) and ((p2 - p1) > 5)) then
    begin
      msg := copy(sCommand, p1 + 6, p2 - p1 - 5);
      if UpperCase(msg) = 'NOREAD' then // ������ δ��ȡ����
      begin
        {GlobalBarCode := '';
        GlobalLength := '';
        GlobalWidth := '';
        GlobalHeight := '';
        GlobalVolume := '';
        GlobalIsBarCodeRead := 0;

        sleep(GlobalDelayTime);
        TIdSync.SynchronizeMethod(FrmMonitor.BarCodeNoReadNotifyInner);
        }
      end
      else if UpperCase(msg).StartsWith('BC:') then // ��ڷ�������  [STX]BC:OPC ITEM ID,����[ETX]
      begin
        tmpStr := Copy(msg,4,length(msg)-3);
        try
          p3 := tmpStr.IndexOf(',');
          GlobalOPCItemIn := copy(tmpStr, 0, p3);
          GlobalBarCodeIn := copy(tmpStr, p3 + 2, Length(tmpStr) - p3);

          TIdSync.SynchronizeMethod(FormMonitor.WriteOuterForInter);
        except
          on e: exception do
            formmain.ErrorLog('������ݽ�����' + msg + ' -> ' + e.Message);
        end;
      end
      else if UpperCase(msg).StartsWith('BM:') then // ����δʶ����ڲ����룬����  [STX]BM:Ψһ��,���ڱ���[ETX]
      begin
        tmpStr := Copy(msg,4,length(msg)-3);
        try
          p3 := tmpStr.IndexOf(',');
          GlobalGuid := copy(tmpStr, 0, p3);
          GlobalOuter := copy(tmpStr, p3 + 2, Length(tmpStr) - p3);

          TIdSync.SynchronizeMethod(FormMonitor.WriteOuterForMain);
        except
          on e: exception do
            formmain.ErrorLog('����δʶ�𣬲�¼�����ݽ�����' + msg + ' -> ' + e.Message);
        end;
      end
      else // ������ ��ȡ���� ��
      begin
        {GlobalBarCode := '';
        GlobalLength := '';
        GlobalWidth := '';
        GlobalHeight := '';
        GlobalVolume := '';
        GlobalIsBarCodeRead := 1;

        try
          p3 := msg.IndexOf(',');
          GlobalIndex := copy(msg, 0, p3);
          tmpStr := copy(msg, p3 + 2, Length(msg) - p3);

          p3 := tmpStr.IndexOf(',');
          GlobalBarCode := copy(tmpStr, 0, p3);
          tmpStr := copy(tmpStr, p3 + 2, Length(tmpStr) - p3);

          p3 := tmpStr.IndexOf(',');
          GlobalLength := copy(tmpStr, 0, p3);
          tmpStr := copy(tmpStr, p3 + 2, Length(tmpStr) - p3);

          p3 := tmpStr.IndexOf(',');
          GlobalWidth := copy(tmpStr, 0, p3);
          tmpStr := copy(tmpStr, p3 + 2, Length(tmpStr) - p3);

          p3 := tmpStr.IndexOf(',');
          GlobalHeight := copy(tmpStr, 0, p3);
          GlobalVolume := copy(tmpStr, p3 + 2, Length(tmpStr) - p3);
        except
          on e: exception do
            ErrorLog('���������ݽ�����' + msg + ' -> ' + e.Message);
        end;

        TIdSync.SynchronizeMethod(FrmMonitor.UpdateDBByBarCode);
        }
      end;

    end;
  end;
end;

procedure TRecContextData.CheckMsg(AContext: TIdContext);
var
  S, Swp, IP: string;
  i: Integer;
begin
  Encoding := TEncoding.Default;
  FLock.Enter;
  try
    FContext := AContext;
    AContext.Connection.IOHandler.CheckForDisconnect(True, True);
    i := AContext.Connection.IOHandler.RecvBufferSize;
    if i >= 1 then
    begin
      // Swp := Copy(FCurMsg.Text, 1, Length(FCurMsg.Text) - 2);
      // SetLength(S, I);
      IP := AContext.Connection.Socket.Binding.PeerIP;
      S := AContext.Connection.IOHandler.ReadLn();

      { S := StringReplace(S, #13#10, #10#13, [rfReplaceAll]);
        if (S = #10#13) then
        FCurMsg.Add('')
        else }
      FCurMsg.Text := IP + ',' + S;
      // FCurMsg.Text := S;
      CheckForMsg;
    end;

  finally
    FLock.Leave;
  end;
end;

constructor TRecContextData.Create;
begin
  inherited;
  FCurMsg := TStringList.Create;
  FLock := TCriticalSection.Create;
end;

destructor TRecContextData.Destroy;
begin
  FCurMsg.Free;
  FLock.Free;
  inherited;
end;

function TRecContextData.GetContext: TIdContext;
begin
  Result := FContext;
end;

function TRecContextData.GetCurMsg: string;
begin
  FLock.Enter;
  try
    if FCurMsg.Count > 0 then
    begin
      Result := FCurMsg[0];
    end
    else
      Result := '';
  finally
    FLock.Leave;
  end;
end;

function TRecContextData.Pop: string;
begin
  FLock.Enter;
  try
    Result := GetCurMsg;
    if UserName <> '' then
      Result := UserName + ': ' + Result;
    if FCurMsg.Count > 0 then
      FCurMsg.Delete(0);
  finally
    FLock.Leave;
  end;
end;

procedure TRecContextData.SetOnMsgAvail(const Value: TMsgAvail);
begin
  FOnMsgAvail := Value;
end;

procedure TRecContextData.SetOnUserNameSet(const Value: TUserNameSet);
begin
  FOnUserNameSet := Value;
end;

procedure TRecContextData.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

end.
