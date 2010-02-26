CREATE TABLE "ideeli_hashes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "hkey" varchar(255), "hvalue" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE INDEX "index_ideeli_hashes_on_hkey" ON "ideeli_hashes" ("hkey");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20100218021445');