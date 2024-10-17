/*
  Warnings:

  - The `extensions` column on the `tokenList` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "tokenList" DROP COLUMN "extensions",
ADD COLUMN     "extensions" JSONB;
