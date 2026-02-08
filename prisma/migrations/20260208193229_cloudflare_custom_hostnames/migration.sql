-- Cloudflare for SaaS (Custom Hostnames)
--
-- NOTE:
-- Some older databases may not have the "CloudflareAccount" table yet (it previously existed
-- only in the Prisma schema without a corresponding migration). We create it here if missing,
-- then apply SaaS-related columns in an idempotent way.

DO $$
BEGIN
  IF to_regclass('"CloudflareAccount"') IS NULL THEN
    CREATE TABLE "CloudflareAccount" (
      "id" TEXT NOT NULL,
      "name" TEXT,
      "account_id" TEXT NOT NULL,
      "api_token" TEXT NOT NULL,
      "email" TEXT,
      "status" TEXT DEFAULT 'ACTIVE',
      "zone_count" INTEGER NOT NULL DEFAULT 0,
      "worker_count" INTEGER NOT NULL DEFAULT 0,
      "saas_zone_id" TEXT,
      "saas_zone_name" TEXT,
      "saas_target_host" TEXT,
      "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
      "updatedAt" TIMESTAMP(3) NOT NULL,

      CONSTRAINT "CloudflareAccount_pkey" PRIMARY KEY ("id")
    );
  END IF;
END$$;

ALTER TABLE "CloudflareAccount"
  ADD COLUMN IF NOT EXISTS "saas_zone_id" TEXT,
  ADD COLUMN IF NOT EXISTS "saas_zone_name" TEXT,
  ADD COLUMN IF NOT EXISTS "saas_target_host" TEXT;

-- CreateTable
CREATE TABLE IF NOT EXISTS "CloudflareCustomHostname" (
    "id" TEXT NOT NULL,
    "hostname" TEXT NOT NULL,
    "cloudflare_id" TEXT NOT NULL,
    "status" TEXT,
    "ssl" JSONB,
    "ownership_verification" JSONB,
    "ownership_verification_http" JSONB,
    "verification_errors" JSONB,
    "domain_id" TEXT NOT NULL,
    "cloudflare_account_id" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CloudflareCustomHostname_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX IF NOT EXISTS "CloudflareCustomHostname_cloudflare_id_key" ON "CloudflareCustomHostname"("cloudflare_id");

-- CreateIndex
CREATE UNIQUE INDEX IF NOT EXISTS "CloudflareCustomHostname_domain_id_key" ON "CloudflareCustomHostname"("domain_id");

-- CreateIndex
CREATE INDEX IF NOT EXISTS "CloudflareCustomHostname_hostname_idx" ON "CloudflareCustomHostname"("hostname");

-- AddForeignKey
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_constraint c
      JOIN pg_class t ON t.oid = c.conrelid
      JOIN pg_namespace n ON n.oid = t.relnamespace
    WHERE c.conname = 'CloudflareCustomHostname_domain_id_fkey'
      AND t.relname = 'CloudflareCustomHostname'
      AND n.nspname = 'public'
  ) THEN
    ALTER TABLE "CloudflareCustomHostname"
      ADD CONSTRAINT "CloudflareCustomHostname_domain_id_fkey"
      FOREIGN KEY ("domain_id") REFERENCES "Domain"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END$$;

-- AddForeignKey
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_constraint c
      JOIN pg_class t ON t.oid = c.conrelid
      JOIN pg_namespace n ON n.oid = t.relnamespace
    WHERE c.conname = 'CloudflareCustomHostname_cloudflare_account_id_fkey'
      AND t.relname = 'CloudflareCustomHostname'
      AND n.nspname = 'public'
  ) THEN
    ALTER TABLE "CloudflareCustomHostname"
      ADD CONSTRAINT "CloudflareCustomHostname_cloudflare_account_id_fkey"
      FOREIGN KEY ("cloudflare_account_id") REFERENCES "CloudflareAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END$$;
