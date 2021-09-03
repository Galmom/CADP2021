program alcance4a;{imprime 1, 2 y 1}
var a,b: integer;
procedure uno;
begin
 a := 1;
 writeln(a);
end;
begin
 a:= 1;
 b:= 2;
 uno;
 writeln(b, a);
readln();
end.
program alcance4b;{tira error porque en el proceso no esta definido a}
procedure uno;
begin
 a := 1;
 writeln(a);
end;
var a,b: integer;
begin
 a:= 1;
 b:= 2;
 uno;
 writeln(b, a);
 readln();
end.
