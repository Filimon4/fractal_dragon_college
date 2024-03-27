unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
    k1,k2,i,t : Integer;
begin
     i:=1;
    t:=1;
    k1:=StrToInt(Edit1.Text); // number
    k2:=StrToInt(Edit2.Text); // power
    while i <= k2 do begin
      t := t*k1;
      i:= i + 1;
    end;
    memo1.Lines.add('число '+Edit1.Text+' в степени '+Edit2.Text+' равно: '+ IntToStr(t));

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
end;

end.

