//
//  AddressInfo.swift
//  Tcp
//
//  Created by Tran Thien Khiem on 13/10/17.
//

import Foundation

/// contain address information
public struct AddressInfo {

    /// raw data
    public var raw: UnsafeMutablePointer<addrinfo>
    
    /// Initialize address info with raw data
    ///
    /// - Parameter raw: the raw data
    public init(raw: UnsafeMutablePointer<addrinfo>) {
        self.raw = raw
    }
    
    /// Look up for an address info
    ///
    /// - Parameters:
    ///   - hostName: host name
    ///   - port: the port
    public init(hostName: String, port: Int) throws {
        var hints = addrinfo()
        
        // Support both IPv4 and IPv6
        hints.ai_family = AF_INET
        hints.ai_socktype = SOCK_STREAM
        hints.ai_protocol = IPPROTO_TCP
        hints.ai_flags = AI_PASSIVE
        
        var data: UnsafeMutablePointer<addrinfo>?
        let result = getaddrinfo(hostName, port.description, &hints, &data)
        
        guard result == 0 else {
            throw SocketError.getAddressFailed(code: errno)
        }
        
        self.init(raw: data!)
    }
    
    /// free the memory of this address info
    public func free() {
        freeaddrinfo(raw)
    }
}
