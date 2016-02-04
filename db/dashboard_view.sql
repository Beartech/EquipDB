CREATE VIEW dash_views AS
SELECT dashviews.*
  FROM (
    SELECT tools.location_id, tools.name, tools.serial, tools.in_service, tools.id, tools.loaner, tools.category_id,
      tools.model, tools.condition, locations.name loc_name, categories.name cat_name
     FROM tools
       INNER JOIN locations ON locations.id = tools.location_id
       INNER JOIN categories ON categories.id = tools.category_id)
    AS dashviews
  ORDER BY dashviews.loc_name;


CREATE VIEW annual_service_completes AS
SELECT ann_serv_complete.*
  FROM (
    SELECT tools.id, tools.name, tools.category_id, services.id serv_id, service_types.name serv_type, services.completed comp
    FROM services
    INNER JOIN tools ON tools.id = services.tool_id
    INNER JOIN service_types ON service_types.id = services.service_type_id
    WHERE tools.category_id IN (SELECT categories.id FROM categories WHERE categories.ann_serv = TRUE)
    ORDER BY tools.category_id)
  AS ann_serv_complete
WHERE (serv_type LIKE '%Annual%' OR serv_type LIKE '%New%')  AND  date_part('year', comp) = date_part('year', now());


CREATE VIEW table_of_parts AS
SELECT parts.*, alias_skus
  FROM parts
    LEFT JOIN (
           SELECT part_id, array_agg(sku) alias_skus
           FROM part_aliases GROUP BY part_id)
      AS sub1
      ON parts.id = sub1.part_id;


CREATE VIEW equipment AS
select equipment.* from (SELECT serial, categories.name AS type, model, locations.name AS location, in_service,
  CAST(ann_serv.id AS BIT) AS ann_serv, condition, sum_hours.sum_id AS hours
FROM tools
  JOIN categories ON categories.id = tools.category_id
  JOIN locations ON locations.id = tools.location_id
  LEFT JOIN annual_service_completes ann_serv ON ann_serv.id = tools.id
  JOIN (SELECT distinct tool_id, SUM(hours) AS sum_id
        FROM services
          LEFT OUTER JOIN service_types ON service_types.id = services.service_type_id
        GROUP BY tool_id ORDER BY tool_id ) AS sum_hours ON sum_hours.tool_id = tools.id)
AS equipment;


CREATE VIEW annual_tools AS
SELECT locations.name, array_agg(tools.id) ids
FROM locations
  JOIN tools ON locations.id = tools.location_id
WHERE tools.category_id IN (SELECT categories.id
                            FROM categories
                            WHERE categories.ann_serv = TRUE)
GROUP BY locations.name;