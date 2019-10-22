unit uVendas;

interface

uses
   Winapi.Windows,
   Winapi.Messages,
   System.SysUtils,
   System.Variants,
   System.Classes,
   Vcl.Graphics,
   Vcl.Controls,
   Vcl.Forms,
   Vcl.Dialogs,
   Data.DB,
   Vcl.StdCtrls,
   Vcl.Buttons,
   Vcl.Grids,
   Vcl.DBGrids,
   Data.FMTBcd,
   Data.DbxSqlite,
   Data.SqlExpr,
   Datasnap.DBClient,
   Vcl.ExtCtrls,
   Vcl.DBCtrls,
   Datasnap.Provider,
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
   FireDAC.Stan.Param,
   FireDAC.DatS,
   FireDAC.DApt.Intf,
   FireDAC.DApt,
   FireDAC.Comp.DataSet;

type
   TFormVendas = class(TForm)
      Label3: TLabel;
      GridPanel1: TGridPanel;
      Panel1: TPanel;
      Panel2: TPanel;
      Label2: TLabel;
      EditDespesas: TEdit;
      Label5: TLabel;
      Label6: TLabel;
      EditMargemLucro: TEdit;
      Label7: TLabel;
      DBGrid1: TDBGrid;
      BtnAdicionar: TBitBtn;
      BtnExcluir: TBitBtn;
      DataSource1: TDataSource;
      Label1: TLabel;
      DBGrid2: TDBGrid;
      EditTotal: TEdit;
      BtnFinalizar: TBitBtn;
      DataSource2: TDataSource;
      BitBtn1: TBitBtn;
      queryProdutos: TFDQuery;
    btnClose: TSpeedButton;
      procedure FormCreate(Sender: TObject);
      procedure BtnAdicionarClick(Sender: TObject);
      procedure EditDespesasExit(Sender: TObject);
      procedure EditMargemLucroExit(Sender: TObject);
      procedure BtnExcluirClick(Sender: TObject);
      procedure BtnFinalizarClick(Sender: TObject);
      procedure btnCloseClick(Sender: TObject);

   private
      { Private declarations }
   public
      { Public declarations }

      procedure pCarregaProdutos;
      procedure pRecalculaTotal;
      procedure pReprocessaValores;
      // procedure pLimpaTela;
   end;

var
   FormVendas: TFormVendas;
   cDS_Produtos, cDS_Carrinho: TClientDataSet;

implementation

uses
   uMenu,
   CadProdDTO,
   CadProDAO;

{$R *.dfm}

procedure TFormVendas.BtnAdicionarClick(Sender: TObject);
begin
   if cDS_Carrinho.FieldCount = 0 then
   begin
      cDS_Carrinho.FieldDefs.Clear;
      cDS_Carrinho.FieldDefs.Add('produto', ftString, 50, false);
      cDS_Carrinho.FieldDefs.Add('descricao', ftString, 200, false);
      cDS_Carrinho.FieldDefs.Add('qtde', ftFloat);
      cDS_Carrinho.FieldDefs.Add('vlrTotal', ftFloat);
      cDS_Carrinho.CreateDataSet;
   end;
   if cDS_Carrinho.Locate('produto', cDS_Produtos.Fieldbyname('produto').AsString, []) then
   begin
      cDS_Carrinho.Edit;
   end
   else
      cDS_Carrinho.Append;
   cDS_Carrinho.Fieldbyname('produto').AsString := cDS_Produtos.Fieldbyname('produto').AsString;
   cDS_Carrinho.Fieldbyname('descricao').AsString := cDS_Produtos.Fieldbyname('descricao').AsString;
   cDS_Carrinho.Fieldbyname('qtde').AsFloat := cDS_Carrinho.Fieldbyname('qtde').AsFloat + 1;
   cDS_Carrinho.Fieldbyname('vlrTotal').AsFloat := cDS_Produtos.Fieldbyname('vlrTotal').AsFloat *
     cDS_Carrinho.Fieldbyname('qtde').AsFloat;
   cDS_Carrinho.Post;

   pRecalculaTotal;
end;

procedure TFormVendas.pReprocessaValores;
var
   vfRateioDespesas, vfCustoCompra, vfDespesas, vfMargemLucro, vfPrecoVenda: double;
   viQtdeItens: integer;
begin
   // viQtdeItens := 0;
   // vfDespesas := 0;
   // vfRateioDespesas := 0;
   // vfCustoCompra := 0;
   // vfMargemLucro := 0;
   // vfLucro := 0;
   // vfPrecoVenda := 0;
   vfDespesas := StrToFloat(EditDespesas.Text);
   if vfDespesas = 0 then
      vfDespesas := 400;
   cDS_Produtos.First;
   viQtdeItens := cDS_Produtos.RecordCount;

   vfRateioDespesas := (vfDespesas / viQtdeItens);

   while not cDS_Produtos.EOF do
   begin
      vfCustoCompra := StrToFloat(cDS_Produtos.Fieldbyname('custo').AsString);
      vfMargemLucro := StrToFloat(EditMargemLucro.Text);

      vfPrecoVenda := vfCustoCompra + vfRateioDespesas;
      vfPrecoVenda := vfPrecoVenda * (1 + vfMargemLucro / 100);
      cDS_Produtos.Edit;
      cDS_Produtos.Fieldbyname('vlrTotal').AsFloat := StrToFloat(FormatFloat('#.##', vfPrecoVenda));
      cDS_Produtos.Post;
      cDS_Produtos.Next;
   end;
end;

procedure TFormVendas.btnCloseClick(Sender: TObject);
begin
   Self.Close;
   FTDI.Fechar(False);
end;

procedure TFormVendas.BtnExcluirClick(Sender: TObject);
begin
   if not cDS_Carrinho.IsEmpty then
   begin
      if cDS_Carrinho.Fieldbyname('qtde').AsFloat > 1 then
      begin
         cDS_Carrinho.Edit;
         cDS_Carrinho.Fieldbyname('qtde').AsFloat := cDS_Carrinho.Fieldbyname('qtde').AsFloat - 1;
         cDS_Carrinho.Fieldbyname('vlrTotal').AsFloat := cDS_Produtos.Fieldbyname('vlrTotal')
           .AsFloat * cDS_Carrinho.Fieldbyname('qtde').AsFloat;
         cDS_Carrinho.Post;
      end
      else
         cDS_Carrinho.Delete;
      pRecalculaTotal;
   end
   else
      EditTotal.Text := '0';
end;

procedure TFormVendas.BtnFinalizarClick(Sender: TObject);
begin
   if not cDS_Carrinho.IsEmpty then
      cDS_Carrinho.EmptyDataSet;
   EditTotal.Text := '0';
end;

procedure TFormVendas.EditDespesasExit(Sender: TObject);
begin
   if (EditDespesas.Text = '0') or (EditDespesas.Text = '') then
      EditDespesas.Text := '400';
   pReprocessaValores;
end;

procedure TFormVendas.EditMargemLucroExit(Sender: TObject);
begin
   pReprocessaValores;
end;

procedure TFormVendas.FormCreate(Sender: TObject);
begin
   cDS_Produtos := TClientDataSet.Create(nil);
   cDS_Carrinho := TClientDataSet.Create(nil);
   if cDS_Produtos.FieldCount = 0 then
   begin
      cDS_Produtos.FieldDefs.Clear;
      cDS_Produtos.FieldDefs.Add('produto', ftString, 50, false);
      cDS_Produtos.FieldDefs.Add('descricao', ftString, 200, false);
      cDS_Produtos.FieldDefs.Add('custo', ftFloat);
      cDS_Produtos.FieldDefs.Add('vlrTotal', ftFloat);
      cDS_Produtos.CreateDataSet;
   end;
   DataSource1.DataSet := cDS_Produtos;
   DataSource2.DataSet := cDS_Carrinho;
   pCarregaProdutos;
end;

procedure TFormVendas.pRecalculaTotal;
var
   vfTotal: double;
begin
   vfTotal := 0;
   cDS_Carrinho.First;
   while not cDS_Carrinho.EOF do
   begin
      vfTotal := vfTotal + cDS_Carrinho.Fieldbyname('vlrTotal').AsFloat;
      cDS_Carrinho.Next;
   end;
   EditTotal.Text := FloatToStr(vfTotal);
end;

procedure TFormVendas.pCarregaProdutos;
   function CalculaPrecoVenda(AObject : TDtoCadProduto; QtdeItens: Integer) : Double;
   var
      vfRateioDespesas,
      vfCustoCompra,
      Despesas,
      vfMargemLucro,
      vfPrecoVenda: double;
   begin
      if StrToFloat(EditDespesas.Text) = 0 then
      begin
         Despesas := 400;
      end else
         Despesas := 0;

      if QtdeItens <= 0 then
      begin
         QtdeItens := 1;
      end;

      vfPrecoVenda := (AObject.Custo + (Despesas / QtdeItens)) * (1 + StrToFloat(EditMargemLucro.Text) / 100);
   end;

var
   CadProDAO : TCadProDao;
   CadProdDTOList: TDtoCadProdutos;
   CadProdDTO: TDtoCadProduto;
begin
   CadProDAO := TCadProDao.Create();
   CadProdDTOList:= TDtoCadProdutos.Create();
   CadProdDTO:= TDtoCadProduto.Create();
   try
         if CadProDAO.TryLoadList(CadProdDTOList, ' where custo > 0') then
         begin
            for CadProdDTO in CadProdDTOList do
            begin
               cDS_Produtos.Append;
               cDS_Produtos.Fieldbyname('produto').AsString := CadProdDTO.Nome;
               cDS_Produtos.Fieldbyname('descricao').AsString := CadProdDTO.Descricao;
               cDS_Produtos.Fieldbyname('custo').AsFloat := StrToFloat(FormatFloat('#.##', CadProdDTO.Custo));
               cDS_Produtos.Fieldbyname('vlrTotal').AsFloat := StrToFloat(FormatFloat('#.##', CalculaPrecoVenda(CadProdDTO, CadProdDTOList.Count)));
               cDS_Produtos.Post;
            end;
         end;
   finally
      FreeAndNil(CadProDAO);
      FreeAndNil(CadProdDTOList);
      FreeAndNil(CadProdDTO);
   end;
end;
end.
