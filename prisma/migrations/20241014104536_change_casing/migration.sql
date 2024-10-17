/*
  Warnings:

  - You are about to drop the column `dailyVolume` on the `token_list` table. All the data in the column will be lost.
  - You are about to drop the column `freezeAuthority` on the `token_list` table. All the data in the column will be lost.
  - You are about to drop the column `logoURI` on the `token_list` table. All the data in the column will be lost.
  - You are about to drop the column `mintAuthority` on the `token_list` table. All the data in the column will be lost.
  - You are about to drop the column `mintedAt` on the `token_list` table. All the data in the column will be lost.
  - You are about to drop the column `permanentDelegate` on the `token_list` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "token_list" DROP COLUMN "dailyVolume",
DROP COLUMN "freezeAuthority",
DROP COLUMN "logoURI",
DROP COLUMN "mintAuthority",
DROP COLUMN "mintedAt",
DROP COLUMN "permanentDelegate",
ADD COLUMN     "daily_volume" INTEGER,
ADD COLUMN     "freeze_authority" TEXT,
ADD COLUMN     "logo_uri" TEXT,
ADD COLUMN     "mint_authority" TEXT,
ADD COLUMN     "minted_at" TEXT,
ADD COLUMN     "permanent_delegate" TEXT;
