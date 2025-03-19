# Agregaciones

1. Para hacer esta práctica vamos a cargar unos datos ficticios de empresas.
2. Tienes un fichero denominado “productos.json”
3. Debes poner el resultado de las consultas en cada apartado





# Consultas

 Contar los productos de tipo "medio" (usando un método básico):
````json

db.productos.countDocuments({ tipo: "medio" })

resultado:

25

````


2. Indicar con un distinct las empresas (fabricantes) que hay en la colección:

````json
db.productos.distinct("fabricante")

````
resultado

````json
PractiPracticas> db.productos.distinct("fabricante")
[
  'A.O. Smith',
  'Alere',
  'American Tire Distributors Holdings',
  'Anthem',
  'Archrock',
  'Ascena Retail Group',
  'AutoNation',
  'Best Buy',
  'CIT Group',
  'Cabot',
  'Comcast',
  'Comerica',
  'Core-Mark Holding',
  'DST Systems',
  'Darling Ingredients',
  'Delta Air Lines',
  'Delta Tucker Holdings',
  "Dick's Sporting Goods",
  'First Solar',
  'HCA Holdings',
  'Hanesbrands',
  'Hartford Financial Services Group',
  'Hawaiian Holdings',
  'HealthSouth',
  'Hyatt Hotels',
  'Kar Auction Services',
  'Kelly Services',
  'Kemper',
  'Kimberly-Clark',
  'Lennar',
  'Mercury General',
  'Mondelez International',
  'Motorola Solutions',
  'Nasdaq OMX Group',
  'National Oilwell Varco',
  'Nordstrom',
  'OneMain Holdings',
  'Oneok',
  'Orbital ATK',
  'Pep Boys-Mann',
  'Pool',
  'Precision Castparts',
  'Primoris Services',
  'Raymond James Financial',
  'Seaboard',
  'Securian Financial Group',
  'Simon Property Group',
  'State Farm Insurance Cos.',
  'State Street Corp.',
  'SunPower',
  'TEGNA',
  'Telephone & Data Systems',
  'Total System Services',
  'Tractor Supply',
  'TransDigm Group',
  'Trinity Industries',
  'TrueBlue',
  'Universal American',
  'Universal Health Services',
  'WGL Holdings',
  "Wendy's",
  'Werner Enterprises',
  'WestRock',
  'Williams-Sonoma'
]

````

3. Usando aggregate, visualizar los productos que tengan más de 80 unidades:

````json

db.productos.aggregate([
  {
    $match: { unidades: { $gt: 80 } }
  }
])
````
resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $match: { unidades: { $gt: 80 } }
...   }
... ])
[
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce2'),
    codigo: 0,
    nombre: 'Fantastic Wooden Fish',
    unidades: 95,
    precio: 291,
    fabricante: 'Kimberly-Clark',
    tipo: 'avanzado'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce4'),
    codigo: 2,
    nombre: 'Small Soft Fish',
    unidades: 96,
    precio: 189,
    fabricante: 'Primoris Services',
    tipo: 'medio'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cee'),
    codigo: 12,
    nombre: 'Refined Concrete Salad',
    unidades: 90,
    precio: 129,
    fabricante: 'Universal Health Services',
    tipo: 'avanzado'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0d00'),
    codigo: 30,
    nombre: 'Small Rubber Pants',
    unidades: 89,
    precio: 16,
    fabricante: 'Hanesbrands',
    tipo: 'basico'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0d03'),
    codigo: 33,
    nombre: 'Generic Concrete Hat',
    unidades: 82,
    precio: 70,
    fabricante: 'American Tire Distributors Holdings',
    tipo: 'basico'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0d17'),
    codigo: 53,
    nombre: 'Licensed Plastic Hat',
    unidades: 96,
    precio: 38,
    fabricante: 'Best Buy',
    tipo: 'medio'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0d18'),
    codigo: 54,
    nombre: 'Generic Metal Sausages',
    unidades: 84,
    precio: 77,
    fabricante: 'DST Systems',
    tipo: 'medio'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0d1f'),
    codigo: 61,
    nombre: 'Sleek Rubber Keyboard',
    unidades: 82,
    precio: 33,
    fabricante: 'Alere',
    tipo: 'basico'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0d24'),
    codigo: 66,
    nombre: 'Incredible Concrete Fish',
    unidades: 96,
    precio: 336,
    fabricante: 'Darling Ingredients',
    tipo: 'medio'
  }
]


````

4. Con $project, visualizar solo el nombre, unidades y precio de los productos que tengan menos de 10 unidades:

````json

db.productos.aggregate([
  {
    $match: { unidades: { $lt: 10 } }
  },
  {
    $project: { _id: 0, nombre: 1, unidades: 1, precio: 1 }
  }
])
````
resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $match: { unidades: { $lt: 10 } }
...   },
...   {
...     $project: { _id: 0, nombre: 1, unidades: 1, precio: 1 }
...   }
... ])
[
  { nombre: 'Ergonomic Metal Ball', unidades: 5, precio: 246 },
  { nombre: 'Handmade Plastic Hat', unidades: 7, precio: 253 },
  { nombre: 'Ergonomic Metal Table', unidades: 0, precio: 94 },
  { nombre: 'Practical Frozen Chips', unidades: 0, precio: 305 },
  { nombre: 'Fantastic Metal Pants', unidades: 5, precio: 129 },
  { nombre: 'Intelligent Frozen Sausages', unidades: 3, precio: 111 },
  { nombre: 'Rustic Plastic Mouse', unidades: 5, precio: 24 }
]


````


5. Con $project, poner el fabricante pero cambiar el nombre a "empresa". Usar el mismo comando anterior:


````json

db.productos.aggregate([
  {
    $match: { unidades: { $lt: 10 } }
  },
  {
    $project: {
      _id: 0,
      nombre: 1,
      unidades: 1,
      precio: 1,
      empresa: "$fabricante"
    }
  }
])

````

resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $match: { unidades: { $lt: 10 } }
...   },
...   {
...     $project: {
...       _id: 0,
...       nombre: 1,
...       unidades: 1,
...       precio: 1,
...       empresa: "$fabricante"
...     }
...   }
... ])

[
  {
    nombre: 'Ergonomic Metal Ball',
    unidades: 5,
    precio: 246,
    empresa: 'Seaboard'
  },
  {
    nombre: 'Handmade Plastic Hat',
    unidades: 7,
    precio: 253,
    empresa: "Dick's Sporting Goods"
  },
  {
    nombre: 'Ergonomic Metal Table',
    unidades: 0,
    precio: 94,
    empresa: 'Kelly Services'
  },
  {
    nombre: 'Practical Frozen Chips',
    unidades: 0,
    precio: 305,
    empresa: 'Delta Air Lines'
  },
  {
    nombre: 'Fantastic Metal Pants',
    unidades: 5,
    precio: 129,
    empresa: 'OneMain Holdings'
  },
  {
    nombre: 'Intelligent Frozen Sausages',
    unidades: 3,
    precio: 111,
    empresa: 'A.O. Smith'
  },
  {
    nombre: 'Rustic Plastic Mouse',
    unidades: 5,
    precio: 24,
    empresa: 'Orbital ATK'
  }
]


````

6. Añadir un campo calculado llamado total que multiplica precio por unidades:

````json

db.productos.aggregate([
  {
    $match: { unidades: { $lt: 10 } }
  },
  {
    $project: {
      _id: 0,
      nombre: 1,
      unidades: 1,
      precio: 1,
      empresa: "$fabricante",
      total: { $multiply: ["$precio", "$unidades"] }
    }
  }
])

````

resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $match: { unidades: { $lt: 10 } }
...   },
...   {
...     $project: {
...       _id: 0,
...       nombre: 1,
...       unidades: 1,
...       precio: 1,
...       empresa: "$fabricante",
...       total: { $multiply: ["$precio", "$unidades"] }
...     }
...   }
... ])
[
  {
    nombre: 'Ergonomic Metal Ball',
    unidades: 5,
    precio: 246,
    empresa: 'Seaboard',
    total: 1230
  },
  {
    nombre: 'Handmade Plastic Hat',
    unidades: 7,
    precio: 253,
    empresa: "Dick's Sporting Goods",
    total: 1771
  },
  {
    nombre: 'Ergonomic Metal Table',
    unidades: 0,
    precio: 94,
    empresa: 'Kelly Services',
    total: 0
  },
  {
    nombre: 'Practical Frozen Chips',
    unidades: 0,
    precio: 305,
    empresa: 'Delta Air Lines',
    total: 0
  },
  {
    nombre: 'Fantastic Metal Pants',
    unidades: 5,
    precio: 129,
    empresa: 'OneMain Holdings',
    total: 645
  },
  {
    nombre: 'Intelligent Frozen Sausages',
    unidades: 3,
    precio: 111,
    empresa: 'A.O. Smith',
    total: 333
  },
  {
    nombre: 'Rustic Plastic Mouse',
    unidades: 5,
    precio: 24,
    empresa: 'Orbital ATK',
    total: 120
  }
]



````


7. Hacer que el nombre salga en mayúsculas con el operador $toUpper:

````json

db.productos.aggregate([
  {
    $match: { unidades: { $lt: 10 } }
  },
  {
    $project: {
      _id: 0,
      nombre: { $toUpper: "$nombre" },
      unidades: 1,
      precio: 1,
      empresa: "$fabricante",
      total: { $multiply: ["$precio", "$unidades"] }
    }
  }
])
````

resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $match: { unidades: { $lt: 10 } }
...   },
...   {
...     $project: {
...       _id: 0,
...       nombre: { $toUpper: "$nombre" },
...       unidades: 1,
...       precio: 1,
...       empresa: "$fabricante",
...       total: { $multiply: ["$precio", "$unidades"] }
...     }
...   }
... ])
[
  {
    unidades: 5,
    precio: 246,
    nombre: 'ERGONOMIC METAL BALL',
    empresa: 'Seaboard',
    total: 1230
  },
  {
    unidades: 7,
    precio: 253,
    nombre: 'HANDMADE PLASTIC HAT',
    empresa: "Dick's Sporting Goods",
    total: 1771
  },
  {
    unidades: 0,
    precio: 94,
    nombre: 'ERGONOMIC METAL TABLE',
    empresa: 'Kelly Services',
    total: 0
  },
  {
    unidades: 0,
    precio: 305,
    nombre: 'PRACTICAL FROZEN CHIPS',
    empresa: 'Delta Air Lines',
    total: 0
  },
  {
    unidades: 5,
    precio: 129,
    nombre: 'FANTASTIC METAL PANTS',
    empresa: 'OneMain Holdings',
    total: 645
  },
  {
    unidades: 3,
    precio: 111,
    nombre: 'INTELLIGENT FROZEN SAUSAGES',
    empresa: 'A.O. Smith',
    total: 333
  },
  {
    unidades: 5,
    precio: 24,
    nombre: 'RUSTIC PLASTIC MOUSE',
    empresa: 'Orbital ATK',
    total: 120
  }
]



````

8. Añadir un campo calculado que ponga el nombre del producto y el tipo concatenado con el operador $concat, y llamarlo "completo":


````json

db.productos.aggregate([
  {
    $match: { unidades: { $lt: 10 } }
  },
  {
    $project: {
      _id: 0,
      nombre: { $toUpper: "$nombre" },
      unidades: 1,
      precio: 1,
      empresa: "$fabricante",
      total: { $multiply: ["$precio", "$unidades"] },
      completo: { $concat: ["$nombre", " - ", "$tipo"] }
    }
  }
])

````

resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $match: { unidades: { $lt: 10 } }
...   },
...   {
...     $project: {
...       _id: 0,
...       nombre: { $toUpper: "$nombre" },
...       unidades: 1,
...       precio: 1,
...       empresa: "$fabricante",
...       total: { $multiply: ["$precio", "$unidades"] },
...       completo: { $concat: ["$nombre", " - ", "$tipo"] }
...     }
...   }
... ])
[
  {
    unidades: 5,
    precio: 246,
    nombre: 'ERGONOMIC METAL BALL',
    empresa: 'Seaboard',
    total: 1230,
    completo: 'Ergonomic Metal Ball - medio'
  },
  {
    unidades: 7,
    precio: 253,
    nombre: 'HANDMADE PLASTIC HAT',
    empresa: "Dick's Sporting Goods",
    total: 1771,
    completo: 'Handmade Plastic Hat - medio'
  },
  {
    unidades: 0,
    precio: 94,
    nombre: 'ERGONOMIC METAL TABLE',
    empresa: 'Kelly Services',
    total: 0,
    completo: 'Ergonomic Metal Table - avanzado'
  },
  {
    unidades: 0,
    precio: 305,
    nombre: 'PRACTICAL FROZEN CHIPS',
    empresa: 'Delta Air Lines',
    total: 0,
    completo: 'Practical Frozen Chips - medio'
  },
  {
    unidades: 5,
    precio: 129,
    nombre: 'FANTASTIC METAL PANTS',
    empresa: 'OneMain Holdings',
    total: 645,
    completo: 'Fantastic Metal Pants - basico'
  },
  {
    unidades: 3,
    precio: 111,
    nombre: 'INTELLIGENT FROZEN SAUSAGES',
    empresa: 'A.O. Smith',
    total: 333,
    completo: 'Intelligent Frozen Sausages - basico'
  },
  {
    unidades: 5,
    precio: 24,
    nombre: 'RUSTIC PLASTIC MOUSE',
    empresa: 'Orbital ATK',
    total: 120,
    completo: 'Rustic Plastic Mouse - avanzado'
  }
]



````


9. Ordenar el resultado por el campo "total":

````json

db.productos.aggregate([
  {
    $match: { unidades: { $lt: 10 } }
  },
  {
    $project: {
      _id: 0,
      nombre: { $toUpper: "$nombre" },
      unidades: 1,
      precio: 1,
      empresa: "$fabricante",
      total: { $multiply: ["$precio", "$unidades"] },
      completo: { $concat: ["$nombre", " - ", "$tipo"] }
    }
  },
  {
    $sort: { total: 1 }
  }
])

````

resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $match: { unidades: { $lt: 10 } }
...   },
...   {
...     $project: {
...       _id: 0,
...       nombre: { $toUpper: "$nombre" },
...       unidades: 1,
...       precio: 1,
...       empresa: "$fabricante",
...       total: { $multiply: ["$precio", "$unidades"] },
...       completo: { $concat: ["$nombre", " - ", "$tipo"] }
...     }
...   },
...   {
...     $sort: { total: 1 }
...   }
... ])
[
  {
    unidades: 0,
    precio: 94,
    nombre: 'ERGONOMIC METAL TABLE',
    empresa: 'Kelly Services',
    total: 0,
    completo: 'Ergonomic Metal Table - avanzado'
  },
  {
    unidades: 0,
    precio: 305,
    nombre: 'PRACTICAL FROZEN CHIPS',
    empresa: 'Delta Air Lines',
    total: 0,
    completo: 'Practical Frozen Chips - medio'
  },
  {
    unidades: 5,
    precio: 24,
    nombre: 'RUSTIC PLASTIC MOUSE',
    empresa: 'Orbital ATK',
    total: 120,
    completo: 'Rustic Plastic Mouse - avanzado'
  },
  {
    unidades: 3,
    precio: 111,
    nombre: 'INTELLIGENT FROZEN SAUSAGES',
    empresa: 'A.O. Smith',
    total: 333,
    completo: 'Intelligent Frozen Sausages - basico'
  },
  {
    unidades: 5,
    precio: 129,
    nombre: 'FANTASTIC METAL PANTS',
    empresa: 'OneMain Holdings',
    total: 645,
    completo: 'Fantastic Metal Pants - basico'
  },
  {
    unidades: 5,
    precio: 246,
    nombre: 'ERGONOMIC METAL BALL',
    empresa: 'Seaboard',
    total: 1230,
    completo: 'Ergonomic Metal Ball - medio'
  },
  {
    unidades: 7,
    precio: 253,
    nombre: 'HANDMADE PLASTIC HAT',
    empresa: "Dick's Sporting Goods",
    total: 1771,
    completo: 'Handmade Plastic Hat - medio'
  }
]



````


10. Averiguar el número de productos por tipo de producto:


````json

db.productos.aggregate([
  {
    $group: {
      _id: "$tipo",
      "Numero de Productos": { $count: {} }
    }
  }
])

````

resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $group: {
...       _id: "$tipo",
...       "Numero de Productos": { $count: {} }
...     }
...   }
... ])
[
  { _id: 'medio', 'Numero de Productos': 25 },
  { _id: 'basico', 'Numero de Productos': 24 },
  { _id: 'avanzado', 'Numero de Productos': 18 }
]


````

11. Añadir el valor mayor y el menor:


````json

db.productos.aggregate([
  {
    $group: {
      _id: "$tipo",
      "Numero de Productos": { $count: {} },
      "Valor Mayor": { $max: "$precio" },
      "Valor Menor": { $min: "$precio" }
    }
  }
])

````

resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $group: {
...       _id: "$tipo",
...       "Numero de Productos": { $count: {} },
...       "Valor Mayor": { $max: "$precio" },
...       "Valor Menor": { $min: "$precio" }
...     }
...   }
... ])
[
  {
    _id: 'medio',
    'Numero de Productos': 25,
    'Valor Mayor': 337,
    'Valor Menor': 16
  },
  {
    _id: 'basico',
    'Numero de Productos': 24,
    'Valor Mayor': 285,
    'Valor Menor': 16
  },
  {
    _id: 'avanzado',
    'Numero de Productos': 18,
    'Valor Mayor': 331,
    'Valor Menor': 18
  }
]


````


12. Añadir el total de unidades por cada tipo:

````json

db.productos.aggregate([
  {
    $group: {
      _id: "$tipo",
      "Numero de Productos": { $count: {} },
      "Valor Mayor": { $max: "$precio" },
      "Valor Menor": { $min: "$precio" },
      "Total de Unidades": { $sum: "$unidades" }
    }
  }
])

````

resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $group: {
...       _id: "$tipo",
...       "Numero de Productos": { $count: {} },
...       "Valor Mayor": { $max: "$precio" },
...       "Valor Menor": { $min: "$precio" },
...       "Total de Unidades": { $sum: "$unidades" }
...     }
...   }
... ])
[
  {
    _id: 'avanzado',
    'Numero de Productos': 18,
    'Valor Mayor': 331,
    'Valor Menor': 18,
    'Total de Unidades': 773
  },
  {
    _id: 'basico',
    'Numero de Productos': 24,
    'Valor Mayor': 285,
    'Valor Menor': 16,
    'Total de Unidades': 1067
  },
  {
    _id: 'medio',
    'Numero de Productos': 25,
    'Valor Mayor': 337,
    'Valor Menor': 16,
    'Total de Unidades': 1224
  }
]



````

13. Con el operador $set y $substr, visualizar todos los datos del producto "Small Metal Tuna" y los primeros 5 caracteres del nombre:

````json

db.productos.aggregate([
  {
    $match: { nombre: "Small Metal Tuna" }
  },
  {
    $set: {
      _id: 1,
      nombre: 1,
      unidades: 1,
      precio: 1,
      fabricante: 1,
      tipo: 1,
      primeros_5_caracteres: { $substr: ["$nombre", 0, 5] }
    }
  }
])


````

resultado

````json


Practicas> db.productos.aggregate([
...   {
...     $match: { nombre: "Small Metal Tuna" }
...   },
...   {
...     $set: {
...       _id: 1,
...       nombre: 1,
...       unidades: 1,
...       precio: 1,
...       fabricante: 1,
...       tipo: 1,
...       primeros_5_caracteres: { $substr: ["$nombre", 0, 5] }
...     }
...   }
... ])
[
  {
    _id: 1,
    codigo: 55,
    nombre: 1,
    unidades: 1,
    precio: 1,
    fabricante: 1,
    tipo: 1,
    primeros_5_caracteres: 'Small'
  }
]




````

14. Crear una salida que tenga el nombre del artículo y el total (precio por unidades) y guardarlo en una colección denominada productos2:


````json

db.productos.aggregate([
  {
    $project: {
      nombre: 1,
      total: { $multiply: ["$precio", "$unidades"] }
    }
  },
  {
    $out: "productos2"
  }
])

````

15. Comprobar que se ha creado la colección productos2:



 ````json
show collections

````
resultado

````json
Practicas> show collections
productos
productos2

````

16. Hacer un find para comprobar el resultado:

````json
db.productos2.find()

````

resultado

````json

Practicas> db.productos2.find()
[
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce2'),
    nombre: 'Fantastic Wooden Fish',
    total: 27645
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce3'),
    nombre: 'Rustic Concrete Pants',
    total: 18414
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce4'),
    nombre: 'Small Soft Fish',
    total: 18144
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce5'),
    nombre: 'Practical Soft Pants',
    total: 2747
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce6'),
    nombre: 'Ergonomic Metal Ball',
    total: 1230
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce7'),
    nombre: 'Small Steel Gloves',
    total: 1665
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce8'),
    nombre: 'Ergonomic Wooden Shirt',
    total: 14994
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce9'),
    nombre: 'Handmade Steel Chair',
    total: 5392
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cea'),
    nombre: 'Handcrafted Soft Gloves',
    total: 4512
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ceb'),
    nombre: 'Fantastic Concrete Salad',
    total: 12985
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cec'),
    nombre: 'Handmade Plastic Hat',
    total: 1771
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ced'),
    nombre: 'Refined Wooden Tuna',
    total: 8480
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cee'),
    nombre: 'Refined Concrete Salad',
    total: 11610
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cef'),
    nombre: 'Unbranded Soft Fish',
    total: 9434
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf0'),
    nombre: 'Small Concrete Fish',
    total: 5040
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf1'),
    nombre: 'Refined Concrete Bike',
    total: 2700
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf2'),
    nombre: 'Tasty Cotton Pants',
    total: 3536
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf3'),
    nombre: 'Incredible Granite Gloves',
    total: 20590
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf4'),
    nombre: 'Practical Metal Mouse',
    total: 6650
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf5'),
    nombre: 'Handcrafted Steel Chicken',
    total: 6215
  }
]


````

17. Usar $cond y $project para visualizar el nombre del producto, el precio y un campo llamado "valoración" que diga “barato” si el precio es menor de 250 y “caro” si es mayor o igual:

````json

db.productos.aggregate([
  {
    $project: {
      nombre: 1,
      precio: 1,
      valoración: {
        $cond: {
          if: { $lt: ["$precio", 250] },
          then: "barato",
          else: "caro"
        }
      }
    }
  }
])

````

resultado

````json

Practicas> db.productos.aggregate([
...   {
...     $project: {
...       nombre: 1,
...       precio: 1,
...       valoración: {
...         $cond: {
...           if: { $lt: ["$precio", 250] },
...           then: "barato",
...           else: "caro"
...         }
...       }
...     }
...   }
... ])
[
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce2'),
    nombre: 'Fantastic Wooden Fish',
    precio: 291,
    'valoración': 'caro'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce3'),
    nombre: 'Rustic Concrete Pants',
    precio: 279,
    'valoración': 'caro'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce4'),
    nombre: 'Small Soft Fish',
    precio: 189,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce5'),
    nombre: 'Practical Soft Pants',
    precio: 67,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce6'),
    nombre: 'Ergonomic Metal Ball',
    precio: 246,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce7'),
    nombre: 'Small Steel Gloves',
    precio: 37,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce8'),
    nombre: 'Ergonomic Wooden Shirt',
    precio: 238,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ce9'),
    nombre: 'Handmade Steel Chair',
    precio: 337,
    'valoración': 'caro'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cea'),
    nombre: 'Handcrafted Soft Gloves',
    precio: 282,
    'valoración': 'caro'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ceb'),
    nombre: 'Fantastic Concrete Salad',
    precio: 265,
    'valoración': 'caro'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cec'),
    nombre: 'Handmade Plastic Hat',
    precio: 253,
    'valoración': 'caro'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0ced'),
    nombre: 'Refined Wooden Tuna',
    precio: 212,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cee'),
    nombre: 'Refined Concrete Salad',
    precio: 129,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cef'),
    nombre: 'Unbranded Soft Fish',
    precio: 178,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf0'),
    nombre: 'Small Concrete Fish',
    precio: 126,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf1'),
    nombre: 'Refined Concrete Bike',
    precio: 180,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf2'),
    nombre: 'Tasty Cotton Pants',
    precio: 52,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf3'),
    nombre: 'Incredible Granite Gloves',
    precio: 290,
    'valoración': 'caro'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf4'),
    nombre: 'Practical Metal Mouse',
    precio: 190,
    'valoración': 'barato'
  },
  {
    _id: ObjectId('67da3ae72a60e9029ecb0cf5'),
    nombre: 'Handcrafted Steel Chicken',
    precio: 113,
    'valoración': 'barato'
  }
]

````