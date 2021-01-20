//
//  Song.swift
//  jiwawa
//
//  Created by User10 on 2021/1/20.
//

import SwiftUI

struct Song: View {
    let url: URL
        
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController,
                                context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Song_Previews: PreviewProvider {
    static var previews: some View {
        Song()
    }
}
