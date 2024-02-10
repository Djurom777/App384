//
//  ConvertDate.swift
//  App384
//
//  Created by DJUROM on 03/02/2024.
//

import SwiftUI

extension Date {

    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

