//
//  NetworkMonitor.swift
//  Check_Internet
//
//  Created by 이상훈 on 2021/03/07.
//

import Foundation
import Network

final class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    public private(set) var isConnected: Bool = false
    
    public private(set) var connectionType: ConnectionType = .unknown
    
    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }//연결된 방법
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status != .unsatisfied
            self?.getConnectionType(path)
            print(self?.isConnected ?? "N/A")
            print(self?.connectionType as Any)
        }
    }
    public func stopMonitoring() {
        monitor.cancel()
    }
    
    private func getConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        }
        else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        }
        else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .ethernet
        }
        else {
            connectionType = .unknown
        }
    }
}
