#nombre del actor y nombre de pelicula en la que trabajo
CREATE VIEW `actores_peliculas` AS
    SELECT 
		a.first_name, 
        a.last_name,
        f.title
	FROM
		actor a INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
				INNER JOIN film f ON fa.film_id = f.film_id;
                
SELECT * FROM actores_peliculas;

                
#devolver nombre actor de aquellos que han trabajo en al menis 15 peliculas
CREATE VIEW `actores_15peliculas` AS
    SELECT 
		a.first_name
	FROM
		actor a INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
	GROUP BY fa.actor_id
	HAVING COUNT(*)>=15;
SELECT * FROM actores_15peliculas; 

#devolver nombre actor de aquellos que han trabajo en mas de 15 peliculas
CREATE VIEW `actores_15peliculas` AS
	SELECT 
		a.first_name
	FROM
		actor a INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
	GROUP BY fa.actor_id
	HAVING COUNT(*)>15;
SELECT * FROM actores_15peliculas; 


#nombre del actor y nombre de pelicula en la que trabajo CUYO APELLIDO EMPIEZA POR C
CREATE VIEW `actores_peliculas_c` AS
    SELECT 
		a.first_name, 
		a.last_name,
		f.title
	FROM
		actor a INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
				INNER JOIN film f ON fa.film_id = f.film_id
	WHERE
		a.last_name LIKE 'C%';

SELECT * FROM actores_peliculas_c;

