unit ufrmPadraoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfrmPadraoCad = class(TForm)
    pnMenu: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    Button5: TButton;
    pcPrincipal: TPageControl;
    tabPesquisar: TTabSheet;
    tabDados: TTabSheet;
    Panel1: TPanel;
    grDados: TDBGrid;
    btnBuscar: TButton;
    Label1: TLabel;
    dsPrincipal: TDataSource;
    edtFiltro: TEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dsPrincipalDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadraoCad: TfrmPadraoCad;

implementation

{$R *.dfm}

procedure TfrmPadraoCad.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPadraoCad.btnNovoClick(Sender: TObject);
begin
  dsPrincipal.DataSet.Open;
  dsPrincipal.DataSet.Append;

  pcPrincipal.ActivePage := tabDados;
end;

procedure TfrmPadraoCad.btnSalvarClick(Sender: TObject);
begin
  if dsPrincipal.State in dsEditModes then
  begin
    dsPrincipal.DataSet.Post;
    TClientDataSet(dsPrincipal.DataSet).ApplyUpdates(0);
  end;
end;

procedure TfrmPadraoCad.dsPrincipalDataChange(Sender: TObject; Field: TField);
begin
  btnNovo.Enabled := not (dsPrincipal.State in dsEditModes);
  btnSalvar.Enabled := dsPrincipal.State in dsEditModes;
  btnExcluir.Enabled := not (dsPrincipal.State in dsEditModes) and (dsPrincipal.DataSet.RecordCount > 0);
end;

procedure TfrmPadraoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPadraoCad.FormShow(Sender: TObject);
begin
  pcPrincipal.ActivePage := tabPesquisar;
end;

end.
