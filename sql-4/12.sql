 CREATE OR REPLACE view spj 
 as
 SELECT job.name AS job_name,
    job.city AS job_city,
    products.color,
    products.name AS product_name,
    products.weight,
    products.city AS product_city,
    shipper.name AS shipper_name,
    shipper.raiting,
    shipper.city AS shipper_city
   FROM supply
     JOIN job ON job.id = supply.jid
     JOIN products ON products.id = supply.pid
     JOIN shipper ON shipper.id = supply.sid;