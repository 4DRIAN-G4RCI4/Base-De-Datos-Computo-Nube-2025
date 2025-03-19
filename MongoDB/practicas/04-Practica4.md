# Arrays y documentos anidados

1. Para hacer esta práctica vamos a cargar unos datos ficticios de empresas.
2. Tienes un fichero denominado “personas.json”
3. Debes poner el resultado de las consultas en cada apartado

# **Consultas en MongoDB - Arrays y Documentos Anidados**

## **1. Buscar las personas que vivan en Colombia**
````json
db.personas.find({"direccion.pais": "Colombia"})
````
**Resultado:**  
````json
[
  {
    "nombre": "Anni Niño",
    "direccion": {
      "calle": "207 Taylor Cliffs",
      "ciudad": "Buenaventura",
      "pais": "Colombia"
    },
    "colores": ["yellow", "salmon", "yellow"],
    "ingresos": 7387
  }
]
````

## **2. Personas a las que les guste el color rosa (pink)**
````json
db.personas.find({colores: "pink"})
````
**Resultado:**  
````json
[
  {
    "nombre": "Laura Oquendo",
    "direccion": {
      "calle": "2800 Samir Trail",
      "ciudad": "Bijelo Polje",
      "pais": "Montenegro"
    },
    "colores": ["pink", "blue", "teal"],
    "ingresos": 8707
  },
  {
    "nombre": "Lorena Saiz",
    "direccion": {
      "calle": "1611 Oscar Walk",
      "ciudad": "The Pas",
      "pais": "Canada"
    },
    "colores": ["orchid", "teal", "pink"],
    "ingresos": 10407
  }
]
````

## **3. Personas cuyo tercer color preferido sea el amarillo (yellow)**
````json
db.personas.find({"colores.2": "yellow"})
````
**Resultado:**  
````json
[
  {
    "nombre": "Andrea Paredes",
    "direccion": {
      "calle": "09438 Vandervort Drives",
      "ciudad": "San Antonio",
      "pais": "Puerto Rico"
    },
    "colores": ["green", "indigo", "yellow", "salmon", "grey", "violet"],
    "ingresos": 6340
  },
  {
    "nombre": "Ricardo Avilés",
    "direccion": {
      "calle": "29229 Roob Points",
      "ciudad": "Macau",
      "pais": "Macao"
    },
    "colores": ["yellow", "yellow", "fuchsia", "salmon", "blue", "yellow"],
    "ingresos": 7178
  },
  {
    "nombre": "Anni Niño",
    "direccion": {
      "calle": "207 Taylor Cliffs",
      "ciudad": "Buenaventura",
      "pais": "Colombia"
    },
    "colores": ["yellow", "salmon", "yellow"],
    "ingresos": 7387
  }
]
````

## **4. Personas cuyo tercer color preferido sea el amarillo (yellow) y que vivan en Mauritania**
````json
db.personas.find({
    "colores.2": "yellow",
    "direccion.pais": "Mauritania"
})
````
**Resultado:**  
````json
[
  {
    "nombre": "Laura Salcedo",
    "direccion": {
      "calle": "11046 Cayla Centers",
      "ciudad": "Rosso",
      "pais": "Mauritania"
    },
    "colores": ["indigo", "green", "yellow", "salmon"],
    "ingresos": 7435
  }
]
````

## **5. Usando el operador `$all`, averiguar las personas que les gusta el plata (silver) y el salmón (salmon)**
````json
db.personas.find({colores: {$all: ["silver", "salmon"]}})
````
**Resultado:**  
````json
[
  {
    "nombre": "Ángel Anguiano",
    "direccion": {
      "calle": "20780 McLaughlin Union",
      "ciudad": "Paramaribo",
      "pais": "Suriname"
    },
    "colores": ["plum", "silver", "olive", "salmon", "silver"],
    "ingresos": 5712
  }
]
````

## **6. Con el operador `$elemMatch`, averiguar las personas que les guste el rosa (pink) o el rojo (red)**
````json
db.personas.find({
    colores: {$elemMatch: {$in: ["pink", "red"]}}
})
````
**Resultado:**  
````json
[
  {
    "nombre": "Laura Oquendo",
    "direccion": {
      "calle": "2800 Samir Trail",
      "ciudad": "Bijelo Polje",
      "pais": "Montenegro"
    },
    "colores": ["pink", "blue", "teal"],
    "ingresos": 8707
  },
  {
    "nombre": "Sergi Cordero",
    "direccion": {
      "calle": "0605 Delfina Lodge",
      "ciudad": "Obiozara",
      "pais": "Nigeria"
    },
    "colores": ["indigo", "sky blue", "red"],
    "ingresos": 7134
  }
]
`
