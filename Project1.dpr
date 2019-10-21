program Project1;

uses
  Vcl.Forms,
  uMenu in 'uMenu.pas' {FMenu},
  uCadastro in 'uCadastro.pas' {FormCadProd},
  uVendas in 'uVendas.pas' {FormVendas},
  uInicio in 'uInicio.pas' {FormInicio},
  Geral in 'Geral.pas',
  CadProdDTO in 'source\Cadastros\DTO\CadProdDTO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TFormCadProd, FormCadProd);
  Application.CreateForm(TFormVendas, FormVendas);
  Application.CreateForm(TFormInicio, FormInicio);
  Application.Run;
end.
