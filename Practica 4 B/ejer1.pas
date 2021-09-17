{1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un
valor n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}
program ejer;
const
	max_500=20;//va 500
type
	rango=1..max_500;
	vector500=array[rango] of integer;

	procedure carga(var n:vector500);
		var
			i:integer;
		begin
			randomize;
			i:=0;
			for i:=1 to max_500 do begin
				n[i]:=random(20);
			end;
		end;

	function buscar_num(n:vector500; num:integer):boolean;
		var
			i:integer;
		begin
			i:=1;
			while (num <> n[i]) and (i < max_500) do begin //diml no tiene sentido ya que son 500 si o si
				i:=i+1;
				if (n[i] = num) then 
					buscar_num:=true
				else 
					buscar_num:=false;	
			end;			
		end;

	procedure imprimir(n:vector500);
		var
			i:integer;
		begin
			i:=0;
			for i:=1 to max_500 do begin
				writeln(n[i]);
			end;
		end;	

	var
		numeros:vector500;
		num:integer;
	begin	
		carga(numeros);
		imprimir(numeros);
		writeln('Ingrese un numero a buscar');
		readln(num);
		if (buscar_num(numeros, num) = true) then
			writeln('Se encontro el numero')
		else
			writeln('No se encontro el numero');
		
		readln();
	end.


	function buscar_num(numeros, num):boolean;
		var
			i:integer;
		begin
			i:=1;
			while (num > n[i]) and (i < max_500) do begin
				i:=i+1;
				if (i > max_500) or (num < n[i]) then
					buscar_num:=false
				else
					buscar_num:=true;	
			end;
		end;
