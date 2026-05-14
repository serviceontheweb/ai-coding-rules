# Rule Pack: Schema Discipline

Purpose: keep database structure inspectable, reproducible, and version-
controlled. A schema that exists only in a live database — created by hand or
by scattered statements buried in application code — is a schema nobody can
document, review, or recreate. These rules prevent that.

## Rules

1. **Database schema is defined only by committed migration files.** The
   authoritative description of the schema is an ordered set of migration files
   in the repository. The live database is downstream of those files, never the
   other way around.

2. **No schema changes embedded in application startup.** Application code must
   not create or alter tables at boot — no `CREATE TABLE`, no
   `ALTER TABLE ... ADD COLUMN IF NOT EXISTS`, no best-effort schema patching in
   the request path or the startup sequence. Schema changes go in migrations.

3. **Migrations are ordered, named, and forward-only by default.** Each
   migration has a clear sequence position and a descriptive name. Destructive
   migrations (dropping columns or tables) require explicit human approval.

4. **Code and schema must agree.** Application code must not read from or write
   to columns or tables that the committed migrations do not define. If code
   writes a field, a migration must create it. A mismatch here is a live bug,
   not a style issue.

5. **Recovering an undocumented schema is a real task.** If a project is found
   with a live schema that is not represented in migrations, capture the live
   schema (a structure-only dump), convert it into ordered migration files, and
   commit them. Until that is done, the repository is not the source of truth
   for the database and should not be treated as one.

6. **Seed data is separate from schema.** Migrations define structure. Seed or
   reference data belongs in clearly separated, clearly named files — not mixed
   into structural migrations.

## Verification

Before claiming schema-related work complete, the agent should be able to
answer, with evidence:

- Could the current database structure be recreated from a fresh database using
  only the committed migration files?
- Does every column and table the application code references exist in a
  committed migration?
- Is there any `CREATE`/`ALTER` statement reachable from application startup or
  the request path? (There should be none.)

If any answer is wrong, the work is not complete.
