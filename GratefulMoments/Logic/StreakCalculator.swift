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
        print(daysAgoArray)
        
        var streak = 0
        // compute streak
        for daysAgo in daysAgoArray {
            if daysAgo == streak {
                print("Streak already here. Don't increase the streak")
                continue
            } else if daysAgo == streak + 1{
                print("A moment exists the day after the current streak")
                streak += 1
                print("Increasing streak to \(streak)")
            } else {
                print("Streak of \(streak) broken with daysAgo \(daysAgo)")
                break
            }
        }
        
        // Streak is calculated above starting from yesterday.
        // not yet saving a moment today shouldn't break the streak
        // if a moment has been saved today, include it in the streak
        if daysAgoArray.first == 0 {
            streak += 1
        }
        
        return streak
    }
}
