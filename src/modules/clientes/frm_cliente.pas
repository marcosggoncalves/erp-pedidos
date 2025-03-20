unit frm_cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, repository_cliente, entity_cliente,
  factory_cliente,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.DBCtrls;

type
  TTfrm_cliente = class(TForm)
    abas_navegacao: TPageControl;
    aba_cadastro: TTabSheet;
    aba_pesquisa: TTabSheet;
    panel_btns: TPanel;
    btn_salvar: TBitBtn;
    btn_limpar: TBitBtn;
    btn_excluir: TBitBtn;
    titulo_aba_cadastro: TLabel;
    label_cadastro: TLabel;
    label_id_cliente: TLabel;
    edit_id_cliente: TEdit;
    label_cpf_cnpj_cliente: TLabel;
    edit_documento_cliente: TEdit;
    label_nome_razao: TLabel;
    edit_nome_cliente: TEdit;
    Panel1: TPanel;
    aba_titulo_pesquisa: TLabel;
    titulo_filtro_nome: TLabel;
    btn_pesquisar: TBitBtn;
    ClientDataSet1: TClientDataSet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ComboBox_filtro_cliente: TComboBox;
    edit_filtro_search: TEdit;
    btn_limpar_pesquisa: TBitBtn;
    procedure btn_limpar_cadastro(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_salvar_click(Sender: TObject);
    procedure btn_pesquisar_click(Sender: TObject);
    procedure btn_limpar_pesquisa_click(Sender: TObject);
    procedure btn_excluir_click(Sender: TObject);
    procedure comboBox_filtro_cliente_change(Sender: TObject);
    procedure ddbridcell_selecionar(Column: TColumn);
  private
    ClienteRepository: TClienteRepository;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tfrm_cliente: TTfrm_cliente;

implementation

{$R *.dfm}

procedure TTfrm_cliente.btn_salvar_click(Sender: TObject);
var
  Cliente: TCliente;
  Id: Integer;
begin
  Id := 0;

  if (edit_nome_cliente.Text = '') or (edit_documento_cliente.Text = '') then
  begin
    ShowMessage('Preencha todos os campos!');
    Exit;
  end;

  if edit_id_cliente.Text <> '' then
  begin
    Id := StrToInt(edit_id_cliente.Text);
  end;

  Cliente := TClienteFactory.CriarCliente(Id, edit_nome_cliente.Text,
    edit_documento_cliente.Text);

  if edit_id_cliente.Text <> '' then
  begin
    try
      if ClienteRepository.Atualizar(Cliente) then
      begin
        ShowMessage('Cliente atualizado com sucesso!');
        btn_limpar_cadastro(self);
      end
      else
        ShowMessage('Erro ao atualizar cliente.');
    finally
      Cliente.Free;
    end;
  end
  else
    try
      if ClienteRepository.Adicionar(Cliente) then
      begin
        ShowMessage('Cliente salvo com sucesso!');

        btn_limpar_cadastro(self);
      end
      else
        ShowMessage('Erro ao salvar cliente.');
    finally
      Cliente.Free;
    end;
end;

procedure TTfrm_cliente.comboBox_filtro_cliente_change(Sender: TObject);
begin
  edit_filtro_search.Enabled := true;
  edit_filtro_search.Clear;
end;

procedure TTfrm_cliente.btn_pesquisar_click(Sender: TObject);
var
  Clientes: TList<TCliente>;
  Cliente: TCliente;
begin
  try
    Clientes := ClienteRepository.ListarTodos(ComboBox_filtro_cliente.Text,
      edit_filtro_search.Text);

    ClientDataSet1.Close;
    ClientDataSet1.FieldDefs.Clear;

    ClientDataSet1.FieldDefs.Add('ID', ftInteger);
    ClientDataSet1.FieldDefs.Add('Nome', ftString, 30);
    ClientDataSet1.FieldDefs.Add('DOCUMENTO(CPF/CNPJ)', ftString, 30);
    ClientDataSet1.CreateDataSet;

    for Cliente in Clientes do
    begin
      ClientDataSet1.Append;
      ClientDataSet1.FieldByName('ID').AsInteger := Cliente.Id;
      ClientDataSet1.FieldByName('Nome').AsString := Cliente.Nome;
      ClientDataSet1.FieldByName('DOCUMENTO(CPF/CNPJ)').AsString :=
        Cliente.CpfCnpj;
      ClientDataSet1.Post;
    end;

    DataSource1.DataSet := ClientDataSet1;
  finally
    ClienteRepository.Free;
  end;
end;

procedure TTfrm_cliente.btn_limpar_cadastro(Sender: TObject);
begin
  edit_id_cliente.Clear;
  edit_documento_cliente.Clear;
  edit_nome_cliente.Clear;
  edit_filtro_search.Clear;
  btn_excluir.Visible := false;
end;

procedure TTfrm_cliente.btn_limpar_pesquisa_click(Sender: TObject);
begin
  edit_filtro_search.Clear;
  ClientDataSet1.Open;
  ClientDataSet1.EmptyDataSet;
end;

procedure TTfrm_cliente.ddbridcell_selecionar(Column: TColumn);
var
  source: TDataSet;
begin
  abas_navegacao.ActivePageIndex := 0;
  source := DBGrid1.DataSource.DataSet;

  edit_id_cliente.Text := source.FieldByName('ID').AsString;
  edit_nome_cliente.Text := source.FieldByName('nome').AsString;
  edit_documento_cliente.Text :=
    source.FieldByName('DOCUMENTO(CPF/CNPJ)').AsString;

  btn_excluir.Visible := true;
end;

procedure TTfrm_cliente.FormCreate(Sender: TObject);
begin
  ClienteRepository := TClienteRepository.Create;
end;

procedure TTfrm_cliente.btn_excluir_click(Sender: TObject);
var
  ClienteId: Integer;
begin
  if edit_id_cliente.Text = '' then
  begin
    ShowMessage('Selecione um cliente para excluir!');
    Exit;
  end;

  ClienteId := StrToIntDef(edit_id_cliente.Text, 0);
  if ClienteId = 0 then
  begin
    ShowMessage('ID inválido!');
    Exit;
  end;

  if ClienteRepository.Remover(ClienteId) then
  begin
    ShowMessage('Cliente excluído com sucesso!');

    btn_limpar_cadastro(self);
  end
  else
    ShowMessage('Erro ao excluir cliente.');
end;

end.
