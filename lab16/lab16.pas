program ReverseListUsingDeque;

type
  PNode = ^Node;
  Node = record
    Data: Integer;
    Next, Prev: PNode;
  end;

type
  Deque = record
    Front, Rear: PNode;
  end;

procedure AddFront(var d: Deque; value: Integer);
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.Data := value;
  NewNode^.Next := d.Front;
  NewNode^.Prev := nil;

  if d.Front <> nil then
    d.Front^.Prev := NewNode
  else
    d.Rear := NewNode;

  d.Front := NewNode;
end;

function RemoveFront(var d: Deque): Integer;
var
  TempNode: PNode;
begin
  if d.Front <> nil then
  begin
    TempNode := d.Front;
    RemoveFront := TempNode^.Data;
    d.Front := TempNode^.Next;

    if d.Front <> nil then
      d.Front^.Prev := nil
    else
      d.Rear := nil;

    Dispose(TempNode);
  end;
end;

var
  InputFile, OutputFile: Text;
  Number: Integer;
  d: Deque;

begin
  Assign(InputFile, 'lab15-5.txt');
  Reset(InputFile);

  Assign(OutputFile, 'lab15-4.txt');
  Rewrite(OutputFile);

  d.Front := nil;
  d.Rear := nil;

  while not eof(InputFile) do
  begin
    Readln(InputFile, Number);
    AddFront(d, Number);
  end;

  while d.Front <> nil do
    Writeln(OutputFile, RemoveFront(d));

  Close(InputFile);
  Close(OutputFile);
end.
