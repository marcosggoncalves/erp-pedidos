unit conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, frxClass,
  frxExportBaseDialog, frxExportPDF, frxDBSet, System.IniFiles;

type
  Tdm = class(TDataModule)
    FDConexao: TFDConnection;
    FDTransaction: TFDTransaction;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QryVendasRelatorio: TFDQuery;
    VendasRelatorio: TDataSource;
    RelatorioVendas: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure LerIni;
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ Tdm }

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
   LerIni;
end;

procedure Tdm.LerIni;
var
  Lini: TiniFile;
begin
  Lini := TiniFile.Create(ExtractFilePath(ParamStr(0)) + 'conf.ini');
  try
    FDConexao.Params.Clear;

    FDConexao.Params.Values['DriverID'] := Lini. ReadString('CONEXAO','DriverID', 'FB');
    FDConexao.Params.Values['Server'] := Lini.ReadString('CONEXAO', 'SERVER', '');
    FDConexao.Params.Values['User_Name'] := Lini.ReadString('CONEXAO', 'USER', '');
    FDConexao.Params.Values['Password'] := Lini.ReadString('CONEXAO', 'SENHA', '');
    FDConexao.Params.Values['Port'] := Lini.ReadString('CONEXAO', 'Port', '3050');
    FDConexao.Params.Values['Database'] := Lini.ReadString('CONEXAO', 'DATABASE', '');
    FDConexao.Params.Values['CharacterSet'] := Lini.ReadString('CONEXAO', 'CharacterSet', 'UTF8');

    FDConexao.Connected := True;
  finally
    Lini.Free;
  end;
end;

end.

