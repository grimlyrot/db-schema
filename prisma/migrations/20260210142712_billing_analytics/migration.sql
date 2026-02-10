-- CreateEnum
CREATE TYPE "BillingProvider" AS ENUM ('CLOUDFLARE', 'DIGITALOCEAN', 'VERCEL', 'PULUMI', 'GITHUB', 'NAMECHEAP', 'CLOUDINARY', 'SENTRY', 'OPENAI', 'BETTERSTACK', 'JITSU');

-- CreateEnum
CREATE TYPE "BillingIntegrationStatus" AS ENUM ('ACTIVE', 'DISABLED', 'ERROR', 'MISSING_PERMISSIONS');

-- CreateEnum
CREATE TYPE "BillingImportStatus" AS ENUM ('RUNNING', 'SUCCESS', 'FAILED');

-- CreateEnum
CREATE TYPE "BillingRecordType" AS ENUM ('INVOICE', 'LINE_ITEM', 'CHARGE', 'PAYMENT', 'REFUND', 'CREDIT', 'ADJUSTMENT', 'USAGE_ESTIMATE', 'MANUAL');

-- CreateEnum
CREATE TYPE "BillingRecurringInterval" AS ENUM ('MONTHLY', 'YEARLY');

-- CreateTable
CREATE TABLE "billing_integrations" (
    "id" TEXT NOT NULL,
    "provider" "BillingProvider" NOT NULL,
    "source_key" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "account_key" TEXT,
    "credentials" JSONB,
    "cloudflare_account_id" TEXT,
    "status" "BillingIntegrationStatus" NOT NULL DEFAULT 'ACTIVE',
    "status_comment" TEXT,
    "status_checked_at" TIMESTAMP(3),
    "last_imported_at" TIMESTAMP(3),
    "billing_anchor_day" INTEGER,
    "billing_timezone" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "billing_integrations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "billing_import_runs" (
    "id" TEXT NOT NULL,
    "integration_id" TEXT NOT NULL,
    "status" "BillingImportStatus" NOT NULL DEFAULT 'RUNNING',
    "message" TEXT,
    "stats" JSONB,
    "started_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "finished_at" TIMESTAMP(3),

    CONSTRAINT "billing_import_runs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "billing_records" (
    "id" TEXT NOT NULL,
    "provider" "BillingProvider" NOT NULL,
    "integration_id" TEXT NOT NULL,
    "source_key" TEXT NOT NULL,
    "external_id" TEXT,
    "type" "BillingRecordType" NOT NULL,
    "amount" DECIMAL(20,6) NOT NULL,
    "currency" TEXT NOT NULL,
    "description" TEXT,
    "status" TEXT,
    "occurred_at" TIMESTAMP(3) NOT NULL,
    "period_start" TIMESTAMP(3),
    "period_end" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "billing_records_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "billing_usage_snapshots" (
    "id" TEXT NOT NULL,
    "provider" "BillingProvider" NOT NULL,
    "integration_id" TEXT NOT NULL,
    "source_key" TEXT NOT NULL,
    "captured_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "period_start" TIMESTAMP(3),
    "period_end" TIMESTAMP(3),
    "metrics" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "billing_usage_snapshots_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "billing_recurring_costs" (
    "id" TEXT NOT NULL,
    "provider" "BillingProvider" NOT NULL,
    "integration_id" TEXT,
    "name" TEXT NOT NULL,
    "amount" DECIMAL(20,6) NOT NULL,
    "currency" TEXT NOT NULL,
    "interval" "BillingRecurringInterval" NOT NULL,
    "day_of_month" INTEGER,
    "starts_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ends_at" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "billing_recurring_costs_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "billing_integrations_source_key_key" ON "billing_integrations"("source_key");

-- CreateIndex
CREATE INDEX "billing_integrations_provider_idx" ON "billing_integrations"("provider");

-- CreateIndex
CREATE INDEX "billing_import_runs_integration_id_idx" ON "billing_import_runs"("integration_id");

-- CreateIndex
CREATE INDEX "billing_import_runs_status_idx" ON "billing_import_runs"("status");

-- CreateIndex
CREATE UNIQUE INDEX "billing_records_source_key_key" ON "billing_records"("source_key");

-- CreateIndex
CREATE INDEX "billing_records_provider_occurred_at_idx" ON "billing_records"("provider", "occurred_at");

-- CreateIndex
CREATE INDEX "billing_records_integration_id_occurred_at_idx" ON "billing_records"("integration_id", "occurred_at");

-- CreateIndex
CREATE UNIQUE INDEX "billing_usage_snapshots_source_key_key" ON "billing_usage_snapshots"("source_key");

-- CreateIndex
CREATE INDEX "billing_usage_snapshots_provider_captured_at_idx" ON "billing_usage_snapshots"("provider", "captured_at");

-- CreateIndex
CREATE INDEX "billing_usage_snapshots_integration_id_captured_at_idx" ON "billing_usage_snapshots"("integration_id", "captured_at");

-- CreateIndex
CREATE INDEX "billing_recurring_costs_provider_idx" ON "billing_recurring_costs"("provider");

-- CreateIndex
CREATE INDEX "billing_recurring_costs_integration_id_idx" ON "billing_recurring_costs"("integration_id");

-- AddForeignKey
ALTER TABLE "billing_integrations" ADD CONSTRAINT "billing_integrations_cloudflare_account_id_fkey" FOREIGN KEY ("cloudflare_account_id") REFERENCES "CloudflareAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "billing_import_runs" ADD CONSTRAINT "billing_import_runs_integration_id_fkey" FOREIGN KEY ("integration_id") REFERENCES "billing_integrations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "billing_records" ADD CONSTRAINT "billing_records_integration_id_fkey" FOREIGN KEY ("integration_id") REFERENCES "billing_integrations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "billing_usage_snapshots" ADD CONSTRAINT "billing_usage_snapshots_integration_id_fkey" FOREIGN KEY ("integration_id") REFERENCES "billing_integrations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "billing_recurring_costs" ADD CONSTRAINT "billing_recurring_costs_integration_id_fkey" FOREIGN KEY ("integration_id") REFERENCES "billing_integrations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

