program anidamientos;
	function analizarLetra(letra:char) : boolean;{faltaba el parametro a pasar}
				begin
					if (letra >= 'a') and (letra <= 'z') then
						analizarLetra := true
				else
					if (letra >= 'A') and (letra <= 'Z') then
						analizarletra := false;
				end; { fin de la funcion analizarLetra }
	procedure leer();{NO LLEGAN LOS DATOS A ANALIZAR LETRA si la funcion esta adentro en var}
		var
			letra:char;
		begin
			writeln('Ingrese una letra');
			readln(letra);
		if (analizarLetra(letra)) then
			writeln('Se trata de una minuscula')
		else
			writeln('Se trata de una mayuscula');
	end; { fin del procedure leer}
Var
	ok : boolean;
	letra:char;{faltaba agregar letra aca, para que lo tome abajo}
Begin { programa principal }
	leer;
	ok := analizarLetra(letra);
if ok then
	writeln('Gracias, vuelva prontosss'); 
	readln();
end.
