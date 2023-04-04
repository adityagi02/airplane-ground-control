//
//  ContentView.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 29/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "sun.min")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Weatherific!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

