//
//  ContentView.swift
//  SUI-ImageTint
//
//  Created by Daniel Bonates on 29/01/20.
//  Copyright © 2020 Daniel Bonates. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Original")
                ZStack {
                    Image("peixe-logo")
                        .resizable()
                        .scaledToFit()
                        .padding(50)
                        .blur(radius: 23)
                    Image("peixe-logo")
                        .resizable()
                        .scaledToFit()
                        .padding(50)
                }
            }
            Rectangle()
                // Using tint
            .fill(Color.gray)
                .frame(height: 1.0, alignment: .top)
            VStack {
                Text("Tinted with red color")
                ZStack {
                    Image.tinted("peixe-logo", with: .red)
                        .resizable()
                        .scaledToFit()
                        .padding(50)
                        .blur(radius: 23)
                    Image.tinted("peixe-logo", with: .red)
                        .resizable()
                        .scaledToFit()
                        .padding(50)

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



