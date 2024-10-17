/*
  Warnings:

  - You are about to drop the column `token_created_at` on the `token_list` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "token_list" DROP COLUMN "token_created_at",
ALTER COLUMN "freeze_authority" SET DATA TYPE TEXT,
ALTER COLUMN "mint_authority" SET DATA TYPE TEXT,
ALTER COLUMN "permanent_delegate" SET DATA TYPE TEXT;
