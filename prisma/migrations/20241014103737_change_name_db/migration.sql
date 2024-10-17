/*
  Warnings:

  - You are about to drop the `tokenList` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "tokenList";

-- CreateTable
CREATE TABLE "token_list" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "symbol" TEXT NOT NULL,
    "decimals" INTEGER NOT NULL,
    "logoURI" TEXT,
    "tags" TEXT[],
    "dailyVolume" INTEGER,
    "freezeAuthority" TEXT,
    "mintAuthority" TEXT,
    "permanentDelegate" TEXT,
    "mintedAt" TEXT,
    "extensions" JSONB,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "token_list_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "token_list_address_key" ON "token_list"("address");
