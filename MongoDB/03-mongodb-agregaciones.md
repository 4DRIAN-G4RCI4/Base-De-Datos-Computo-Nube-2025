## Agregaciones en MongoDB(Framework)

## Métodos para realizar agregaciones simples
- distinct(): Devuelve valores no duplicados
- countDocuments(): Cuenta los documentos en una colección
- estimatedDocumentCount(): Cuenta de manera aproximada durante un 
  periodo de tiempo

## Una Aggregation pipeline consta de una o más etapas (stage) que
## procesan documentos

1. Cada etapa realiza una operación de documentos de entrada. Por
   ejemplo, una fase puede filtrar documentos, agrupar documentos
   y calcular valores.

2. Los documentos que se generan en una fase pasan a la siguiente
   fase. 

3. Puede devolver resultados para grupos de documentos como totales,
   máximo, mínimo etc.

## Se utiliza la clausula "aggregate"
- Existen una serie de operadores que se pueden utilizar para 
  realizar operaciones. Se tienen distintos tipos: etapa, de
  comparación, booleanos, aritméticos, de cadena, etc.

## Métodos simples: countDocuments() y distinct()

1. Contar los documentos de la colección libros
db.libros.countDocuments()

2. Contar los documentos de la editorial Terra
db.libros.countDocuments({editorial: 'Terra'})

3. Mostrar todos los libros mostrando solamente la editorial
db.libros.find({},{editorial:1, _id:0})

4. Mostrar todas las distintas editoriales
db.libros.distinct('editorial')

[Documentación de Agregaciones](https://www.mongodb.com/docs/manual/aggregation/)

## $match. Una pipeline básica
## Tienen funciones de etapa
db.libros.aggregate(
    [
        {
            $match:{editorial: "Biblio"}
        }
    ]
)

## $project. Incluir y renombar campos

db.libros.aggregate(
  [
    {
      $match: {editorial: 'Biblio'}
    },
    {
      $project:{
        _id:0,
        titulo:1,
        precio:1,
        NombreEditorial:"$editorial",
        editorial:1
      }
    }
  ]
)


Generado por mongoCompas
[
  {
    $match:
      /**
       * query: The query in MQL.
       */
      {
        editorial: "Biblio"
      }
  },
  {
    $project:
      /**
       * specifications: The fields to
       *   include or exclude.
       */
      {
        _id: 0,
        precio: 1,
        cantidad: 1,
        NombreEditorial: "$editorial",
        editorial: 1
      }
  }
]



[
  {
    $match:
      /**
       * query: The query in MQL.
       */
      {
        editorial: "Biblio"
      }
  },
  {
    $project:
      /**
       * specifications: The fields to
       *   include or exclude.
       */
      {
        _id: 0,
        titulo: 1,
        precio: 1,
        cantidad: 1,
        "Nombre Editorial": "$editorial",
        "Total de Ganancias": {
          $multiply: ["$precio", "$cantidad"]
        }
      }
  }
]

## sort. Ordenaciones

[
  {
    $sort:
      /**
       * Provide any number of field/order pairs.
       */
      {
        precio: 1
      }
  }
]

## $group. Agrupaciones
[Agrupaciones](https://www.mongodb.com/docs/manual/reference/operator/aggregation/group/)



-- Cuantos documentos hay por cada una de las editoriales
[
  {
    $group:
        _id: "editorial",
        "Numero de Documentos": {
          $count: {}
        }
      }
  
]

--Cuantos documentos hay por cada una de las editoriales por número de
--documentos de manera descendente 



-- Utilizando MongoAtlas Base de datos sample_airnbnb
-- Agrupar por tipo de propiedad mostrando el numero de propiedades y
-- el promedio de sus precios

{
  _id: "$property_type",
  Numero: {
    $count: {}
  },
  Media:
  {
    $avg: "$price"
    
  }
}

-- Operadores $set 

[
  
    {
        _id: "$property_type",
        Numero: {
          $count: {}
        },
        Media: {
          $avg: "$price"
        }
      }
  ,
  {
    $set:
      /**
       * field: The field name
       * expression: The expression.
       */
      {
        Media_Total: {
          $trunc: "$Media"
        }
      }
  }
]


-- Operador $unset

['Media', 'Media_Total']

-- Quitando solo un campo
'Media' 


-- Creando nuevas colecciones utilizando el operador $out
-- Nota: debe ser el último en la agregación


[
  ¿
      {
        _id: "$property_type",
        Numero: {
          $count: {}
        },
        Media: {
          $avg: "$price"
        }
      },
  {
    $set:
      /**
       * field: The field name
       * expression: The expression.
       */
      {
        Media_Total: {
          $trunc: "$Media"
        }
      }
  },
  {
    $unset:
      /**
       * Provide the field name to exclude.
       * To exclude multiple fields, pass the field names in an array.
       */
      "Media"
  },
  {
    $out:
      /**
       * Provide the name of the output database and collection.
       */
      {
        db: "sample_airbnb",
        coll: "media_propiedades"
        /*
    timeseries: {
      timeField: 'field',
      bucketMaxSpanSeconds: 'number',
      granularity: 'granularity'
    }
    */
      }
  }
]


Ejemplos con operadores de comparacion



