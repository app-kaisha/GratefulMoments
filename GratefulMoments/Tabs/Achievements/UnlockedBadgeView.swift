//
//  UnlockedBadgeView.swift
//  GratefulMoments
//
//  Created by app-kaihatsusha on 14/03/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct UnlockedBadgeView: View {
    
    var badge: Badge
    
    var body: some View {
        NavigationLink {
            BadgeDetailView(badge: badge)
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Image(badge.details.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                Text(badge.details.title)
                    .font(.headline.bold())
                Text(badge.details.requirements)
                    .font(.caption2.bold())
                Spacer()
                if let timestamp = badge.timestamp {
                    Text(timestamp, style: .date)
                        .font(.caption2.bold())
                }
                
            }
            .padding()
            .frame(width: 210)
            .frame(minHeight: 225)
            .fixedSize()
            .multilineTextAlignment(.leading)
            .foregroundStyle(.white)
            .background(badge.details.colour.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
        }
    }
}

#Preview {
    NavigationStack {
        UnlockedBadgeView(badge: .sample)
    }
}
