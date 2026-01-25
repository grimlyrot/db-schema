-- Add hashed invite token support and single-use tracking.
ALTER TABLE "invites" ADD COLUMN "token_hash" TEXT;
ALTER TABLE "invites" ADD COLUMN "accepted_at" TIMESTAMP(3);
ALTER TABLE "invites" ADD COLUMN "revoked_at" TIMESTAMP(3);
ALTER TABLE "invites" ADD COLUMN "uses_left" INTEGER NOT NULL DEFAULT 1;
ALTER TABLE "invites" ALTER COLUMN "token" DROP NOT NULL;

CREATE UNIQUE INDEX "invites_token_hash_key" ON "invites"("token_hash");
