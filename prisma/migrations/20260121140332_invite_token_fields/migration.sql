-- Idempotent invite token fields migration (safe if prior migration already added columns)
ALTER TABLE "invites"
  ADD COLUMN IF NOT EXISTS "accepted_at" TIMESTAMP(3),
  ADD COLUMN IF NOT EXISTS "revoked_at" TIMESTAMP(3),
  ADD COLUMN IF NOT EXISTS "token_hash" TEXT,
  ADD COLUMN IF NOT EXISTS "uses_left" INTEGER NOT NULL DEFAULT 1,
  ALTER COLUMN "token" DROP NOT NULL;

CREATE UNIQUE INDEX IF NOT EXISTS "invites_token_hash_key" ON "invites"("token_hash");
