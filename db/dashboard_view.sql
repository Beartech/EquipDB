SELECT dashviews.*
  FROM (
    SELECT tools.location_id, tools.name, tools.serial, tools.in_service, tools.id, tools.loaner, tools.annual_service,
      tools.model, locations.name loc_name, categories.name cat_name
     FROM tools
       INNER JOIN locations ON locations.id = tools.location_id
       INNER JOIN categories ON category_id = tools.category_id)
    AS dashviews
  ORDER BY dashviews.loc_name;


