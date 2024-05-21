unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  Grids;

type

  { TfMain }

  TfMain = class(TForm)
    Panel1: TPanel;
    bAdd: TSpeedButton;
    bEdit: TSpeedButton;
    bDel: TSpeedButton;
    bSort: TSpeedButton;
    SG: TStringGrid;
    procedure bAddClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure sgDblClick(Sender: TObject);
    procedure bSortClick(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;

implementation
uses editLangForm;

{$R *.lfm}

{ TfMain }

procedure TfMain.bSortClick(Sender: TObject);
begin
  //если данных в сетке нет - просто выходим:
  if SG.RowCount = 1 then exit;
  //иначе сортируем список:
  SG.SortColRow(true, 0);
end;

procedure TfMain.bAddClick(Sender: TObject);
begin
  fFormEdit.LangName.Text:= '';
  fFormEdit.Author.Text:= '';
  fFormEdit.Year.Text := '';
  fFormEdit.TypeCast.Checked := False;
  fFormEdit.TypeTranslator.ItemIndex := 0;
  fFormEdit.TypeParadigm.ItemIndex := 0;
  fFormEdit.ModalResult:= mrNone;
  fFormEdit.ShowModal;
  if (fFormEdit.LangName.Text= '') or (fFormEdit.Author.Text= '') then exit;
  if fFormEdit.ModalResult <> mrOk then exit;
  SG.RowCount:= SG.RowCount + 1;
  SG.Cells[0, SG.RowCount-1]:= fFormEdit.LangName.Text;
  SG.Cells[1, SG.RowCount-1]:= fFormEdit.Author.Text;
  SG.Cells[2, SG.RowCount-1]:= fFormEdit.Year.Text;
  SG.Cells[3, SG.RowCount-1]:= '';
  SG.Cells[4, SG.RowCount-1]:= fFormEdit.TypeTranslator.Text;
  SG.Cells[5, SG.RowCount-1]:= '';
  SG.Cells[6, SG.RowCount-1]:= fFormEdit.TypeParadigm.Text;
  if fFormEdit.TypeCast.Checked = True then begin
    SG.Cells[3, SG.RowCount-1]:= 'Строгая';
  end
  else begin
    SG.Cells[3, SG.RowCount-1]:= 'Нестрогая';
  end;
  if fFormEdit.TypeVar.Checked = True then begin
    SG.Cells[5, SG.RowCount-1]:= 'Явная';
  end
  else begin
    SG.Cells[5, SG.RowCount-1]:= 'Неявная';
  end;
end;

procedure TfMain.bDelClick(Sender: TObject);
begin
  if SG.RowCount = 1 then exit;
  if MessageDlg('Требуется подтверждение',
                'Вы действительно хотите удалить контакт "' +
                SG.Cells[0, SG.Row] + '"?',
      mtConfirmation, [mbYes, mbNo, mbIgnore], 0) = mrYes then
      SG.DeleteRow(SG.Row);
end;

procedure TfMain.bEditClick(Sender: TObject);
begin
  if SG.RowCount = 1 then exit;

  fFormEdit.LangName.Text:= SG.Cells[0, SG.Row];
  fFormEdit.Author.Text:= SG.Cells[1, SG.Row];
  fFormEdit.Year.Text:= SG.Cells[2, SG.Row];
  if SG.Cells[3, SG.Row] = 'Строгая' then begin
    fFormEdit.TypeCast.Checked := True;
  end
  else begin
    fFormEdit.TypeCast.Checked := False;
  end;
  fFormEdit.TypeTranslator.Text:= SG.Cells[4, SG.Row];
  if SG.Cells[5, SG.Row] = 'Явная' then begin
    fFormEdit.TypeVar.Checked := True;
  end
  else begin
    fFormEdit.TypeVar.Checked := False;
  end;
  fFormEdit.TypeParadigm.Text := SG.Cells[6, SG.Row];
  fFormEdit.ModalResult:= mrNone;
  fFormEdit.ShowModal;
  if fFormEdit.ModalResult = mrOk then begin
    SG.Cells[0, SG.RowCount-1]:= fFormEdit.LangName.Text;
    SG.Cells[1, SG.RowCount-1]:= fFormEdit.Author.Text;
    SG.Cells[2, SG.RowCount-1]:= fFormEdit.Year.Text;
    SG.Cells[3, SG.RowCount-1]:= '';
    SG.Cells[4, SG.RowCount-1]:= fFormEdit.TypeTranslator.Text;
    SG.Cells[5, SG.RowCount-1]:= '';
    SG.Cells[6, SG.RowCount-1]:= fFormEdit.TypeParadigm.Text;
    if fFormEdit.TypeCast.Checked = True then begin
      SG.Cells[3, SG.RowCount-1]:= 'Строгая';
    end
    else begin
      SG.Cells[3, SG.RowCount-1]:= 'Нестрогая';
    end;
    if fFormEdit.TypeVar.Checked = True then begin
      SG.Cells[5, SG.RowCount-1]:= 'Явная';
    end
    else begin
      SG.Cells[5, SG.RowCount-1]:= 'Неявная';
    end;
  end;
end;

procedure TfMain.sgDblClick(Sender: TObject);
begin

end;

end.

