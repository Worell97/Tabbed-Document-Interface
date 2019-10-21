unit CadProdDTO;
{$pointermath on}
{$scopedenums on}

interface

uses
   System.Generics.Collections,
   System.Types,
   System.SysUtils,
   Data;

type
   TDtoCadProduto = class;

   TDtoCadProdutos = class;

   TDtoCadProduto = class(TObjectList<TDtoCadProdutos>)
      procedure InternalClear;
   private
    FDescricao: System.Integer;
    FID: System.Integer;
    FNome: System.Integer;
    FCusto: System.Integer;

   protected

   public
      procedure Clear; inline;
      // constructor Create(const AOwner: EcoRT.Objects.TErtPersistent);override;
   published
      property ID: System.Integer read FID write FID;
      property Nome: System.Integer read FNome write FNome;
      property Descricao: System.Integer read FDescricao write FDescricao;
      property Custo: System.Integer read FCusto write FCusto;

   end;

   TDtoCadProdutos = class(TObjectList<TDtoCadProduto>)
   end;

implementation

{ TDtoFinanceiroGerCentroCustos }

{ TDtoCadProduto }

procedure TDtoCadProduto.Clear;
begin
   Self.InternalClear();
end;

procedure TDtoCadProduto.InternalClear;
begin
   RTData.Clear(ID);
   RTData.Clear(Nome);
   RTData.Clear(Descricao);
   RTData.Clear(Custo);
end;

end.
