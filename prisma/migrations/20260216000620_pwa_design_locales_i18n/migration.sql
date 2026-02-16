-- AlterTable
ALTER TABLE "Image" ADD COLUMN     "pwa_design_locale_id" TEXT;

-- CreateTable
CREATE TABLE "PwaDesignLocale" (
    "id" TEXT NOT NULL,
    "pwa_id" TEXT NOT NULL,
    "locale" TEXT NOT NULL,
    "is_main" BOOLEAN NOT NULL DEFAULT false,
    "name" TEXT,
    "developer_name" TEXT,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "file_size" INTEGER,
    "age_rating" "AgeRating",
    "total_downloads" INTEGER,
    "description" TEXT,
    "tags" "PwaTag"[],
    "update_date" TIMESTAMP(3),
    "update_description" TEXT,
    "icon_image_id" TEXT,
    "rating_total_rating" DOUBLE PRECISION,
    "rating_total_reviews" INTEGER,
    "rating_five_star_percent" DOUBLE PRECISION,
    "rating_four_star_percent" DOUBLE PRECISION,
    "rating_three_star_percent" DOUBLE PRECISION,
    "rating_two_star_percent" DOUBLE PRECISION,
    "rating_one_star_percent" DOUBLE PRECISION,
    "trailer" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PwaDesignLocale_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PwaDesignLocaleReview" (
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
    "design_locale_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PwaDesignLocaleReview_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "PwaDesignLocale_pwa_id_idx" ON "PwaDesignLocale"("pwa_id");

-- CreateIndex
CREATE INDEX "PwaDesignLocale_pwa_id_is_main_idx" ON "PwaDesignLocale"("pwa_id", "is_main");

-- CreateIndex
CREATE UNIQUE INDEX "PwaDesignLocale_pwa_id_locale_key" ON "PwaDesignLocale"("pwa_id", "locale");

-- CreateIndex
CREATE INDEX "PwaDesignLocaleReview_design_locale_id_idx" ON "PwaDesignLocaleReview"("design_locale_id");

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_pwa_design_locale_id_fkey" FOREIGN KEY ("pwa_design_locale_id") REFERENCES "PwaDesignLocale"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PwaDesignLocale" ADD CONSTRAINT "PwaDesignLocale_pwa_id_fkey" FOREIGN KEY ("pwa_id") REFERENCES "Pwa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PwaDesignLocale" ADD CONSTRAINT "PwaDesignLocale_icon_image_id_fkey" FOREIGN KEY ("icon_image_id") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PwaDesignLocaleReview" ADD CONSTRAINT "PwaDesignLocaleReview_design_locale_id_fkey" FOREIGN KEY ("design_locale_id") REFERENCES "PwaDesignLocale"("id") ON DELETE CASCADE ON UPDATE CASCADE;
