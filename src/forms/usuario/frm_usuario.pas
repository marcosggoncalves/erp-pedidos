unit frm_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Mask, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  System.Generics.Collections,
  constants, entity_usuario, factory_usuario, repository_usuario, validation,
  mascaras;

type
  TTfrm_usuario = class(TForm)
    abas_usuarios: TPageControl;
    aba_usuario_cadastro: TTabSheet;
    aba_usuario_pesquisa: TTabSheet;
    btn_limpar: TBitBtn;
    btn_salvar: TBitBtn;
    titulo_aba_cadastro: TLabel;
    panel_btns_usuarios: TPanel;
    btn_excluir: TBitBtn;
    label_cadastro: TLabel;
    label_usuario_id: TLabel;
    edit_usuario_id: TEdit;
    label_usuario_nome: TLabel;
    edit_usuario_nome: TEdit;
    label_cadastro_cpf: TLabel;
    label_cadastro_senha: TLabel;
    edit_usuario_senha: TEdit;
    Panel1: TPanel;
    aba_titulo_pesquisa: TLabel;
    titulo_filtro_nome: TLabel;
    btn_usuario_pesquisar: TBitBtn;
    selecionar_filtro_usuario: TComboBox;
    edit_filtro_search: TEdit;
    btn_limpar_pesquisa: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    edit_usuario_cpf: TEdit;
    // Prodecures "ABA CADASTRO"
    procedure btn_salvar_click(Sender: TObject);
    procedure btn_limpar_cadastro_click(Sender: TObject);
    procedure btn_excluir_click(Sender: TObject);
    procedure edit_usuario_cpf_mascara(Sender: TObject);
    // Prodecures "ABA PESQUISA"
    procedure btn_limpar_pesquisa_click(Sender: TObject);
    procedure btn_pesquisar_click(Sender: TObject);
    procedure dbgridcell_selecionar(Column: TColumn);
    procedure selecionar_filtro_usuario_change(Sender: TObject);
    procedure edit_filtro_search_change(Sender: TObject);

  private
    UsuarioRepository: TUsuarioRepository;
  end;

var
  Tfrm_usuario: TTfrm_usuario;

implementation

{$R *.dfm}

// Prodecures "ABA CADASTRO"
procedure TTfrm_usuario.btn_limpar_cadastro_click(Sender: TObject);
begin
  LimparFields([edit_usuario_id, edit_usuario_nome, edit_usuario_cpf,
    edit_usuario_senha]);
  btn_excluir.Visible := False;
end;

procedure TTfrm_usuario.btn_excluir_click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir cadastro do usuário?', mtInformation,
    [mbOK, mbCancel], 0) = mrOk then
  begin
    if UsuarioRepository.Remover(StrToIntDef(edit_usuario_id.Text, 0)) then
    begin
      ShowMessage(constants.MsgExcluidoSucesso);

      btn_limpar_cadastro_click(self);
    end
    else
      ShowMessage(constants.MsgErroExcluir);
  end;
end;

procedure TTfrm_usuario.btn_salvar_click(Sender: TObject);
var
  Usuario: TUsuario;
  Id: Integer;
begin
  Id := 0;

  if not ValidarFields([edit_usuario_nome, edit_usuario_cpf, edit_usuario_senha])
  then
    Exit;

  if edit_usuario_id.Text <> '' then
  begin
    Id := StrToInt(edit_usuario_id.Text);
  end;

  Usuario := TUsuarioFactory.CriarUsuario(Id, edit_usuario_nome.Text, edit_usuario_cpf.Text, edit_usuario_senha.Text);

  if edit_usuario_id.Text <> '' then
  begin
    try
      if MessageDlg('Deseja salvar alterações efetuadas?', mtConfirmation,
        [mbOK, mbCancel], 0) = mrOk then
      begin
        if UsuarioRepository.Atualizar(Usuario) then
        begin
          ShowMessage(constants.MsgAtualizadoSucesso);
        end
        else
          ShowMessage(constants.MsgErroAtualizar);
      end;
    finally
      Usuario.Free;

      btn_limpar_cadastro_click(self);
    end;
  end
  else
    try
      if UsuarioRepository.Adicionar(Usuario) then
      begin
        ShowMessage(constants.MsgSalvoSucesso);
      end
      else
        ShowMessage(constants.MsgErroSalvar);
    finally
      Usuario.Free;

      btn_limpar_cadastro_click(self);
    end;
end;

procedure TTfrm_usuario.edit_usuario_cpf_mascara(Sender: TObject);
begin
  AplicarMascaraCPFCNPJ(edit_usuario_cpf, 'CPF');
end;

// Prodecures "ABA PESQUISA"
procedure TTfrm_usuario.edit_filtro_search_change(Sender: TObject);
begin
  if selecionar_filtro_usuario.Text = 'CPF' then
  begin
     AplicarMascaraCPFCNPJ(edit_filtro_search, 'CPF');
  end;
end;

procedure TTfrm_usuario.dbgridcell_selecionar(Column: TColumn);
var
  source: TDataSet;
begin
  if MessageDlg('Deseja editar o cadastro selecionado?',
    mtConfirmation, [mbOK, mbCancel], 0) = mrOk then
  begin
    abas_usuarios.ActivePageIndex := 0;
    source := DBGrid1.DataSource.DataSet;

    edit_usuario_id.Text := source.FieldByName('ID').AsString;
    edit_usuario_nome.Text := source.FieldByName('Usuario').AsString;;
    edit_usuario_cpf.Text := source.FieldByName('CPF').AsString;

    btn_excluir.Visible := true;
  end;

end;

procedure TTfrm_usuario.selecionar_filtro_usuario_change(Sender: TObject);
begin
  edit_filtro_search.Enabled := true;
  edit_filtro_search.Clear;
end;

procedure TTfrm_usuario.btn_limpar_pesquisa_click(Sender: TObject);
begin
  LimparFields([edit_filtro_search]);
  btn_limpar_pesquisa.Enabled := False;

  ClientDataSet1.Open;
  ClientDataSet1.EmptyDataSet;
end;

procedure TTfrm_usuario.btn_pesquisar_click(Sender: TObject);
var
  Usuarios: TList<TUsuario>;
  Usuario: TUsuario;
begin
  try
    Usuarios := UsuarioRepository.ListarTodos(selecionar_filtro_usuario.Text,
      edit_filtro_search.Text);

    ClientDataSet1.Close;
    ClientDataSet1.FieldDefs.Clear;

    ClientDataSet1.FieldDefs.Add('ID', ftInteger);
    ClientDataSet1.FieldDefs.Add('Usuario', ftString, 35);
    ClientDataSet1.FieldDefs.Add('CPF', ftString, 30);
    ClientDataSet1.CreateDataSet;

    for Usuario in Usuarios do
    begin
      ClientDataSet1.Append;
      ClientDataSet1.FieldByName('ID').AsInteger := Usuario.Id;
      ClientDataSet1.FieldByName('Usuario').AsString := Usuario.Usuario;
      ClientDataSet1.FieldByName('CPF').AsString := Usuario.CPF;
      ClientDataSet1.Post;
    end;

    DataSource1.DataSet := ClientDataSet1;
  finally
    UsuarioRepository.Free;
    btn_limpar_pesquisa.Enabled := true;
  end;
end;

end.
