/*
  Warnings:

  - Added the required column `extension` to the `token_list` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "token_list" ADD COLUMN     "extension" JSONB NOT NULL;
