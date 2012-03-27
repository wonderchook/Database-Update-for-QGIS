ALTER TABLE public.planet_osm_polygon ADD COLUMN "id" Integer;
CREATE SEQUENCE public.polygon_id_seq;
UPDATE planet_osm_polygon SET id = nextval('"public"."polygon_id_seq"');
ALTER TABLE "public"."planet_osm_polygon" ADD UNIQUE ("id");
ALTER TABLE "public"."planet_osm_polygon" ADD PRIMARY KEY ("id");
CREATE VIEW vw_planet_osm_polygon AS SELECT planet_osm_polygon.id, planet_osm_polygon.osm_id, planet_osm_polygon."building:levels" AS levels, planet_osm_polygon."building:structure" AS structure, planet_osm_polygon.way FROM planet_osm_polygon WHERE planet_osm_polygon.building IS NOT NULL;

