﻿unit uCadastro;

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
    BtnGravar: TBitBtn;
    EditNome: TEdit;
    EditCusto: TEdit;
    Label2: TLabel;
    LabelCustoCompra: TLabel;
    MemoDesc: TMemo;
    query: TSQLQuery;
    Label3: TLabel;
    EditID: TEdit;
    BtnExcluir: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnPesquisar: TBitBtn;
    pnlHeader: TPanel;
    btnClose: TSpeedButton;
      procedure BtnGravarClick(Sender: TObject);
      procedure pLimpaCampos;
      procedure FormCreate(Sender: TObject);
      procedure btnCloseClick(Sender: TObject);

      function fVerificaCadastro(vsNome: String): Boolean;
    procedure EditIDExit(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FormCadProd: TFormCadProd;

implementation

{$R *.dfm}
uses
   CadProDAO,
   CadProdDTO;

procedure TFormCadProd.btnCloseClick(Sender: TObject);
begin
   Self.Close;
   FTDI.Fechar(False);
end;

procedure TFormCadProd.BtnGravarClick(Sender: TObject);
var
   CadProDAO : TCadProDao;
   CadProdDTO: TDtoCadProduto;
begin
   CadProDAO := TCadProDao.Create();
   CadProdDTO:= TDtoCadProduto.Create();
   try
      if (EditNome.Text <> '') and (MemoDesc.Text <> '') and ((EditCusto.Text <> '') or (EditCusto.Text <> '0')) then
      begin
         if EditID.Enabled then
         begin
            CadProdDTO.ID:= 0;
            CadProdDTO.Nome := EditNome.Text;
            CadProdDTO.Descricao := EditNome.Text;
            CadProdDTO.Custo := StrToFloat(EditNome.Text);
         end else
         begin

         end;
            pLimpaCampos;
            EditNome.SetFocus;
      end
      else
         Showmessage('Preencha os campos antes de gravar os dados!')
   finally
      FreeAndNil(CadProDAO);
      FreeAndNil(CadProdDTO);
   end;
end;

procedure TFormCadProd.EditIDExit(Sender: TObject);
var
   CadProDAO : TCadProDao;
   CadProdDTO: TDtoCadProduto;
begin
   CadProDAO := TCadProDao.Create();
   CadProdDTO:= TDtoCadProduto.Create();
   try
      if CadProDAO.TryLoad(CadProdDTO, EditID.Text) then
      begin
         EditNome.Text := CadProdDTO.Nome;
         MemoDesc.Text := CadProdDTO.Descricao;
         EditCusto.Text := FloatToStr(CadProdDTO.Custo);
      end else
         EditID.Text := '';
      EditID.Enabled := False;
   finally
      FreeAndNil(CadProDAO);
      FreeAndNil(CadProdDTO);
   end;
end;

procedure TFormCadProd.FormCreate(Sender: TObject);
var
   Connection: TFDConnection;
begin
   Connection := TFDConnection.Create(Self);
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
