unit uFuncoes;

interface

uses
  Vcl.Forms, System.Classes, Winapi.Windows;

  function AbrirFormulario(oFormPai: TForm; oForm: TFormClass; var Reference): Boolean;

implementation

function IsChildFormExist(InstanceClass: TFormClass): Boolean;
var
  I: Integer;
begin
  with (Application.MainForm) do
    for I := 0 to MDIChildCount - 1 do
      if (MDIChildren[i] is InstanceClass) then
      begin
        Result := True;
        Exit;
      end;
  Result:= False;
end;

function AbrirFormulario(oFormPai: TForm; oForm: TFormClass; var Reference): Boolean;
var
  Instance: TForm;
begin
  LockWindowUpdate(oFormPai.Handle);
  if not IsChildFormExist(oForm) then
    try
      Instance:= TForm(oForm.NewInstance);
      TForm(Reference):= Instance;
      try
        Instance.Create(oFormPai);
        if (Instance as TForm).FormStyle = fsNormal then
        begin
          (Instance as TForm).FormStyle := fsMdiChild;
          (Instance as TForm).Visible := True;
        end;
      except
        TForm(Reference):= nil;
        Instance.Free;
        raise;
      end;
    finally

    end
  else
    with TForm(Reference) do
    begin
      if WindowState = wsMinimized then WindowState:= wsNormal;
      BringToFront;
      SetFocus;
    end;

  LockWindowUpdate(0);
end;

end.
