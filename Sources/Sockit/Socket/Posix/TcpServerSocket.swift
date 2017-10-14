//
//  TcpServerSocket.swift
//  Sockit
//
//  Created by Tran Thien Khiem on 14/10/17.
//

import Foundation

public class TcpServerSocket: ServerSocket {
    
    /// check if the socket is available for incoming connection
    public var isAvailable: Bool {
        return true
    }
    
    /// accept the socket
    ///
    /// - Returns: the socket
    public func accept() -> Socket {
        return TcpSocket()
    }
    
    /// the public constructor
    public init() {
        
    }
    
}


