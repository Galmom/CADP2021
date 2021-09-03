program ejer;
function par_numero(numA, numB:integer):boolean;
	begin
		if (numA = 2*numB) then
			par_numero:=true
		else
			par_numero:=false;
	end;
var
	numA, numB, pares, dobles:integer;
begin
	pares:=0;
	dobles:=0;
	writeln('Ingrese dos numero');
	readln(numA);
	readln(numB);
	while (numA <> 0) and (numB <> 0) do begin
		dobles:=dobles+1;
		if (par_numero(numA, numB)) then
			pares:=pares+1;
	writeln('Ingrese dos numero');
	readln(numA);
	readln(numB);	
		end;
	writeln('Los cantidad de dobles son ',pares,' y los que son pares es ',dobles);			
	readln();
end.