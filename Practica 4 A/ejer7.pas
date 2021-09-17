{7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8}

program ejer;
	const
		dimf=9;
	type
		rango=1..dimf;
		vector=array[rango] of integer;

	procedure vector_contador(var v:vector);
		var
			i:integer;
		begin
			for i:=1 to dimf do
				v[i]:=0;
		end;
	procedure descomponer (var v:vector; numero:integer);
		var
			dig:integer;
		begin
			if (numero = 0) then
	     		v[0]:= v[0] + 1;
			while (numero <> 0) do begin
				dig:=numero mod 10;
				v[dig]:=v[dig]+1;
				numero:= numero div 10;
			end;
		end;

	procedure no_ocurrencias(v:vector; i:integer);
		begin
			if (v[i] = 0) then
				writeln('El digito ',i,' no tuvo ocurrencias');		
		end;

	procedure mas_leido(v:vector; i:integer; var max, posicion:integer);
		begin
			if (v[i] > max) then begin
				max:=v[i];
				posicion:=i;
			end;	
		end;	

	procedure ocurrencias(var v:vector);
		var
			numero,i, max:integer;
		begin
			numero:=0;
			writeln('Ingrese un numero');
			readln(numero);
			while (numero <> -1) do begin
				descomponer(v, numero);
				writeln('Ingrese un numero');
				readln(numero);	
			end;
			for i:=1 to dimf do begin
				if (v[i] <> 0) then
					writeln('El numero ',i,' aparece ',v[i]);
			end;
		end;

	var
		v:vector;
		diml, i, max,posicion:integer;
	begin
		posicion:=0;
		max:=-1;
		vector_contador(v);
		ocurrencias(v);
		for i:=1 to dimf do begin
			mas_leido(v,i,max, posicion);
			no_ocurrencias(v, i);
		end;
		writeln('El digito mas leido fue el ', posicion);
		readln();
	end.