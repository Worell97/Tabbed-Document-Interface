unit uCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Data.DbxSqlite;

type
  TFormCadProd = class(TForm)
    LabelNome: TLabel;
    LabelCustoCompra: TLabel;
    Label2: TLabel;
    EditNome: TEdit;
    EditCusto: TEdit;
    MemoDesc: TMemo;
    BtnGravar: TBitBtn;
    query: TSQLQuery;
    SQLConnection: TSQLConnection;
    btnClose: TBitBtn;
    procedure BtnGravarClick(Sender: TObject);
    procedure pLimpaCampos;
    function fVerificaCadastro(vsNome : String):Boolean;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadProd: TFormCadProd;

implementation

{$R *.dfm}


procedure TFormCadProd.btnCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadProd.BtnGravarClick(Sender: TObject);
var
  vsSQl,
  vsNome,
  vfCusto,
  vsDescricao : String;
begin
  vsNome := '';
  vsDescricao := '';
  vfCusto := '';
  vsNome := EditNome.Text;
  vsDescricao := MemoDesc.Text;
  vfCusto := EditCusto.Text;
  if (vsNome <> '') and (vsDescricao <> '') and ((vfCusto <> '') or (vfCusto = '0')) then
  begin
    if fVerificaCadastro(vsNome) then
    begin
      vsSQL :=  'update produtos set descricao = "'+vsDescricao+'", custo = '+vfCusto+
                ' where nome = "'+vsNome+'"';
    end
    else
      vsSQL := 'insert into produtos (id ,nome, descricao, custo) values (null, "'
              +vsNome+'","'+vsDescricao+'",'+vfCusto+')';
    query.close;
    query.SQL.Clear;
    query.SQL.Text := vsSQL;
    query.ExecSQL(true);
    pLimpaCampos;
    EditNome.SetFocus;
  end else
    Showmessage('Preencha os campos antes de gravar os dados!')
end;

procedure TFormCadProd.FormCreate(Sender: TObject);
//var
//  vsCaminho :String;
begin
//  vsCaminho := ExtractFilePath(Application.ExeName);
//  SQLConnection.Connected:=False;
//  SQLConnection.Params.Text := 'Database='+vsCaminho+'teste.db';
//  try
//    SQLConnection.Connected:=True;
//  except
//    ShowMessage('Erro ao conectar ao banco de dados, verifique se o mesmo se encontra no diretório da aplicação');
//    Application.Terminate;
//  end;
end;

function TFormCadProd.fVerificaCadastro(vsNome : String) : Boolean;
var
  vsSQL : String;
begin
  vsSQL := 'select * from produtos where nome = "'+vsNome+'"';
  query.close;
  query.SQL.Clear;
  query.SQL.Text := vsSQL;
  query.open;
  if query.RecordCount > 0 then
  begin
     Result := True;
  end
  else
    Result := False;

end;
procedure TFormCadProd.pLimpaCampos;
begin
  EditNome.Clear;
  EditCusto.Clear;
  MemoDesc.Clear;
end;
end.
