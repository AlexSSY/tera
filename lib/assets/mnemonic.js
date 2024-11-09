const { initWasm } = require('@trustwallet/wallet-core')

async function main() {
    const { HDWallet } = await initWasm()
    console.log(HDWallet.create(256, '').mnemonic())
}

main()