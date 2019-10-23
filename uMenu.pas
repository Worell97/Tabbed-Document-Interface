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
   FireDAC.Comp.Client,
   Geral, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
   TFMenu = class(TForm)
      pnl1: TPanel;
      Cadastro1: TBitBtn;
      Vendas1: TBitBtn;
      BitBtn1: TBitBtn;
      chk1: TCheckBox;
    lblFooter: TLabel;
    con1: TFDConnection;
      procedure Cadastro1Click(Sender: TObject);
      procedure Vendas1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);

   private
    FConnection: TFDConnection;
      { Private declarations }
   public
      { Public declarations }
      function Conecta():TFDConnection;
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

function TFMenu.Conecta(): TFDConnection;
   procedure PreencheParametrosConexao();
   begin
      con1.Params.DriverID := 'SQLite';
      con1.Params.Database := ExtractFilePath(Application.ExeName) + 'teste.db';
   end;

begin
   Result := con1;
   PreencheParametrosConexao();
   try
      con1.Connected := True;
   except
      ShowMessage
        ('Erro ao conectar ao banco de dados, verifique se o mesmo se encontra no diretório da aplicação');
      Exit;
   end;
   Result := con1;
end;

procedure TFMenu.FormCreate(Sender: TObject);
   {Retorna o mês por extenço a partir do numero}
   function LongMonthName(Mes : integer):System.UnicodeString;
   begin
      case Mes of
         1: Result := 'Janeiro';
         2: Result := 'Fevereiro';
         3: Result := 'Março';
         4: Result := 'Abril';
         5: Result := 'Maio';
         6: Result := 'Junho';
         7: Result := 'Julho';
         8: Result := 'Agosto';
         9: Result := 'Setembro';
         10: Result := 'Outubro';
         11: Result := 'Novembro';
         12: Result := 'Dezembro';
      end;
   end;
var
   Year, Month, Day: Word;

begin
   DecodeDate(Now, Year, Month, Day);
   lblFooter.Caption := IntToStr(Day) + ' de ' + LongMonthName(Month) + ' de '
     + IntToStr(Year);
   Conecta();
   FTDI := TTDI.Create(Self, TFormInicio);
   FTDI.MostrarMenuPopup := True;
end;

procedure TFMenu.Vendas1Click(Sender: TObject);
begin
   FTDI.MostrarFormulario(TFormVendas, chk1.Checked);
end;

end.
