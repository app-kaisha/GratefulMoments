//
//  AchievementsView.swift
//  GratefulMoments
//
//  Created by app-kaihatsusha on 14/03/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import SwiftData

struct AchievementsView: View {
    
    @Query(filter: #Predicate<Badge> { $0.timestamp != nil })
    private var unlockedBadges: [Badge]
    
    @Query(filter: #Predicate<Badge> { $0.timestamp == nil })
    private var lockedBadges: [Badge]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                contentStack
            }
            .navigationTitle("Achievements")
        }
    }
    
    private var contentStack: some View {
        VStack {
            header("Your Badges")
            ForEach(sortedUnlockedBadges) { badge in
                Text(badge.details.title)
            }
            header("Locked Badges")
            ForEach(sortedLockedBadges) { badge in
                Text(badge.details.title)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    
    func header(_ text: String) -> some View {
        Text(text)
            .font(.subheadline.bold())
            .padding()
    }
    
    // sort by order they are declared
    private var sortedLockedBadges: [Badge] {
        lockedBadges.sorted {
            $0.details.rawValue < $1.details.rawValue
        }
    }
    
    // sort unlocked badges by timestamp
    private var sortedUnlockedBadges: [Badge] {
        unlockedBadges.sorted {
            ($0.timestamp!, $0.details.title) < ($1.timestamp!, $1.details.title)
        }
    }
}

#Preview {
    AchievementsView()
        .sampleDataContainer()
}
