//
//  Date+timeAgoDisplay.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 12-05-21.
//

import Foundation

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
