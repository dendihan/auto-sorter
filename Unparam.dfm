object Formparam: TFormparam
  Left = 0
  Top = 0
  Caption = #21442#25968#35774#32622
  ClientHeight = 655
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 33
  object GroupBox3: TGroupBox
    Left = 950
    Top = 65
    Width = 330
    Height = 590
    Align = alClient
    Caption = #20837#21475#21442#25968
    TabOrder = 8
    ExplicitLeft = 408
    ExplicitWidth = 550
    object Panel3: TPanel
      Left = 128
      Top = 96
      Width = 185
      Height = 60
      BevelOuter = bvNone
      TabOrder = 3
    end
    object Btnaddout: TButton
      Left = 6
      Top = 38
      Width = 97
      Height = 42
      Caption = #28155#21152#20986#21475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnaddoutClick
    end
    object Btnoutedit: TButton
      Left = 109
      Top = 38
      Width = 97
      Height = 42
      Caption = #32534#36753#20986#21475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtnouteditClick
    end
    object Btnoutdel: TButton
      Left = 212
      Top = 38
      Width = 97
      Height = 42
      Caption = #21024#38500#20986#21475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BtnoutdelClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 400
    Top = 65
    Width = 550
    Height = 590
    Align = alLeft
    Caption = #20837#21475#21442#25968
    TabOrder = 6
    object Panel2: TPanel
      Left = 128
      Top = 96
      Width = 185
      Height = 60
      BevelOuter = bvNone
      TabOrder = 3
    end
    object Btnaddin: TButton
      Left = 6
      Top = 38
      Width = 97
      Height = 42
      Caption = #28155#21152#20837#21475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnaddinClick
    end
    object Btninedit: TButton
      Left = 109
      Top = 38
      Width = 97
      Height = 42
      Caption = #32534#36753#20837#21475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtnineditClick
    end
    object Btnindel: TButton
      Left = 212
      Top = 38
      Width = 97
      Height = 42
      Caption = #21024#38500#20837#21475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BtnindelClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 65
    Width = 400
    Height = 590
    Align = alLeft
    Caption = #31995#32479#21442#25968
    TabOrder = 4
    ExplicitTop = 71
    ExplicitHeight = 490
    object Label1: TLabel
      Left = 3
      Top = 112
      Width = 84
      Height = 33
      Caption = #22320#22336#65306
    end
    object Label2: TLabel
      Left = 3
      Top = 191
      Width = 140
      Height = 33
      Caption = #23567#36710#24635#25968#65306
    end
    object Label3: TLabel
      Left = 3
      Top = 273
      Width = 140
      Height = 33
      Caption = #26368#22810#22280#25968#65306
    end
    object Label4: TLabel
      Left = 0
      Top = 351
      Width = 118
      Height = 33
      Caption = 'PLC IP'#65306
    end
    object Label5: TLabel
      Left = 3
      Top = 431
      Width = 151
      Height = 33
      Caption = #24037#25511#26426' IP'#65306
    end
    object Label6: TLabel
      Left = 0
      Top = 507
      Width = 193
      Height = 33
      Caption = 'SOCKET'#31471#21475#65306
    end
    object DBEdit1: TDBEdit
      Left = 169
      Top = 109
      Width = 225
      Height = 41
      DataField = 'ADDRESS'
      DataSource = DMtest.DSparameter
      Enabled = False
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 169
      Top = 188
      Width = 225
      Height = 41
      DataField = 'CARS'
      DataSource = DMtest.DSparameter
      Enabled = False
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 169
      Top = 270
      Width = 225
      Height = 41
      DataField = 'ROUNDMAX'
      DataSource = DMtest.DSparameter
      Enabled = False
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 169
      Top = 348
      Width = 225
      Height = 41
      DataField = 'PLCIP'
      DataSource = DMtest.DSparameter
      Enabled = False
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 169
      Top = 428
      Width = 225
      Height = 41
      DataField = 'CTRLIP'
      DataSource = DMtest.DSparameter
      Enabled = False
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 169
      Top = 507
      Width = 225
      Height = 41
      DataField = 'PORT00'
      DataSource = DMtest.DSparameter
      Enabled = False
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Caption = #21442#25968#35774#32622
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -47
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 1282
  end
  object Btnedit: TButton
    Left = 3
    Top = 103
    Width = 97
    Height = 42
    Caption = #32534#36753
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtneditClick
  end
  object cxGrid1: TcxGrid
    Left = 406
    Top = 280
    Width = 538
    Height = 267
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DMtest.DSin
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1CODE00: TcxGridDBColumn
        Caption = #20195#30721
        DataBinding.FieldName = 'CODE00'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 60
      end
      object cxGrid1DBTableView1IPADDR: TcxGridDBColumn
        Caption = 'IP'#22320#22336
        DataBinding.FieldName = 'IPADDR'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 184
      end
      object cxGrid1DBTableView1READPLC: TcxGridDBColumn
        Caption = #35835'PLC'#22320#22336
        DataBinding.FieldName = 'READPLC'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 84
      end
      object cxGrid1DBTableView1WRITEPLC: TcxGridDBColumn
        Caption = #20889'PLC'#22320#22336
        DataBinding.FieldName = 'WRITEPLC'
        HeaderAlignmentHorz = taCenter
        Width = 103
      end
      object cxGrid1DBTableView1ATTR00: TcxGridDBColumn
        Caption = #34917#24405#20986#21475
        DataBinding.FieldName = 'ATTR00'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 110
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGrid2: TcxGrid
    Left = 956
    Top = 151
    Width = 332
    Height = 338
    TabOrder = 3
    object cxGrid2DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.Visible = fvNever
      DataController.DataSource = DMtest.DSpout
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object cxGrid2DBTableView1CODE00: TcxGridDBColumn
        Caption = #20195#30721
        DataBinding.FieldName = 'CODE00'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 87
      end
      object cxGrid2DBTableView1TYPE00: TcxGridDBColumn
        Caption = #20986#21475#31867#22411
        DataBinding.FieldName = 'TYPE00'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 128
      end
      object cxGrid2DBTableView1NAME00: TcxGridDBColumn
        Caption = #21517#31216
        DataBinding.FieldName = 'NAME00'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 106
      end
      object cxGrid2DBTableView1MAX000: TcxGridDBColumn
        Caption = #23481#37327
        DataBinding.FieldName = 'MAX000'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 78
      end
      object cxGrid2DBTableView1TARCODE: TcxGridDBColumn
        Caption = #30446#30340#22320#20195#30721
        DataBinding.FieldName = 'TARCODE'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 142
      end
      object cxGrid2DBTableView1TARNAME: TcxGridDBColumn
        Caption = #30446#30340#22320#21517#31216
        DataBinding.FieldName = 'TARNAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 138
      end
      object cxGrid2DBTableView1STAT00: TcxGridDBColumn
        Caption = #21551#29992
        DataBinding.FieldName = 'STAT00'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 88
      end
      object cxGrid2DBTableView1PRINTIP: TcxGridDBColumn
        Caption = #25171#21360#26426'IP'#22320#22336
        DataBinding.FieldName = 'PRINTIP'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 200
      end
      object cxGrid2DBTableView1OPCITEMIDMAX: TcxGridDBColumn
        Caption = 'OPC'#39033#30446#32534#21495#65288#23481#37327#65289
        DataBinding.FieldName = 'OPCITEMIDMAX'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 458
      end
      object cxGrid2DBTableView1OPCITEMIDCOU: TcxGridDBColumn
        Caption = 'OPC'#39033#30446#32534#21495#65288#25968#37327#65289
        DataBinding.FieldName = 'OPCITEMIDCOU'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 456
      end
      object cxGrid2DBTableView1OPCITEMIDCHG: TcxGridDBColumn
        Caption = 'OPC'#39033#30446#26356#25442#21253#35013#34955
        DataBinding.FieldName = 'OPCITEMIDCHG'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 422
      end
      object cxGrid2DBTableView1OPCITEMBEGIN: TcxGridDBColumn
        Caption = 'OPC'#20986#21475#21160#20316#23436#25104
        DataBinding.FieldName = 'OPCITEMBEGIN'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 380
      end
      object cxGrid2DBTableView1OPCITEMGUID: TcxGridDBColumn
        Caption = 'OPC'#21807#19968#35782#21035#30721
        DataBinding.FieldName = 'OPCITEMGUID'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 355
      end
      object cxGrid2DBTableView1OPCITEMEND: TcxGridDBColumn
        Caption = 'OPC PC'#35835#21462#23436#25104
        DataBinding.FieldName = 'OPCITEMEND'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 358
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object Btnsave: TButton
    Left = 106
    Top = 103
    Width = 97
    Height = 42
    Caption = #20445#23384
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BtnsaveClick
  end
  object Btnclose: TButton
    Left = 209
    Top = 103
    Width = 97
    Height = 42
    Caption = #20851#38381
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Button5Click
  end
end