-- CreateEnum
CREATE TYPE "AllowedOS" AS ENUM ('ANDROID_ONLY', 'MOBILE_ONLY', 'ALL_PLATFORMS');

-- CreateEnum
CREATE TYPE "GeoFilterMode" AS ENUM ('OFF', 'WHITELIST', 'BLACKLIST');

-- CreateEnum
CREATE TYPE "DeniedAccessAction" AS ENUM ('REDIRECT_URL', 'BLANK_PAGE');

-- AlterTable
ALTER TABLE "CloakSettings" ADD COLUMN     "allowed_os" "AllowedOS" NOT NULL DEFAULT 'ANDROID_ONLY',
ADD COLUMN     "geo_countries" "Country"[] DEFAULT ARRAY[]::"Country"[],
ADD COLUMN     "geo_filter_mode" "GeoFilterMode" NOT NULL DEFAULT 'OFF';

