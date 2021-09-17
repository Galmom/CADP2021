{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar proyectos 
de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se han 
determinado los siguientes criterios:
-sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la 
superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar 
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los nuevos 
criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y 
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no 
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el costo 
total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello, utilice 
el módulo realizado en b.
}
program ejer;
type

//a----------------------------------------------------------------------------------------
function cumple_regla(costo_mm, costo_construc:real; rango_espectro:integer):boolean;
	var
	begin
		if (costo_mm < costo_construc) and (rango_espectro <> 1) do
			cumple_regla:=true
		else
			cumple_regla:=false;	
	end;
 //pp
	var
		m:lista;
	begin
		if (cumple_regla(m^.dato.costo_mante_mensual, m^.dato.costo_construc, m^.dato.rango_espectro)) then
			writeln('La sonda ', m^.dato.nombre,' cumple los nuevos criterios H2020')
		else
			writeln('La sonda ', m^.dato.nombre,' NO cumple los nuevos criterios H2020');
	end.
//b--------------------------------------------------------------------------------------------	

function cumple_regla(costo_mm, costo_construc:real; rango_espectro:integer):boolean;
	var
	begin
		cumple_regla:= (costo_mm < costo_construc) and (rango_espectro <> 1);	
	end;
 //pp
	var
		m, lista_cumple, lista_NOcumple:lista;

	begin
		m:=nil;
		lista_cumple:=nil;
		lista_NOcumple:=nil;
		while (m <> nil)  do begin
			if (cumple_regla(m^.dato.costo_mante_mensual, m^.dato.costo_construc, m^.dato.rango_espectro)) then begin
				writeln('La sonda ', m^.dato.nombre,' cumple los nuevos criterios H2020');
				lista_cumple:=m^.dato;
			end	
			else begin
				writeln('La sonda ', m^.dato.nombre,' NO cumple los nuevos criterios H2020');
				lista_NOcumple:=m^.dato;
			end;
		end;
	end.
//c--------------------------------------------------------------------------------------------

procedure no_finaciados(lista_NOcumple:lista);
	var
		cant_nofinanciado:integer;
		costo_total:real;
	begin
		costo_total:=0;
		cant_nofinanciado:=0;
		while (lista_NOcumple <> nil) do begin
			cant_nofinanciado:=cant_nofinanciado+1;
			costo_total:=costo_total+lista_NOcumple^.datos.costo_costruccion+lista_NOcumple^.datos.costo_mantenimiento;
		end;
		writeln('el informe de  la cantidad es, ', cant_nofinanciado);
		writeln('el costo total (construcción y mantenimiento) ',costo_total:4:2);
	end;
