/*
  Warnings:

  - Made the column `daily_volume` on table `token_list` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "token_list" ALTER COLUMN "daily_volume" SET NOT NULL;
