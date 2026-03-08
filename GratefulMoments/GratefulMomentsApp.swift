//
//  GratefulMomentsApp.swift
//  GratefulMoments
//
//  Created by app-kaihatsusha on 08/03/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import SwiftData

@main
struct GratefulMomentsApp: App {
    
    let dataContainer = DataContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
        .modelContainer(dataContainer.modelContainer)
    }
}
