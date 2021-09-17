{La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso
y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).
1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el
alumno con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a
cada alumno deben quedar ordenadas de forma descendente.
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.
b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto
únicamente por dígitos impares.
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido
se recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de
la estructura generada en el inciso 1. El alumno puede no existir.}
program ejercicio7;
const
	dimf=4;//24
type
	string20=string[20];

	vector_notas=array[1..dimf] of integer;

	alumno=record
		num_alumno:integer;
		apellido:string20;
		nombre:string20;
		email:string20;
		anio_ingreso:integer;
		anio_egreso:integer;
		nota:vector_notas;
		diml:integer;
		end;

	lista=^nodo;

	nodo=record
		dato:alumno;
		sig:lista;
		end;

	procedure ordenarvector(var v: vector_notas);
		var 
			i, j, actual: integer;
		begin

			for i:= 2 to dimF do begin
		   		actual:=v[i];
		   		j:= i-1;
		   		while (j > 0) and (v[j] > actual) do begin
		     		v[j+1]:=v[j];
		     		j := j-1;
		     	end;
				v[j+1] := actual;
			end;
		end;	

	procedure leer(var a:alumno);
		var
			valor, i, cant_diml:integer;
		begin
			cant_diml:=0;
			writeln('Ingrese el numero de alumno');
			readln(a.num_alumno);
			if (a.num_alumno <> -1) then begin
				writeln('Ingrese el apellido');
				readln(a.apellido);
				writeln('Ingrese el nombre');
				readln(a.nombre);
				writeln('Ingrese el email');
				readln(a.email);
				writeln('Ingrese anio de ingreso');
				readln(a.anio_ingreso);
				writeln('Ingrese ani de egreso');
				readln(a.anio_egreso);
				writeln('Ingrese las notas');
				for i:=1 to dimf do begin 
					readln(valor);  
					if (valor > 3) then begin
						a.nota[i]:=valor;
						cant_diml:=i;
//0000000000000000000 OTRA OPCION 0000000000000000000000000000000000000000000000000000000
				readln(valor);
				while (diml < dimf) do begin
					if (valor > 3) then begin
						diml:=diml+1
						a.nota[diml]:=valor;
					end;
					readln(valor);	
				end;
				a.diml:=diml;	
//00000000000000000000000000000000000000000000000000000000000000000000000000
					end;	
				end;
				a.diml:=cant_diml;                     
				ordenarvector(a.nota);
			end;
			writeln('wewew',cant_diml);
		end;

	procedure agregaradelante(var l:lista; a:alumno);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=a;
			nue^.sig:=l;
			l:=nue;
		end;

	procedure cargarlista(var l:lista);
		var
			a:alumno;
		begin
			leer(a);
			while (a.num_alumno <> -1) do begin
				agregaradelante(l, a);
				leer(a);
			end;
		end;

	function calculo_promedio(vn:vector_notas; diml:integer):real;
		var
			i:integer;
			suma:real;
		begin
			suma:=0;
			for i:=1 to diml do
				suma:=suma+vn[i];
			calculo_promedio:=suma/i;
		end;

	function digitos_impares(num_alumno:integer):integer;
		var
			digito:integer;
			par:boolean;
		begin
			par:=false;
			while (num_alumno <> 0) and (par = false) do begin  
				digito:= num_alumno mod 10;
				if (digito mod 2 = 0) then
					par:=true
				else
					par:=false;
				num_alumno:=num_alumno div 10;	
			end;
				if (par = false) then
					digitos_impares:=1
				else
					digitos_impares:=0;
		end;

	procedure recibieron_rapido(l:lista; var min1, min2:integer; var ape1, ape2, nom1, nom2, email1, email2:string);
		begin
			if (l^.dato.num_alumno < min1) then begin
				min2:=min1;
				ape2:=ape1;
				nom2:=nom1;
				email2:=email1;
				min1:=l^.dato.num_alumno;
				ape1:=l^.dato.apellido;
				nom1:=l^.dato.nombre;
				email1:=l^.dato.email;

			end
			else
				if (l^.dato.num_alumno < min2) then begin
					min2:=l^.dato.num_alumno;
					ape2:=l^.dato.apellido;
					nom2:=l^.dato.nombre;
					email2:=l^.dato.email;
				end;		
		end;

	procedure recorrer(l:lista);
		var
			cant_impar, min1, min2:integer;
			ape1, ape2, nom1, nom2, email1, email2:string;
		begin
			min1:=-1;
			min2:=-1;
			cant_impar:=0;
			while (l <> nil) do begin
				writeln('El promedio de notas obtenido por cada alumno ', calculo_promedio(l^.dato.nota, l^.dato.diml):3:2);
				if (l^.dato.anio_ingreso = 2012) then
					cant_impar:=cant_impar+(digitos_impares(l^.dato.num_alumno));
				recibieron_rapido(l, min1, min2, ape1, ape2, nom1, nom2, email1, email2);
				l:=l^.sig;
			end;
			write('La cantidad de alumnos ingresantes 2012 cuyo numero de alumno esta compuesto');
			writeln(' unicamente por digitos impares es ', cant_impar);
			write('El apellido, nombres y direccion de correo electronico de los dos alumnos');
			writeln(' que mas rapido se recibieron ',ape1,', ' ,nom1,', ',email1,' y ',ape2,', ',nom2,', ',email2);
		end;

	procedure buscareliminar(var l:lista; valor:integer; var exito:boolean);
		var
			ant, act:lista;
		begin
			act:=l;
			ant:=l;
			while (act <> nil) and (act^.dato.num_alumno <> valor) do begin
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
		end;

	var
		l:lista;
		valor:integer;
		exito:boolean;
	begin
		exito:=false;
		valor:=0;
		l:=nil;
		cargarlista(l);
		recorrer(l);
		writeln('Ingrese el numero de persona a buscar');
		readln(valor);
		buscareliminar(l, valor, exito);
		if (exito = true) then
			writeln('se borro')
		else
			writeln('NO SE BORRO');	
		readln;
	end.