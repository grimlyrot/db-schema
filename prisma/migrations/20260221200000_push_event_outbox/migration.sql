-- Push event outbox for durable admin -> push ingress delivery.

-- CreateEnum
DO $$
BEGIN
  CREATE TYPE "PushEventOutboxChannel" AS ENUM ('PUSH', 'CLIENT');
EXCEPTION
  WHEN duplicate_object THEN NULL;
END$$;

-- CreateEnum
DO $$
BEGIN
  CREATE TYPE "PushEventOutboxOp" AS ENUM ('INSERT', 'UPDATE', 'DELETE');
EXCEPTION
  WHEN duplicate_object THEN NULL;
END$$;

-- CreateEnum
DO $$
BEGIN
  CREATE TYPE "PushEventOutboxStatus" AS ENUM ('PENDING', 'SENT');
EXCEPTION
  WHEN duplicate_object THEN NULL;
END$$;

-- CreateTable
CREATE TABLE IF NOT EXISTS "push_event_outbox" (
  "id" TEXT NOT NULL,
  "dedupe_key" TEXT NOT NULL,
  "channel" "PushEventOutboxChannel" NOT NULL,
  "op" "PushEventOutboxOp" NOT NULL,
  "entity_id" TEXT NOT NULL,
  "payload" JSONB NOT NULL,
  "status" "PushEventOutboxStatus" NOT NULL DEFAULT 'PENDING',
  "attempts" INTEGER NOT NULL DEFAULT 0,
  "next_attempt_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "processed_at" TIMESTAMP(3),
  "last_error" TEXT,
  "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "push_event_outbox_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX IF NOT EXISTS "push_event_outbox_dedupe_key_key"
  ON "push_event_outbox"("dedupe_key");

-- CreateIndex
CREATE INDEX IF NOT EXISTS "push_event_outbox_status_next_attempt_at_idx"
  ON "push_event_outbox"("status", "next_attempt_at");

-- CreateIndex
CREATE INDEX IF NOT EXISTS "push_event_outbox_channel_status_next_attempt_at_idx"
  ON "push_event_outbox"("channel", "status", "next_attempt_at");

-- CreateIndex
CREATE INDEX IF NOT EXISTS "push_event_outbox_entity_id_channel_idx"
  ON "push_event_outbox"("entity_id", "channel");
