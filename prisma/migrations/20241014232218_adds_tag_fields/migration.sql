/*
  Warnings:

  - You are about to drop the column `extensions` on the `token_list` table. All the data in the column will be lost.
  - You are about to drop the column `tags` on the `token_list` table. All the data in the column will be lost.
  - The `freeze_authority` column on the `token_list` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `mint_authority` column on the `token_list` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `minted_at` column on the `token_list` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `permanent_delegate` column on the `token_list` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "token_list" DROP COLUMN "extensions",
DROP COLUMN "tags",
ADD COLUMN     "tags_birdeye_trending" BOOLEAN,
ADD COLUMN     "tags_community" BOOLEAN,
ADD COLUMN     "tags_lst" BOOLEAN,
ADD COLUMN     "tags_moonshot" BOOLEAN,
ADD COLUMN     "tags_pump" BOOLEAN,
ADD COLUMN     "tags_token_2022" BOOLEAN,
ADD COLUMN     "tags_verified" BOOLEAN,
ADD COLUMN     "token_created_at" TIMESTAMP(3),
DROP COLUMN "freeze_authority",
ADD COLUMN     "freeze_authority" BOOLEAN,
DROP COLUMN "mint_authority",
ADD COLUMN     "mint_authority" BOOLEAN,
DROP COLUMN "minted_at",
ADD COLUMN     "minted_at" TIMESTAMP(3),
DROP COLUMN "permanent_delegate",
ADD COLUMN     "permanent_delegate" BOOLEAN;
