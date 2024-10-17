interface Extensions {
    [key: string]: string;
  }
  
interface Token {
address: string;
name: string;
symbol: string;
decimals: number;
logoURI: string | null;
tags?: string[];
daily_volume: number | null;
freeze_authority: string | null;
mint_authority: string | null;
permanent_delegate: string | null;
minted_at: string | null;
extensions: Extensions | {};
}

interface TokenWithTags extends Token {
lst: boolean;
pump: boolean;
moonshot: boolean;
verified: boolean;
community: boolean;
birdeye_trending: boolean;
token_2022: boolean;
unknown: boolean

[key: string]: boolean | string | number | string[] | Extensions | null | undefined; // index signature -> can accepts any type key
}

const allTokens = [
    {
      address: "Hrd2en37VJaDspWFq6miK8w6xTuQRTHNaD2e3tqH2uxr",
      created_at: "2024-09-18T17:57:50.849585Z",
      daily_volume: 1000,
      decimals: 11,
      extensions: {},
      freeze_authority: null,
      logoURI: "https://minechain.gg/wood.png",
      mint_authority: "DJt9AECGWeHFn77S2qNfwFpJGbyuZLVDqQz171ocXLo3",
      minted_at: "2024-09-18T15:53:36Z",
      name: "wood",
      permanent_delegate: null,
      symbol: "WOOD",
      tags: [ "unknown", "lst", 'pump' ],
    }
]

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
  
        const { tags, created_at, ...modifiedToken } = currentToken //removes tags & created_at 
        tokenWithTags.push(modifiedToken)
      }
    }
    return tokenWithTags
  }

const modifiedToken = createTokenTags(allTokens)
console.log(modifiedToken)