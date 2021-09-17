program ejer;
type
	rango=1..5;
	string20=string[20];

	persona=record
		dni:longint;
		apellido:string20;
		nombre:string20;
		edad:integer;
		cod_genero:rango;
		end;

	lista=^nodo;

	nodo=record
		dato:persona;
		sig:lista;
		end;

	vecto_genero=array[rango] of integer;
	
	procedure cargavector(var vg:vecto_genero);
		var
			i:rango;
		begin
			for i:=1 to 5 do
				vg[i]:=0;
		end;

	procedure leer_persona(var p:persona);
		begin
			writeln('Ingresar el dni de la persona');
			readln(p.dni);
			writeln('Ingresar el apellido de la persona');
			readln(p.apellido);
			writeln('Ingresar el nombre de la persona');
			readln(p.nombre);
			writeln('Ingresar la edad de la persona');
			readln(p.edad);
			writeln('Ingresar el el codigo de actuacion');
			readln(p.cod_genero);
		end;

	procedure agregaradelante(var l:lista; p:persona);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=p;
			nue^.sig:=l;
			l:=nue;
		end;

	procedure cargarlista(var l:lista);
		var
			p:persona;
		begin
			repeat
				leer_persona(p);
				agregaradelante(l, p);
			until(p.dni = 33555444);	
		end;
	
	function dni_digitos_par_impar(dni:integer):integer;
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
				dni:= dni div 10;	
			end;
			if (par > impar) then
				dni_digitos_par_impar:=1
			else
				dni_digitos_par_impar:=0;
		end;

	procedure max_codigo(vg:vecto_genero; var cod1, cod2, nume1, nume2:integer);	
		var
			i:rango;
		begin
			for i:=1 to 5 do begin
				if (vg[i] > cod1) then begin
					cod2:=cod1;
					cod1:=vg[i];
					nume1:=i;
				end
				else
					if (vg[i] > cod2) then
						cod2:=vg[i];
						nume2:=i;
			end;
		end;

	procedure recorrer(l:lista; vg:vecto_genero);
		var
			cant_digito_par, cod1, cod2:integer;
		begin
			cod1:=-1;
			cod2:=-1;
			cant_digito_par:=0; 
			while (l <> nil) do begin
				vg[l^.dato.cod_genero]:=vg[l^.dato.cod_genero]+1;
				cant_digito_par:=cant_digito_par+dni_digitos_par_impar(l^.dato.dni);
				l:=l^.sig;
			end;
			max_codigo(vg, cod1, cod2, nume1, nume2);
			writeln('la cantidad de personas cuyo DNI contiene más dígitos pares que impares es ', cant_digito_par);
			writeln('Los dos códigos de género más elegidos es ', nume1,' y ', nume2);
		end;

	procedure buscar_borrar(var l:lista; valor:longint);
		var
			ant, act:lista;
			exito:boolean;
		begin
			exito:=false;
			ant:=l;
			act:=l;
			while (act <> nil) and (act^.dato.dni <> valor) do begin
				ant:=act;
				act:=act^.sig;
			end;
			if (act <> nil) then begin
				if (act = l) then begin
					exito:=true;
					l:=act^.sig;
				end	
				else
					ant^.sig:=act^.sig;
			dispose(act);
			end;
			if (exito) then
				writeln('se elimino')
			else
				writeln('NO SE BORRO');	
		end;
	var
		l:lista;
		vg:vecto_genero;
		valor:longint;
	begin
		valor:=0;
		l:=nil;
		cargavector(vg);
		cargarlista(l);
		recorrer(l, vg);
		writeln('Ingrese un DNI a borrar');
		readln(valor);
		buscar_borrar(l, valor);
		readln;	
	end.
