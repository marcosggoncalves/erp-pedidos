unit validation;

interface
uses
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.Mask,
  System.SysUtils,
  Vcl.Dialogs;

function ValidarFields(const Edits: array of TControl): Boolean;
function LimparFields(const Edits: array of TControl) : Boolean;

implementation

function LimparFields(const Edits: array of TControl): Boolean;
var
  i: Integer;
  EditField: TControl;
begin
  Result := True;

  for i := 0 to High(Edits) do
  begin
    EditField := Edits[i];

    if EditField is TEdit then
    begin
      TEdit(EditField).Clear;
    end;

    if EditField is TMaskEdit then
    begin
      TMaskEdit(EditField).Clear;
    end;
  end;
end;

function ValidarFields(const Edits: array of TControl): Boolean;
var
  i: Integer;
  EditField: TControl;
begin
  Result := True;

  for i := 0 to High(Edits) do
  begin
    EditField := Edits[i];

    if EditField is TEdit then
    begin
      if TEdit(EditField).Text = '' then
      begin
        ShowMessage(TEdit(EditField).TextHint);
        Result := False;
        Exit;
      end;
    end;

    if EditField is TMaskEdit then
    begin
      if TMaskEdit(EditField).Text = '' then
      begin
        ShowMessage(TMaskEdit(EditField).TextHint);
        Result := False;
        Exit;
      end;
    end;
  end;
end;
end .
