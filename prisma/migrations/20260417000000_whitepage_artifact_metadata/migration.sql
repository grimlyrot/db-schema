-- Create whitepage_artifacts table with metadata fields (no R2 storage)
CREATE TABLE "whitepage_artifacts" (
  "id"             TEXT NOT NULL,
  "pwa_id"         TEXT NOT NULL,
  "correlation_id" TEXT NOT NULL,
  "play_url"       TEXT NOT NULL,
  "title"          TEXT NOT NULL,
  "description"    TEXT NOT NULL,
  "icon_url"       TEXT NOT NULL,
  "screenshots"    TEXT[] NOT NULL DEFAULT '{}',
  "createdAt"      TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT "whitepage_artifacts_pkey" PRIMARY KEY ("id")
);

CREATE INDEX "whitepage_artifacts_pwa_id_idx" ON "whitepage_artifacts"("pwa_id");

ALTER TABLE "whitepage_artifacts"
  ADD CONSTRAINT "whitepage_artifacts_pwa_id_fkey"
  FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id")
  ON UPDATE CASCADE ON DELETE CASCADE;

-- Add generated whitepage metadata to CloakSettings (populated on generation, read by Worker via Edge Config)
ALTER TABLE "CloakSettings" ADD COLUMN "generated_whitepage" JSONB;
