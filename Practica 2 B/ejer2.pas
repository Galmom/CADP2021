Program ejercicio4;
procedure digParesImpares(num : integer; var par, impar : integer);
var
 dig: integer;
begin
 while (num <> 0) do begin
 dig:= num mod 10;
 if((dig mod 2)= 0) then
 par := par + 1
 else
 impar:= impar +1;
 num := num DIV 10; 
 end;
end;
var
 dato, par, impar, total, cant : integer;
begin
 par := 0;
 impar := 0;
 repeat
 read(dato);
 digParesImpares(dato,par,impar);
 until (dato = 100);
 writeln('Pares: ',par, 'impares: ', impar);
 readln();
end.

{200 cada digito es par}
{35 cada digito impar}
{100 1 es impar cero par}