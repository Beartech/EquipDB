SELECT dashviews.*
  FROM (
    SELECT tools.location_id, tools.name, tools.serial, tools.in_service, tools.id, tools.loaner, tools.annual_service,
      tools.model, tools.condition, locations.name loc_name, categories.name cat_name
     FROM tools
       INNER JOIN locations ON locations.id = tools.location_id
       INNER JOIN categories ON categories.id = tools.category_id)
    AS dashviews
  ORDER BY dashviews.loc_name;


SELECT ann_serv_complete.*
  FROM (
    SELECT tools.id, tools.name, services.id serv_id, service_types.name serv_type, services.completed comp
    FROM services
    INNER JOIN tools ON tools.id = services.tool_id
    INNER JOIN service_types ON service_types.id = services.service_type_id)
  AS ann_serv_complete
WHERE (serv_type LIKE '%Annual%' OR serv_type LIKE '%New%')  AND  date_part('year', comp) = date_part('year', now());


SELECT parts.*, alias_skus
  FROM parts
    LEFT JOIN (
           SELECT part_id, array_agg(sku) alias_skus
           FROM part_aliases GROUP BY part_id)
      AS sub1
      ON parts.id = sub1.part_id;

