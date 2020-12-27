//
//  ViewController.swift
//  LNP Demo App
//
//  Created by Maxim Orlovsky on 6/10/20.
//  Copyright © 2020 LNP/BP Standards Association. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var issueResult: UILabel!
    @IBOutlet weak var transferResult: UILabel!
    @IBOutlet weak var listResult: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onAssetIssue(_ sender: Any) {
        guard let lnpController = (UIApplication.shared.delegate as! AppDelegate).lnpController else {
            issueResult.text = "LNP runtime failed to start"
            return
        }
        
        do {
            try lnpController.createAsset(
                ticker: "DEMO",
                name: "Demo asset",
                allocations: "[{ \"coins\": 100, \"outpoint\": \"0313ba7cfcaa66029a1a63918ebc426259f00953016c461663315d1bf6b83ab4:1\" }]"
            )
            issueResult.text = "Issued successfully"
        } catch {
            issueResult.text = "Failed to issue asset: \(error.localizedDescription)"
            return
        }

        /*
        // MARK: - Transfer asset
        do {
            let dataUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            let consignment_file = dataUrl.appendingPathComponent((UUID().uuidString)).path
            let transaction_file = dataUrl.appendingPathComponent((UUID().uuidString)).path
            
            let tArgs = TransferArgs(
                inputs: ["0313ba7cfcaa66029a1a63918ebc426259f00953016c461663315d1bf6b83ab4:0"],
                allocate: [allocations],
                invoice: "lnp20:outpoint1mzu8vz3jly3rzzkdpph583yahv9wktljtfcln6pe2le6n7ehqulstu967t?amount=5&asset=lnp:id1yqqqxya60n725eszngdx8yvwh3pxyk0sp9fszmzxze3nzhgm76ur4dqf2f7gy",
                prototype_psbt: "cHNidP8BAFICAAAAAZ38ZijCbFiZ/hvT3DOGZb/VXXraEPYiCXPfLTht7BJ2AQAAAAD/////AfA9zR0AAAAAFgAUezoAv9wU0neVwrdJAdCdpu8TNXkAAAAATwEENYfPAto/0AiAAAAAlwSLGtBEWx7IJ1UXcnyHtOTrwYogP/oPlMAVZr046QADUbdDiH7h1A3DKmBDck8tZFmztaTXPa7I+64EcvO8Q+IM2QxqT64AAIAAAACATwEENYfPAto/0AiAAAABuQRSQnE5zXjCz/JES+NTzVhgXj5RMoXlKLQH+uP2FzUD0wpel8itvFV9rCrZp+OcFyLrrGnmaLbyZnzB1nHIPKsM2QxqT64AAIABAACAAAEBKwBlzR0AAAAAIgAgLFSGEmxJeAeagU4TcV1l82RZ5NbMre0mbQUIZFuvpjIBBUdSIQKdoSzbWyNWkrkVNq/v5ckcOrlHPY5DtTODarRWKZyIcSEDNys0I07Xz5wf6l0F1EFVeSe+lUKxYusC4ass6AIkwAtSriIGAp2hLNtbI1aSuRU2r+/lyRw6uUc9jkO1M4NqtFYpnIhxENkMak+uAACAAAAAgAAAAAAiBgM3KzQjTtfPnB/qXQXUQVV5J76VQrFi6wLhqyzoAiTACxDZDGpPrgAAgAEAAIAAAAAAACICA57/H1R6HV+S36K6evaslxpL0DukpzSwMVaiVritOh75EO3kXMUAAACAAAAAgAEAAIAA",
                consignment_file: consignment_file,
                transaction_file: transaction_file
            )
            try runtime.transferAsset(tArgs)
            
            transferResult.text = "Transferred successfully"
        } catch {
            transferResult.text = "Failed to transfer asset: \(error.localizedDescription)"
        }
         */
    }
    
    @IBAction func onAssetList(_ sender: Any) {
        guard let lnpController = (UIApplication.shared.delegate as! AppDelegate).lnpController else {
            listResult.text = "LNP runtime failed to start"
            return
        }

        do {
            let assets = try lnpController.listAssets()
            listResult.text = "\(assets)"
        } catch {
            listResult.text = "Failed to issue asset: \(error.localizedDescription)"
            return
        }

    }
}

