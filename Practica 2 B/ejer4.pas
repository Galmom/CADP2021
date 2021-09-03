program programadores;
	procedure leerDatos(var legajo: integer; salario : real);{salario tambien deveria ser var}
		begin
			writeln('Ingrese el nro de legajo y el salario');
			read(legajo);
			read(salario);
		end;
	procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer);
		var
			maxSalario : real;
		begin
			if (nuevoLegajo > maxLegajo) then begin
				maxLegajo:= nuevoLegajo; 
				maxSalario := nuevoSalario{falta devolver maxsalario}
			end;
		end;
var
	legajo, maxLegajo, i : integer;
	salario, maxSalario : real;
begin
	sumaSalarios := 0; {falta definirlo}
	salario:=0; {falta iniciarlos}
	legajo:=0;
	for i := 1 to 3 do begin
		leerDatos(legajo, salario);{el orden no tiene que ser salario, legajo, acomodo bien}
		actualizarMaximo(legajo, salario, maxLegajo);{tendria que se maxSalario}
		sumaSalarios := sumaSalarios + salario;
	end;
	writeln('En todo el mes se gastan ', sumaSalarios, ' pesos');
	writeln('El salario del empleado mas nuevo es ',maxSalario);
	readln();
end.