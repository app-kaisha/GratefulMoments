//
//  MomentsView.swift
//  GratefulMoments
//
//  Created by app-kaihatsusha on 08/03/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import SwiftData

struct MomentsView: View {
    
    @State private var showCreateMoment = false
    
    @Query(sort: \Moment.timestamp)
    private var moments: [Moment]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                pathItems
                    .frame(maxWidth: .infinity)
            }
            .overlay {
                if moments.isEmpty {
                    ContentUnavailableView {
                        Label("No moments yet!", systemImage: "exclamationmark.circle.fill")
                    } description: {
                        Text("Post a note or photo to start fillin this space with gratitude.")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showCreateMoment = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showCreateMoment) {
                        MomentEntryView()
                    }

                }
            }
            .navigationTitle("Grateful Moments")
        }
    }
    
    private var pathItems: some View {
        ForEach(moments) { moment in
            Text(moment.title)
        }
    }
}

#Preview {
    MomentsView()
        .sampleDataContainer()
}

#Preview("No Moments") {
    MomentsView()
        .modelContainer(for: [Moment.self])
}
