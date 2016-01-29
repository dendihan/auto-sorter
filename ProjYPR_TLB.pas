  unit ProjYPR_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 2016/1/7 10:31:29 from Type Library described below.

// ************************************************************************  //
// Type Lib: F:\YPR\ProjYPR (1)
// LIBID: {9AFE3742-0E20-4449-A36C-76D4DAE80E92}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
//   (2) v1.0 Midas, (C:\Program Files\Embarcadero\Studio\14.0\bin\midas.dll)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, Midas, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ProjYPRMajorVersion = 1;
  ProjYPRMinorVersion = 0;

  LIBID_ProjYPR: TGUID = '{9AFE3742-0E20-4449-A36C-76D4DAE80E92}';

  IID_IDMtest: TGUID = '{41F2C3CB-D485-4F2C-B05F-6D1C9874DC9E}';
  CLASS_DMtest: TGUID = '{E10CFBAC-02AA-42AD-B93C-3EBB2622DC3B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IDMtest = interface;
  IDMtestDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  DMtest = IDMtest;


// *********************************************************************//
// Interface: IDMtest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {41F2C3CB-D485-4F2C-B05F-6D1C9874DC9E}
// *********************************************************************//
  IDMtest = interface(IAppServer)
    ['{41F2C3CB-D485-4F2C-B05F-6D1C9874DC9E}']
  end;

// *********************************************************************//
// DispIntf:  IDMtestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {41F2C3CB-D485-4F2C-B05F-6D1C9874DC9E}
// *********************************************************************//
  IDMtestDisp = dispinterface
    ['{41F2C3CB-D485-4F2C-B05F-6D1C9874DC9E}']
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer;
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer;
                           Options: Integer; const CommandText: WideString; var Params: OleVariant;
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer;
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString;
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoDMtest provides a Create and CreateRemote method to
// create instances of the default interface IDMtest exposed by
// the CoClass DMtest. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoDMtest = class
    class function Create: IDMtest;
    class function CreateRemote(const MachineName: string): IDMtest;
  end;

implementation

uses System.Win.ComObj;

class function CoDMtest.Create: IDMtest;
begin
  Result := CreateComObject(CLASS_DMtest) as IDMtest;
end;

class function CoDMtest.CreateRemote(const MachineName: string): IDMtest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DMtest) as IDMtest;
end;

end.

