unit uCadastro;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.FMTBcd,
   Data.DB, Data.SqlExpr, Data.DbxSqlite, uMenu,
   FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Error,
   FireDAC.UI.Intf,
   FireDAC.Phys.Intf,
   FireDAC.Stan.Def,
   FireDAC.Stan.Pool,
   FireDAC.Stan.Async,
   FireDAC.Phys,
   FireDAC.Phys.SQLite,
   FireDAC.Phys.SQLiteDef,
   FireDAC.Stan.ExprFuncs,
   FireDAC.VCLUI.Wait,
   FireDAC.Comp.Client,
   Vcl.ExtCtrls;

type
   TFormCadProd = class(TForm)
    pnl1: TPanel;
    btnClose: TSpeedButton;
    BtnGravar: TBitBtn;
    EditNome: TEdit;
    EditCusto: TEdit;
    LabelNome: TLabel;
    Label2: TLabel;
    LabelCustoCompra: TLabel;
    MemoDesc: TMemo;
    query: TSQLQuery;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
      procedure BtnGravarClick(Sender: TObject);
      procedure pLimpaCampos;
      procedure FormCreate(Sender: TObject);
      procedure btnCloseClick(Sender: TObject);

      function fVerificaCadastro(vsNome: String): Boolean;
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
   FTDI.Fechar(False);
end;

procedure TFormCadProd.BtnGravarClick(Sender: TObject);
var
   vsSQl, vsNome, vfCusto, vsDescricao: String;
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
         vsSQl := 'update produtos set descricao = "' + vsDescricao + '", custo = ' + vfCusto +
           ' where nome = "' + vsNome + '"';
      end
      else
         vsSQl := 'insert into produtos (id ,nome, descricao, custo) values (null, "' + vsNome +
           '","' + vsDescricao + '",' + vfCusto + ')';
      query.Close;
      query.SQL.Clear;
      query.SQL.Text := vsSQl;
      query.ExecSQL(true);
      pLimpaCampos;
      EditNome.SetFocus;
   end
   else
      Showmessage('Preencha os campos antes de gravar os dados!')
end;

procedure TFormCadProd.FormCreate(Sender: TObject);
var
   Present: TDateTime;
   Connection: TFDConnection;
   Year, Month, Day: Word;
begin
   Connection := TFDConnection.Create(Self);
   Present := Now;
   DecodeDate(Present, Year, Month, Day);
   Label1.Caption := 'Today is Day ' + IntToStr(Day) + ' of Month ' + IntToStr(Month) + ' of Year '
     + IntToStr(Year);
   try
      Connection:= FMenu.Connection;
   finally
      Connection.Close;
   end;
end;

function TFormCadProd.fVerificaCadastro(vsNome: String): Boolean;
var
   vsSQl: String;
begin
   vsSQl := 'select * from produtos where nome = "' + vsNome + '"';
   query.Close;
   query.SQL.Clear;
   query.SQL.Text := vsSQl;
   query.open;
   try
      if query.RecordCount > 0 then
      begin
         Result := true;
      end
      else
         Result := False;
   finally
      query.Close;
   end;

end;

procedure TFormCadProd.pLimpaCampos;
begin
   EditNome.Clear;
   EditCusto.Clear;
   MemoDesc.Clear;
end;

end.
