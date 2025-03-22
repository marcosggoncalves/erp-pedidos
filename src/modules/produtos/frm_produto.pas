unit frm_produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, validation_field, entity_produto, factory_produto, repository_produto,
  System.Generics.Collections, constants;

type
  TTfrm_produto = class(TForm)
    abas_produtos: TPageControl;
    aba_produto_cadastro: TTabSheet;
    aba_produto_pesquisa: TTabSheet;
    panel_btns_produto: TPanel;
    btn_excluir: TBitBtn;
    btn_limpar: TBitBtn;
    btn_salvar: TBitBtn;
    titulo_aba_cadastro: TLabel;
    label_cadastro: TLabel;
    edit_id_produto: TEdit;
    edit_produto_nome: TEdit;
    label_id_cliente: TLabel;
    label_produto_descricao: TLabel;
    label_produto_valor: TLabel;
    label_produto_quantidade: TLabel;
    edit_produto_quantidade: TEdit;
    edit_produto_valor: TMaskEdit;
    edit_filtro_search: TEdit;
    titulo_filtro_nome: TLabel;
    btn_pesquisar: TBitBtn;
    btn_limpar_pesquisa: TBitBtn;
    aba_titulo_pesquisa: TLabel;
    panel_btns_pesquisa: TPanel;
    label_produto_pesquisar: TLabel;
    btn_produto_pesquisar: TBitBtn;
    edit_produto_pesquisa: TEdit;
    btn_produto_limpar_pq: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    //Prodecures "ABA CADASTRO"
    procedure btn_salvar_click(Sender: TObject);
    procedure btn_limpar_cadastro_click(Sender: TObject);
    procedure btn_excluir_click(Sender: TObject);
    //Prodecures "ABA PESQUISA"
    procedure btn_limpar_pesquisa_click(Sender: TObject);
    procedure btn_pesquisar_click(Sender: TObject);
    procedure dbgridcell_selecionar(Column: TColumn);
  private
    ProdutoRepository: TProdutoRepository;
  end;

var
  Tfrm_produto: TTfrm_produto;

implementation

{$R *.dfm}

//Prodecures "ABA CADASTRO"
procedure TTfrm_produto.btn_limpar_cadastro_click(Sender: TObject);
begin
  LimparFields([edit_id_produto,edit_produto_nome, edit_produto_quantidade, edit_produto_valor]);
  btn_excluir.Visible := False;
end;

procedure TTfrm_produto.btn_excluir_click(Sender: TObject);
var
  ClienteId: Integer;
begin
  if edit_id_produto.Text = '' then
  begin
    ShowMessage(constants.MsgSelecioneExcluir);
    Exit;
  end;

  ClienteId := StrToIntDef(edit_id_produto.Text, 0);
  if ClienteId = 0 then
  begin
    ShowMessage(constants.MsgIDInvalido);
    Exit;
  end;

  if ProdutoRepository.Remover(ClienteId) then
  begin
    ShowMessage(constants.MsgExcluidoSucesso);

    btn_limpar_cadastro_click(self);
  end
  else
    ShowMessage(constants.MsgErroExcluir);
end;

procedure TTfrm_produto.btn_salvar_click(Sender: TObject);
var
  Produto: TProduto;
  Id: Integer;
  Valor: Currency;
  Quantidade: Integer;
begin
  Id := 0;

  if not ValidarFields([edit_produto_nome, edit_produto_quantidade, edit_produto_valor]) then
    Exit;

  if edit_id_produto.Text <> '' then
  begin
    Id := StrToInt(edit_id_produto.Text);
  end;

  Valor := StrToCurr(edit_produto_valor.Text);

  Quantidade := StrToInt(edit_produto_quantidade.Text);

  Produto := TProdutoFactory.CriarProduto(Id, edit_produto_nome.Text, Valor, Quantidade);

  if edit_id_produto.Text <> '' then
  begin
    try
      if ProdutoRepository.Atualizar(Produto) then
      begin
         ShowMessage(constants.MsgAtualizadoSucesso);
      end
      else
        ShowMessage(constants.MsgErroAtualizar);
    finally
      Produto.Free;

      btn_limpar_cadastro_click(self);
    end;
  end
  else
    try
      if ProdutoRepository.Adicionar(Produto) then
      begin
        ShowMessage(constants.MsgSalvoSucesso);
      end
      else
         ShowMessage(constants.MsgErroSalvar);
    finally
      Produto.Free;

      btn_limpar_cadastro_click(self);
    end;
end;

//Prodecures "ABA PESQUISA"
procedure TTfrm_produto.dbgridcell_selecionar(Column: TColumn);
var
  source: TDataSet;
begin
  abas_produtos.ActivePageIndex := 0;
  source := DBGrid1.DataSource.DataSet;

  edit_id_produto.Text := source.FieldByName('ID').AsString;
  edit_produto_nome.Text := source.FieldByName('Nome').AsString;

  btn_excluir.Visible := true;
end;

procedure TTfrm_produto.btn_limpar_pesquisa_click(Sender: TObject);
begin
  LimparFields([edit_produto_pesquisa]);
  btn_produto_limpar_pq.Enabled := False;

  ClientDataSet1.Open;
  ClientDataSet1.EmptyDataSet;
end;

procedure TTfrm_produto.btn_pesquisar_click(Sender: TObject);
var
  Produtos: TList<TProduto>;
  Produto: TProduto;
begin
  try
    Produtos := ProdutoRepository.ListarTodos(edit_produto_pesquisa.Text);

    ClientDataSet1.Close;
    ClientDataSet1.FieldDefs.Clear;

    ClientDataSet1.FieldDefs.Add('ID', ftInteger);
    ClientDataSet1.FieldDefs.Add('Nome', ftString, 30);
    ClientDataSet1.CreateDataSet;

    for Produto in Produtos do
    begin
      ClientDataSet1.Append;
      ClientDataSet1.FieldByName('ID').AsInteger := Produto.Id;
      ClientDataSet1.FieldByName('Nome').AsString := Produto.Nome;
      ClientDataSet1.Post;
    end;

    DataSource1.DataSet := ClientDataSet1;
  finally
    ProdutoRepository.Free;
    btn_produto_limpar_pq.Enabled := True;
  end;
end;
end.
