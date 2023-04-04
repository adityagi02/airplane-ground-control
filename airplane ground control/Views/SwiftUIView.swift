//
//  SwiftUIView.swift
//  airplane ground control
//
//  Created by Aditya Tyagi  on 29/03/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack(spacing: -9){
            Text("          Under \n   Construction🚀")
                .foregroundColor(Color("animationColor2"))
                .font(.system(size: 35))
                .padding(.bottom, 50).bold()
            GifImage("constructionAnimation")
                .frame(width: 570, height: 400).padding(.bottom, 70)
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("animationColor"))
    }
}
