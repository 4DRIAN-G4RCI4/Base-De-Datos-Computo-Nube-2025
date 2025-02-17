# Crud y Consultas En Mongo DB

## crear una base de datos
solo se crea si contiene por lo menos una colleccion

**use bd1**
## como crear una colleccion
**db.createColleccion("empleados")**
## mostras colecciones
**show colletions**

## insertar un documento
```json

 db.alumnos.insertOne(
 {
 nombre: 'Huitzilopoztli',
 apellido1: 'Vaca',
 edad: 32,
 ciudad: 'San Miguel De Las Piedras'
 }
 )
 ```
## consultar tabla 
db.alumnos.find({})
 ## Incercion de documentos  mas complejos con arrays
```json
 db.alumnos.insertOne(
 {
 nombre:"Joaquin",
 apellido:"Dorian",
 apellido2:"Guerrero",
 edad:15,
 aficiones:[
            'Cerveza','Hueva',"Canabis"
           ]
 }
 )

```
## Incercion de documentos  mas complejos con documentos anidados y ID

```json
{
  nombre: 'Alfredo',
  apellido: 'Adame',
  apellido2: 'Gallardo',
  edad: 39,
  aficiones: [ 'Futbol', 'Juegos', 'tomar' ],
  experiencia: { lenguaje: 'SQL', sbd: 'SQL Server', aniosExp: 14 }
}
```

```json
 db.alumnos.insertOne(
 {
    _id:3,
 nombre:"Sergio",
 apellido:"Ramos",
 equipo:"Monterrey",
 aficiones:[
            'Dinero','Hombres',"Fiesta"
           ]
           talentos:{Futbol:true
           bañarse:false}
           
 }
 )
 ```
```json

 db.alumnos.insertMany([
  {
    _id: 12,
    nombre: "Roberto Gomez",
    apellido: "Gomez",
    edad: "23",
    descripcion: "Es un Comediante bueno"
  },
  {
    nombre: "Luiz",
    apellido: "Suarez",
    edad: 43,
    habilidades: ["Correr", "dormir", "Morder"],
    direcciones: {
      calle: "del infierno",
      numero: 666
    },
    esposas: [
      {
        nombre: "Marisol",
        edad: 20,
        pension: 350,
        hijos: ["Joaquin", "Bridget"]
      },
      {
        nombre: "Dorien",
        edad: 46,
        pension: 6500.56,
        complaciente: true
      }
    ]
  }
])
```

# practica

1. bases de datos, collecciones e inserts
.nos conectamos con msh al mongo db
.crear base de datos denominada curso 

```
use curso
```
.verificar que la base de datos no existe 
```
show dbs
```
.crear una conexion denominada facturas con el comando 
```
createColleccion

```
y comprobar que aparece tanto la coleccion como la base de datos 


# Practica1

# Cargar Datos
[Libros.json](./data/libros.json)

## Busquedas. Condiciones de igualdad. Metodo find()
1. Selecionar todos los documentos de la coleccion libros

 json
db.libros.find({})


2. Mostrar todos los documentos que sean de la editorial biblio
 json
db.libros.find({editorial:'Biblio'})

3. Mostrar todos los documentos que le precio sea 25
json
db.libros.find({precio:25})

4. Seleccionar todos los documentos donde titulos sea 'JSON para todos' 
json
db.libros.find({titulo:'JSON para todos'})

## Operadoderes de comparacion 
![Operadores de Comperacion](./img/Operadores%20relacionales.png)

1. Mostrar todos los documentos donde el precio sea mayor a 25
json
db.libros.find({precio:{$gte:25}})

2. Mostrar los documentos donde el precio sea 25
json
db.libros.find({precio:{$gte $eq 25}})


3. Mostrar los documentos cuya cantidad sea menor a 5
json
db.libros.find({precio:{$lt: 5}})


4. Mostrar los documentos que pertenezcan a la editorial Biblio o planeta
json
db.libros.find({editorial:{$in: ['Biblio','Planeta']}})

5. Mostrar todos los libros que cuestente 20 o 25
json 
db.libros.find({precio:{$in:[20,25]}})


6. Mostrar todos los documentos de libros que no cuesten 20 o 25
json
 db.libros.find({precio:{$nin:[20,25]}})

7. Mostrar el primero documentos de libros que cueste 20 0 25
json
db.libros.findOne({precio:{$in:[20,25]}})

## Operadores logicos
![Operadores logicos](./img/Operadores%20Logicos.png)

## Operador AND
Dos posibles opciones de AND
1. La simple, mediante condiciones sepaeradas por comas

**sintaxis**

db.coleccion.find({condicion1,condicion2}) -> con est asume que es una *and*

2. Usando el operador $and

**Sintaxis**
json
db.coleccion.find({$and:[{condicion1},{condicion2}]})

### Ejercicios 
1. Mostrar todoos aquellos libros que cuesten mas de 25 y cuya cantidad sea inferiror a 15
json
db.libros.find({ precio: { $gte: 25}, cantidad: {$lt: 15} } )


**Forma simple**
json
db.libros.find({ $and:[ {precio: { $gte: 25}}, {cantidad: {$lt: 15}}] } )

2. Mostar todos aquelllos libros que cuesten mas de 25 y cuya cantidad sea inferior a 15 y id igual a 14
json
db.libros.find({ precio: { $gte: 25}, cantidad: {$lt: 15}, _id:4 } )

### Operador OR 
#### Mostrar todos aquellos libros que cuesten mas de 25 o cuya cantidad sea inferior a 15

json
db.libros.find({$or:[{precio:{$gte:25}},{cantidad:{$lt:15}}]})



### AND y OR combinadas

1. Mostar los libros de la editorial BIblio o recio mayor a 40 o Libros de la editorial planeta
con precio mayor a 30 

json
db.libros.find({
    $or:[
        {$and:[{editorial:'Biblio'},{precio:{$gt:30}}]},
        {$and:[{editorial:{$eq:'Planeta'}},{precio:{$gt:20}}]}
    ]
})

##### De la otra forma 
json
db.libros.find({
    $or:[
        {editorial:'Biblio'},{precio:{$gt:30}},
        {editorial:{$eq:'Planeta'}},{precio:{$gt:20}}
    ]
})


## Proyeccion de columnas

*** Sintaxis  ***
db.coleccion.find(filtro,columnas)

db.libros.find({},{titulo:1})

1. Seleccionar todos los documentos, mostrando el titulo y la editorial

json
db.libros.find({},{titulo:1,editorial:1})
db.libros.find({},{titulo:1,editorial:1,_id:0})


2. Seleccionar todos los documentos de la editorial Planeta, 
mostrando solamente el titu;o y la editorial

json
db.libros.find({editorial:'Planeta'},{_id:0,titulo:1,editorial:1})

## Operador exists(permiten saber si un campo se encuentra o no en un documento)


Sirve para saber si una consulta regresa un registro o no 
````
db.libros.find({ editorial:{$exist:true} } )
````
````
db.libros.InsertOne(
  {
    _id:10,
    titulo:'Mongo en entornos Graficos',
    editorial:'Terra',
    precio:125
  }
)
````
## Operador Type (Permite preguntar si un determinado capo corresponde con un tipo)

https://www.mongodb.com/docs/manual/reference/operator/query/type/#mongodb-query-op.-type

1.Mostrar tidis  los documentos donde el precio sea dooble

db.libros.find({precio:{$type:1}})

//solo apareceran de tipo double 


db.libros.find({precio:{$type:16}})

db.libros.isertOne({
  _id:11,
  titulo:'IA',
  editorial:'Terra',
  precio:125.4,
  cantidad:20
})

db.libros.find({precio:{$type:1}}, {_id:0, cantidad:0})



1.Seleccionar los documentos donde la editorial sea de typo string sea de tipo entero 
db.libros.find({editorial:{type:16}})

2.seleccionar todos los documentos donde la editorial sea String

db.libros.find({editorial:{$type:'string'}})
db.libros.find({editorial:{$type:2}})


## Practica de consultas

1.Instalar las tools de mongoDb
[DatabaseTools](https://www.mongodb.com/try/download/database-tools)

2.Cargar el json empleados (debemos estar ubicados en la carpeta donde se encuentra el json empleados)

-En Local :
Comando:
mongoimport --db curso1 --Collections empleados --file empleados.json