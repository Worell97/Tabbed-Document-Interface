unit uMenu;

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
  TDI, Vcl.ExtCtrls;

type
  TFMenu = class(TForm)
    pnl1: TPanel;
    Cadastro1: TBitBtn;
    Vendas1: TBitBtn;
    BitBtn1: TBitBtn;
    chk1: TCheckBox;
    procedure Cadastro1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
//  frmCadastroProdutos := TFormCadProd.Create(nil);
//  frmCadastroProdutos.ShowModal;
end;

procedure TFMenu.FormCreate(Sender: TObject);
begin

    FTDI := TTDI.Create(Self,   TFormInicio);
    FTDI.MostrarMenuPopup := True;
//  if not FileExists('midas.dll') then
//  begin
//    ShowMessage('Não foi possível encontrar o arquivo midas.dll'+
//                ' verifique a pasta de instalação ou extraia novamente');
//    Application.Terminate;
//  end;
//  if not FileExists('sqlite3.dll') then
//  begin
//    ShowMessage('Não foi possível encontrar o arquivo sqlite3.dll'+
//                ' verifique a pasta de instalação ou extraia novamente');
//    Application.Terminate;
//  end;
//  if not FileExists('teste.db') then
//  begin
//    ShowMessage('Não foi possível encontrar o arquivo teste.db'+
//                ' verifique a pasta de instalação ou extraia novamente');
//    Application.Terminate;
//  end;
end;

procedure TFMenu.Vendas1Click(Sender: TObject);
begin

//  frmVendas := TFormVendas.Create(nil);
//  frmVendas.ShowModal;
  FTDI.MostrarFormulario(TFormVendas, chk1.Checked);
end;

end.
