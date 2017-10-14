//
//  Application.swift
//  RiskPackageDescription
//
//  Created by Tran Thien Khiem on 12/10/17.
//

import Foundation
import Core
import Sockit


/// the socket processing queue - a serial queue
let processingQueue = DispatchQueue(label: "socket-processing")

/// list of socket that is connected to current application
var sockets = [Socket]()

/// Check if there is incoming socket then dispatch to the next queue
///
/// - Parameter serverSocket: the server socket
/// - Returns: dispatch to queue
func checkInComing(serverSocket: ServerSocket) -> Socket? {
    var result: Socket?
    
    print("Checking incoming connection")
    
    if serverSocket.isAvailable {
        result = serverSocket.accept()
    }
    
    return result
}

/// Queue the socket into an array
///
/// - Parameter socket: the socket to queue
func addToQueue(socket: Socket) {
    processingQueue.async {
        sockets.append(socket)
    }
}

let eventLoop = EventLoop(context: TcpServerSocket(),
                          listenBy: checkInComing)

eventLoop.run(addToQueue)



