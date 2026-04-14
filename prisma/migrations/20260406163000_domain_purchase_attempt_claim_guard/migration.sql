-- AlterTable
ALTER TABLE "DomainPurchaseAttempt"
ADD COLUMN "active_claim_key" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "DomainPurchaseAttempt_active_claim_key_key" ON "DomainPurchaseAttempt"("active_claim_key");

-- CreateIndex
CREATE INDEX "DomainPurchaseAttempt_pwa_id_normalized_domain_idx" ON "DomainPurchaseAttempt"("pwa_id", "normalized_domain");
