﻿unit CadProDAO;

interface

uses
   System.Generics.Collections,
   Data,
   uMenu,
   System.SysUtils,
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
   Data.DB,
   CadProdDTO;

type
   TCadProDao = class(System.TObject)
   strict private
    const
      Select: System.UnicodeString =
          ' SELECT                  ' +
          '   ID,                   ' +
          '   Nome,                 ' +
          '   Descricao,            ' +
          '   Custo                 ' +
          '  FROM                   ' +
          '   Produtos              ' ;

      SelectCamp: System.UnicodeString =
          'SELECT MAX(%s)           '+
          '  AS  %s                 '+
          ' FROM                    '+
          '  %s                     ';

        Insert: System.UnicodeString =
          'INSERT INTO              ' +
          ' Produtos       (        ' +
          '   Nome,                 ' +
          '   Descricao,            ' +
          '   Custo)                ' +
          ' VALUES(                 ' +
          '   :Nome,                ' +
          '   :Descricao,           ' +
          '   :Custo)               ' +
          ' RETURNING ID            ' ;

        Update: System.UnicodeString =
          'UPDATE                          ' +
          '  Produtos                      ' +
          'SET                             ' +
          '  Nome          = :Nome,        ' +
          '  Descricao     = :Descricao,   ' +
          '  Custo         = :Custo,       ' +
          'WHERE                           ' +
          '  ID = :ID                      ' ;

        Delete: System.UnicodeString =
          'DELETE FROM                 ' +
          '  Produtos                  ' +
          'WHERE                       ' +
          '  ID = :ID                  ' ;



    class procedure InternalLoad(var AQuery: TFDQuery; const AObject: TDtoCadProduto); static;
  private
   public

      constructor Create; override;
      procedure UnsafeSave(const AObject: TDtoCadProduto);
      procedure Save(const AObject: TDtoCadProduto);

      function  TryLoad(const AObject: TDtoCadProduto; const ID: System.UnicodeString): Boolean;
      function  TryLoadList(const AObject: TDtoCadProdutos; const ACondicao: System.UnicodeString): Boolean;
      function  LoadLastCod(const ACampo : System.UnicodeString; const ATabela : System.UnicodeString):System.UnicodeString;

      procedure Load   (const AObject: TDtoCadProduto; const ID: System.UnicodeString);
      procedure UnSafeDelete (const ID : System.UnicodeString);
      procedure SafeDelete (const ID : System.UnicodeString);
   end;

implementation

{ TCadProDao }

{ TCadProDao }

constructor TCadProDao.Create;
begin
  inherited;

end;

class procedure TCadProDao.InternalLoad(var AQuery: TFDQuery;
  const AObject: TDtoCadProduto);
begin
   AObject.ID := AQuery.FieldByName('ID');
   AObject.Nome := AQuery.FieldByName('Nome');
   AObject.Descricao := AQuery.FieldByName('Descricao');
   AObject.Custo := AQuery.FieldByName('Custo');
end;

procedure TCadProDao.Load(const AObject: TDtoCadProduto;
  const ID: System.UnicodeString);
begin
   if (not TryLoad(AObject, ID)) then
      raise;
end;

function TCadProDao.LoadLastCod(const ACampo,
  ATabela: System.UnicodeString): System.UnicodeString;
begin

end;

procedure TCadProDao.SafeDelete(const ID: System.UnicodeString);
var
   Connection : TFMenu.Connection;
begin
   Connection.StartTransaction;
   try
      UnsafeDelete(ID);
      Connection.Commit;
   except
      Connection.Rollback;
      raise;
   end;
end;

procedure TCadProDao.Save(const AObject: TDtoCadProduto);
var
   Connection : TFMenu.Connection;
begin
   Connection.StartTransaction;
   try
      UnsafeSave(AObject);
      Connection.Commit;
   except
      Connection.Rollback;
      raise;
   end;
end;

function TCadProDao.TryLoad(const AObject: TDtoCadProduto;
  const ID: System.UnicodeString): Boolean;
var
   LQuery : TFDQuery;
begin
   if Trim(ID) <> '' then
   begin
      LQuery.Create(Self);
      try
         LQuery.SQL := Select+' WHERE id = '+ID;
         LQuery.Open;
         if LQuery.IsEmpty then
         begin
            Exit
         end else
         begin
            InternalLoad(LQuery, AObject)            
         end;
      finally
         LQuery.Destroy;
      end;
   end;
end;

function TCadProDao.TryLoadList(const AObject: TDtoCadProdutos;
  const ACondicao: System.UnicodeString): Boolean;
var
   LQuery : TFDQuery;
begin
   if Trim(ACondicao) <> '' then
   begin
      LQuery.Create(Self);
      try
         LQuery.SQL := Select+ACondicao;
         LQuery.Open;
         if LQuery.IsEmpty then
         begin
            Exit
         end else
         begin
            while not(LQuery.Eof) do
            begin
               InternalLoad(LQuery, AObject.add);
            end;                                             
            Result := True;
         end;
      finally

      end;
   end;
end;

procedure TCadProDao.UnSafeDelete(const ID: System.UnicodeString);
var
  LQuery: TFDQuery;
begin
   if Trim(ID) <> '' then
   begin
      LQuery.Create(Self);
      LQuery.SQL:= Delete;
      LQuery.Params('ID', ID);
      LQuery.ExecSQL;
   end;
end;

procedure TCadProDao.UnsafeSave(const AObject: TDtoCadProduto);
var
  LQuery: TFDQuery;
begin
   if AObject.ID <=0 then
   begin
      LQuery.Create();
      LQuery.SQL:= Insert;
      LQuery.Params('ID', AObject.ID);
      LQuery.Params('Nome', AObject.Nome);
      LQuery.Params('Descricao', AObject.Descricao);
      LQuery.Params('Custo', AObject.Custo);
      LQuery.Open;
      AObject.ID := LQuery.FieldByName('GID').AsInteger;
   end
   else
   begin
      LQuery.Create();
      LQuery.SQL:= Update;
      LQuery.Params('ID', AObject.ID);
      LQuery.Params('Nome', AObject.Nome);
      LQuery.Params('Descricao', AObject.Descricao);
      LQuery.Params('Custo', AObject.Custo);
      LQuery.ExecSQL;
   end;
end;

end.
