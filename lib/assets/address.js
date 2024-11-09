const { initWasm } = require("@trustwallet/wallet-core");


async function magic(mnemonic, network) {
    var core = await initWasm();
    var { HDWallet, CoinType, HexCoding, Mnemonic } = core;

    // Validate mnemonic
    if (!Mnemonic.isValid(mnemonic)) {
        console.log(JSON.stringify(
            { msg: "mnemonic phrase is invalid." }
        ));
        return -1;
    }

    // Validate coinType
    if (!CoinType.propertyIsEnumerable(network)) {
        console.log(JSON.stringify(
            { msg: "network name is invalid." }
        ));
        return -1;
    }

    var wallet = HDWallet.createWithMnemonic(mnemonic, "");

    // Determine network CoinType object
    var coinTypeValue = Object.getOwnPropertyDescriptor(CoinType, network)?.value;

    var key = wallet.getKeyForCoin(coinTypeValue);
    var pubKey = key.getPublicKeySecp256k1(false);
    var address = wallet.getAddressForCoin(coinTypeValue);

    // Output
    var output = {
        key: HexCoding.encode(key.data()),
        pubKey: HexCoding.encode(pubKey.data()),
        address: address
    };
    console.log(JSON.stringify(output));
    return 0;
}


async function main() {

    var argv = process.argv.slice(2);

    // Validate argv
    if (argv.length !== 2) {
        console.log(JSON.stringify(
            { msg: `wrong number of parameters, expected: 2 given: ${argv.length}` }
        ));
        return -1;
    }

    // Set mnemonic
    var mnemonic = argv[1];

    // Set coin type
    var network = argv[0];

    //
    return await magic(mnemonic, network);
}


main();