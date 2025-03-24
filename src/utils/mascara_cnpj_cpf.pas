unit mascara_cnpj_cpf;

interface

uses System.SysUtils, Vcl.Controls, Vcl.StdCtrls;

procedure AplicarMascaraCPFCNPJ(Edit: TEdit; Tipo: String = '');

implementation

procedure AplicarMascaraCPFCNPJ(Edit: TEdit; Tipo: String = '');
var
  TextoSemMascara, TextoFormatado: string;
  I: Integer;
begin
  TextoSemMascara := '';

  // Remover caracteres especiais, deixar somente os númericos.
  for I := 1 to Length(Edit.Text) do
    if CharInSet(Edit.Text[I], ['0'..'9'])  then
      TextoSemMascara := TextoSemMascara + Edit.Text[I];

  // Limitador CPF (11) ou CNPJ (14), não deixar usuário inserir caractres a mais.
  if Length(TextoSemMascara) > 14 then
    TextoSemMascara := Copy(TextoSemMascara, 1, 14)
  else if (Length(TextoSemMascara) > 11) and (Tipo = 'CPF') then
    TextoSemMascara := Copy(TextoSemMascara, 1, 11);

  //CPF
  if (Length(TextoSemMascara) <= 11) or (Tipo = 'CPF') then
  begin
    TextoFormatado := TextoSemMascara;
    if Length(TextoSemMascara) > 3 then
      Insert('.', TextoFormatado, 4);
    if Length(TextoSemMascara) > 6 then
      Insert('.', TextoFormatado, 8);
    if Length(TextoSemMascara) > 9 then
      Insert('-', TextoFormatado, 12);
  end
  else
  begin
    // CNPJ
    TextoFormatado := TextoSemMascara;
    if Length(TextoSemMascara) > 2 then
      Insert('.', TextoFormatado, 3);
    if Length(TextoSemMascara) > 5 then
      Insert('.', TextoFormatado, 7);
    if Length(TextoSemMascara) > 8 then
      Insert('/', TextoFormatado, 11);
    if Length(TextoSemMascara) > 12 then
      Insert('-', TextoFormatado, 16);
  end;

  if Edit.Text <> TextoFormatado then
  begin
    Edit.Text := TextoFormatado;
    Edit.SelStart := Length(Edit.Text);
  end;
end;
end .

