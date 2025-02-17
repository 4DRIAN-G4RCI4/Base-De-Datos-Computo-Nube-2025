# Practica 1: Base de Datos, colecciones e inserts


1. Conectarnos con mongosh a mongo db
1. crear base de datos llamada Curso
1. comprobar que la base de datos no existe
1. crear una coleccion llamada facturas y mostrarla
``` json

db.createCollection('Facturas')
```
5. Insertar un Documento con los siguientes elementos 




``` json 

db.Facturas.insertOne(
 {
    cod_factura:10,
    cliente :"Frutos Ramirez",
    total:223
           
 }
 )
 ```

  | Codigo   | Valor   |
|-------------|-------------|
| Cod_Factura | 20 |
| Ciente | Ferreteria Juan |
| Total | 140 |


``` json 

db.Facturas.insertOne(
 {
    cod_factura:20,
    cliente :"Ferreteria Juan",
    total:140
           
 }
 )
 ```
 6. Crear una Nueva coleccion pero usando directamente el insert one
insertar un documento en la coleccion productos con los siguientes datos:


  | Codigo   | Valor   |
|-------------|-------------|
| Cod_producto | 1 |
| Nombre | Tornillo x 1"|
| precio | 2 |

``` json 

db.productos.find(
 {
    cod_producto:1,
    Nombre :'Tornillo x 1"',
    precio:2 ,
    unidades:1500
           
 }
 )
 ```
 7. Crear Un nuevo documento de productos que contengan un array con lo ssiguientes datos 

   | Codigo   | Valor   |
|-------------|-------------|
| Cod_producto | 2 |
| Nombre | Martillo|
| precio | 20 |
| Unidades | 50 |
| Fabricantes | fab1,fab2,fab3,fab4|

```   
db.productos.insertOne(
 {
    cod_producto:2,
    Nombre :'Martillo',
    precio:20,
    unidades:50,
    Fabricantes:[
        "fab1","fab2","fab3","fab4"
        ]
           
 }
 )
 
 ```
 8. borrar la coleccion facturas y comprobar que se borro 

 ````
 db.Facturas.drop()
 ````
9. insertar un documento en una conexion denominada  "fabricantes"


| Codigo   | Valor   |
|-------------|-------------|
| id | 1 |
| nombre | fab1|
| Localidad | ciudad : buenos aires, pais: argentina, Calle: Calle Pez 27, cod_postal:2900 |


````
db.fabricantes.insertOne(
 {
    _id : 1,
    nombre: "fab1",
    localidad: {

        ciudad:"Buenos Aires",
        pais: "Argentina",
        calle: "Calle Pez 27",
        cod_postal:2900
    }        
 }
 )

 ````



 