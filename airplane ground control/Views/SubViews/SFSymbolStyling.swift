//
//  DatePlannerApp.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 26/03/23.
//


import SwiftUI

struct SFSymbolStyling: ViewModifier {
    func body(content: Content) -> some View {
        content
            .imageScale(.large)
            .symbolRenderingMode(.monochrome)
    }
}

extension View {
    func sfSymbolStyling() -> some View {
        modifier(SFSymbolStyling())
    }
}
