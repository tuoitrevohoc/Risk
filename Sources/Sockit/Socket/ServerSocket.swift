//
//  ServerSocket.swift
//  RiskPackageDescription
//
//  Created by Tran Thien Khiem on 13/10/17.
//

import Foundation
import LibC

/// The server socket protocol
public protocol ServerSocket {
    
    /// Check if an incoming socket is available
    var isAvailable: Bool { get }
    
    /// Accept and return a socket
    ///
    /// - Returns: return the socket
    func accept() -> Socket
}
