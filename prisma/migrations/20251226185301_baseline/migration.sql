-- CreateEnum
CREATE TYPE "PixelType" AS ENUM ('FACEBOOK', 'TIKTOK', 'GOOGLE', 'BIGO');

-- CreateEnum
CREATE TYPE "Status" AS ENUM ('ACTIVE', 'DRAFT', 'STOPPED');

-- CreateEnum
CREATE TYPE "AgeRating" AS ENUM ('THREE', 'SEVEN', 'TWELVE', 'SIXTEEN', 'EIGHTEEN');

-- CreateEnum
CREATE TYPE "Category" AS ENUM ('GAMBLING', 'BETTING', 'CRYPTO', 'FINANCE', 'DATING', 'NUTRA');

-- CreateEnum
CREATE TYPE "PwaTag" AS ENUM ('NUMBER_ONE_IN_CASINO_CATEGORY', 'MOBILE_CASINO', 'CLASSIC_SLOTS', 'NEW_GAMES', 'COMPETITIONS', 'FREE_SPINS', 'REAL_WINNINGS', 'CASINO_STRATEGIES', 'FAST_PAYOUTS', 'SECURE_PAYMENTS', 'SUPPORT_24_7', 'POPULAR_SLOTS', 'BEST_CHOICE', 'LIVE_DEALER', 'BLACKJACK_MASTER', 'ROULETTE_KING', 'BONUSES_AND_PROMOTIONS', 'JACKPOTS', 'VIDEO_POKER', 'VIP_CLUB');

-- CreateEnum
CREATE TYPE "StoreCategory" AS ENUM ('APPLICATION', 'ART_DESIGN', 'AUTO_VEHICLES', 'BEAUTY', 'BOOKS_REFERENCE', 'BUSINESS', 'COMICS', 'COMMUNICATION', 'DATING', 'EDUCATION', 'ENTERTAINMENT', 'EVENTS', 'FINANCE', 'FOOD_DRINK', 'HEALTH_FITNESS', 'HOUSE_HOME', 'LIBRARIES_DEMO', 'LIFESTYLE', 'APP_WALLPAPER', 'MAPS_NAVIGATION', 'MEDIA_VIDEO', 'MEDICAL', 'MUSIC_AUDIO', 'NEWS_MAGAZINES', 'PARENTING', 'PERSONALIZATION', 'PHOTOGRAPHY', 'PRODUCTIVITY', 'SHOPPING', 'SOCIAL', 'SPORTS', 'TOOLS', 'TRANSPORTATION', 'TRAVEL_LOCAL', 'VIDEO_PLAYERS_EDITORS', 'WEATHER', 'APP_WIDGETS', 'GAME', 'FAMILY', 'FAMILY_ACTION_ADVENTURE', 'FAMILY_BRAIN_GAMES', 'FAMILY_CREATIVITY', 'FAMILY_EDUCATION', 'FAMILY_MUSIC_VIDEO', 'FAMILY_PRETEND_PLAY', 'ACTION', 'ADVENTURE', 'ARCADE', 'BOARD', 'CARD', 'CASINO', 'CASUAL', 'EDUCATIONAL', 'MUSIC', 'PUZZLE', 'RACING', 'ROLE_PLAYING', 'SIMULATION', 'SPORTS_GAMES', 'STRATEGY', 'TRIVIA', 'WORD');

-- CreateEnum
CREATE TYPE "EventType" AS ENUM ('VISIT', 'INSTALL', 'OPEN', 'FIRST_OPEN', 'PUSH_SUBSCRIPTON', 'PUSH_OPEN', 'REGISTRATION', 'FIRST_DEPOSIT', 'DEPOSIT');

-- CreateEnum
CREATE TYPE "EventRepeatStrategy" AS ENUM ('NONE', 'FIXED_INTERVAL');

-- CreateEnum
CREATE TYPE "FacebookEvent" AS ENUM ('AddPaymentInfo', 'AddToCart', 'AddToWishlist', 'CompleteRegistration', 'Contact', 'CustomizeProduct', 'Donate', 'FindLocation', 'InitiateCheckout', 'Lead', 'Purchase', 'Schedule', 'Search', 'StartTrial', 'SubmitApplication', 'Subscribe', 'ViewContent');

-- CreateEnum
CREATE TYPE "Language" AS ENUM ('EN', 'FR', 'IT', 'DE', 'ES', 'RU', 'HU', 'AZ', 'AR', 'PT', 'EL', 'BG', 'CS', 'DA', 'ET', 'FI', 'JA', 'KO', 'LT', 'LV', 'NO', 'PL', 'SK', 'SL', 'SV', 'UK', 'VI', 'ZH', 'NL', 'RO', 'TR');

-- CreateEnum
CREATE TYPE "Country" AS ENUM ('AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'As', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW');

-- CreateEnum
CREATE TYPE "RedirectType" AS ENUM ('BUILD_IN', 'CUSTOM');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('ACTIVE', 'INACTIVE', 'SUSPENDED');

-- CreateEnum
CREATE TYPE "PushType" AS ENUM ('ONE_TIME', 'RECURRING');

-- CreateEnum
CREATE TYPE "PushWeekday" AS ENUM ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY');

-- CreateEnum
CREATE TYPE "RegistrationFilter" AS ENUM ('EVERYONE', 'REGISTERED', 'UNREGISTERED');

-- CreateEnum
CREATE TYPE "DepositFilter" AS ENUM ('EVERYONE', 'DEPOSITED', 'NOT_DEPOSITED');

-- CreateEnum
CREATE TYPE "PwaFilter" AS ENUM ('ALL', 'SPECIFIC');

-- CreateEnum
CREATE TYPE "GeoFilter" AS ENUM ('ALL', 'SPECIFIC');

-- CreateEnum
CREATE TYPE "Method" AS ENUM ('GET', 'POST');

-- CreateEnum
CREATE TYPE "Variant" AS ENUM ('MAIN', 'SHADOW');

-- CreateEnum
CREATE TYPE "TeamRole" AS ENUM ('OWNER', 'ADMIN', 'MEMBER');

-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN');

-- CreateTable
CREATE TABLE "accounts" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "provider_account_id" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,

    CONSTRAINT "accounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sessions" (
    "id" TEXT NOT NULL,
    "session_token" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "sessions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Client" (
    "id" TEXT NOT NULL,
    "country" "Country",
    "city" TEXT,
    "language" "Language" NOT NULL DEFAULT 'EN',
    "os" TEXT,
    "device_model" TEXT,
    "registration" BOOLEAN NOT NULL DEFAULT false,
    "deposit" BOOLEAN NOT NULL DEFAULT false,
    "click_date" TIMESTAMP(3) NOT NULL,
    "user_status" "UserStatus" NOT NULL,
    "source_id" INTEGER,
    "sub1" TEXT,
    "sub2" TEXT,
    "sub3" TEXT,
    "sub4" TEXT,
    "sub5" TEXT,
    "sub6" TEXT,
    "sub7" TEXT,
    "sub8" TEXT,
    "sub9" TEXT,
    "sub10" TEXT,
    "fbclid" TEXT,
    "fb_gen_mail" TEXT,
    "ip" TEXT,
    "ua" TEXT,
    "previous_client_id" TEXT,
    "pwa_id" TEXT NOT NULL,

    CONSTRAINT "Client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Event" (
    "id" TEXT NOT NULL,
    "event_type" "EventType" NOT NULL,
    "event_time" TIMESTAMP(3) NOT NULL,
    "payload" TEXT,
    "client_id" TEXT NOT NULL,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pixel" (
    "id" TEXT NOT NULL,
    "type" "PixelType" NOT NULL,

    CONSTRAINT "Pixel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FacebookPixel" (
    "id" TEXT NOT NULL,
    "accessToken" TEXT NOT NULL,

    CONSTRAINT "FacebookPixel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Mapping" (
    "id" SERIAL NOT NULL,
    "facebook_pixel_id" TEXT NOT NULL,
    "key" "EventType" NOT NULL,
    "value" "FacebookEvent" NOT NULL,

    CONSTRAINT "Mapping_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TiktokPixel" (
    "id" TEXT NOT NULL,
    "accessToken" TEXT NOT NULL,

    CONSTRAINT "TiktokPixel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GoogleTag" (
    "id" TEXT NOT NULL,
    "placeholder1" TEXT,
    "placeholder2" TEXT,

    CONSTRAINT "GoogleTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BigoPixel" (
    "id" TEXT NOT NULL,
    "appId" TEXT NOT NULL,
    "appKey" TEXT NOT NULL,

    CONSTRAINT "BigoPixel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subscription" (
    "endpoint" TEXT NOT NULL,
    "expiration_time" TIMESTAMP(3),
    "p256dh" TEXT NOT NULL,
    "auth" TEXT NOT NULL,
    "client_id" TEXT NOT NULL,
    "pwa_id" TEXT NOT NULL,

    CONSTRAINT "Subscription_pkey" PRIMARY KEY ("client_id","pwa_id")
);

-- CreateTable
CREATE TABLE "Image" (
    "id" TEXT NOT NULL,
    "asset_id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "public_id" TEXT NOT NULL,
    "pwaId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PushContent" (
    "id" TEXT NOT NULL,
    "iconId" TEXT,
    "imageId" TEXT,
    "pushId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PushContent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PushContentTranslation" (
    "id" TEXT NOT NULL,
    "language" "Language" NOT NULL,
    "title" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "pushContentId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PushContentTranslation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PushFilter" (
    "id" TEXT NOT NULL,
    "registration_filter" "RegistrationFilter" NOT NULL,
    "deposit_filter" "DepositFilter" NOT NULL,
    "pwa_filter" "PwaFilter" NOT NULL,
    "pwa_ids" TEXT[],
    "geo_filter" "GeoFilter" NOT NULL,
    "geo" "Country"[],
    "push_id" TEXT NOT NULL,

    CONSTRAINT "PushFilter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Push" (
    "id" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "name" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "url" TEXT,
    "time_after_event" INTEGER,
    "event_type" "EventType",
    "event_repeat_strategy" "EventRepeatStrategy",
    "event_repeat_count" INTEGER,
    "event_repeat_interval_min" INTEGER,
    "stop_on_event" "EventType",
    "stop_on_event_window_min" INTEGER,
    "push_type" "PushType" NOT NULL,
    "date_time" TIMESTAMP(3),
    "send_time" TEXT[],
    "pushWeekdays" "PushWeekday"[],
    "entire_time" BOOLEAN NOT NULL DEFAULT false,
    "start_date" TIMESTAMP(3),
    "end_date" TIMESTAMP(3),
    "author_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Push_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vapid" (
    "id" TEXT NOT NULL,
    "publicKey" TEXT NOT NULL,
    "privateKey" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "pwa_id" TEXT NOT NULL,

    CONSTRAINT "vapid_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CloakSettings" (
    "id" TEXT NOT NULL,
    "android_only" BOOLEAN NOT NULL DEFAULT false,
    "block_vpn_tor_hosting" BOOLEAN NOT NULL DEFAULT false,
    "block_proxy" BOOLEAN NOT NULL DEFAULT false,
    "trafficback_for_all" BOOLEAN NOT NULL DEFAULT false,
    "trafficback_for_not_android" BOOLEAN NOT NULL DEFAULT false,
    "pixel_as_img" BOOLEAN NOT NULL DEFAULT false,
    "pixel_in_white_page" BOOLEAN NOT NULL DEFAULT false,
    "redirect_type" "RedirectType" NOT NULL DEFAULT 'CUSTOM',
    "white_page_url" TEXT,
    "pwa_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CloakSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DeveloperContacts" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "website" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "policy" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DeveloperContacts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CloudflareDomain" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "api_key" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "domain_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "account_id" TEXT NOT NULL,

    CONSTRAINT "CloudflareDomain_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NamecheapDomain" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "api_key" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "contact_first_name" TEXT NOT NULL,
    "contact_last_name" TEXT NOT NULL,
    "contact_phone" TEXT NOT NULL,
    "domainId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "contact_address" TEXT NOT NULL,
    "contact_city" TEXT NOT NULL,
    "contact_country" TEXT NOT NULL,
    "contact_postal" TEXT NOT NULL,

    CONSTRAINT "NamecheapDomain_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Domain" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "expires_at" TIMESTAMP(3) NOT NULL,
    "pwa_id" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Domain_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Postback" (
    "id" TEXT NOT NULL,
    "type" "EventType" NOT NULL,
    "url" TEXT NOT NULL,
    "method" "Method" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "pwa_id" TEXT NOT NULL,

    CONSTRAINT "Postback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pwa" (
    "id" TEXT NOT NULL,
    "language" "Language" DEFAULT 'EN',
    "category" "Category" DEFAULT 'GAMBLING',
    "icon" TEXT,
    "name" TEXT,
    "developer_name" TEXT,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "file_size" INTEGER,
    "age_rating" "AgeRating",
    "total_downloads" INTEGER,
    "description" TEXT,
    "tags" "PwaTag"[],
    "creator_id" TEXT NOT NULL,
    "variant" "Variant" NOT NULL DEFAULT 'MAIN',
    "original_pwa_id" TEXT,
    "shadow_pwa_id" TEXT,
    "min_load_time" DOUBLE PRECISION DEFAULT 3000,
    "max_load_time" DOUBLE PRECISION DEFAULT 15000,
    "is_editors_choice" BOOLEAN NOT NULL DEFAULT false,
    "geo" "Country",
    "update_date" TIMESTAMP(3),
    "update_description" TEXT,
    "facebook_domain_verification" TEXT,
    "status" "Status" NOT NULL DEFAULT 'DRAFT',
    "store_category" "StoreCategory",
    "developer_contacts_id" TEXT,
    "push_enabled" BOOLEAN NOT NULL DEFAULT true,
    "rich_ui" BOOLEAN NOT NULL DEFAULT false,
    "theme_changing" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pwa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rating" (
    "id" TEXT NOT NULL,
    "total_rating" DOUBLE PRECISION NOT NULL,
    "total_reviews" INTEGER NOT NULL,
    "five_star_percent" DOUBLE PRECISION NOT NULL,
    "four_star_percent" DOUBLE PRECISION NOT NULL,
    "three_star_percent" DOUBLE PRECISION NOT NULL,
    "two_star_percent" DOUBLE PRECISION NOT NULL,
    "one_star_percent" DOUBLE PRECISION NOT NULL,
    "pwa_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Rating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Review" (
    "id" TEXT NOT NULL,
    "avatar" TEXT,
    "user_name" TEXT NOT NULL,
    "publication_date" TIMESTAMP(3) NOT NULL,
    "rating" INTEGER NOT NULL,
    "likes" INTEGER NOT NULL DEFAULT 0,
    "text" TEXT NOT NULL,
    "reply_user_name" TEXT,
    "reply_date" TIMESTAMP(3),
    "reply_text" TEXT,
    "pwa_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tracker" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "pwa_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Tracker_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'USER',
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "email_verified" TIMESTAMP(3),
    "image" TEXT,
    "image_id" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "team_roles" (
    "id" TEXT NOT NULL,
    "role" "TeamRole" NOT NULL,
    "userId" TEXT NOT NULL,
    "teamId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "team_roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teams" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "teams_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PixelToPwa" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "accounts_provider_provider_account_id_key" ON "accounts"("provider", "provider_account_id");

-- CreateIndex
CREATE UNIQUE INDEX "sessions_session_token_key" ON "sessions"("session_token");

-- CreateIndex
CREATE UNIQUE INDEX "Mapping_facebook_pixel_id_key_key" ON "Mapping"("facebook_pixel_id", "key");

-- CreateIndex
CREATE UNIQUE INDEX "PushContent_pushId_key" ON "PushContent"("pushId");

-- CreateIndex
CREATE UNIQUE INDEX "PushFilter_push_id_key" ON "PushFilter"("push_id");

-- CreateIndex
CREATE UNIQUE INDEX "vapid_pwa_id_key" ON "vapid"("pwa_id");

-- CreateIndex
CREATE UNIQUE INDEX "CloakSettings_pwa_id_key" ON "CloakSettings"("pwa_id");

-- CreateIndex
CREATE UNIQUE INDEX "CloudflareDomain_domain_id_key" ON "CloudflareDomain"("domain_id");

-- CreateIndex
CREATE UNIQUE INDEX "NamecheapDomain_domainId_key" ON "NamecheapDomain"("domainId");

-- CreateIndex
CREATE UNIQUE INDEX "Postback_pwa_id_type_key" ON "Postback"("pwa_id", "type");

-- CreateIndex
CREATE UNIQUE INDEX "Pwa_original_pwa_id_key" ON "Pwa"("original_pwa_id");

-- CreateIndex
CREATE UNIQUE INDEX "Pwa_shadow_pwa_id_key" ON "Pwa"("shadow_pwa_id");

-- CreateIndex
CREATE UNIQUE INDEX "Rating_pwa_id_key" ON "Rating"("pwa_id");

-- CreateIndex
CREATE UNIQUE INDEX "Tracker_pwa_id_key" ON "Tracker"("pwa_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_image_id_key" ON "users"("image_id");

-- CreateIndex
CREATE UNIQUE INDEX "_PixelToPwa_AB_unique" ON "_PixelToPwa"("A", "B");

-- CreateIndex
CREATE INDEX "_PixelToPwa_B_index" ON "_PixelToPwa"("B");

-- AddForeignKey
ALTER TABLE "accounts" ADD CONSTRAINT "accounts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sessions" ADD CONSTRAINT "sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Client" ADD CONSTRAINT "Client_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FacebookPixel" ADD CONSTRAINT "FacebookPixel_id_fkey" FOREIGN KEY ("id") REFERENCES "Pixel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Mapping" ADD CONSTRAINT "Mapping_facebook_pixel_id_fkey" FOREIGN KEY ("facebook_pixel_id") REFERENCES "FacebookPixel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TiktokPixel" ADD CONSTRAINT "TiktokPixel_id_fkey" FOREIGN KEY ("id") REFERENCES "Pixel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GoogleTag" ADD CONSTRAINT "GoogleTag_id_fkey" FOREIGN KEY ("id") REFERENCES "Pixel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BigoPixel" ADD CONSTRAINT "BigoPixel_id_fkey" FOREIGN KEY ("id") REFERENCES "Pixel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_pwaId_fkey" FOREIGN KEY ("pwaId") REFERENCES "Pwa"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PushContent" ADD CONSTRAINT "PushContent_iconId_fkey" FOREIGN KEY ("iconId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PushContent" ADD CONSTRAINT "PushContent_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PushContent" ADD CONSTRAINT "PushContent_pushId_fkey" FOREIGN KEY ("pushId") REFERENCES "Push"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PushContentTranslation" ADD CONSTRAINT "PushContentTranslation_pushContentId_fkey" FOREIGN KEY ("pushContentId") REFERENCES "PushContent"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PushFilter" ADD CONSTRAINT "PushFilter_push_id_fkey" FOREIGN KEY ("push_id") REFERENCES "Push"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Push" ADD CONSTRAINT "Push_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vapid" ADD CONSTRAINT "vapid_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CloakSettings" ADD CONSTRAINT "CloakSettings_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CloudflareDomain" ADD CONSTRAINT "CloudflareDomain_domain_id_fkey" FOREIGN KEY ("domain_id") REFERENCES "Domain"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NamecheapDomain" ADD CONSTRAINT "NamecheapDomain_domainId_fkey" FOREIGN KEY ("domainId") REFERENCES "Domain"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Domain" ADD CONSTRAINT "Domain_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Postback" ADD CONSTRAINT "Postback_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pwa" ADD CONSTRAINT "Pwa_icon_fkey" FOREIGN KEY ("icon") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pwa" ADD CONSTRAINT "Pwa_creator_id_fkey" FOREIGN KEY ("creator_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pwa" ADD CONSTRAINT "Pwa_developer_contacts_id_fkey" FOREIGN KEY ("developer_contacts_id") REFERENCES "DeveloperContacts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rating" ADD CONSTRAINT "Rating_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tracker" ADD CONSTRAINT "Tracker_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_image_id_fkey" FOREIGN KEY ("image_id") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_roles" ADD CONSTRAINT "team_roles_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "team_roles" ADD CONSTRAINT "team_roles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PixelToPwa" ADD CONSTRAINT "_PixelToPwa_A_fkey" FOREIGN KEY ("A") REFERENCES "Pixel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PixelToPwa" ADD CONSTRAINT "_PixelToPwa_B_fkey" FOREIGN KEY ("B") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

