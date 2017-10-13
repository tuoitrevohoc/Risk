//
//  SocketErrorTests.swift
//  TcpTests
//
//  Created by Tran Thien Khiem on 13/10/17.
//

import XCTest
import Tcp

class SocketErrorTests: XCTestCase {

    /// check to see if error
    func testPrintError() {
        let error = SocketError.creationFailed(code: 12)
        
        XCTAssertEqual("creationFailed(12)", "\(error)")
    }

}
