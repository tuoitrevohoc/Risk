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
    
}
