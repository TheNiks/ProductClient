//
//  ErrorHandling.swift
//  ProductOnlineClient
//
//  Created by Nikunj Modi on 20/05/22.
//

import Foundation

/// Define error type.
enum ErrorType: String {
    case general = "Error_general"
    case parsing = "Error_parsing"
}

/// Manager class for error.
class ErrorManager: Error {
    
    // MARK: - Properties
    var messageKey: String
    var message: String {
        return messageKey.localized()
    }
    
    init(_ messageKey: String) {
        self.messageKey = messageKey
    }
}

// MARK: - Public Functions
extension ErrorManager {
    class func generalError() -> ErrorManager {
        return ErrorManager(ErrorType.general.rawValue)
    }
}
