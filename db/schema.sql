CREATE TABLE `schema_migrations` (`filename` varchar(255) NOT NULL PRIMARY KEY);
CREATE TABLE `books` (`id` integer NOT NULL PRIMARY KEY AUTOINCREMENT, `image_url` varchar(255), `link` varchar(255), `description` varchar(255), `publisher` varchar(255), `by` varchar(255), `isbn` varchar(255), `year` timestamp, `pages` numeric, `languages` varchar(255), `file_size` numeric, `file_type` integer, `create_at` timestamp, `updated_at` timestamp);
INSERT INTO "schema_migrations" VALUES('20151024155511_create_books.rb');
