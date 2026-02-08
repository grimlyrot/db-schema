-- Edge runtime fields (multi-tenant runtime)

-- CreateEnum
DO $$
BEGIN
  CREATE TYPE "EdgeMode" AS ENUM ('LEGACY', 'WORKER');
EXCEPTION
  WHEN duplicate_object THEN NULL;
END$$;

-- AlterTable
ALTER TABLE "Pwa"
  ADD COLUMN IF NOT EXISTS "edge_mode" "EdgeMode" NOT NULL DEFAULT 'LEGACY',
  ADD COLUMN IF NOT EXISTS "edge_version" TEXT,
  ADD COLUMN IF NOT EXISTS "origin_pages_url" TEXT,
  ADD COLUMN IF NOT EXISTS "edge_account_id" TEXT,
  ADD COLUMN IF NOT EXISTS "edge_config" JSONB,
  ADD COLUMN IF NOT EXISTS "edge_config_updated_at" TIMESTAMP(3);

-- CreateIndex
CREATE INDEX IF NOT EXISTS "Pwa_edge_account_id_idx" ON "Pwa"("edge_account_id");

-- AddForeignKey
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_constraint c
      JOIN pg_class t ON t.oid = c.conrelid
      JOIN pg_namespace n ON n.oid = t.relnamespace
    WHERE c.conname = 'Pwa_edge_account_id_fkey'
      AND t.relname = 'Pwa'
      AND n.nspname = 'public'
  ) THEN
    ALTER TABLE "Pwa" ADD CONSTRAINT "Pwa_edge_account_id_fkey"
      FOREIGN KEY ("edge_account_id") REFERENCES "CloudflareAccount"("id")
      ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END$$;
