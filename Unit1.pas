unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  StdCtrls, IdIntercept,  IdSSLOpenSSL, ExtCtrls, jpeg,
  IdServerIOHandler, IdSSL;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    IdHTTP1: TIdHTTP;
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var str,urls: string;
begin
try
    IdHTTP1.Request.CustomHeaders.Values['X-Cosmos-Token']:='9UDMs4fwqvlAjg71V3Y4Vg';
    IdHTTP1.Request.ContentType := 'application/json;charset=UTF-8';
     IdHTTP1.Request.UserAgent:='Cosmos-API-Request';
    urls := 'https://api.cosmos.bluesoft.com.br/gtins/'+Edit1.Text+'.json';
    Memo1.Clear;

    Memo1.Lines.Add('URL enviada:');

    Memo1.Lines.Add('--> '+urls);
    Screen.Cursor := crHourGlass;
    str := IdHTTP1.Get(urls);

      except on E: Exception do
    Begin
      Memo1.Lines.Add('Resposta da exceção:');
      Memo1.Lines.Add('--> '+E.Message);
    End;
  end;
  Memo1.Lines.Add('HTTP Status Code:');
  Memo1.Lines.Add('--> '+IdHTTP1.ResponseText);

  Memo1.Lines.Add('Resposta da consulta:');
  Memo1.Lines.Add('--> ' + UTF8Decode(str));

  Screen.Cursor := crDefault;
end;

end.
