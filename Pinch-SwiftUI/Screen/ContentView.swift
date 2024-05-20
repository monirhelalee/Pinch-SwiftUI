//
//  ContentView.swift
//  Pinch-SwiftUI
//
//  Created by Monir Haider Helalee on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY

    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero

    // MARK: - FUNCTION

    func resetImageState() {
        return withAnimation(.spring) {
            imageScale = 1
            imageOffset = .zero
        }
    }

    // MARK: - CONTENT

    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: /*@START_MENU_TOKEN@*/ .black/*@END_MENU_TOKEN@*/ .opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)

                    // MARK: - 1. TAP GESTURE

                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })

                    // MARK: - 1. DRAG GESTURE

                    .gesture(
                        DragGesture().onChanged { value in
                            withAnimation(.linear(duration: 1)) {
                                imageOffset = value.translation
                            }
                        }
                        .onEnded { _ in
                            if imageScale <= 1 {
                                resetImageState()
                            }
                        }
                    )
            } //: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })

            // MARK: - Info panel

            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30),
                alignment: .top
            )

            // MARK: - Controls

            .overlay(Group {
                HStack {
                    // Scale down
                    Button {
                        // action
                        withAnimation(.spring()){
                            if imageScale > 1 {
                                imageScale -= 1
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                        }
                    } label: {
                        ControlImageView(icon: "minus.magnifyingglass")
                    }
                    // Reset
                    Button {
                        // action
                        resetImageState()
                    } label: {
                        ControlImageView(icon:
                            "arrow.up.left.and.down.right.magnifyingglass")
                    }
                    // Scale up
                    Button {
                        // action
                        if imageScale < 5 {
                            imageScale += 1
                            if imageScale > 5 {
                                imageScale = 5
                            }
                        }
                    } label: {
                        ControlImageView(icon: "plus.magnifyingglass")
                    }
                } //: Controls
                .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .opacity(isAnimating ? 1 : 0)
            }
            .padding(.bottom, 30),
            alignment: .bottom)
        } //: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
