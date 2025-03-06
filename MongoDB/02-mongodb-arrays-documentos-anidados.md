## Busquedas en Arrays y Documentos Anidados

## Buscar dentro de un documento anidado
 json
db.Ciudades.find({
    alcalde: {
        nombre:"Crystal",
        apellidos:"Long",
        edad:76}})

db.ciudades.find({"alcalde.nombre":"Crystal"})

1. Seleccionar la ciudades donde los alcaldes tengan mas de 70 años
 json
db.Ciudades.find( { "alcalde.edad":{$gt:70} )
 
2. Realizar la consulta anterior 

db.Ciudades.find( { "alcalde.edad":{$gt:70}},{_id:0,nombre:1, "alcalde.edad":1 })

3. Seleccionar las ciudades donde el alcalde tenga 76 años o 41
 json
 db.ciudades.find( 
 { $or:
    [
        {"alcalde.edad":76},
        {"alcalde.edad":41}
    ]
 }
 )
 

## Consultas con Arrays

1. Crear una colección cazas

2. Cargar los documentos de la coleccion cazas, de la data cazas 

## Ejemplo con consulta con Arrays

1. Buscar losn documentos que tengan usa como paises 
 json
 db.Cazas.find({paises:"usa"})

  

 2. Buscar los documentos donde cualquier elemento del array dimensiones sea mayor a 5
 json
db.Cazas.find({dimensiones:{$gt:5}})

3. Buscar los documentos donde las dimensiones del avión por ancho qu e es la posicion 1, sea superior a 14

 json
db.Cazas.find({
    "dimensiones.1":{$gt:14}
},{_id:0,modelo:1, dimensiones:1}
)
 
### Arrays. Operador $all

1. Buscar los aviones que estan sirviendo en egipto y en israel 
JSON 
db1> db.Cazas.find({ paises:{$all:['egipto','israel',]}},{_id:0, modelo:1, paises:1})

 

2. Seleccionar los casas que sirven en inglaterra y españa
JSON 
db.Cazas.find( { $and:[ {paises: 'inglaterra'}, {paises: 'españa'}]})

db.Cazas.find(
    {
        paises:{all:['inglaterra', 'españa']}
    }
)

### Arrays Operador $elementMatch -> Permite hacer busquedas dentro de arrays, este busca la lista de condiciones que estan dentro del operador

1. Buscar que aviones tienen uso dentro de inglaterra 
JSON 
db.Cazas.find({dimensiones:{$elemMatch:{$lt:20, $gt:15}}})
 

2. Buscar los aviones donde las dimensiones sean menores a 20 o mayores a 15
````
db.Cazas.find({dimensiones:{$elemMatch:{$eq: }}})
````
### Buscar en arrays de documentos anidados

1. Utilizar las coleccion ciudades


2. Buscar los consejeros de nombre jeri Flower de edad 78

````json
db.ciudades.find({
  consejeros:{identificador:1, nombre:'Jeri Flowers', edad:78}
})
````


3. Buscar en Consejeros donde tengan una edad mayores a 70
`````json
db.ciudades.find({"consejeros.edad":{$gt:70}})
````

4.Buscar en Consejeros en la posicion 2 que existen entre 70 y 80 años 
`````json
db.ciudades.find({
    'consejeros.2.edad':{
        $gt: 70  , $lt; 80 }},
        {_id:80,"consejeros.nombre":1,"consejeros.edad":1

})
`````

5. Buscar los consejoros de la posicion 0 que sean mayores a 70 

````json
db.ciudades.find({
    "consejeros.0.edad":{$gt:70}
},{_id:0,"consejeros.nombre":1, "consejeros.edad":1})
````

6. Buscar los consejeros que sean mayores a 70 
````json
db.ciudades.find({"consejeros.edad":{$gt:70}})`
````
