-- AlterTable
ALTER TABLE "invites" ADD COLUMN     "accepted_at" TIMESTAMP(3),
ADD COLUMN     "revoked_at" TIMESTAMP(3),
ADD COLUMN     "token_hash" TEXT,
ADD COLUMN     "uses_left" INTEGER NOT NULL DEFAULT 1,
ALTER COLUMN "token" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "invites_token_hash_key" ON "invites"("token_hash");

