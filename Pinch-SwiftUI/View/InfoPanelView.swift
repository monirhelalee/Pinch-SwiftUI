//
//  InfoPanelView.swift
//  Pinch-SwiftUI
//
//  Created by Monir Haider Helalee on 8/5/24.
//

import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offset: CGSize
    
    //@State private var in

    var body: some View {
        HStack {
            // MARK: - HOTSPOT

            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
            Spacer()

            // MARK: - INFO PANEL

            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")

                Spacer()

                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")

                Spacer()

                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")

                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)

            Spacer()
        }
    }
}

#Preview {
    InfoPanelView(scale: 1, offset: .zero)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/ .dark/*@END_MENU_TOKEN@*/)
        .previewLayout(.sizeThatFits)
        .padding()
}
