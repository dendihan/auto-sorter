program ProjYPR;

uses
  Vcl.Forms,
  UnMain in 'UnMain.pas' {FormMain},
  Unlogin in 'Unlogin.pas' {Formlogin},
  ProjYPR_TLB in 'ProjYPR_TLB.pas',
  UnDM in 'UnDM.pas' {DMtest: TRemoteDataModule} {DMtest: CoClass},
  Ungetdata in 'Ungetdata.pas' {Formgetdata},
  Undatacompute in 'Undatacompute.pas' {Formdatacompute},
  Unshowcol in 'Unshowcol.pas' {Formshowcol},
  Unuser in 'Unuser.pas' {Formuser},
  Unuserlog in 'Unuserlog.pas' {Formuserlog},
  Unerrorlog in 'Unerrorlog.pas' {Formerrorlog},
  Unparaminedit in 'Unparaminedit.pas' {Formparaminedit},
  Unparam in 'Unparam.pas' {Formparam},
  Unproperedit in 'Unproperedit.pas' {Formproperedit},
  Unrole in 'Unrole.pas' {Formrole},
  Unpermission in 'Unpermission.pas' {Formpermission},
  Unproper in 'Unproper.pas' {Formproper},
  Unroleedit in 'Unroleedit.pas' {Formroleedit},
  Unparamoutedit in 'Unparamoutedit.pas' {Formparamoutedit},
  Unuseredit in 'Unuseredit.pas' {Formuseredit},
  Unin in 'Unin.pas' {Formin},
  Unout in 'Unout.pas' {Formout},
  Unmonitor in 'Unmonitor.pas' {Formmonitor},
  UnRecContextData in 'UnRecContextData.pas';

{$R *.TLB}

{$R *.res}
{ Reduce EXE size by disabling as much of RTTI as possible (delphi 2009/2010) }

{$IF CompilerVersion >= 21.0}

{$WEAKLINKRTTI ON}

{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

{$ENDIF}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  //Application.CreateForm(TFormmonitor, Formmonitor);
  //Application.CreateForm(TFormout, Formout);
  //Application.CreateForm(TFormroleedit, Formroleedit);
 // Application.CreateForm(TFormparamoutedit, Formparamoutedit);
 // Application.CreateForm(TFormuseredit, Formuseredit);
  //Application.CreateForm(TFormout, Formout);
  //Application.CreateForm(TFormuseredit, Formuseredit);
  //Application.CreateForm(TFormproper, Formproper);
  //Application.CreateForm(TFormpermission, Formpermission);
  //  Application.CreateForm(TFormrole, Formrole);
  //  Application.CreateForm(TFormroleedit, Formroleedit);
  //  Application.CreateForm(TFormrole, Formrole);
  //Application.CreateForm(TFormroleedit, Formroleedit);
  //Application.CreateForm(TFormerrorlog, Formerrorlog);
  //Application.CreateForm(TFormerrorlog, Formerrorlog);
  //Application.CreateForm(TFormuserlog, Formuserlog);
  //Application.CreateForm(TFormshowcol, Formshowcol);
  //Application.CreateForm(TFormuserlog, Formuserlog);
  //Application.CreateForm(TFormdatacompute, Formdatacompute);
  // Application.CreateForm(TFormgetdata, Formgetdata);
  //  Application.CreateForm(TFormlogin, Formlogin);
  Application.Run;
end.
