unit frm_pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, sessao, conexao, System.Generics.Collections,
  Vcl.DBCtrls, repository_produto, Datasnap.DBClient, entity_produto, repository_cliente,
  entity_cliente, constants;

type
  TTFrm_lancar_pedido = class(TForm)
    panel_info_pedido: TPanel;
    label_pedido_usuario: TLabel;
    edit_pedido_usuario: TEdit;
    label_pedido_data: TLabel;
    date_time_pedido: TDateTimePicker;
    dbgrid_lista_pedido: TDBGrid;
    label_cliente: TLabel;
    panel_total_itens: TPanel;
    panel_total: TPanel;
    label_qtd_total: TLabel;
    label_total: TLabel;
    label_escrita_total: TLabel;
    btn_finalizar: TBitBtn;
    label_selecionar_produto: TLabel;
    label_produto_quantidade: TLabel;
    edit_produto_quantidade: TEdit;
    btn_adicionar: TButton;
    label_listagem_produtos: TLabel;
    btn_finalizar_: TBitBtn;
    btn_cancelar: TBitBtn;
    DataSourceCliente: TDataSource;
    ClientSetClientes: TClientDataSet;
    combo_produtos: TDBLookupComboBox;
    combo_clientes: TDBLookupComboBox;
    ClientSetProduto: TClientDataSet;
    DataSourceProduto: TDataSource;
    DataSourcePedido: TDataSource;
    ClientSetPedido: TClientDataSet;

    procedure FormCreate(Sender: TObject);
    procedure carregar_produtos_combobox(Sender: TObject);
    procedure carregar_clientes_combobox(Sender: TObject);
    procedure btn_adicionar_click(Sender: TObject);
    procedure dbgrid_remover_item_click(Column: TColumn);

    function calcularTotalPedido: Currency;
    procedure btn_finalizar_click(Sender: TObject);
  private
    ProdutoRepository: TProdutoRepository;
    ClienteRepository: TClienteRepository;
  public
    { Public declarations }
  end;

var
  TFrm_lancar_pedido: TTFrm_lancar_pedido;

implementation
{$R *.dfm}

procedure TTFrm_lancar_pedido.FormCreate(Sender: TObject);
begin
  // Inicializando usuário e carregando dados
  edit_pedido_usuario.Text := DataModule1.logado.Usuario;
  carregar_produtos_combobox(self);
  carregar_clientes_combobox(self);
end;

procedure TTFrm_lancar_pedido.carregar_produtos_combobox(Sender: TObject);
var
  Produtos: TList<TProduto>;
  Produto: TProduto;
begin
  try
    Produtos := ProdutoRepository.ListarTodos();

    ClientSetProduto.Close;
    ClientSetProduto.FieldDefs.Clear;
    ClientSetProduto.FieldDefs.Add('ID', ftInteger);
    ClientSetProduto.FieldDefs.Add('QuantidadeEstoque', ftInteger);
    ClientSetProduto.FieldDefs.Add('Nome', ftString, 30);
    ClientSetProduto.FieldDefs.Add('ValorUnitario', ftCurrency);
    ClientSetProduto.CreateDataSet;

    for Produto in Produtos do
    begin
      ClientSetProduto.Append;
      ClientSetProduto.FieldByName('ID').AsInteger := Produto.Id;
      ClientSetProduto.FieldByName('QuantidadeEstoque').AsInteger := Produto.QuantidadeEstoque;
      ClientSetProduto.FieldByName('Nome').AsString := Produto.Nome;
      ClientSetProduto.FieldByName('ValorUnitario').AsCurrency := Produto.PrecoUnit;
      ClientSetProduto.Post;
    end;

    DataSourceProduto.DataSet := ClientSetProduto;
  finally
    ProdutoRepository.Free;
  end;
end;

procedure TTFrm_lancar_pedido.carregar_clientes_combobox(Sender: TObject);
var
  Clientes: TList<TCliente>;
  Cliente: TCliente;
begin
  try
    Clientes := ClienteRepository.ListarTodos();

    ClientSetClientes.Close;
    ClientSetClientes.FieldDefs.Clear;
    ClientSetClientes.FieldDefs.Add('ID', ftInteger);
    ClientSetClientes.FieldDefs.Add('Nome', ftString, 30);
    ClientSetClientes.CreateDataSet;

    for Cliente in Clientes do
    begin
      ClientSetClientes.Append;
      ClientSetClientes.FieldByName('ID').AsInteger := Cliente.Id;
      ClientSetClientes.FieldByName('Nome').AsString := Cliente.Nome;
      ClientSetClientes.Post;
    end;

    DataSourceCliente.DataSet := ClientSetClientes;
  finally
    ClienteRepository.Free;
  end;
end;

procedure TTFrm_lancar_pedido.btn_adicionar_click(Sender: TObject);
var
  Valor: Currency;
  Quantidade: Integer;
  Produto: string;
  IsAdicionado: Boolean;
begin
  //  Validação de campos, cliente, produto e quantidade se estão vazio?
  if combo_clientes.Text = '' then
  begin
      ShowMessage(MsgCampoVazioCliente);
      exit;
  end;

  if combo_produtos.Text = '' then
  begin
      ShowMessage(MsgCampoVazioProduto);
      exit;
  end;

  if edit_produto_quantidade.Text = '' then
  begin
      ShowMessage(MsgCampoVazioQuantidade);
      exit;
  end;

  Produto := combo_produtos.ListSource.DataSet.FieldByName('Nome').AsString;
  Valor := combo_produtos.ListSource.DataSet.FieldByName('ValorUnitario').AsCurrency;
  Quantidade := StrToIntDef(edit_produto_quantidade.Text, 1);
  IsAdicionado := False;
  // Inicializa o dataset de pedidos, caso necessário
  if not ClientSetPedido.Active then
  begin
    ClientSetPedido.FieldDefs.Clear;
    ClientSetPedido.FieldDefs.Add('Produto', ftString, 50);
    ClientSetPedido.FieldDefs.Add('Quantidade', ftInteger);
    ClientSetPedido.FieldDefs.Add('Total', ftCurrency);
    ClientSetPedido.CreateDataSet;
  end;
  // Verifica se o produto já foi adicionado
  ClientSetPedido.DisableControls;
  try
    ClientSetPedido.First;
    while not ClientSetPedido.Eof do
    begin
      if ClientSetPedido.FieldByName('Produto').AsString = Produto then
      begin
        IsAdicionado := True;
        ClientSetPedido.Edit;
        ClientSetPedido.FieldByName('Quantidade').AsInteger := ClientSetPedido.FieldByName('Quantidade').AsInteger + Quantidade;
        ClientSetPedido.FieldByName('Total').AsCurrency := ClientSetPedido.FieldByName('Quantidade').AsInteger * Valor;
        ClientSetPedido.Post;
        Break;
      end;
      ClientSetPedido.Next;
    end;
  finally
    ClientSetPedido.EnableControls;
  end;
  // Caso o produto não tenha sido adicionado, inclui-o na lista
  if not IsAdicionado then
  begin
    ClientSetPedido.Append;
    ClientSetPedido.FieldByName('Produto').AsString := Produto;
    ClientSetPedido.FieldByName('Quantidade').AsInteger := Quantidade;
    ClientSetPedido.FieldByName('Total').AsCurrency := (Valor * Quantidade);
    ClientSetPedido.Post;
  end;
  // Atualiza as informações de total
  label_qtd_total.Caption := IntToStr(ClientSetPedido.RecordCount);
  label_total.Caption := FormatFloat('#,##0.00', CalcularTotalPedido);
  // Limpar campo combobox cliente e quantidade
  edit_produto_quantidade.Text := '1';
  combo_produtos.KeyValue  := Null;
end;

procedure TTFrm_lancar_pedido.dbgrid_remover_item_click(Column: TColumn);
var
  Produto: string;
begin
  Produto := ClientSetPedido.FieldByName('Produto').AsString;

  if Produto <> '' then
  begin
    if MessageDlg(MsgRemoverItem, mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
    begin
      ClientSetPedido.DisableControls;
      try
        ClientSetPedido.First;
        while not ClientSetPedido.Eof do
        begin
          if ClientSetPedido.FieldByName('Produto').AsString = Produto then
          begin
            ClientSetPedido.Delete;
            Break;
          end;
          ClientSetPedido.Next;
        end;
      finally
        ClientSetPedido.EnableControls;
      end;

      label_qtd_total.Caption := IntToStr(ClientSetPedido.RecordCount);
      label_total.Caption := FormatFloat('#,##0.00', CalcularTotalPedido);
    end;
  end;
end;

function TTFrm_lancar_pedido.calcularTotalPedido: Currency;
var
  Total: Currency;
begin
  Total := 0;

  if ClientSetPedido.Active and (ClientSetPedido.RecordCount > 0) then
  begin
    ClientSetPedido.DisableControls;
    try
      ClientSetPedido.First;
      while not ClientSetPedido.Eof do
      begin
        Total := Total + ClientSetPedido.FieldByName('Total').AsCurrency;
        ClientSetPedido.Next;
      end;
    finally
      ClientSetPedido.EnableControls;
    end;
  end;

  Result := Total;
end;

procedure TTFrm_lancar_pedido.btn_finalizar_click(Sender: TObject);
begin
   ShowMessage('Chamou');
end;

end.

