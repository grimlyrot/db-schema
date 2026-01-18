-- CreateEnum
CREATE TYPE "OrganizationStatus" AS ENUM ('ACTIVE', 'READ_ONLY', 'FROZEN', 'DELETED');

-- CreateEnum
CREATE TYPE "TeamStatus" AS ENUM ('ACTIVE', 'READ_ONLY', 'FROZEN', 'DELETED');

-- CreateEnum
CREATE TYPE "OrgMembershipStatus" AS ENUM ('WAITLIST', 'INVITED', 'ACTIVE', 'READ_ONLY', 'SUSPENDED');

-- CreateEnum
CREATE TYPE "TeamMembershipStatus" AS ENUM ('INVITED', 'ACTIVE', 'READ_ONLY', 'SUSPENDED');

-- CreateEnum
CREATE TYPE "RoleScope" AS ENUM ('APP', 'ORG', 'TEAM');

-- CreateEnum
CREATE TYPE "InviteStatus" AS ENUM ('PENDING', 'ACCEPTED', 'EXPIRED', 'REVOKED');

-- CreateEnum
CREATE TYPE "JoinRequestStatus" AS ENUM ('PENDING', 'APPROVED', 'REJECTED', 'CANCELED');

-- EnableExtensions
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- DropForeignKey
ALTER TABLE "team_roles" DROP CONSTRAINT "team_roles_teamId_fkey";

-- DropForeignKey
ALTER TABLE "team_roles" DROP CONSTRAINT "team_roles_userId_fkey";

-- AlterTable
ALTER TABLE "Push" ADD COLUMN     "org_id" TEXT,
ADD COLUMN     "team_id" TEXT;

-- AlterTable
ALTER TABLE "Pwa" ADD COLUMN     "org_id" TEXT,
ADD COLUMN     "team_id" TEXT;

-- AlterTable
ALTER TABLE "team_roles" RENAME COLUMN "teamId" TO "team_id";

-- AlterTable
ALTER TABLE "team_roles" RENAME COLUMN "userId" TO "user_id";

-- AlterTable
ALTER TABLE "team_roles" ADD COLUMN     "org_membership_id" TEXT,
ADD COLUMN     "status" "TeamMembershipStatus" NOT NULL DEFAULT 'ACTIVE',
ALTER COLUMN "role" SET DEFAULT 'MEMBER';

-- AlterTable
ALTER TABLE "teams" ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "org_id" TEXT,
ADD COLUMN     "status" "TeamStatus" NOT NULL DEFAULT 'ACTIVE';

-- AlterTable
ALTER TABLE "users" DROP COLUMN "role";

-- DropEnum
DROP TYPE "Role";

-- CreateTable
CREATE TABLE "audit_logs" (
    "id" TEXT NOT NULL,
    "actor_user_id" TEXT,
    "org_id" TEXT,
    "team_id" TEXT,
    "action" TEXT NOT NULL,
    "entity_type" TEXT NOT NULL,
    "entity_id" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "audit_logs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "invites" (
    "id" TEXT NOT NULL,
    "email" TEXT,
    "token" TEXT NOT NULL,
    "scope" "RoleScope" NOT NULL,
    "org_id" TEXT,
    "team_id" TEXT,
    "status" "InviteStatus" NOT NULL DEFAULT 'PENDING',
    "invited_by_id" TEXT,
    "accepted_by_id" TEXT,
    "expires_at" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "invites_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "join_requests" (
    "id" TEXT NOT NULL,
    "email" TEXT,
    "user_id" TEXT,
    "org_id" TEXT NOT NULL,
    "team_id" TEXT,
    "status" "JoinRequestStatus" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "join_requests_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "organizations" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "status" "OrganizationStatus" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "organizations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "org_memberships" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "org_id" TEXT NOT NULL,
    "status" "OrgMembershipStatus" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "org_memberships_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissions" (
    "id" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "description" TEXT,
    "scope" "RoleScope" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" TEXT NOT NULL,
    "scope" "RoleScope" NOT NULL,
    "org_id" TEXT,
    "team_id" TEXT,
    "name" TEXT NOT NULL,
    "is_system" BOOLEAN NOT NULL DEFAULT false,
    "is_protected" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role_permissions" (
    "role_id" TEXT NOT NULL,
    "permission_id" TEXT NOT NULL,

    CONSTRAINT "role_permissions_pkey" PRIMARY KEY ("role_id","permission_id")
);

-- CreateTable
CREATE TABLE "org_member_roles" (
    "org_membership_id" TEXT NOT NULL,
    "role_id" TEXT NOT NULL,

    CONSTRAINT "org_member_roles_pkey" PRIMARY KEY ("org_membership_id","role_id")
);

-- CreateTable
CREATE TABLE "team_member_roles" (
    "team_membership_id" TEXT NOT NULL,
    "role_id" TEXT NOT NULL,

    CONSTRAINT "team_member_roles_pkey" PRIMARY KEY ("team_membership_id","role_id")
);

-- CreateTable
CREATE TABLE "user_permission_overrides" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "permission_id" TEXT NOT NULL,
    "scope" "RoleScope" NOT NULL,
    "org_id" TEXT,
    "team_id" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_permission_overrides_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "push_target_pwas" (
    "push_id" TEXT NOT NULL,
    "pwa_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "push_target_pwas_pkey" PRIMARY KEY ("push_id","pwa_id")
);

-- DataMigration
CREATE TEMP TABLE "tmp_authz_users" AS
SELECT "id" AS "user_id" FROM "users";

INSERT INTO "organizations" ("id", "name", "status", "createdAt", "updatedAt")
SELECT CONCAT('org_user_', "user_id"), CONCAT('Personal Org - ', "user_id"), 'ACTIVE', NOW(), NOW()
FROM "tmp_authz_users"
ON CONFLICT ("id") DO NOTHING;

INSERT INTO "org_memberships" ("id", "user_id", "org_id", "status", "createdAt", "updatedAt")
SELECT gen_random_uuid()::text, "user_id", CONCAT('org_user_', "user_id"), 'ACTIVE', NOW(), NOW()
FROM "tmp_authz_users" u
WHERE NOT EXISTS (
  SELECT 1 FROM "org_memberships" om WHERE om."user_id" = u."user_id" AND om."org_id" = CONCAT('org_user_', u."user_id")
);

INSERT INTO "teams" ("id", "name", "org_id", "createdAt", "updatedAt", "status")
SELECT CONCAT('team_user_', "user_id"), CONCAT('Personal Team - ', "user_id"), CONCAT('org_user_', "user_id"), NOW(), NOW(), 'ACTIVE'
FROM "tmp_authz_users"
ON CONFLICT ("id") DO NOTHING;

INSERT INTO "team_roles" ("id", "role", "user_id", "team_id", "org_membership_id", "status", "createdAt", "updatedAt")
SELECT gen_random_uuid()::text, 'OWNER', u."user_id", CONCAT('team_user_', u."user_id"), om."id", 'ACTIVE', NOW(), NOW()
FROM "tmp_authz_users" u
JOIN "org_memberships" om ON om."user_id" = u."user_id" AND om."org_id" = CONCAT('org_user_', u."user_id")
LEFT JOIN "team_roles" tr ON tr."user_id" = u."user_id" AND tr."team_id" = CONCAT('team_user_', u."user_id")
WHERE tr."id" IS NULL;

CREATE TEMP TABLE "tmp_team_owner" AS
SELECT tr."team_id", MIN(tr."user_id") AS "owner_user_id"
FROM "team_roles" tr
GROUP BY tr."team_id";

UPDATE "teams" t
SET "org_id" = CONCAT('org_user_', o."owner_user_id")
FROM "tmp_team_owner" o
WHERE t."id" = o."team_id" AND t."org_id" IS NULL;

INSERT INTO "org_memberships" ("id", "user_id", "org_id", "status", "createdAt", "updatedAt")
SELECT gen_random_uuid()::text, tr."user_id", CONCAT('org_user_', o."owner_user_id"), 'ACTIVE', NOW(), NOW()
FROM "team_roles" tr
JOIN "tmp_team_owner" o ON o."team_id" = tr."team_id"
LEFT JOIN "org_memberships" om ON om."user_id" = tr."user_id" AND om."org_id" = CONCAT('org_user_', o."owner_user_id")
WHERE om."id" IS NULL;

UPDATE "team_roles" tr
SET "org_membership_id" = om."id"
FROM "tmp_team_owner" o, "org_memberships" om
WHERE tr."team_id" = o."team_id"
  AND om."user_id" = tr."user_id"
  AND om."org_id" = CONCAT('org_user_', o."owner_user_id")
  AND tr."org_membership_id" IS NULL;

INSERT INTO "organizations" ("id", "name", "status", "createdAt", "updatedAt")
VALUES ('org_orphan_teams', 'Orphan Teams', 'ACTIVE', NOW(), NOW())
ON CONFLICT ("id") DO NOTHING;

UPDATE "teams" SET "org_id" = 'org_orphan_teams' WHERE "org_id" IS NULL;

CREATE TEMP TABLE "tmp_primary_team" AS
SELECT "user_id", MIN("team_id") AS "team_id"
FROM "team_roles"
GROUP BY "user_id";

UPDATE "Pwa" p
SET "team_id" = t."team_id",
    "org_id" = tm."org_id"
FROM "tmp_primary_team" t
JOIN "teams" tm ON tm."id" = t."team_id"
WHERE p."creator_id" = t."user_id"
  AND (p."org_id" IS NULL OR p."team_id" IS NULL);

CREATE TEMP TABLE "tmp_push_team" AS
SELECT pf."push_id",
       MIN(p."team_id") AS "team_id",
       COUNT(DISTINCT p."team_id") AS "team_count"
FROM "PushFilter" pf
JOIN unnest(pf."pwa_ids") AS "pwa_id" ON TRUE
JOIN "Pwa" p ON p."id" = "pwa_id"
GROUP BY pf."push_id";

UPDATE "Push" p
SET "team_id" = t."team_id",
    "org_id" = tm."org_id"
FROM "tmp_push_team" t
JOIN "teams" tm ON tm."id" = t."team_id"
WHERE p."id" = t."push_id"
  AND t."team_count" = 1
  AND (p."org_id" IS NULL OR p."team_id" IS NULL);

UPDATE "Push" p
SET "team_id" = t."team_id",
    "org_id" = tm."org_id"
FROM "tmp_primary_team" t
JOIN "teams" tm ON tm."id" = t."team_id"
WHERE p."author_id" = t."user_id"
  AND (p."org_id" IS NULL OR p."team_id" IS NULL);

INSERT INTO "push_target_pwas" ("push_id", "pwa_id")
SELECT pf."push_id", "pwa_id"
FROM "PushFilter" pf, unnest(pf."pwa_ids") AS "pwa_id"
ON CONFLICT DO NOTHING;

DROP TABLE "tmp_push_team";
DROP TABLE "tmp_primary_team";
DROP TABLE "tmp_team_owner";
DROP TABLE "tmp_authz_users";

ALTER TABLE "teams" ALTER COLUMN "org_id" SET NOT NULL;
ALTER TABLE "team_roles" ALTER COLUMN "org_membership_id" SET NOT NULL;
ALTER TABLE "Pwa" ALTER COLUMN "org_id" SET NOT NULL;
ALTER TABLE "Pwa" ALTER COLUMN "team_id" SET NOT NULL;
ALTER TABLE "Push" ALTER COLUMN "org_id" SET NOT NULL;
ALTER TABLE "Push" ALTER COLUMN "team_id" SET NOT NULL;

-- CreateIndex
CREATE INDEX "audit_logs_org_id_idx" ON "audit_logs"("org_id");

-- CreateIndex
CREATE INDEX "audit_logs_team_id_idx" ON "audit_logs"("team_id");

-- CreateIndex
CREATE UNIQUE INDEX "invites_token_key" ON "invites"("token");

-- CreateIndex
CREATE INDEX "invites_org_id_idx" ON "invites"("org_id");

-- CreateIndex
CREATE INDEX "invites_team_id_idx" ON "invites"("team_id");

-- CreateIndex
CREATE INDEX "join_requests_org_id_idx" ON "join_requests"("org_id");

-- CreateIndex
CREATE INDEX "join_requests_team_id_idx" ON "join_requests"("team_id");

-- CreateIndex
CREATE INDEX "org_memberships_org_id_idx" ON "org_memberships"("org_id");

-- CreateIndex
CREATE UNIQUE INDEX "org_memberships_user_id_org_id_key" ON "org_memberships"("user_id", "org_id");

-- CreateIndex
CREATE UNIQUE INDEX "permissions_key_key" ON "permissions"("key");

-- CreateIndex
CREATE INDEX "roles_org_id_idx" ON "roles"("org_id");

-- CreateIndex
CREATE INDEX "roles_team_id_idx" ON "roles"("team_id");

-- CreateIndex
CREATE UNIQUE INDEX "roles_scope_org_id_team_id_name_key" ON "roles"("scope", "org_id", "team_id", "name");

-- CreateIndex
CREATE INDEX "user_permission_overrides_org_id_idx" ON "user_permission_overrides"("org_id");

-- CreateIndex
CREATE INDEX "user_permission_overrides_team_id_idx" ON "user_permission_overrides"("team_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_permission_overrides_user_id_permission_id_scope_org_i_key" ON "user_permission_overrides"("user_id", "permission_id", "scope", "org_id", "team_id");

-- CreateIndex
CREATE INDEX "Push_team_id_idx" ON "Push"("team_id");

-- CreateIndex
CREATE INDEX "Push_author_id_idx" ON "Push"("author_id");

-- CreateIndex
CREATE INDEX "Pwa_team_id_idx" ON "Pwa"("team_id");

-- CreateIndex
CREATE INDEX "push_target_pwas_pwa_id_idx" ON "push_target_pwas"("pwa_id");

-- CreateIndex
CREATE INDEX "team_roles_team_id_idx" ON "team_roles"("team_id");

-- CreateIndex
CREATE INDEX "team_roles_org_membership_id_idx" ON "team_roles"("org_membership_id");

-- CreateIndex
CREATE UNIQUE INDEX "team_roles_user_id_team_id_key" ON "team_roles"("user_id", "team_id");

-- CreateIndex
CREATE INDEX "teams_org_id_idx" ON "teams"("org_id");

-- AddForeignKey
ALTER TABLE "audit_logs" ADD CONSTRAINT "audit_logs_actor_user_id_fkey" FOREIGN KEY ("actor_user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "audit_logs" ADD CONSTRAINT "audit_logs_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "audit_logs" ADD CONSTRAINT "audit_logs_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "invites" ADD CONSTRAINT "invites_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "invites" ADD CONSTRAINT "invites_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "invites" ADD CONSTRAINT "invites_invited_by_id_fkey" FOREIGN KEY ("invited_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "invites" ADD CONSTRAINT "invites_accepted_by_id_fkey" FOREIGN KEY ("accepted_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "join_requests" ADD CONSTRAINT "join_requests_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "join_requests" ADD CONSTRAINT "join_requests_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "join_requests" ADD CONSTRAINT "join_requests_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "org_memberships" ADD CONSTRAINT "org_memberships_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "org_memberships" ADD CONSTRAINT "org_memberships_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teams" ADD CONSTRAINT "teams_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_roles" ADD CONSTRAINT "team_roles_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_roles" ADD CONSTRAINT "team_roles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_roles" ADD CONSTRAINT "team_roles_org_membership_id_fkey" FOREIGN KEY ("org_membership_id") REFERENCES "org_memberships"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Push" ADD CONSTRAINT "Push_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Push" ADD CONSTRAINT "Push_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pwa" ADD CONSTRAINT "Pwa_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pwa" ADD CONSTRAINT "Pwa_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "push_target_pwas" ADD CONSTRAINT "push_target_pwas_push_id_fkey" FOREIGN KEY ("push_id") REFERENCES "Push"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "push_target_pwas" ADD CONSTRAINT "push_target_pwas_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "roles" ADD CONSTRAINT "roles_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "roles" ADD CONSTRAINT "roles_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_permissions" ADD CONSTRAINT "role_permissions_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_permissions" ADD CONSTRAINT "role_permissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "permissions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "org_member_roles" ADD CONSTRAINT "org_member_roles_org_membership_id_fkey" FOREIGN KEY ("org_membership_id") REFERENCES "org_memberships"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "org_member_roles" ADD CONSTRAINT "org_member_roles_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_member_roles" ADD CONSTRAINT "team_member_roles_team_membership_id_fkey" FOREIGN KEY ("team_membership_id") REFERENCES "team_roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_member_roles" ADD CONSTRAINT "team_member_roles_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_permission_overrides" ADD CONSTRAINT "user_permission_overrides_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_permission_overrides" ADD CONSTRAINT "user_permission_overrides_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "permissions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_permission_overrides" ADD CONSTRAINT "user_permission_overrides_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_permission_overrides" ADD CONSTRAINT "user_permission_overrides_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("id") ON DELETE SET NULL ON UPDATE CASCADE;
