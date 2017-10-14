//
//  TcpSocket.swift
//  Sockit
//
//  Created by Tran Thien Khiem on 14/10/17.
//

import Foundation
import Core

/// The tcp socket - non blocking
public class TcpSocket: Socket {
        /// THe socket descriptor
    private var descriptor: Int32 = 0
    
}

/// the tcp socket
extension TcpSocket: Readable {
    
    /// check if the socket is readable
    public var isReadable: Bool {
        return true
    }
    
    /// read data from socket
    ///
    /// - Returns: Data
    public func read() -> Data {
        return "fake data".data(using: .utf8)!
    }
}

extension TcpSocket: Writable {
    
    /// The socket is writabel
    public var isWritable: Bool {
        return true
    }
    
    public func write(data: Data, offset: Int) -> Int {
        return 0
    }
    
}
