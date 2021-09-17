{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello, 
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta 
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida 
por el camión (medida en kilómetros).
a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza 
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida 
sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

program ejer;
const
	max200=200;
type
	fecha=1..31;
	rango=1..max200;
	viaje=record
		dia:fecha;
		monto_transportado:real;
		distancia:real;
	end;

viajes_vector=array[rango] of viaje;
vector_cuenta=array[fecha] of integer;
{a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza 
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.}
procedure leer(var v:viaje);
	begin
		writeln('Ingrese la distancia recorrida, la fecha y monto de dinero transportado');
		readln(v.distancia);
		if (v.distancia <> 0) then begin
			readln(v.dia);
			readln(v.monto_transportado);
		end;	
	end;

procedure carga(var s:viajes_vector; var diml:integer);
	var
		v:viaje;
	begin
		leer(v);
		while (diml < max200) and (v.distancia <> 0) do begin
			diml:=diml+1;
			s[diml]:=v;
			leer(v);
		end;
	end;
{FIN DE A ======================================================================================================}

{b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.}
procedure minimo(s:viajes_vector; i:integer; var dis_recorrida:real; var dia_mes:fecha; var min:real);
	begin
		if (s[i].monto_transportado < min) then begin
			min:=s[i].monto_transportado;
			dis_recorrida:=s[i].distancia;
			dia_mes:=s[i].dia;
		end;
	end;

procedure cantidad_fecha(s:viajes_vector; i:integer; var vc:vector_cuenta);	
	var
		dia_cuenta:integer;
	begin
		dia_cuenta:=s[i].dia;
		vc[dia_cuenta]:=vc[dia_cuenta]+1;	
	end;
{FIN DE B ======================================================================================================}

{c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida 
sea igual a 100 km.}

	function buscar(s:viajes_vector; diml:integer; num_bucar:integer):integer;
		var
			i:integer;
			
		begin
			i:=1;
			while ( i <= diml) and (num_bucar <> s[i].monto_transportado) do 
				i:=i+1;
				writeln('fuction ',i);
			if (i > diml) then
				i:=0;
			buscar:=i;
		end;
	procedure eliminar(var s:viajes_vector; var diml:integer; aux:integer);
		var
			i:integer;
		begin
						 
			for i:=aux to diml do
				s[i]:=s[i+1];
			 
		end;

{FIN DE C ======================================================================================================}

procedure variado(s:viajes_vector; diml:integer; vc:vector_cuenta);
	var
		dis_recorrida, min, suma:real;
		dia_mes:fecha;
		i, num_bucar, aux:integer;
	begin
	aux:=0;
		num_bucar:=100;
		suma:=0;
		i:=0;
		min:=9999;
		dis_recorrida:=0;
		dia_mes:=0;
		for i:=1 to diml do begin
			suma:=suma+s[i].monto_transportado;//b
			minimo(s,i, dis_recorrida, dia_mes, min);
			cantidad_fecha(s, i, vc);
			aux:=buscar(s, diml, num_bucar);//C
			if (aux <> 0 ) then begin
				eliminar(s, diml, aux);
				writeln('El MONTO se elimino');
			end	
			else begin
				writeln('El MONTO no se encontro');	
			end;
			writeln('La cantidad de viajes realizados cada día del mes es ', vc[i]);
		end;
		writeln('El monto promedio transportado de los viajes realizados es ', suma/diml:4:2);//b
		writeln('La distancia recorrida y el dia del mes en que se realizo el viaje que transporto menos dinero ',dis_recorrida:4:2,' y ',dia_mes);
	end;

	var
		servicio:viajes_vector;
		diml, i:integer;
		vc:vector_cuenta;
	begin
	diml:=0;
	carga(servicio, diml);
	variado(servicio, diml, vc);
	// for i:=1 to diml do begin
	// 	writeln('AAA ',servicio[i].distancia:4:2);
	// end;
	readln();
	end.