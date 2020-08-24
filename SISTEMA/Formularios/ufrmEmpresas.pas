unit ufrmEmpresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmPadraoCad, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.Mask, Data.FMTBcd, Data.SqlExpr;

type
  TfrmEmpresas = class(TfrmPadraoCad)
    dsPqEmpresas: TDataSource;
    dsComboCidade: TDataSource;
    dsComboUF: TDataSource;
    Label2: TLabel;
    dbIDEMPRESA: TDBEdit;
    Label3: TLabel;
    dbNMEMPRESA: TDBEdit;
    dbSTATIVO: TDBCheckBox;
    dbNOCNPJ: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbNOINSCRICAO: TDBEdit;
    Label7: TLabel;
    dbDTABERTURA: TDBEdit;
    Label8: TLabel;
    dbDTCADASTRO: TDBEdit;
    Label9: TLabel;
    dbTXEMAIL: TDBEdit;
    Label11: TLabel;
    dbTLCOMERCIAL: TDBEdit;
    Label12: TLabel;
    dbTLCELULAR: TDBEdit;
    Label10: TLabel;
    dbTXOBS: TDBMemo;
    dsDetEndereco: TDataSource;
    dsCadEndereco: TDataSource;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    dbNOCEP: TDBEdit;
    dbNMENDERECO: TDBEdit;
    dbNOENDERECO: TDBEdit;
    dbNMBAIRRO: TDBEdit;
    dbNMCIDADE: TDBLookupComboBox;
    dbSGUF: TDBLookupComboBox;
    Panel2: TPanel;
    grEnderecos: TDBGrid;
    btnNovoEndereco: TButton;
    btnSalvarEndereco: TButton;
    btnExcluirEndereco: TButton;
    dbSTATIVOENDERECO: TDBCheckBox;
    procedure btnBuscarClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnNovoEnderecoClick(Sender: TObject);
    procedure btnSalvarEnderecoClick(Sender: TObject);
    procedure btnExcluirEnderecoClick(Sender: TObject);
    procedure dbSTATIVOENDERECOClick(Sender: TObject);
    procedure dbSTATIVOENDERECOEnter(Sender: TObject);
    procedure grEnderecosCellClick(Column: TColumn);
    procedure dsCadEnderecoStateChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresas: TfrmEmpresas;

implementation

uses
  udmEmpresas, udmPrincipal, uEnderecos;

{$R *.dfm}

procedure TfrmEmpresas.btnBuscarClick(Sender: TObject);
var
  aSQL: TStringList;
begin
  inherited;
  aSQL := TStringList.Create;
  try
    aSQL.Clear;
    aSQL.Add('SELECT EMP.IDEMPRESA, EMP.NMEMPRESA, EMP.NOCNPJ, EMP.STATIVO FROM CADEMPRESA EMP');
    if StrToIntDef(edtFiltro.Text, 0) = 0 then
    begin
      aSQL.Add('WHERE (UPPER(EMP.NMEMPRESA) LIKE ''%' + AnsiUpperCase(edtFiltro.Text) + '%'' OR ');
      aSQL.Add('    EMP.NOCNPJ LIKE ''%' + edtFiltro.Text + '%'') ');
    end
    else
    begin
      aSQL.Add('WHERE EMP.IDEMPRESA = ' + (edtFiltro.Text));
    end;

    aSQL.Add('  AND (EMP.STEXCLUIDO = ''N'' OR EMP.STEXCLUIDO IS NULL) ');

    dmEmpresas.cdsPqEmpresas.Close;
    dmEmpresas.cdsPqEmpresas.CommandText := aSQL.Text;
    dmEmpresas.cdsPqEmpresas.Open;
  finally
    FreeAndNil(aSQL);
  end;
end;

procedure TfrmEmpresas.btnExcluirClick(Sender: TObject);
var
  oDados: TSQLQuery;
  aSQL: TStringList;
begin
  inherited;
  if Application.MessageBox('Deseja excluir esta Empresa?','Confirmação', MB_YESNO + Mb_IconInformation + MB_DEFBUTTON2) = 6 then
  begin
    oDados := TSQLQuery.Create(nil);
    oDados.SQLConnection := dmPrincipal.Conexao;

    aSQL := TStringList.Create;
    try
      aSQL.Clear;
      aSQL.Add('UPDATE CADEMPRESA SET STEXCLUIDO = ''S'', ');
      aSQL.Add('DTEXCLUIDO = ' + QuotedStr(FormatDateTime('yyyy/mm/dd', Now)) );
      aSQL.Add(' WHERE IDEMPRESA = ' + dmEmpresas.cdsCadEmpresas.FieldByName('IDEMPRESA').AsString);

      oDados.Close;
      oDados.CommandText := aSQL.Text;
      oDados.ExecSQL();

    finally
      FreeAndNil(oDados);
      FreeAndNil(aSQL);
    end;
    dmEmpresas.cdsCadEmpresas.Close;
  end;
end;

procedure TfrmEmpresas.btnExcluirEnderecoClick(Sender: TObject);
var
  nCodigo: Integer;
  oDados: TSQLQuery;
  aSQL: TStringList;
begin
  inherited;
  if Application.MessageBox('Deseja excluir este endereço?','Confirmação', MB_YESNO + Mb_IconInformation + MB_DEFBUTTON2) = 6 then
  begin
    if not VerificarEnderecoSelecionado(dmEmpresas.cdsCadEndereco.Params.ParamByName('IDENDERECO').AsInteger) then
    begin
      oDados := TSQLQuery.Create(nil);
      oDados.SQLConnection := dmPrincipal.Conexao;

      aSQL := TStringList.Create;
      try
        aSQL.Clear;
        aSQL.Add('UPDATE CADENDERECOS SET STEXCLUIDO = ''S'', ');
        aSQL.Add('DTEXCLUIDO = ' + QuotedStr(FormatDateTime('yyyy/mm/dd', Now)) );
        aSQL.Add(' WHERE IDEMPRESA = ' + dmEmpresas.cdsCadEmpresas.FieldByName('IDEMPRESA').AsString);
        aSQL.Add('    AND IDENDERECO = ' + dmEmpresas.cdsCadEndereco.Params.ParamByName('IDENDERECO').AsString);

        oDados.Close;
        oDados.CommandText := aSQL.Text;
        oDados.ExecSQL();

        dmEmpresas.cdsCadEndereco.Close;
        dmEmpresas.cdsDetEndereco.Close;
        dmEmpresas.cdsDetEndereco.Open;
      finally
        FreeAndNil(oDados);
        FreeAndNil(aSQL);
      end;
    end
    else
      Application.MessageBox('Não e possível excluir um endereço ativo!', 'SISTEMA', MB_ICONERROR + MB_OK + MB_SYSTEMMODAL);
  end;

end;

procedure TfrmEmpresas.btnNovoClick(Sender: TObject);
begin
  inherited;
  dbNMEMPRESA.SetFocus;
  dmEmpresas.cdsCadEmpresas.FieldByName('STATIVO').AsString := 'S';
  dmEmpresas.cdsCadEmpresas.FieldByName('STEXCLUIDO').AsString := 'N';
end;

procedure TfrmEmpresas.btnNovoEnderecoClick(Sender: TObject);
begin
  inherited;
  dmEmpresas.cdsCadEndereco.Open;
  dmEmpresas.cdsCadEndereco.Append;
  dmEmpresas.cdsCadEndereco.FieldByName('IDEMPRESA').AsInteger :=
    dmEmpresas.cdsCadEmpresas.FieldByName('IDEMPRESA').AsInteger;
  dmEmpresas.cdsCadEndereco.FieldByName('STEXCLUIDO').AsString := 'N';
  dmEmpresas.cdsCadEndereco.FieldByName('TPCADASTRO').AsString := 'E';

  if dmEmpresas.cdsDetEndereco.RecordCount > 0 then
    dmEmpresas.cdsCadEndereco.FieldByName('STATIVO').AsString := 'N'
  else
    dmEmpresas.cdsCadEndereco.FieldByName('STATIVO').AsString := 'S';

  dbNOCEP.SetFocus;
end;

procedure TfrmEmpresas.btnSalvarEnderecoClick(Sender: TObject);
begin
  inherited;
  dmEmpresas.cdsCadEndereco.Post;
  dmEmpresas.cdsCadEndereco.ApplyUpdates(0);

  dmEmpresas.cdsDetEndereco.Close;
  dmEmpresas.cdsDetEndereco.Params.ParamByName('IDEMPRESA').AsInteger :=
    dmEmpresas.cdsCadEmpresas.FieldByName('IDEMPRESA').AsInteger;
  dmEmpresas.cdsDetEndereco.Open;
end;

procedure TfrmEmpresas.dbSTATIVOENDERECOClick(Sender: TObject);
begin
  inherited;
  if VerificarEnderecoSelecionado(dmEmpresas.cdsCadEndereco.Params.ParamByName('IDENDERECO').AsInteger) then
    dbSTATIVOENDERECO.Checked := True;
end;

procedure TfrmEmpresas.dbSTATIVOENDERECOEnter(Sender: TObject);
var
  nCodigo: Integer;
begin
  inherited;
  dmEmpresas.cdsCadEndereco.Edit;
  if (not dbSTATIVOENDERECO.Checked) and VerificarEnderecoAtivo(dmEmpresas.cdsCadEndereco.FieldByName('IDEMPRESA').AsInteger, 'E') then
  begin
    if Application.MessageBox('Já existe outro endereço ativo, deseja remover e ativar este endereço?','Confirmação', MB_YESNO + Mb_IconInformation + MB_DEFBUTTON2) = 6 then
    begin
      nCodigo := dmEmpresas.cdsCadEndereco.FieldByName('IDENDERECO').AsInteger;
      AtivarEnderecoPessoa(nCodigo);
      dbSTATIVOENDERECO.Checked := True;
      dmEmpresas.cdsCadEndereco.FieldByName('STATIVO').AsString := 'S';
    end;
  end;
end;

procedure TfrmEmpresas.dsCadEnderecoStateChange(Sender: TObject);
begin
  inherited;
  btnNovoEndereco.Enabled := not (dmEmpresas.cdsCadEndereco.State in dsEditModes);
  btnSalvarEndereco.Enabled := (dmEmpresas.cdsCadEndereco.State in dsEditModes);
  btnExcluirEndereco.Enabled := not (dmEmpresas.cdsCadEndereco.State in dsEditModes) and dmEmpresas.cdsCadEndereco.Active and (dmEmpresas.cdsCadEndereco.RecordCount > 0);
end;

procedure TfrmEmpresas.grDadosDblClick(Sender: TObject);
begin
  inherited;
  dmEmpresas.cdsCadEmpresas.Close;
  dmEmpresas.cdsCadEmpresas.Params.ParamByName('IDEMPRESA').AsInteger := dmEmpresas.cdsPqEmpresas.FieldByName('IDEMPRESA').AsInteger;
  dmEmpresas.cdsCadEmpresas.Open;

  pcPrincipal.ActivePage := tabDados;
end;

procedure TfrmEmpresas.grEnderecosCellClick(Column: TColumn);
begin
  inherited;
  if dmEmpresas.cdsDetEndereco.RecordCount > 0 then
  begin
    dmEmpresas.cdsCadEndereco.Close;
    dmEmpresas.cdsCadEndereco.Params.ParamByName('IDENDERECO').AsInteger :=
      dmEmpresas.cdsDetEndereco.FieldByName('IDENDERECO').AsInteger;
    dmEmpresas.cdsCadEndereco.Open;
  end;
end;

end.
