{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de 
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada usuario 
se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y cantidad de 
días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la revista 
Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}

program ejer;
type
	string20=string[20];
	rango=1..4;
	usuario=record
			nombre:string20;
			email:string20;
			rol:rango;
			participacion_revista:string20;
			cant_dia_acceso:integer;
			end;
	lista=^nodo;
	
	nodo=record
		dato:usuario;
		sig:lista;
		end;		
	vector_usuario=array[1..3600] of usuario;
	vector_rol=array[rango] of integer;

procedure inicio_vector(var vr:vector_rol);
	var
		i:integer;
	begin
		for i:=1 to 3600 do
			vr[i]:=0;
	end;
procedure cargaordenado(var l:lista; usu:usuario);
	var
		ant, act, nue:lista;
	begin
		new(nue);
		nue^.dato:=usu;
		ant:=l;
		act:=l;
		while (l <> nil) and (l^.dato.cant_dia_acceso < usu.cant_dia_acceso) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (ant =act) then
			l:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;
	end;

procedure cargarlista(VAR l:lista; var vu:vector_usuario);
	var
		i:integer;
		usu:usuario;
	begin
		for i:=1 to 3600 do 
			cargaordenado(l, usu);
	end;

procedure imprimir(l:lista);
	begin
		writeln('El nombre del usuario es ',l^.dato.nombre);
		writeln('la cantidad de dias desde el ultimo acceso es ', l^.dato.cant_dia_acceso);
	end;
procedure maximo(email_principal:string; var mail1, mail2:string; dia_accesos:integer; var max1, max2:integer);
	begin
		if (dia_accesos > max1) then begin
			max2:=max1;
			mail2:=mail1;
			max1:=dia_accesos;
			mail1:=email_principal;
		end
		else
			if (dia_accesos > max2) then begin
				max2:=dia_accesos;
				mail2:=email_principal;
			end;	
	end;

procedure recorrer_lista(l:lista; var vr:vector_rol);
	var
		i, max1, max2:integer;
		mail1, mail2:string;
	begin
		max1:=-1;
		max2:=-1;
		while (l <> nil) do begin
			vr[l^.dato.rol]:=vr[l^.dato.rol]+1;
			maximo(l^.dato.email, mail1, mail2, l^.dato.cant_dia_acceso, max1, max2);
			l:=l^.sig;
		end;
		writeln('los emails de los dos usuarios que hace más tiempo que no ingresan al portal es', mail1,' y ', mail2);
		writeln('la cantidad de usuarios por cada rol');
		for i:=1 to 4 do begin
			writeln(i,' ',vr[i]);
		end;
	end;

	var
		l:lista;
		vr:vector_rol;
		vu:vector_usuario;
	begin
		l:=nil;
		//cargarvu(vu); SE DISPONE
		cargarlista(l, vu);
		inicio_vector(vr);
		recorrer_lista(l, vr);
	end.