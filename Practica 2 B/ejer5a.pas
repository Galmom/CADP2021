program ejer;
function par_numero(numA, numB:integer):boolean;
	begin
		if (numA = 2*numB) then
			par_numero:=true
		else
			par_numero:=false;
	end;
var
	numA, numB:integer;
begin
	writeln('Ingrese dos numero');
	readln(numA);
	readln(numB);
	if (par_numero(numA, numB)) then
		writeln('El numero es el doble')
	else
		writeln('El numero no es el doble');	
	readln();
end.