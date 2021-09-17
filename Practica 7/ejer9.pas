{9. Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se
tiene: código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4:
suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las
críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se
debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI
del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura
finaliza cuando se lee el código de película -1 y la información viene ordenada por código de
película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares
que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).
}
program ejer;
type
	string20=string[20];
	rango=1..8;

	critica=record
		dni_critico:integer;
		apellido:string20;
		nombre:string20;
		cod_pelicula:integer;
		puntaje_otor:integer;
		end;

	pelicula=record
		cod_pelicula:integer;
		titulo_peli:string20;
		cod_genero:integer;
		prome_critica:real;
		end;

	lista=^nodo;

	nodo=record
		dato:pelicula;
		sig:lista;
		end;

	vector_codigo=array[rango] of integer;	

	procedure cargarvector(var vc:vector_codigo);
		var
			i:rango;
		begin
			for i:=1 to 8 do
				vc[i]:=0;
		end;
				
	procedure leer(var c:critica);
		begin
			writeln('Ingrese el sodigo de pelicula');
			readln(c.cod_pelicula);
			if (c.cod_pelicula <> -1) then begin
				writeln('Ingrese el DNI del critico');
				readln(c.dni_critico);
				writeln('Ingrese el apellido del critico');
				readln(c.apellido);
				writeln('Ingrese el nombre del critico');
				readln(c.nombre);
				writeln('Ingrese el puntaje otorgado');
				readln(c.puntaje_otor);
			end;	
		end;
	function ver_codigo(vc:vector_codigo):integer;	
		var
			i:rango;
			max, cod:integer;
		begin
			max:=0;
			cod:=0;
			for i:=1 to 8 do begin
				if (vc[i] > max) then begin
					max:=vc[i];
					cod:=i;
				end;
			end;
			ver_codigo:=cod;		
		end;
	function par_impar(dni:integer):boolean;
		var
			digito, impar, par:integer;
		begin
			digito:=0;
			impar:=0;
			par:=0;
			while (dni <> 0) do begin
				digito:= dni mod 10;
				if (digito mod 2 = 0) then
					par:=par+1
				else
					impar:=impar+1;	
			end;
				if (par = impar) then
					par_impar:=true
				else
					par_impar:=false;	
		end;

	procedure recorrer(l:lista);
		var
			c:critica;
			prome_suma_critica:real;
			suma_critica, cant_critica, actual:integer;
			vc:vector_codigo;
		begin
			leer(c);
			while (c.cod_pelicula <> -1) do begin
				actual:=c.cod_pelicula;
				cant_critica:=0;
				suma_critica:=0;
				prome_suma_critica:=0;
				while (c.cod_pelicula <> -1) and  (actual = c.cod_pelicula) do begin
					cant_critica:=cant_critica+1;
					suma_critica:=suma_critica+c.puntaje_otor;
					vc[l^.dato.cod_genero]:=vc[l^.dato.cod_genero]+1;
					if (par_impar(c.dni_critico) = true) then begin
						write('El apellido y nombre de aquellos críticos que posean la misma');
						writeln('cantidad de dígitos pares que impares en su DNI ',c.apellido,', ',c.nombre);
					end;	
					l:=l^.sig;
				end;
				prome_suma_critica:=suma_critica/cant_critica;
				l^.dato.prome_critica:=	(l^.dato.prome_critica+prome_suma_critica)/2;
				leer(c);
			end;
			writeln('El código de género que más puntaje obtuvo entre todas las críticas', ver_codigo(vc));
		end;
	procedure buscaryborrar(var l:lista; valor:integer);
		var
			ant, act:lista;
			exito:boolean;
		begin
			exito:=false;
			while (act <> nil) and (act^.dato.cod_pelicula <> valor) do begin
				ant:=act;
				act:=act^.sig;
			end;
			if (act <> nil) then begin
				exito:=true;
				if (act = l) then
					l:=act^.sig
				else
					ant^.sig:=act^.sig;
				dispose(act);		
			end;
			if (exito = true) then
				writeln('Se elimino codigo')
			else
				writeln('NO SE BORRO NADA');
		end;

	var
		l:lista;
		vc:vector_codigo;
		valor:integer;
	begin
		l:=nil;
		cargarvector(vc);
		//cargalista(l);	SE DISPONE
		recorrer(l);
		writeln('Ingrese el codigo de pelicula a borrar');
		readln(valor);
		buscaryborrar(l, valor);
		readln();
	end.