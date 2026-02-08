-- AlterTable
ALTER TABLE "CloudflareAccount" ADD COLUMN     "saas_zone_id" TEXT,
ADD COLUMN     "saas_zone_name" TEXT,
ADD COLUMN     "saas_target_host" TEXT;

-- CreateTable
CREATE TABLE "CloudflareCustomHostname" (
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
CREATE UNIQUE INDEX "CloudflareCustomHostname_cloudflare_id_key" ON "CloudflareCustomHostname"("cloudflare_id");

-- CreateIndex
CREATE UNIQUE INDEX "CloudflareCustomHostname_domain_id_key" ON "CloudflareCustomHostname"("domain_id");

-- CreateIndex
CREATE INDEX "CloudflareCustomHostname_hostname_idx" ON "CloudflareCustomHostname"("hostname");

-- AddForeignKey
ALTER TABLE "CloudflareCustomHostname" ADD CONSTRAINT "CloudflareCustomHostname_domain_id_fkey" FOREIGN KEY ("domain_id") REFERENCES "Domain"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CloudflareCustomHostname" ADD CONSTRAINT "CloudflareCustomHostname_cloudflare_account_id_fkey" FOREIGN KEY ("cloudflare_account_id") REFERENCES "CloudflareAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;
