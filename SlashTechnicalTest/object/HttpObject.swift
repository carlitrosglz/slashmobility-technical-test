//
//  HttpObject.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 30/12/21.
//

import Foundation
import SwiftyJSON

class HttpObject {
    private var _messageError: String?
    private var _url: String?
    private var _response: [String]?
    private var _data: SwiftyJSON.JSON?
    
    init(messageError: String, url: String) {
        self._messageError = messageError
        self._url          = url
        self._response     = [String]()
    }
    
    // =======================
    // MARK: PUBLIC FUNCTIONS
    // =======================
    public func isResponseOk() -> Bool {
        return _response!.count > 0 && _response![0].contains("ok")
    }
    
    public func getResponseMessage() -> String {
        if _response!.count > 1 {
            return _response![1]
        }
        
        return _messageError!
    }
    
    // ==========================
    // MARK: GETTERS AND SETTERS
    // ==========================
    public var messageError: String {
        get { return _messageError! }
        set { _messageError = newValue }
    }
    
    public var url: String {
        get { return _url! }
        set { _url = newValue }
    }
    
    public var response: [String] {
        get { return _response! }
        set { _response = newValue }
    }
    
    public var data: JSON? {
        get { return _data }
        set { _data = newValue }
    }
}
