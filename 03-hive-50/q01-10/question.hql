-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<

DROP TABLE IF EXISTS thive1;

CREATE TABLE thive1 ( letra       STRING,
                    fecha       STRING,
                    cantidad    INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE thive1;

INSERT OVERWRITE LOCAL DIRECTORY 'output' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
    SELECT letra, count(*)
    FROM thive1
    GROUP BY letra
    ORDER BY letra;


