//
//  Hexagon.swift
//  GratefulMoments
//
//  Created by app-kaihatsusha on 08/03/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct Hexagon<Content: View>: View {
    
    private let borderWidth = 2.0
    var borderColour: Color = .ember
    
    var moment: Moment? = nil
    var layout: HexagonLayout = .standard
    
    @ViewBuilder
    var content: () -> Content
    
    var body: some View {
        ZStack {
            if let background = moment?.image {
                Image(uiImage: background)
                    .resizable()
                    .scaledToFill()
            }
            
            content()
                .frame(width: layout.size, height: layout.size)
        }
        .mask{
            Image(systemName: "hexagon.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size - borderWidth, height: layout.size - borderWidth)
                .fontWeight(.ultraLight)
        }
        .background {
            Image(systemName: "hexagon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size, height: layout.size)
                .foregroundStyle(borderColour)
                .fontWeight(.ultraLight)
            
        }
        .frame(width: layout.size, height: layout.size)
        .overlay(alignment: .topTrailing) {
            if let moment {
                HexagonAccessoryView(moment: moment, hexagonLayout: layout)
            }
        }
        
    }
}

#Preview {
    Hexagon(moment: Moment.imageSample) {
        Text(Moment.imageSample.title)
            .foregroundStyle(Color.white)
    }
    .sampleDataContainer()
}
