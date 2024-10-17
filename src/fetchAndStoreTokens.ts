import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

interface Extensions {
  [key: string]: string;
}

interface Token {
  address: string;
  name: string;
  symbol: string;
  decimals: number;
  logoURI: string | null;
  tags?: string[]; // optional because removed in in createTokenTags
  daily_volume: number;
  freeze_authority: string | null;
  mint_authority: string | null;
  permanent_delegate: string | null;
  minted_at: string | null;
  extensions: Extensions | {};
}

interface TokenWithTags extends Token {
  tags_lst: boolean;
  tags_pump: boolean;
  tags_moonshot: boolean;
  tags_verified: boolean;
  tags_community: boolean;
  tags_birdeye_trending: boolean;
  tags_token_2022: boolean;

  [key: string]: boolean | string | number | string[] | Extensions | null | undefined; // index signature -> can accepts any type key
}

async function fetchTokens(): Promise<Token[] | null> {
  try {
    const tokenResponse = await (
      await fetch('https://tokens.jup.ag/tokens/tradable')
    ).json()

    return tokenResponse

  } catch (error) {
    console.error('Error fetching tokens', error)
    return null
  }
}


function createTokenTags(allTokens: Token[]): TokenWithTags[] { 
  const tokenWithTags = []

  const tagNames = [
    'lst', 
    'pump', 
    'moonshot', 
    'verified', 
    'community', 
    'birdeye_trending', 
    'token_2022'
  ]

  for (let i = 0; i < allTokens.length; i++) {
    const currentToken = allTokens[i] as TokenWithTags
    const currentTokenTags = currentToken.tags
    const currentTokenVolume = currentToken.daily_volume

    if (!currentTokenVolume) {
      currentToken.daily_volume = 0
    }

    if (currentTokenTags) {
      for (const tag of tagNames) {
        currentToken[`tags_${tag}`] = false
      }

      for (const tag of tagNames) {
        if (currentTokenTags.includes(tag)) {
          currentToken[`tags_${tag}`] = true
        }     
      }

      const { tags, created_at, ...modifiedToken } = currentToken 
      tokenWithTags.push(modifiedToken)
    }
  }
  return tokenWithTags
}


async function writeTokensToDB(allTokens: TokenWithTags[]) {
  const batchSize = 10000
  let totalCreatedTokens = 0
  const totalTokenLength = allTokens.length

  for (let i = 0; i < totalTokenLength; i += batchSize) {
    const batch = allTokens.slice(i, Math.min(i + batchSize, totalTokenLength)) 
    const createdTokens = await prisma.tokens.createMany({
      data: batch,
      skipDuplicates: true
    })

    totalCreatedTokens += createdTokens.count
  }
  console.log(`Total tokens created: ${totalCreatedTokens} & total token length: ${totalTokenLength}`)
  
  return totalCreatedTokens === totalTokenLength
}


async function main() {
  console.log('Starting token fetch and store process at: ', new Date())

  const allTokens = await fetchTokens();

  if (!allTokens) {
    console.error('Failed to fetch tokens');
    return
  }

  const modifiedTokens = createTokenTags(allTokens);

  console.log(`Total amount of tokens: ${modifiedTokens.length}`);

  const wroteTokensToDb = await writeTokensToDB(modifiedTokens);

  if (wroteTokensToDb) {
    console.log('Finished token fetch and store process at', new Date());
  } else {
    console.log('Error writing tokens to database!', new Date());
  }
}

main();