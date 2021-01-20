//
//  ContentView.swift
//  jiwawa
//
//  Created by User14 on 2020/11/3.
//

import SwiftUI
import UIKit
import SafariServices

struct ContentView: View {
    @State private var ShowImage = false
    @State private var ChooseIndex: Int = 1
    @State private var date = Date()
    @State private var ShowAlert = false
    @State private var bgColor = Color.black
    @State private var dog: CGFloat = 0
    @State private var age  = ""
    @State var urlString = "https://www.youtube.com/watch?v=Nl4lAO-HFJo"
    @State private var show = false
    
    let doggie = ["長毛","短毛"]
        
    var body: some View {
        VStack {
            Text("幸運吉娃娃")
            if ShowImage{
                Button(action: {ShowAlert = true}){
                    Image("\(ChooseIndex+1)")
                        .resizable()
                        .frame(width: 300, height: 500)
                        .scaledToFit()
                }.alert(isPresented: $ShowAlert) { () -> Alert in
                    let answer = ["你今天吉了嗎？", "哩五炭吉謀！"].randomElement()!
                    return Alert(title: Text(answer))
                }
            }
            Form{
                Toggle("顯示圖片", isOn: $ShowImage)
                DatePicker("今日日期", selection: $date, displayedComponents: .date)
//                    Text("選擇你的幸運吉娃娃").offset(x: -3, y: 6)
                LuckyChoice(ChooseIndex: $ChooseIndex)
                RandomChoice(ChooseIndex: $ChooseIndex)
                HStack{
                    Stepper("想養幾隻吉娃娃", value: $dog, step: 1)
                    Text("\(Int(dog))隻")
                }
                HStack{
                    Slider(value: $dog, in: 0...10, step: 1, minimumValueLabel: Text("0隻"), maximumValueLabel: Text("10隻")){
                        Text("dog")
                    }
                }
                HStack{
                    Text("小可愛年紀")
                    TextField("年紀", text: $age)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }
                DisclosureGroup("小可愛種類") {
                    VStack(alignment: .leading) {
                        ForEach(doggie.indices) {
                            (index) in
                            Text(doggie[index])
                        }
                    }
                }
                Button(action: {
                    self.urlString = "https://www.youtube.com/watch?v=Nl4lAO-HFJo"
                    self.show.toggle()
                }){
                    Text("吉娃娃教神曲")
                }.sheet(isPresented: $show) {
                    SafariView(url:URL(string: self.urlString)!)
                }
                ColorPicker("設定文字顏色", selection: $bgColor)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(bgColor)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LuckyChoice: View {
    @Binding var ChooseIndex : Int
    
    var body: some View {
        Picker(selection: $ChooseIndex, label: Text("選擇你的幸運吉娃娃")){
            ForEach(0 ..< 15){ item in
                Text("\(item+1)")
            }
        }
        .pickerStyle(MenuPickerStyle())
    }
}

struct RandomChoice: View {
    @Binding var ChooseIndex : Int
    
    var body: some View {
        Button("隨機好運吉娃娃"){
            ChooseIndex = Int.random(in: 0...14)
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController,
        context: UIViewControllerRepresentableContext<SafariView>) {

    }
    
}
