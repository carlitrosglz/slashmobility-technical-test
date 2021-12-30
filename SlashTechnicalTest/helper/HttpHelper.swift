//
//  HttpHelper.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 30/12/21.
//

import Foundation

class HttpHelper {
    static func getUrlPetition(endpoint: String) -> String {
        return "\(UrlPetition.FIREBASE_DOMAIN)\(endpoint)"
    }
}
