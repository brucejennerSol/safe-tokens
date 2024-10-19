
interface TokenInfo {
    logoURI: string,
    name: string,
    symbol: string,
}

interface ContractLabel {
    address: string,
    name: string,
    metadata: boolean, //change
}

interface BalanceChange {
    amount: number,
    symbol: string,
    name: string,
    decimals: number,
    address: string,
    logoURI: string
}

interface MetaData {
    icon: string;
}

export interface TransactionHistoryResponse {
    txHash: string,
    blockNumber: number,
    blockTime: string,
    status: boolean,
    from: string,
    to: string,
    fee: number,
    mainAction: string,
    balanceChange: BalanceChange[],
    contractLabel: {
      address: string,
      name: string,
      metadata: MetaData
    },
}

export interface TransactionHistorySwapResponse extends TransactionHistoryResponse {
  balanceChange: [BalanceChange, BalanceChange, BalanceChange],
}

export async function getWalletTransactionHistory(
  walletAddress: string, 
  limit: number): Promise<TransactionHistoryResponse[] | TransactionHistorySwapResponse[] | null> {
  const options = {
      method: 'GET',
      headers: {
        accept: 'application/json',
        'x-chain': 'solana',
        'X-API-KEY': '73446a3bc8a04ed898f63aab9e56e09e' // TODO add to .env
      }
    };

  const historicalTransactions = await (
      await fetch(`https://public-api.birdeye.so/v1/wallet/tx_list?wallet=${walletAddress}&limit=${limit}`, options)
  ).json()

  if (historicalTransactions.success) {
      return historicalTransactions.data.solana
  }
  return null
}