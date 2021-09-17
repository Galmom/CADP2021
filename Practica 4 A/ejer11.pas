{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}
program ejer;
const
	max200=3;
type
	string20=string[20];
	rango=1..max200;

	foto=record
		titulo_foto:string20;
		autor_foto:string20;
		cant_gusta:integer;
		cant_clics:integer;
		cant_comentarios:integer;
	end;

	vector_face=array[rango] of foto;

	procedure foto_registro(var f:foto);
		begin
			write('Ingrese titulo de la foto, el autor de la foto, cantidad de Me gusta, ');
			writeln('cantidad de clics y cantidad de comentarios de usuarios.');
			readln(f.titulo_foto);
			readln(f.autor_foto);
			readln(f.cant_gusta);
			readln(f.cant_clics);
			readln(f.cant_comentarios);
		end;

	procedure carga(var p:vector_face);
		var
			i:integer;
		begin
			i:=0;
			for i:=1 to max200 do begin
				foto_registro(p[i]);
			end;
		end;

	procedure foto_mas_vista(p:vector_face; var nombre_foto:string);
		var
			i, max:integer;
		begin
			max:=-1;
			for i:=1 to max200 do begin
				if (p[i].cant_clics > max) then begin
					max:=p[i].cant_clics;
					nombre_foto:=p[i].titulo_foto;
				end;	
			end;
		end;

	procedure me_gusta(p:vector_face);
		var
			i, max:integer;
		begin
			max:=0;
			i:=0;
			for i:=1 to max200 do begin
				if (p[i].autor_foto = 'pepe') then  //va Art Vandelay
					max:=max+p[i].cant_gusta;
			end;
			writeln('La cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotografo “Art Vandelay”.', max);
		end;

	procedure comentarios(p:vector_face);
		var
			i:integer;
		begin
			i:=0;
			for i:=1 to max200 do begin
				writeln('La Cantidad de comentarios recibidos para la foto ',p[i].titulo_foto, ' publicada en esa pagina es ',p[i].cant_comentarios);
			end;
		end;

	// procedure imprimir(a:vector_face);
	// 	var
	// 		i:integer;
	// 	begin
	// 		for i:=1 to max200 do begin
	// 			writeln('salario ',i,' ',a[i].titulo_foto);
	// 		end;
	// 	end;	
var
	publicacion:vector_face;
	nombre_foto:string20;
begin
	carga(publicacion);
	foto_mas_vista(publicacion, nombre_foto);
	me_gusta(publicacion);
	comentarios(publicacion);
	writeln('El Titulo de la foto mas vista es ', nombre_foto);
	// imprimir(publicacion);
	readln();
	end.