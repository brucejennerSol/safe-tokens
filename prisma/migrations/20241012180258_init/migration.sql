-- CreateTable
CREATE TABLE "tokenList" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "symbol" TEXT NOT NULL,
    "decimals" INTEGER NOT NULL,
    "logo_uri" TEXT,
    "tags" TEXT[],
    "daily_volume" INTEGER NOT NULL,
    "freeze_authority" TEXT,
    "mint_authority" TEXT,
    "permanent_delegate" TEXT,
    "minted_at" TEXT,
    "extensions" TEXT,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tokenList_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "tokenList_address_key" ON "tokenList"("address");
