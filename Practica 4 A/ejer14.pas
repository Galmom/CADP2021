{14. El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:
CÓDIGO ROL DEL DESARROLLADOR VALOR/HORA (USD)
1 Analista Funcional 35,20
2 Programador 27,45
3 Administrador de bases de datos 31,03
4 Arquitecto de software 44,28
5 Administrador de redes y seguridad 39,87
Nota: los valores/hora se incluyen a modo de ejemplo
Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto.}

PROGRAM ejer;
const
 max_rango=3;
type
	string20=string[20];

	dato=record
		pais_residencia:string20;
		codigo_proyecto:integer;
		nombre_proyecto:string20;
		rol_cumplido:1..5;
		hs_trabajo:real;
	end;

	registro_contador=record
		minimo_pro:real;
		arquit:integer;
	end;

	vector_contador=array [1..max_rango] of registro_contador;

	procedure v_contador(var vc:vector_contador);
		var
			i:integer;
		begin
			for i:=1 to max_rango do begin
				vc[i].minimo_pro:=0;
				vc[i].arquit:=0;
			end;
		end;	

	procedure leer(var d:dato);
		begin
			writeln();
			writeln('<-------------------------------------------------------------------------------------->');
			writeln();
			write('Ingrese el codigo de proyecto (1 a 1000), pais de residencia, el nombre del proyecto, ');
			writeln('el rol que cumplio en dicho proyecto (1 a 5) y la cantidad de horas trabajadas.');
			readln(d.codigo_proyecto);
			if (d.codigo_proyecto <> -1) then begin
				readln(d.pais_residencia);
				readln(d.nombre_proyecto);
				readln(d.rol_cumplido);
				readln(d.hs_trabajo);
			end;
		end;

	function hs_rol(horas_trabajadas:real; tipo_rol:integer):real;
		var
			resul_rol:real;
		begin
			resul_rol:=0;
			if (tipo_rol = 1) then
				resul_rol:=horas_trabajadas*35.20
			else 
				if (tipo_rol = 2) then
					resul_rol:=horas_trabajadas*27.45
			else 
				if (tipo_rol = 3) then	
					resul_rol:=horas_trabajadas*31.03
			else 
				if (tipo_rol = 4) then	
					resul_rol:=horas_trabajadas*44.28
			else 
				if (tipo_rol = 5) then
					resul_rol:=horas_trabajadas*39.87;

			hs_rol:=resul_rol;		
		end;

	procedure residencia_arg(d:dato; dimf:integer; var suma:real);
		begin
			if (d.pais_residencia = 'argentina') then
				suma:=suma+(hs_rol(d.hs_trabajo, d.rol_cumplido));
		end;

	procedure hs_total_admin(d:dato; dimf:integer; var cant_horas:real);
		begin
			if (d.rol_cumplido = 3) then
				cant_horas:=cant_horas+(d.hs_trabajo*31.03);
			end;

	procedure minimo(min_monto:real; i:integer; var min:real; var cod:integer);
		begin
			min:=0;
			if (min_monto < min) then begin
				min:=min_monto;
				cod:=i;
			end;
		end;

	var
		d:dato;
		vc:vector_contador;
		i, cod:integer;
		min_monto, suma, cant_horas:real; 
	begin
		cant_horas:=0;
		suma:=0;
		i:=0;
		v_contador(vc);
		leer(d);
		while (d.codigo_proyecto <> -1) and (dimf < max_rango) do begin
//guardo en vc[pongo aca lo que necesito del registro].pongo aca los que necesito del vector, don de lo guardo
//guardo el codigo y el monto de cada proyecto
			vc[d.codigo_proyecto].minimo_pro:=vc[d.codigo_proyecto].minimo_pro+(hs_rol(d.hs_trabajo, d.rol_cumplido));
			
			writeln('monto total para el codigo: ',d.codigo_proyecto,' es: ', vc[d.codigo_proyecto].minimo_pro:6:2);
			if (d.rol_cumplido = 4) then	
				vc[d.codigo_proyecto].arquit:=vc[d.codigo_proyecto].arquit+1;
			residencia_arg(d, dimf, suma);//a) El monto total invertido en desarrolladores con residencia en Argentina.
			hs_total_admin(d, dimf, cant_horas);//b) La cantidad total de horas trabajadas por Administradores de bases de datos.
			//diml:=diml+1;
			leer(d);
		end;
		for i:=1 to dimf do begin
			minimo(vc[i].minimo_pro, i, min_monto, cod);
			writeln('La cantidad de Arquitectos de software de cada proyecto es ', vc[d.codigo_proyecto].arquit);//d) La cantidad de Arquitectos de software de cada proyecto.
		end;
		writeln('El monto total invertido en desarrolladores con residencia en Argentina es ', suma:6:2);
		writeln('El codigo del proyecto con menor monto invertido. ',cod);//c) El código del proyecto con menor monto invertido.
		writeln('La cantidad total de horas trabajadas por Administradores de bases de datos, ', cant_horas:4:2,'hs');
	//imprimir(participante);
	readln()
	end.