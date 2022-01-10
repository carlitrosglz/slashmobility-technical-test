//
//  Group.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 2/1/22.
//

import Foundation

class Group {
    public var name: String?
    public var descriptionShort: String?
    public var date: Int?
    public var urlImage: String?
    
    init(name: String, descriptionShort: String, date: Int, urlImage: String) {
        self.name = name
        self.descriptionShort = descriptionShort
        self.date = date
        self.urlImage = urlImage
    }
}
