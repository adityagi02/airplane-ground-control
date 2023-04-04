//
//  GifView.swift
//  GifView_SwiftUI
//
//  Created by Pedro Rojas on 16/08/21.
//

import SwiftUI
import WebKit

struct ColoredView: UIViewRepresentable {
    var color: Color
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor =  UIColor(Color("animationColor"))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct GifImage: UIViewRepresentable {
    private let name: String

    init(_ name: String) {
        self.name = name
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }

}


struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        GifImage("constructionAnimation").background(Color("animationColor"))
    }
}
