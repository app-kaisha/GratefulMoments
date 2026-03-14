//
//  BadgeDetailView.swift
//  GratefulMoments
//
//  Created by app-kaihatsusha on 14/03/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct BadgeDetailView: View {
    
    var badge: Badge
    
    var body: some View {
        VStack(spacing: 8) {
            Image(badge.details.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
            Text(badge.details.title)
                .font(.title.bold())
            Text(badge.details.congratulatoryMessage)
                .font(.body)
            Spacer()
            if let timestamp = badge.timestamp {
                Text(timestamp, style: .date)
                    .font(.caption2.bold())
            }
        }
        .padding()
        .frame(width: 320, height: 410)
        .multilineTextAlignment(.center)
        .foregroundStyle(.white)
        .background(badge.details.colour.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
    }
}

#Preview {
    BadgeDetailView(badge: .sample)
}
