-- Add ui_design to support explicit APP/WEB page design selection.
-- Keep legacy rich_ui for backward compatibility while services migrate.

ALTER TABLE "Pwa"
  ADD COLUMN IF NOT EXISTS "ui_design" TEXT;

UPDATE "Pwa"
SET "ui_design" = CASE
  WHEN "rich_ui" = TRUE THEN 'WEB'
  ELSE 'APP'
END
WHERE "ui_design" IS NULL;

ALTER TABLE "Pwa"
  ALTER COLUMN "ui_design" SET DEFAULT 'APP';

ALTER TABLE "Pwa"
  ALTER COLUMN "ui_design" SET NOT NULL;
