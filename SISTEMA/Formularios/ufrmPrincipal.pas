unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, MidasLib;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    C1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    C2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure C2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  ufrmEmpresas, ufrmPessoas, uFuncoes, udmPrincipal, ufrmFuncionarios;

{$R *.dfm}

procedure TfrmPrincipal.C2Click(Sender: TObject);
begin
  AbrirFormulario(Self, TfrmFuncionarios, frmFuncionarios);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  //dmPrincipal.Conexao.Open;
end;

procedure TfrmPrincipal.N1Click(Sender: TObject);
begin
  AbrirFormulario(Self, TfrmPessoas, frmPessoas);
end;

procedure TfrmPrincipal.N2Click(Sender: TObject);
begin
  AbrirFormulario(Self, TfrmEmpresas, frmEmpresas);
end;

end.
