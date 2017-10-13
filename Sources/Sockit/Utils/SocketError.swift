//
//  SocketError.swift
//  RiskPackageDescription
//
//  Created by Tran Thien Khiem on 13/10/17.
//

import Foundation

/// Socket Error
public enum SocketError: Error {
    
    // error on creation with code
    case creationFailed(code: Int32)
    
    // error on set non blocking
    case setNonBlockingFailed(code: Int32)
    
    // error when setting socket option failed
    case setSocketOptionFailed(code: Int32)
    
    // get address failed
    case getAddressFailed(code: Int32)
    
    // bind to address failed
    case bindFailed(code: Int32)
    
    // listen failed with code
    case listenFailed(code: Int32)
}
