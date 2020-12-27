const lib = require('../../bindings/npm/lnplib')

exports.Node = class Node {
    /*
    constructor(dataDir, network, electrum, verbosity) {
        this.network = network || "testnet"
        this.dataDir = dataDir
        electrum = electrum || ("pandora.network:" + {
            "bitcoin": "50001",
            "testnet": "60001",
            "signet": "60601"
        }[this.network] || "60001")
        this.runtime = lib.lnp_node_run(dataDir, network, electrum, verbosity || 0)
    }

    issue(ticker, name, description, precision, allocations, inflation, renomination, epoch) {
        return lib.lnp_node_fungible_issue(
            this.runtime,
            this.network,
            ticker,
            name,
            description || "",
            precision,
            JSON.stringify(allocations || []),
            JSON.stringify(inflation || []),
            JSON.stringify(renomination || null),
            JSON.stringify(epoch || null)
        )
    }

    listAssets() {
        return JSON.parse(lib.lnp_node_fungible_list_assets(this.runtime))
    }

    assetAllocations(contractId) {
        return JSON.parse(lib.lnp_node_fungible_asset_allocations(this.runtime, contractId))
    }

    outpointAssets(outpoint) {
        return JSON.parse(lib.lnp_node_fungible_outpoint_assets(this.runtime, outpoint))
    }

    invoice(contractId, amount, outpoint) {
        return JSON.parse(lib.lnp20_invoice(contractId, amount, outpoint))
    }

    transfer(inputs, allocate, invoice, prototypePsbt, consignmentFile, transactionFile) {
        return lib.lnp_node_fungible_transfer(
            this.runtime,
            JSON.stringify(inputs),
            JSON.stringify(allocate),
            invoice,
            prototypePsbt,
            consignmentFile,
            transactionFile
        )
    }

    validate(consignment_file) {
        return lib.lnp_node_fungible_validate(this.runtime, consignment_file)
    }

    accept(consignment_file, reveal_outpoints) {
      return lib.lnp_node_fungible_accept(this.runtime, consignment_file, reveal_outpoints)
    }
    */
}
