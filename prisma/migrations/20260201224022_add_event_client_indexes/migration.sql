-- CreateIndex
CREATE INDEX "Client_pwa_id_idx" ON "Client"("pwa_id");

-- CreateIndex
CREATE INDEX "Event_event_type_event_time_idx" ON "Event"("event_type", "event_time");

-- CreateIndex
CREATE INDEX "Event_client_id_event_time_idx" ON "Event"("client_id", "event_time");

