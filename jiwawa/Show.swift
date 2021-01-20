//
//  Show.swift
//  jiwawa
//
//  Created by User10 on 2021/1/19.
//

import SwiftUI



struct Show: View {
    @Binding var show: Bool
    var body: some View {
        Link("神曲點此", destination: URL(string: "https://www.youtube.com/watch?v=Nl4lAO-HFJo")!)
    }
}

struct Show_Previews: PreviewProvider {
    static var previews: some View {
        Show(show: .constant(true))
    }
}
