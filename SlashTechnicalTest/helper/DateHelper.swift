//
//  DateHelper.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 2/1/22.
//

import Foundation

class DateHelper {
    static func convertIntToFormattedDate(ms: Int, format: String) -> String {
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSince1970: TimeInterval(ms / 1000))
        
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
}
