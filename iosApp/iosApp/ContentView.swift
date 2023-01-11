import SwiftUI
import shared
import WebKit

struct ContentView: View {
    var body: some View {
        WebView()
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

struct WebView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> WebViewController {
        // Do some configurations here if needed.
        return WebViewController()
    }
    
    func updateUIViewController(_ uiViewController: WebViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}
