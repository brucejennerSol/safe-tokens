/*
  Warnings:

  - Made the column `tags_birdeye_trending` on table `token_list` required. This step will fail if there are existing NULL values in that column.
  - Made the column `tags_community` on table `token_list` required. This step will fail if there are existing NULL values in that column.
  - Made the column `tags_lst` on table `token_list` required. This step will fail if there are existing NULL values in that column.
  - Made the column `tags_moonshot` on table `token_list` required. This step will fail if there are existing NULL values in that column.
  - Made the column `tags_pump` on table `token_list` required. This step will fail if there are existing NULL values in that column.
  - Made the column `tags_token_2022` on table `token_list` required. This step will fail if there are existing NULL values in that column.
  - Made the column `tags_verified` on table `token_list` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "token_list" ADD COLUMN     "tags" TEXT[],
ALTER COLUMN "tags_birdeye_trending" SET NOT NULL,
ALTER COLUMN "tags_community" SET NOT NULL,
ALTER COLUMN "tags_lst" SET NOT NULL,
ALTER COLUMN "tags_moonshot" SET NOT NULL,
ALTER COLUMN "tags_pump" SET NOT NULL,
ALTER COLUMN "tags_token_2022" SET NOT NULL,
ALTER COLUMN "tags_verified" SET NOT NULL;
