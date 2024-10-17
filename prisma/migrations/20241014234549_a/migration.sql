/*
  Warnings:

  - You are about to drop the column `extension` on the `token_list` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "token_list" DROP COLUMN "extension",
ADD COLUMN     "extensions" JSONB;
