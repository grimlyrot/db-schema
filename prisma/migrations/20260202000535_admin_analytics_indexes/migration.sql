-- CreateTable
CREATE TABLE "EventDailyAggregate" (
    "date" DATE NOT NULL,
    "pwa_id" TEXT NOT NULL,
    "uniques" INTEGER NOT NULL,
    "visits" INTEGER NOT NULL,
    "installs" INTEGER NOT NULL,
    "opens" INTEGER NOT NULL,
    "registrations" INTEGER NOT NULL,
    "deposits" INTEGER NOT NULL,

    CONSTRAINT "EventDailyAggregate_pkey" PRIMARY KEY ("pwa_id", "date")
);

-- CreateIndex
CREATE INDEX "EventDailyAggregate_date_idx" ON "EventDailyAggregate"("date");

-- AddForeignKey
ALTER TABLE "EventDailyAggregate" ADD CONSTRAINT "EventDailyAggregate_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- CreateIndex
CREATE INDEX "Pwa_variant_team_id_createdAt_idx" ON "Pwa"("variant", "team_id", "createdAt");

-- CreateIndex
CREATE INDEX "Pwa_variant_org_id_createdAt_idx" ON "Pwa"("variant", "org_id", "createdAt");

-- CreateIndex
CREATE INDEX "Pwa_variant_creator_id_createdAt_idx" ON "Pwa"("variant", "creator_id", "createdAt");

-- CreateIndex
CREATE INDEX "Pwa_variant_status_createdAt_idx" ON "Pwa"("variant", "status", "createdAt");

-- CreateIndex
CREATE INDEX "Push_org_id_idx" ON "Push"("org_id");

-- CreateIndex
CREATE INDEX "Push_is_active_createdAt_idx" ON "Push"("is_active", "createdAt");

-- CreateIndex
CREATE INDEX "PushFilter_geo_idx" ON "PushFilter" USING GIN ("geo");
