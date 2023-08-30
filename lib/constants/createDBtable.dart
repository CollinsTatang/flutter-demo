
const createUserTable = '''CREATE TABLE IF NOT EXISTS "user" (
	      "id"	INTEGER NOT NULL,
	      "email"	TEXT NOT NULL UNIQUE,
	      PRIMARY KEY("id" AUTOINCREMENT)
      );''';
const createNoteTable = '''CREATE TABLE IF NOT EXISTS "note" (
	      "id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	      "user_id"	INTEGER NOT NULL,
	      "text"	TEXT,
	      FOREIGN KEY("user_id") REFERENCES "user"("id")
        );''';
