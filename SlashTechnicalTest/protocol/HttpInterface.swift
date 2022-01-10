//
//  HttpProtocol.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 30/12/21.
//

import Foundation
import SwiftyJSON

protocol HttpInterface {
    func onHttpExecute(httpObject: HttpObject)
    func onHttpResponse(response: HttpObject)
}
