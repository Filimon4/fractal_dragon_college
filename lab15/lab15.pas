program test;

procedure task1();
type
  ptr_int = ^integer;

var
  i: integer;
  i_prt: ptr_int;
begin
  i := 2;
  i_prt := @i;
  writeln('i: ', i, ' ', 'i_ptr: ' ,i_prt^);
end;

function TakeWord(F: Text):string;
var c: char;
begin
  reset(F);
  Result:= '';
  c := ' ';
  while not eof(f) and (c <= ' ')do
    read(F, c);
  while not eof(f) and (c > ' ') do begin
    Result := Result + c;
    read(F, c);
  end;
  CloseFile(F);
  TakeWord := Result;
end;

procedure task2();
var 
  r: string; 
  f: TextFile;
const FILE_NAME = 'words.txt';
begin
  Assign(f, FILE_NAME);
  r := TakeWord(f);
  writeln(r.Length);
end;

procedure task3();
type
  PNode = ^Node;
  Node = record
    val: integer;
    next: pointer;
  end;
var
  Head: PNode;
  NewNode: PNode;
  pp: PNode;
  i: integer;
begin
  New(Head);
  Head^.val := 0;
  Head^.next := nil;
  
  while i <= 10 do begin
    pp := Head;
    while pp^.next <> nil do
      pp := pp^.next;
    New(NewNode);
    NewNode^.val := i;
    NewNode^.next := nil;
    pp^.next := NewNode;
    i := i + 1;
  end;
  
  pp := Head^.next;
  while pp^.next <> nil do begin
    writeln(pp^.val);
    pp := pp^.next;
  end;
  
  pp := Head^.next;
  while pp^.next <> nil do begin
    if pp^.val mod 2 = 0 then
      writeln(pp^.val);
    pp := pp^.next;
  end;
end;

procedure task4();
type
  PNode = ^Node;
  Node = record
    val: integer;
    next: pointer;
  end;
var
  Head: PNode;
  NewNode: PNode;
  pp: PNode;
  i, min, max: integer;
begin
  New(Head);
  Head^.val := 0;
  Head^.next := nil;
  
  i := 501;
  while i <= 1000 do begin
    pp := Head;
    while pp^.next <> nil do begin
      pp := pp^.next;
    end;
    New(NewNode);
    NewNode^.val := (Abs(1000 - i) + Abs(1000 - (i*i)) + Abs(1000 - (i*i*i))) mod 500;
    NewNode^.next := nil;
    pp^.next := NewNode;
    i := i + 1;
  end;
  
  pp := Head^.next;
  min := pp^.val;
  max := pp^.val;
  while pp^.next <> nil do begin
    if pp^.val > max then
      max := pp^.val;
    if pp^.val < min then
      min := pp^.val;
    pp := pp^.next;
  end;
  writeln(min);
  writeln(max);
end;

begin
  task4();
end.