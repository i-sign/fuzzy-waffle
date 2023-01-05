import SwiftUI
import shared
import WebKit

struct ContentView: View {
    @State private var showLoginForm: Bool = true
    @State private var url = "https://www.finnomena.com"

	let greet = Greeting().greet()

	var body: some View {
		WebView(url: url)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}

struct WebView : UIViewRepresentable {
    var url: String

    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(url)
    }
}