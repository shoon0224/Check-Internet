//
//  ViewController.swift
//  Check_Internet
//
//  Created by 이상훈 on 2021/03/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblNetworkMonitoring: UILabel!
    @IBOutlet var lblConnected: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if NetworkMonitor.shared.isConnected {
            
            lblNetworkMonitoring.text = "네트워크에 연결되어 있습니다."
            lblConnected.text = "연결된 방법은 \(NetworkMonitor.shared.connectionType) 입니다."
            print("네트워크에 연결되어 있습니다.")
            print(NetworkMonitor.shared.connectionType)
        }
        else {
            lblNetworkMonitoring.text = "네트워크에 연결되어 있지 않습니다."
            lblConnected.text = ""
            print("네트워크에 연결되어 있지 않습니다.")
        }
    }
}

