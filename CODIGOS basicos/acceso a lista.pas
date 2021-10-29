 {
 read(monto)
 while(dimL<dimF) and (monto <>-1)
    dimL:=diml+1;
    vectorMontos[dimL]:=monto
    read(monto)
 end;
   }




 ///CASOS RAROS DE ACCESOS A ESTRUCTURAS

   alumno=record
     nombre:string[10]

  lista^=nodo
  nodo = record
     dato: alumno
     sig

  vector_numeros = array[1..10] of lista;


  v[1]^.dato.nombre:='juanito';



  dir = record
    localidad: stirng[20];
    numeroLaCsa:vector_alumnos;
  end;

  persona = record
    direccion: dir;
  end;

  lista de personas


  p:persona


  p.direccion.localidad:='city bell';
  l^.dato.direccion.numeroLaCsa[1]:=190;

  lp^.dato.direccion.numeroLaCsa[1]^.dato.nombre:='pedrito';

  //---------------------------------------------------------------

   lista_montos=^nodo1;
   nodo1 = record
    dato: integer;
    sig: lista_montos;
   end;

   obra = record
    nombre_obra:String[20];
    montos: lista_montos;
   end;
 
   vector_obras = array [1..100] of obra;

   persona=record
    nombre:string[20];
    obrasSociales: vector_obras;
   end;

   lista=^nodo;
   nodo = record
    dato:persona
    sig:lista;
   end;

 var
    l: lista;

 //si quiero imprimir un monto de una obra social teniendo la lista de personas por ejemplo:


  writeln(l^.dato.obrasSociales[1].montos^.dato)

  //si le quiero cambiar el nombre a la obra social
  l^.dato.obrasSociales[8].nombre_obra:='un nombre';