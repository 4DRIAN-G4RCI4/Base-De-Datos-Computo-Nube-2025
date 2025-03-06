# Practica 3. Updates y Deletes 

1. Cambiar El Salario del empleado Imogene Nolan y se le asigna 8000

````json
db.empleados.updateOne(
  { nombre: "Imogene", apellidos: "Nolan" },
  { $set: { salario: 8000 } }
)

```` 

2. Cambiar "Belgium" por "Belgica" en los Empleados (Debe de actualizar a dos)

````json
db.empleados.updateMany(
  { pais: "Belgium" },
  { $set: { pais: "Belgica" } }
)

```` 

3. Incrementar el salario de todos los empleados de google en 1000 

````json
db.empleados.updateMany(
  { empresa: "Google" },
  { $inc: { salario: 1000 } }
)

```` 

4. Remplazar el empleado Omar Gentry por el siguiente documento:
````json
{
"nombre": "Omar",
"apellidos": "Gentry",
"correo": "sin correo",
"direccion": "Sin calle",
"region": "Sin region",
"pais": "Sin pais",
"empresa": "Sin empresa",
"ventas": 0,
"salario": 0,
"departamentos": "Este empleado ha sido anulado"
}
````

RESULTADO :
````json

db.empleados.replaceOne(
  { nombre: "Omar", apellidos: "Gentry" },
  {
    "nombre": "Omar",
    "apellidos": "Gentry",
    "correo": "sin correo",
    "direccion": "Sin calle",
    "region": "Sin region",
    "pais": "Sin pais",
    "empresa": "Sin empresa",
    "ventas": 0,
    "salario": 0,
    "departamentos": "Este empleado ha sido anulado"
  }
)
```` 

5. Con un find comprobar que el empleado ha sido modificado 
````json
db.empleados.find({ nombre: "Omar", apellidos: "Gentry" })
```` 

6. Borrar todos los empleados que ganen mas de 8500
nota: deben de ser borrados 3 documentos 
````json
db.empleados.deleteMany({ salario: { $gt: 8500 } })
```` 

7. Visualiar con una expresion regular todos los apellidos que comienzen con "R"
````json
db.empleados.find({ apellidos: /^R/ })
```` 

8. Buscar todas las regines que contengan un "V"
(hacerlo con el operador "regex" y que no distinga mayusculas y minusculas) 
.deben de salir 2
````json
db.empleados.find({ region: { $regex: "v", $options: "i" } })
```` 

9. Visualizar los apellidos de los empleados ordenados por el propio apellido 
````json
db.empleados.find({}, { apellidos: 1, _id: 0 }).sort({ apellidos: 1 })
```` 

10. Indicar el numero de empleados que trabajan  en google
````json
db.empleados.countDocuments({ empresa: "Google" })
````

11. Borrar la colleccion empleados y la base de datos 
````json
db.empleados.drop()
db.dropDatabase()
````