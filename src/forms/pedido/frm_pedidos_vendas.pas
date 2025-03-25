unit frm_pedidos_vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, entity_pedido_relatorio, repository_pedido,
  Datasnap.DBClient, System.Generics.Collections, frxClass, frxDBSet;

type
  TTfrm_pedidos_vendas = class(TForm)
    abas_vendas: TPageControl;
    aba_vendas: TTabSheet;
    panel_btns_pesquisa: TPanel;
    label_opcoes: TLabel;
    btn_produto_pesquisar: TBitBtn;
    btn_limpar: TBitBtn;
    label_data_inicial: TLabel;
    label_data_final: TLabel;
    date_inicial: TDateTimePicker;
    date_final: TDateTimePicker;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    // Prodecures "ABA PESQUISA"
    procedure btn_pesquisa_click(Sender: TObject);
    procedure btn_pesquisa_limpar_click(Sender: TObject);
  private
    PedidoRepository: TPedidoRepository;
  public
    { Public declarations }
  end;

var
  Tfrm_pedidos_vendas: TTfrm_pedidos_vendas;

implementation

{$R *.dfm}

procedure TTfrm_pedidos_vendas.btn_pesquisa_limpar_click(Sender: TObject);
begin
  btn_limpar.Enabled := False;

  date_inicial.Date := now;
  date_final.Date := now;

  ClientDataSet1.FieldDefs.Clear;
  ClientDataSet1.Close;
end;

procedure TTfrm_pedidos_vendas.btn_pesquisa_click(Sender: TObject);
var
  Pedidos: TList<TPedidoRelatorio>;
  Pedido: TPedidoRelatorio;
begin
  try
    Pedidos := PedidoRepository.ListarRelatorio(date_inicial.Date, date_final.Date);

    ClientDataSet1.Close;
    ClientDataSet1.FieldDefs.Clear;

    ClientDataSet1.FieldDefs.Add('ID', ftInteger);
    ClientDataSet1.FieldDefs.Add('CLIENTE', ftString, 20);
    ClientDataSet1.FieldDefs.Add('VENDEDOR', ftString, 20);
    ClientDataSet1.FieldDefs.Add('DATA_PEDIDO', ftDateTime);
    ClientDataSet1.FieldDefs.Add('TOTAL', ftCurrency);
    ClientDataSet1.CreateDataSet;

    for Pedido in Pedidos do
    begin
      ClientDataSet1.Append;
      ClientDataSet1.FieldByName('ID').AsInteger := Pedido.ID;
      ClientDataSet1.FieldByName('CLIENTE').AsString := Pedido.Cliente;
      ClientDataSet1.FieldByName('VENDEDOR').AsString := Pedido.Vendedor;
      ClientDataSet1.FieldByName('DATA_PEDIDO').AsDateTime := Pedido.DataPedido;
      ClientDataSet1.FieldByName('TOTAL').AsCurrency := Pedido.Total;
      ClientDataSet1.Post;
    end;

    DataSource1.DataSet := ClientDataSet1;
  finally
    PedidoRepository.Free;
    btn_limpar.Enabled := True;
  end;
end;


end.
