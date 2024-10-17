/*
  Warnings:

  - You are about to drop the `token_list` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "token_list";

-- CreateTable
CREATE TABLE "tokens" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "symbol" TEXT NOT NULL,
    "decimals" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "daily_volume" INTEGER NOT NULL,
    "tags" TEXT[],
    "logo_uri" TEXT,
    "tags_birdeye_trending" BOOLEAN NOT NULL,
    "tags_community" BOOLEAN NOT NULL,
    "tags_lst" BOOLEAN NOT NULL,
    "tags_moonshot" BOOLEAN NOT NULL,
    "tags_pump" BOOLEAN NOT NULL,
    "tags_token_2022" BOOLEAN NOT NULL,
    "tags_verified" BOOLEAN NOT NULL,
    "freeze_authority" TEXT,
    "mint_authority" TEXT,
    "minted_at" TIMESTAMP(3),
    "permanent_delegate" TEXT,
    "extensions" JSONB,

    CONSTRAINT "tokens_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "tokens_address_key" ON "tokens"("address");
