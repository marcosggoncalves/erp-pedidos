unit frm_pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, sessao, conexao,
  System.Generics.Collections,
  Vcl.DBCtrls, repository_produto, Datasnap.DBClient, entity_produto,
  repository_cliente,
  entity_cliente, constants, repository_pedido;

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
    label_listagem_produtos: TLabel;
    DataSourceCliente: TDataSource;
    ClientSetClientes: TClientDataSet;
    combo_produtos: TDBLookupComboBox;
    combo_clientes: TDBLookupComboBox;
    ClientSetProduto: TClientDataSet;
    DataSourceProduto: TDataSource;
    DataSourcePedido: TDataSource;
    ClientSetPedido: TClientDataSet;
    BitBtn1: TBitBtn;
    btn_cancelar_: TBitBtn;
    btn_finalizar_: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure carregar_produtos_combobox(Sender: TObject);
    procedure carregar_clientes_combobox(Sender: TObject);
    procedure btn_adicionar_click(Sender: TObject);
    procedure dbgrid_remover_item_click(Column: TColumn);
    procedure btn_finalizar_click(Sender: TObject);
    procedure mostrar_calculo_panel(Sender: TObject);
    procedure btn_limpar_click(Sender: TObject);

    function calcularTotalPedido: Currency;
  private
    ProdutoRepository: TProdutoRepository;
    ClienteRepository: TClienteRepository;
    PedidoRepository: TPedidoRepository;
  public
    { Public declarations }
  end;

var
  TFrm_lancar_pedido: TTFrm_lancar_pedido;

implementation

{$R *.dfm}

uses entity_pedido, entity_pedido_produto, factory_pedido, factory_produto_pedido;

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
        Total := Total + ClientSetPedido.FieldByName('SubTotal').AsCurrency;
        ClientSetPedido.Next;
      end;
    finally
      ClientSetPedido.EnableControls;
    end;
  end;

  Result := Total;
end;

procedure TTFrm_lancar_pedido.mostrar_calculo_panel(Sender: TObject);
begin
  label_qtd_total.Caption := IntToStr(ClientSetPedido.RecordCount);
  label_total.Caption := FormatFloat('#,##0.00', calcularTotalPedido);
end;

procedure TTFrm_lancar_pedido.FormCreate(Sender: TObject);
begin
  // Pegar os dados do usuário logado
  edit_pedido_usuario.Text := DataModule1.logado.Usuario;
  // carregar dados do combobox
  carregar_produtos_combobox(self);
  carregar_clientes_combobox(self);
end;

procedure TTFrm_lancar_pedido.btn_limpar_click(Sender: TObject);
begin
  ClientSetPedido.FieldDefs.Clear;
  ClientSetPedido.Close;

  label_qtd_total.Caption := '0';
  label_total.Caption := '0,00';
  edit_produto_quantidade.Text := '1';

  combo_clientes.KeyValue := Null;
  combo_produtos.KeyValue := Null;

  btn_finalizar_.Enabled := False;
  btn_cancelar_.Enabled := False;
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
      ClientSetProduto.FieldByName('QuantidadeEstoque').AsInteger :=
        Produto.QuantidadeEstoque;
      ClientSetProduto.FieldByName('Nome').AsString := Produto.Nome;
      ClientSetProduto.FieldByName('ValorUnitario').AsCurrency :=
        Produto.PrecoUnit;
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
  Id: Integer;
  Produto: string;
  IsAdicionado: Boolean;
begin
  // Validação de campos, produto e quantidade se estão vazio
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

  Id := combo_produtos.ListSource.DataSet.FieldByName('ID').AsInteger;
  Produto := combo_produtos.ListSource.DataSet.FieldByName('Nome').AsString;
  Valor := combo_produtos.ListSource.DataSet.FieldByName('ValorUnitario')
    .AsCurrency;
  Quantidade := StrToIntDef(edit_produto_quantidade.Text, 1);
  IsAdicionado := False;

  // Inicia o dataset de pedidos
  if not ClientSetPedido.Active then
  begin
    ClientSetPedido.FieldDefs.Clear;
    ClientSetPedido.FieldDefs.Add('ID', ftInteger);
    ClientSetPedido.FieldDefs.Add('Produto', ftString, 25);
    ClientSetPedido.FieldDefs.Add('Quantidade', ftInteger);
    ClientSetPedido.FieldDefs.Add('Valor por unidade', ftCurrency);
    ClientSetPedido.FieldDefs.Add('SubTotal', ftCurrency);
    ClientSetPedido.CreateDataSet;
  end;
  // Verificar se o produto já foi adicionado
  ClientSetPedido.DisableControls;
  try
    ClientSetPedido.First;
    while not ClientSetPedido.Eof do
    begin
      if ClientSetPedido.FieldByName('Produto').AsString = Produto then
      begin
        IsAdicionado := True;
        ClientSetPedido.Edit;
        ClientSetPedido.FieldByName('Quantidade').AsInteger :=
          ClientSetPedido.FieldByName('Quantidade').AsInteger + Quantidade;
        ClientSetPedido.FieldByName('SubTotal').AsCurrency :=
          ClientSetPedido.FieldByName('Quantidade').AsInteger * Valor;
        ClientSetPedido.Post;
        Break;
      end;
      ClientSetPedido.Next;
    end;
  finally
    ClientSetPedido.EnableControls;
  end;
  // Caso o produto não tenha sido adicionado
  if not IsAdicionado then
  begin
    ClientSetPedido.Append;
    ClientSetPedido.FieldByName('ID').AsInteger := Id;
    ClientSetPedido.FieldByName('Produto').AsString := Produto;
    ClientSetPedido.FieldByName('Quantidade').AsInteger := Quantidade;
    ClientSetPedido.FieldByName('Valor por unidade').AsCurrency := Valor;
    ClientSetPedido.FieldByName('SubTotal').AsCurrency := (Valor * Quantidade);
    ClientSetPedido.Post;
  end;
  // Habilitar botão para finalizar
  if not btn_finalizar_.Enabled then
  begin
    btn_finalizar_.Enabled := True;
    btn_cancelar_.Enabled := True;
  end;
  // Atualiza as informações de total
  mostrar_calculo_panel(self);
  // Limpar campo combobox cliente e quantidade
  edit_produto_quantidade.Text := '1';
  combo_produtos.KeyValue := Null;
end;

procedure TTFrm_lancar_pedido.dbgrid_remover_item_click(Column: TColumn);
var
  Produto: string;
begin
  Produto := ClientSetPedido.FieldByName('Produto').AsString;

  if Produto <> '' then
  begin
    if MessageDlg(MsgRemoverItem, mtConfirmation, [mbOK, mbCancel], 0) = mrOk
    then
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

      // Atualiza totalizadores em tela, panel
      mostrar_calculo_panel(self);
    end;
  end;
end;

procedure TTFrm_lancar_pedido.btn_finalizar_click(Sender: TObject);
var
  Pedido: TPedido;
  PedidoProduto: TPedidoProduto;
  PedidoRepository: TPedidoRepository;
begin
  if MessageDlg(MsgFinalizarPedido, mtConfirmation, [mbOK, mbCancel], 0) = mrOk
  then
  begin
    if combo_clientes.Text = '' then
    begin
      ShowMessage(MsgCampoVazioCliente);
      exit;
    end;
    PedidoRepository := TPedidoRepository.Create;

     // Verificar estoques dos produtos antes de realizar pedido
    ClientSetPedido.First;
    while not ClientSetPedido.Eof do
    begin
      try
        if not ProdutoRepository.AlterarEstoque(ClientSetPedido.FieldByName('ID').AsInteger,ClientSetPedido.FieldByName('Quantidade').AsInteger) then
        begin
          if MessageDlg(MsgEstoqueInsuficiente + ClientSetPedido.FieldByName('Produto').AsString, mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
            begin
                ClientSetPedido.Delete;

                // Atualiza totalizadores em tela, panel
                mostrar_calculo_panel(self);
            end;
            exit;
        end;
      finally
        ProdutoRepository.Free;
      end;
      ClientSetPedido.Next;
    end;

    try
      Pedido := TPedidoFactory.CriarPedido(0, combo_clientes.KeyValue, DataModule1.logado.Id, Now, calcularTotalPedido);

      try
        Pedido.Id := PedidoRepository.AbrirPedido(Pedido);

        ClientSetPedido.First;
        while not ClientSetPedido.Eof do
        begin
          PedidoProduto := TPedidoProduto.Create;
          try
            PedidoProduto := TPedidoProdutoFactory.CriarPedidoProduto(0,Pedido.Id, ClientSetPedido.FieldByName('ID').AsInteger,ClientSetPedido.FieldByName('Quantidade').AsInteger);
            // Verificar estoque do produto e realizar baixa na quantidade atual
            if ProdutoRepository.AlterarEstoque(PedidoProduto.ProdutoId, PedidoProduto.Quantidade, True) then
            begin
              PedidoRepository.InserirProdutoNoPedido(PedidoProduto);
            end;
          finally
            PedidoProduto.Free;
          end;
          ClientSetPedido.Next;
        end;

        ShowMessage(MsgPedidoFInalizado);
      finally
        Pedido.Free;
        btn_limpar_click(self);
      end;
    except
      on E: Exception do
        ShowMessage('AVISO:' + E.Message);
    end;

    PedidoRepository.Free;
  end;
end;

end.
