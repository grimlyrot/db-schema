-- CreateEnum
CREATE TYPE "DomainPurchaseStatus" AS ENUM (
  'PURCHASE_REQUESTED',
  'PURCHASE_IN_PROGRESS',
  'PURCHASE_CONFIRMED',
  'SETUP_IN_PROGRESS',
  'ACTIVE',
  'PURCHASE_FAILED',
  'PURCHASE_UNCONFIRMED',
  'SETUP_FAILED',
  'PURCHASED_SETUP_FAILED',
  'OWNED_NOT_ATTACHED',
  'CANCELLED'
);

-- CreateTable
CREATE TABLE "DomainPurchaseAttempt" (
  "id" TEXT NOT NULL,
  "normalized_domain" TEXT NOT NULL,
  "source_domain" TEXT NOT NULL,
  "status" "DomainPurchaseStatus" NOT NULL,
  "reason" TEXT,
  "provider" TEXT NOT NULL DEFAULT 'NAMECHEAP',
  "attempt_count" INTEGER NOT NULL DEFAULT 1,
  "automatic_reconciliation_attempts" INTEGER NOT NULL DEFAULT 0,
  "manual_reconciliation_attempts" INTEGER NOT NULL DEFAULT 0,
  "provider_purchase_confirmed_at" TIMESTAMP(3),
  "setup_started_at" TIMESTAMP(3),
  "setup_completed_at" TIMESTAMP(3),
  "last_status_check_at" TIMESTAMP(3),
  "timeout_at" TIMESTAMP(3),
  "last_error_code" TEXT,
  "last_error_message" TEXT,
  "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP(3) NOT NULL,
  "domain_id" TEXT,
  "pwa_id" TEXT,

  CONSTRAINT "DomainPurchaseAttempt_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "DomainPurchaseAttempt_normalized_domain_idx" ON "DomainPurchaseAttempt"("normalized_domain");

-- CreateIndex
CREATE INDEX "DomainPurchaseAttempt_pwa_id_idx" ON "DomainPurchaseAttempt"("pwa_id");

-- CreateIndex
CREATE INDEX "DomainPurchaseAttempt_domain_id_idx" ON "DomainPurchaseAttempt"("domain_id");

-- CreateIndex
CREATE INDEX "DomainPurchaseAttempt_status_idx" ON "DomainPurchaseAttempt"("status");

-- AddForeignKey
ALTER TABLE "DomainPurchaseAttempt"
ADD CONSTRAINT "DomainPurchaseAttempt_domain_id_fkey"
FOREIGN KEY ("domain_id") REFERENCES "Domain"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DomainPurchaseAttempt"
ADD CONSTRAINT "DomainPurchaseAttempt_pwa_id_fkey"
FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE SET NULL ON UPDATE CASCADE;
