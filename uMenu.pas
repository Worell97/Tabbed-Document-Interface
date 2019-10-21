﻿unit uMenu;

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
   Vcl.Menus,
   Data.DBXMySQL,
   Data.DB,
   Data.SqlExpr,
   Data.DbxSqlite,
   Vcl.StdCtrls,
   Vcl.Buttons,
   TDI,
   Vcl.ExtCtrls,
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
   FireDAC.Comp.Client;

type
   TFMenu = class(TForm)
      pnl1: TPanel;
      Cadastro1: TBitBtn;
      Vendas1: TBitBtn;
      BitBtn1: TBitBtn;
      chk1: TCheckBox;
      con1: TFDConnection;
      procedure Cadastro1Click(Sender: TObject);
      procedure Vendas1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);

   private
    FConnection: TFDConnection;
    procedure Conexao();
      { Private declarations }
   public
      { Public declarations }
      property Connection : TFDConnection read FConnection write FConnection;
   end;

var
   FMenu: TFMenu;
   FTDI: TTDI;

implementation

uses
   uCadastro,
   uVendas,
   uInicio;
{$R *.dfm}

procedure TFMenu.Cadastro1Click(Sender: TObject);
begin

   FTDI.MostrarFormulario(TFormCadProd, chk1.Checked);
end;

procedure TFMenu.Conexao();
var
   vsCaminho : String;
begin
   vsCaminho := ExtractFilePath(Application.ExeName);
   con1.Connected := False;
   con1.Params.DriverID := 'SQLite';
   con1.Params.Database := vsCaminho + 'teste.db';
   try
      con1.Connected := True;
      FConnection := con1;
   except
      ShowMessage
        ('Erro ao conectar ao banco de dados, verifique se o mesmo se encontra no diretório da aplicação');
      Application.Terminate;
   end;
end;

procedure TFMenu.FormCreate(Sender: TObject);
begin
   Conexao();
   FTDI := TTDI.Create(Self, TFormInicio);
   FTDI.MostrarMenuPopup := True;
end;

procedure TFMenu.Vendas1Click(Sender: TObject);
begin
   FTDI.MostrarFormulario(TFormVendas, chk1.Checked);
end;

end.
