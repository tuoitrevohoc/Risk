//
//  ServerSocket.swift
//  RiskPackageDescription
//
//  Created by Tran Thien Khiem on 13/10/17.
//

import Foundation
import LibC

/// The server socket
public class ServerSocket: Socket {
    
    /// Create an instance of server socket with isNonBlocking and should
    /// reuse address
    ///
    /// - Parameters:
    ///   - isNonBlocking: is non blocking socket or not
    ///   - shouldReuseAddress: should reuse address
    ///         if should reuse address is true - then we can bind to
    ///             0.0.0.0 - and 127.0.0.1 with no problem
    public init(isNonBlocking: Bool,
                shouldReuseAddress: Bool = true) throws {
        try super.init(isNonBlocking: isNonBlocking)
        
        if shouldReuseAddress {
            var yes = 1
            let sockLength = socklen_t(MemoryLayout<Int>.size)
            
            guard setsockopt(descriptor, SOL_SOCKET, SO_REUSEADDR, &yes, sockLength) == 0 else {
                throw SocketError.setSocketOptionFailed(code: errno)
            }
        }
    }
    
    ///
    /// Bind this server socket to host name and port
    ///
    ///
    /// - Parameters:
    ///   - hostName: the host name
    ///   - port: the port
    public func bind(hostName: String, port: Int) throws {
        let addressInfo = try AddressInfo(hostName: hostName, port: port)
        
        defer {
            addressInfo.free()
        }
        
        let pointee = addressInfo.raw.pointee
        let result = LibC.bind(descriptor,
                               pointee.ai_addr,
                               pointee.ai_addrlen)
        
        guard result == 0 else {
            throw SocketError.bindFailed(code: errno)
        }
    }
    
    
    /// Start listening on the hostname and port. This socket
    ///  will be use for accepting the call
    ///
    /// - Parameter backLog: The backlog argument defines the maximum length to which the queue of
    ///                         pending connections for sockfd may grow.  If a connection request
    ///                         arrives when the queue is full, the client may receive an error with
    ///                         an indication of ECONNREFUSED or, if the underlying protocol supports
    ///                         retransmission, the request may be ignored so that a later reattempt
    ///                         at connection succeeds.
    /// - Throws: Error with the code
    public func listen(backLog: Int) throws {
        let result = LibC.listen(descriptor, Int32(backLog))
        
        guard result == 0 else {
            throw SocketError.listenFailed(code: errno)
        }
    }
    
}
