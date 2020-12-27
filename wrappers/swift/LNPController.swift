//
//  LNPController.swift
//  LNPController
//
//  Created by Maxim Orlovsky on 12/16/20.
//

import Foundation
import lnplib

public struct LNPError: Error {
    let message: String
    
    init!(_ res: CResult) {
        guard res.result.rawValue != 0 else {
            return nil
        }
        let cstr = res.inner.ptr.load(as: UnsafePointer<CChar>.self)
        self.message = String(cString: cstr)
    }

    init!(_ res: CResultString) {
        guard res.result.rawValue != 0 else {
            return nil
        }
        self.message = String(cString: res.inner)
    }
    
    init(_ msg: String) {
        self.message = msg
    }
}

public enum Verbosity: UInt8 {
    case Error = 0
    case Warning = 1
    case Info = 2
    case Debug = 3
    case Trace = 4
}

open class LNPController {
    private var client: COpaqueStruct
    let network: String
    let dataDir: String
    
    public init(network: String = "testnet", electrum: String = "pandora.network:60001", verbosity: Verbosity = .Info) throws {
        self.network = network
        self.dataDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path

        let client = lnp_node_run(self.dataDir, self.network, electrum, verbosity.rawValue)
        
        guard client.result.rawValue == 0 else {
            throw LNPError(client)
        }
        
        self.client = client.inner
    }
    
    open func createAsset(ticker: String, name: String, description: String? = nil, precision: UInt8 = 8, allocations: String = "[]") throws {
        // let allocations = String(data: try JSONEncoder().encode(allocations), encoding: .utf8)
        
        try withUnsafePointer(to: self.client) { client in
            let res = lnp_node_fungible_issue(
                client,
                network,
                ticker,
                name,
                description,
                precision,
                allocations,
                "[]", "null", "null")
            guard res.result.rawValue == 0 else {
                throw LNPError(res)
            }
        }
    }
    
    open func listAssets() throws -> String {
        try withUnsafePointer(to: self.client) { client in
            let res = lnp_node_fungible_list_assets(client)
            guard res.result.rawValue == 0 else {
                throw LNPError(res)
            }
            guard let jsonString = String(utf8String: res.inner) else {
                throw LNPError("Wrong node response (not JSON string)")
            }
            //try JSONSerialization.jsonObject(with: jsonString.data(using: .utf8), options: [])
            return jsonString
        }
    }
}
