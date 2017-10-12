import LibC

/// The socket class for both client-side and server-side
public class Socket {
    
    /// the socket descriptor
    private var descriptor: Int32
    
    /// if the socket is non blocking socket or not
    public var isNonBlocking: Bool
    
    /// check if the socket is currently connected
    public var isConnected : Bool {
        var error = 0
        getsockopt(descriptor, SOL_SOCKET, SO_ERROR, &error, nil)
        
        return error == 0
    }
    
    /// Initialize the socket instance with a raw descriptor
    ///
    /// - Parameters:
    ///   - descriptor: socket descriptor
    ///   - isNonBlocking: is blocking or not
    public init(descriptor: Int32, isNonBlocking: Bool) {
        self.descriptor = descriptor
        self.isNonBlocking = isNonBlocking
    }
    
    ///
    /// Create a socket with is non blocking option
    ///
    /// - Parameter isNonBlocking: is non blocking or not
    public convenience init(isNonBlocking: Bool) throws {
        let descriptor = socket(AF_INET, SOCK_STREAM, 0)
        
        guard descriptor > 0 else {
            throw SocketError.creationFailed(code: errno)
        }
        
        if isNonBlocking {
            guard fcntl(descriptor, F_SETFL, O_NONBLOCK) == 0 else {
                throw SocketError.setNonBlockingFailed(code: errno)
            }
        }
        
        self.init(descriptor: descriptor, isNonBlocking: isNonBlocking)
    }
    
    /// Close current socket
    public func close() {
        LibC.close(descriptor)
    }
    
    // deinitialize the socket
    deinit {
        close()
    }
    
}
