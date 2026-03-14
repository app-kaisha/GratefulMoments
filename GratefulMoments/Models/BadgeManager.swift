//
//  BadgeManager.swift
//  GratefulMoments
//
//  Created by app-kaihatsusha on 14/03/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation
import SwiftData

// responsible for storing and awarding badges when requirements are met
class BadgeManager {
    private let modelContainer: ModelContainer
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }
    
    func unlockBadges(newMoment: Moment) throws {
        let context = modelContainer.mainContext
        let moments = try context.fetch(FetchDescriptor<Moment>())
        let lockedBadges = try context.fetch(FetchDescriptor<Badge>(predicate: #Predicate { $0.timestamp == nil }))
        
        var newlyUnlocked: [Badge] = []
        for badge in lockedBadges {
            // Add badge to newlyUnlocked if earned
            switch badge.details {
            case .firstEntry where moments.count >= 1,
                    .fiveStars where moments.count >= 5,
                    .shutterbug where moments.count(where: { $0.image != nil }) >= 3,
                    .expressive where moments.count(where: { $0.image != nil && !$0.note.isEmpty }) >= 5,
                    .perfectTen where moments.count >= 10 && lockedBadges.count == 1:
                newlyUnlocked.append(badge)
            default:
                continue
            }
        }
        
        // unlock each earned badge
        for badge in newlyUnlocked {
            badge.moment = newMoment
            badge.timestamp = newMoment.timestamp
        }
    }
    
    // load badges
    func loadBadgesIfNeeded() throws {
        let context = modelContainer.mainContext
        
        var fetchDescriptor = FetchDescriptor<Badge>()
        fetchDescriptor.fetchLimit = 1
        let existingBadges = try context.fetch(fetchDescriptor)
        if existingBadges.isEmpty {
            for details in BadgeDetails.allCases {
                context.insert(Badge(details: details))
            }
        }
    }
}
