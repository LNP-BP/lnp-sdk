"""
LNP Node Python Wrapper
"""

import sys
sys.path.insert(1, '../../bindings/python')
from lnp import *

class LNPNode:
    def __init__(self, network="testnet", datadir="/tmp/lnp-node/", verbosity=0):
        electrum_port ={
            "testnet": "60001",
            "bitcoin": "50001",
            "signet": "60601"
        }
        self.network = network
        self.datadir = datadir
        self.electrum = "pandora.network:" + electrum_port[network]

        self.runtime = lnp_node_run(self.datadir, self.network, self.electrum, verbosity)

    def issue(self, ticker, name, description, precision, allocations, inflation, renomination, epoch):
        return lnp_node_fungible_issue(runtime=self.runtime,
                                        network=self.network,
                                        ticker=ticker,
                                        name=name,
                                        description=description,
                                        precision=precision,
                                        allocations=allocations,
                                        inflation=inflation,
                                        renomination=renomination,
                                        epoch=epoch)

    def listAssets(self):
        return lnp_node_fungible_list_assets(self.runtime)

    def assetAllocations(self, contractId):
        return lnp_node_fungible_asset_allocations(self.runtime, contractId)

    def outpointAssets(self, outpoint):
        return lnp_node_fungible_outpoint_assets(self.runtime, outpoint)

    def invoice(self, contractId, amount, outpoint):
        return lnp20_invoice(contractId, amount, outpoint)

    def importAsset(self, asset_genesis):
        return lnp_node_fungible_import_asset(self.runtime, asset_genesis)

    def exportAsset(self, asset_id):
        return lnp_node_fungible_export_asset(self.runtime, asset_id)

    def transfer(self, inputs, allocate, invoice, prototypePsbt, consignmentFile, transactionFile):
        return lnp_node_fungible_transfer(
            self.runtime,
            inputs,
            allocate,
            invoice,
            prototypePsbt,
            consignmentFile,
            transactionFile
        )

    def validate(self, consignment_file):
        return lnp_node_fungible_validate(self.runtime, consignment_file)

    def accept(self, consignment_file, reveal_outpoints):
        return lnp_node_fungible_accept(self.runtime, consignment_file, reveal_outpoints)