program ExtraDigital;

uses
  Vcl.Forms,
  ufrmPrincipal in 'Formularios\ufrmPrincipal.pas' {frmPrincipal},
  ufrmPadraoCad in 'Formularios\ufrmPadraoCad.pas' {frmPadraoCad},
  ufrmPessoas in 'Formularios\ufrmPessoas.pas' {frmPessoas},
  ufrmEmpresas in 'Formularios\ufrmEmpresas.pas' {frmEmpresas},
  uFuncoes in 'Classes\uFuncoes.pas',
  udmPrincipal in 'DataModules\udmPrincipal.pas' {dmPrincipal: TDataModule},
  udmPessoas in 'udmPessoas.pas' {dmPessoas: TDataModule},
  uFuncoesDB in 'Classes\uFuncoesDB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TdmPessoas, dmPessoas);
  Application.Run;
end.
