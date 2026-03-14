//
//  StreakCalculator.swift
//  GratefulMoments
//
//  Created by app-kaihatsusha on 14/03/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation

struct StreakCalculator {
    let calendar = Calendar.current
    
    func calculateStreak(for moments: [Moment]) -> Int {
        let startOfToday = calendar.startOfDay(for: .now)
        let endOfToday = calendar.date(byAdding: DateComponents(day: 1, second: -1), to: startOfToday)!
        
        // sort moments oldest to newest, extract all timestamps, calculate difference in days between moments and end of day, then finally filter into a non-optional array the transformed array
        let daysAgoArray = moments
            .reversed()
            .map(\.timestamp)
            .map { calendar.dateComponents([.day], from: $0, to: endOfToday) }
            .compactMap { $0.day }
        
        var streak = 0
        // compute streak
        for daysAgo in daysAgoArray {
            if daysAgo == streak {
                streak += 1
            }
        }
        
        return streak
    }
}
