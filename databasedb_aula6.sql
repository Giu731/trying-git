CREATE TABLE "custumers" (
  "id" SERIAL PRIMARY KEY,
  "name" text NOT NULL,
  "email" text,
  "telephone" integer NOT NULL,
  "cpf" integer NOT NULL
);

CREATE TABLE "agencies" (
  "id" SERIAL PRIMARY KEY,
  "name" text NOT NULL,
  "adress_id" int UNIQUE,
  "car_types" text[],
  "price_range" text,
  "amount_cars" integer,
  "since" integer
);

CREATE TABLE "adresses" (
  "id" SERIAL PRIMARY KEY,
  "city" text NOT NULL,
  "zip_code" integer NOT NULL,
  "street" text NOT NULL,
  "number" integer NOT NULL,
  "extra" text
);

CREATE TABLE "car" (
  "id" SERIAL PRIMARY KEY,
  "agency_id" int,
  "model_id" int,
  "image" url,
  "color" text,
  "plate" text NOT NULL,
  "price" integer NOT NULL,
  "status" integer NOT NULL
);

CREATE TABLE "models" (
  "id" SERIAL PRIMARY KEY,
  "brand" text NOT NULL,
  "model" text NOT NULL,
  "year" integer,
  "type" text
);

CREATE TABLE "orders" (
  "id" SERIAL PRIMARY KEY,
  "custumer_id" int,
  "agency_id" int,
  "car_id" int,
  "begin_date" integer,
  "days" integer
);

ALTER TABLE "adresses" ADD FOREIGN KEY ("id") REFERENCES "agencies" ("adress_id");

ALTER TABLE "car" ADD FOREIGN KEY ("model_id") REFERENCES "models" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("custumer_id") REFERENCES "custumers" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("agency_id") REFERENCES "agencies" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("car_id") REFERENCES "car" ("id");
