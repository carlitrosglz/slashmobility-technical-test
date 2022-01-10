//
//  GlobalVariables.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 30/12/21.
//

import Foundation

class GlobalVariables {
    private static var httpService: HttpService?
    
    static func HTTP_SERVICE() -> HttpService {
        if httpService == nil {
            httpService = HttpService()
        }
        
        return httpService!
    }
}
