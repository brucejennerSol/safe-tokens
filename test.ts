const baseUrl = "http://localhost:3000"

async function main() {
   const res = await fetch(baseUrl + "/api/alltokens")
   const resJson = await res.json()
   return resJson
}

const res = await main()
console.log(res)
