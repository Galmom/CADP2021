{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program ejer;
const
	max_53=3;
type
	string20=string[20];
	rango=1..max_53;

	galaxia=record
		nombre:string20;
		tipo:1..4;
		masa:real;
		distancia:real;
	end;

	vector_galaxias=array[rango] of galaxia;
	vector_tipo=array[1..4] of integer;

procedure leer(var g:galaxia);
	begin
		writeln('Ingrese nombre, tipo, masa y la distancia en parsecs (pc) ');
		readln(g.nombre);
		readln(g.tipo);
		readln(g.masa);
		readln(g.distancia);
	end;

procedure cargar(var d:vector_galaxias);
	var
		i:integer;
	begin
		i:=0;
		for i:=1 to max_53 do begin
			leer(d[i]);
		end;
	end;

procedure cargar_contador(var tipo_v:vector_tipo);
	var
		i:integer;
	begin
		i:=0;
		for i:=1 to 4 do begin
			tipo_v[i]:=0;
		end;	
	end;

procedure tipo_galaxia(tipo_galaxia:integer; var tv:vector_tipo);// es integer porque es 1..4
	begin
		tv[tipo_galaxia]:=tv[tipo_galaxia]+1;//tipo_galaxia es el vector donde saco la info del tipo que se agrego, en tv pongo que tipo se subio y los suma
	end;

function masas(masa:real; nom:string):real;
	begin
		if (nom ='via lactea') or (nom = 'andromeda') or (nom = 'triangulo') then
			masas:=masa
		else
			masas:=0;	
	end;

function porcentaje_masa(masa_t, masa_3:real):real;
	begin
		porcentaje_masa:=masa_t*100/masa_3;
	end;

function menos_1000(tipo_4:integer; distancia:real):integer;
	begin
		if (tipo_4 <> 4) and (distancia < 1000) then
			menos_1000:=1
		else
			menos_1000:=0;	 
	end;

	procedure max_masa(nombre:string; masa:real; var gala1, gala2:string; var  masa1, masa2:real);
		begin
			if (masa > masa1) then begin
				masa2:=masa1;
				gala2:=gala1;
				masa1:=masa;
				gala1:=nombre;
			end	
			else if (masa > masa2) then begin
				masa2:=masa;
				gala2:=nombre;	
			end;	
		end;

	procedure min_masa(nombre:string; masa:real; var gala3, gala4:string; var  masa3, masa4:real);
		begin
			if (masa > masa3) then begin
				masa4:=masa3;
				gala4:=gala3;
				masa3:=masa;
				gala3:=nombre;
			end	
			else if (masa > masa4) then begin
				masa4:=masa;
				gala4:=nombre;	
			end;	
		end;

	procedure imprimir(a:vector_galaxias);
		var
			i:integer;
		begin
			for i:=1 to max_53 do begin
				writeln('sadasda ',a[i].masa);
				end;
		end;


	var
		datos:vector_galaxias;
		tipo_vec:vector_tipo;
		masa_3gala, masa_total, masa1, masa2, masa3, masa4:real;
		no_irregular, i:integer;
		gala1, gala2, gala3, gala4:string20;
	begin
		no_irregular:=0;
		masa_total:=0;
		masa_3gala:=0;
		cargar(datos);
		cargar_contador(tipo_vec);
		for i:=1 to max_53 do begin
			masa_total:=masa_total+datos[i].masa;
			tipo_galaxia(datos[i].tipo, tipo_vec);//mando el tipo de galaxi guardado en datos, y mando tipo_v para saber cual es, las suma
			masa_3gala:=masa_3gala+masas(datos[i].masa, datos[i].nombre);
			//imprimir(datos);
			no_irregular:=no_irregular+menos_1000(datos[i].tipo, datos[i].distancia);
			max_masa(datos[i].nombre, datos[i].masa, gala1, gala2, masa1, masa2);
			min_masa(datos[i].nombre, datos[i].masa, gala3, gala4, masa3, masa4);
		end;
		writeln('la masa total acumulada de las 3 galaxias principales (la Via Lactea, Andromeda y Triangulo) ',masa_3gala:4:3);
		writeln('El porcentaje que esto representa respecto a la masa de todas las galaxias ',porcentaje_masa(masa_total, masa_3gala));
		writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc es ',no_irregular);
		writeln('El nombre de las dos galaxias con mayor masa es ',gala1,' y ',gala2);
		writeln('El nombre de las dos galaxias con menor masa es ',gala3,' y ',gala4);
	end.