unit frm_cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, repository_cliente, entity_cliente,
  factory_cliente, validation_field, constants,
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
    //Prodecures "ABA CADASTRO"
    procedure btn_limpar_cadastro(Sender: TObject);
    procedure btn_salvar_click(Sender: TObject);
    procedure btn_excluir_click(Sender: TObject);
    //Prodecures "ABA PESQUISA"
    procedure btn_pesquisar_click(Sender: TObject);
    procedure btn_limpar_pesquisa_click(Sender: TObject);
    procedure combobox_filtro_cliente_change(Sender: TObject);
    procedure dbgridcell_selecionar(Column: TColumn);
  private
    ClienteRepository: TClienteRepository;

  end;

var
  Tfrm_cliente: TTfrm_cliente;

implementation

{$R *.dfm}

//Prodecures "ABA CADASTRO"
procedure TTfrm_cliente.btn_salvar_click(Sender: TObject);
var
  Cliente: TCliente;
  Id: Integer;
begin
  Id := 0;

  if not ValidarFields([edit_documento_cliente, edit_nome_cliente]) then
    Exit;

  if edit_id_cliente.Text <> '' then
  begin
    Id := StrToInt(edit_id_cliente.Text);
  end;

  Cliente := TClienteFactory.CriarCliente(Id, edit_nome_cliente.Text, edit_documento_cliente.Text);

  if edit_id_cliente.Text <> '' then
  begin
    try
      if ClienteRepository.Atualizar(Cliente) then
      begin
        ShowMessage(constants.MsgAtualizadoSucesso);
      end
      else
        ShowMessage(constants.MsgErroAtualizar);
    finally
      Cliente.Free;

      btn_limpar_cadastro(self);
    end;
  end
  else
    try
      if ClienteRepository.Adicionar(Cliente) then
      begin
       ShowMessage(constants.MsgSalvoSucesso);
      end
      else
        ShowMessage(constants.MsgErroSalvar);
    finally
      Cliente.Free;

      btn_limpar_cadastro(self);
    end;
end;

procedure TTfrm_cliente.btn_limpar_cadastro(Sender: TObject);
begin
  LimparFields([edit_id_cliente, edit_documento_cliente, edit_nome_cliente, edit_filtro_search ]);
  btn_excluir.Visible := false;
end;

procedure TTfrm_cliente.btn_excluir_click(Sender: TObject);
var
  ClienteId: Integer;
begin
  if edit_id_cliente.Text = '' then
  begin
    ShowMessage(constants.MsgSelecioneExcluir);
    Exit;
  end;

  ClienteId := StrToIntDef(edit_id_cliente.Text, 0);
  if ClienteId = 0 then
  begin
    ShowMessage(constants.MsgIDInvalido);
    Exit;
  end;

  if ClienteRepository.Remover(ClienteId) then
  begin
    ShowMessage(constants.MsgExcluidoSucesso);

    btn_limpar_cadastro(self);
  end
  else
    ShowMessage(constants.MsgExcluidoSucesso);
end;

//Prodecures "ABA PESQUISA"
procedure TTfrm_cliente.btn_limpar_pesquisa_click(Sender: TObject);
begin
  edit_filtro_search.Clear;
  btn_limpar_pesquisa.Enabled := False;
  ClientDataSet1.Open;
  ClientDataSet1.EmptyDataSet;
end;

procedure TTfrm_cliente.combobox_filtro_cliente_change(Sender: TObject);
begin
  if ComboBox_filtro_cliente.Text <> '' then
  begin
    edit_filtro_search.Enabled := true;
    edit_filtro_search.Clear;
  end;
end;

procedure TTfrm_cliente.btn_pesquisar_click(Sender: TObject);
var
  Clientes: TList<TCliente>;
  Cliente: TCliente;
begin
  try
    Clientes := ClienteRepository.ListarTodos(ComboBox_filtro_cliente.Text, edit_filtro_search.Text);

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
      ClientDataSet1.FieldByName('DOCUMENTO(CPF/CNPJ)').AsString := Cliente.CpfCnpj;
      ClientDataSet1.Post;
    end;

    DataSource1.DataSet := ClientDataSet1;
  finally
    ClienteRepository.Free;

    btn_limpar_pesquisa.Enabled := True;
  end;
end;

procedure TTfrm_cliente.dbgridcell_selecionar(Column: TColumn);
var
  source: TDataSet;
  begin
    abas_navegacao.ActivePageIndex := 0;
    source := DBGrid1.DataSource.DataSet;

    edit_id_cliente.Text := source.FieldByName('ID').AsString;
    edit_nome_cliente.Text := source.FieldByName('nome').AsString;
    edit_documento_cliente.Text := source.FieldByName('DOCUMENTO(CPF/CNPJ)').AsString;

    btn_excluir.Visible := true;
  end;
end.
