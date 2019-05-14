CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "full_name" varchar,
  "username" varchar UNIQUE NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "profile_photo_url" varchar,
  "header_photo_url" varchar,
  "work_status" varchar NOT NULL,
  "bio" text
);


CREATE TABLE "compentencies" (
  "id" integer PRIMARY KEY,
  "tag" varchar NOT NULL
);


CREATE TABLE "user_competencies" (
  "id" integer PRIMARY KEY,
  "competency_id" integer,
  "user_id" integer
);


CREATE TABLE "projects" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "logo_url" varchar,
  "header_photo_url" varchar,
  "tagline" varchar,
  "description" text,
  "created_at" timestamp
);


CREATE TABLE "categories" (
  "id" integer PRIMARY KEY,
  "tag" varchar
);


CREATE TABLE "project_categories" (
  "id" integer PRIMARY KEY,
  "project_id" integer NOT NULL,
  "category_id" integer NOT NULL
);


CREATE TABLE "milestones" (
  "id" integer PRIMARY KEY,
  "date" timestamp,
  "description" varchar
);


CREATE TABLE "project_milestones" (
  "id" integer PRIMARY KEY,
  "project_id" integer,
  "milestone_id" integer
);


CREATE TABLE "positions" (
  "id" integer PRIMARY KEY,
  "project_id" integer NOT NULL,
  "user_id" integer,
  "title" varchar,
  "description" varchar
);


ALTER TABLE "user_competencies" ADD FOREIGN KEY ("competency_id") REFERENCES "compentencies" ("id");


ALTER TABLE "user_competencies" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");


ALTER TABLE "projects" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");


ALTER TABLE "project_categories" ADD FOREIGN KEY ("project_id") REFERENCES "projects" ("id");


ALTER TABLE "project_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");


ALTER TABLE "project_milestones" ADD FOREIGN KEY ("project_id") REFERENCES "projects" ("id");


ALTER TABLE "project_milestones" ADD FOREIGN KEY ("milestone_id") REFERENCES "milestones" ("id");


ALTER TABLE "positions" ADD FOREIGN KEY ("project_id") REFERENCES "projects" ("id");


ALTER TABLE "positions" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");