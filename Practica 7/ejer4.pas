{ Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.
}

program ejer;
type
	string20=string[20];
	rango=1..42;

	vecto_peso=array[rango] of real;

	paciente=record
		nombre:string20;
		apellido:string20;
		semana_embarazo:integer;
		peso:vecto_peso;
		end;

	lista=^nodo;

	nodo=record
		dato:paciente;
		sig:lista;
		end;	

	function maximo(semana_embarazo:integer; peso:vecto_peso):integer;
		var
			i, semana_max:rango;
			max, dato:real;
		begin
			dato:=0;
			semana_max:=0;
			max:=-1;
			for i:=1 to semana_embarazo do begin
				dato:=peso[i+1]-peso[i];
				if (dato > max) then begin
					max:=dato;
					semana_max:=i;
				end;
			end;		
			maximo:=semana_max;
		end;	
	function peso_total(peso:vecto_peso):real;
		// var
			// i:rango;
			// cant_peso:real;
		begin
			peso_total:=peso[42] - peso[1];
			// cant_peso:=0;
			// for i:=1 to 42 do begin
			// 	cant_peso:=cant_peso+peso[i];
			// end;
			// peso_total:=cant_peso;
		end;

	procedure recorrer(l:lista);
		begin
			while (l <> nil) do begin
				writeln('Para ',l^.dato.apellido,' la semana con mayor aumento de peso',maximo(l^.dato.semana_embarazo, l^.dato.peso));
				writeln('El aumento de peso total de ',l^.dato.apellido,' durante el embarazo es',peso_total(l^.dato.peso));
				l:=l^.sig;
			end;
		end;	

	var
		l:lista;
	begin
		l:=nil;
		//cargarlista(l); SE DISPONE	
		recorrer(l);
		readln;
	end.