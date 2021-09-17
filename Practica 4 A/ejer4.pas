{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.}

program ejer;
const
	max_vector=100;
type
	rango = 1..max_vector;

	vector=array[rango] of integer;

	procedure carga (var v:vector);
		var
			i:rango;	
		begin
			for i:=1 to max_vector do begin
				v[i]:= abs(random(max_vector));
			end;
		end;

	procedure posicion(v:vector);
		var
			numero, i:integer;
		begin
			writeln('Ingrese el numero');
			readln(numero);
			if (numero <> -1) then begin
				for i:=1 to max_vector do begin
					if (numero = v[i]) then
						writeln('la posicion del numero X ',numero,' es ', i);
				end;
			end	
			else
				writeln('no se encontro el la posiscion');
		end;

	var
		v:vector;
	begin
		Randomize;
		carga(v);
	 	posicion(v);
	 	readln();
	end.
{b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.}
program ejer;
const
	max_vector=100;
type
	rango = 1..max_vector;

	vector=array[rango] of integer;

	procedure carga (var v:vector);
		var
			i:rango;	
		begin
			for i:=1 to max_vector do begin
				v[i]:= abs(random(max_vector));
			end;
		end;
	procedure intercambiaron(v:vector; x,y:integer);
		var
			i:integer;
			auxiliar:integer;
		begin
			writeln('Los numeros recibidos ',x,' y ',y,' tienen los numeros ',v[x],' y ',v[y]);
			auxiliar:=v[x];
			v[x]:=v[y];
			v[y]:=auxiliar;
			writeln('El intercambio de ',x,' y ',y,', es ',v[x],' y ',v[y]);
		end;

	var
		v:vector;
		x, y:integer;
	begin
		Randomize;
		carga(v);
		writeln('Ingrese 2 numeros');
		readln(x);
		readln(y);
	 	intercambiaron(v,x,y);
	 	readln();
	end.

{c) sumaVector: retorna la suma de todos los elementos del vector.}

program ejer;
const
	max_vector=100;
type
	rango = 1..max_vector;

	vector=array[rango] of integer;

	procedure carga (var v:vector);
		var
			i:rango;	
		begin
			for i:=1 to max_vector do begin
				v[i]:= abs(random(max_vector));
			end;
		end;

	procedure sumaVector(v:vector);
		var
			i,suma:integer;
		begin
			for i:=1 to max_vector do begin
				suma:=suma+v[i];
			end;
			writeln('La suma total es ',suma);
		end;

	var
		v:vector;
	begin
		Randomize;
		carga(v);
		sumaVector(v);
	 	readln();
	end.

{d) promedio: devuelve el valor promedio de los elementos del vector.}

program ejer;
const
	max_vector=100;
type
	rango = 1..max_vector;

	vector=array[rango] of integer;

	procedure carga (var v:vector);
		var
			i:rango;	
		begin
			for i:=1 to max_vector do begin
				v[i]:= abs(random(max_vector));
			end;
		end;

	function promedio(v:vector):real;
		var
			i:integer;
			suma:real;
		begin
			suma:=0;
			for i:=1 to max_vector do begin
				suma:=suma+v[i];
			end;
			promedio:=suma/100;
		end;	
	 var
		v:vector;
	begin
		Randomize;
		carga(v);
		writeln('El promedio del vector es ', promedio(v):4:3);
	 	readln();
	end.


{e) elementoMaximo: retorna la posición del mayor elemento del vector}

program ejer;
const
	max_vector=100;
type
	rango = 1..max_vector;

	vector=array[rango] of integer;

	procedure carga (var v:vector);
		var
			i:rango;	
		begin
			for i:=1 to max_vector do begin
				v[i]:= abs(random(max_vector));
			end;
		end;
	function elementoMaximo(v:vector):integer;
		var
			i, max1, posicion_max:integer;
		begin
			posicion_max:=0;
			max1:=-1;
			for i:=1 to max_vector do begin
				if (v[i] > max1) then begin
					max1:=v[i];
					posicion_max:=i;
				end;	
			end;
			elementoMaximo:=posicion_max;
		end;


	 var
		v:vector;
	begin
		Randomize;
		carga(v);
		writeln('El maximo esta en ', elementoMaximo(v));
	 	readln();
	end.


{f) elementoMinimo: retorna la posicion del menor elemento del vector}

program ejer;
const
	max_vector=100;
type
	rango = 1..max_vector;

	vector=array[rango] of integer;

	procedure carga (var v:vector);
		var
			i:rango;	
		begin
			for i:=1 to max_vector do begin
				v[i]:= abs(random(max_vector));
			end;
		end;
	function elementoMinimo(v:vector):integer;
		var
			i, max1, posicion_max:integer;
		begin
			posicion_max:=0;
			max1:=9999;
			for i:=1 to max_vector do begin
				if (v[i] < max1) then begin
					max1:=v[i];
					posicion_max:=i;
				end;	
			end;
			elementoMinimo:=posicion_max;
		end;


	 var
		v:vector;
	begin
		Randomize;
		carga(v);
		writeln('El minimo esta en ', elementoMinimo(v));
	 	readln();
	end.