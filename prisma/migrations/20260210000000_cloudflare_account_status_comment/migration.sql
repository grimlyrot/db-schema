-- CloudflareAccount: persist last readiness check comment for super-admin UI

ALTER TABLE "CloudflareAccount"
  ADD COLUMN IF NOT EXISTS "status_comment" TEXT,
  ADD COLUMN IF NOT EXISTS "status_checked_at" TIMESTAMP(3);

