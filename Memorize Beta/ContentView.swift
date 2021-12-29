//
//  ContentView.swift
//  Memorize Beta
//
//  Created by Rituraj Mahato on 02/11/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚚","🚘","🚖","🚠","🚟","🚃","🚝","🚞","🚄"]
    @State var emojiCount = 12
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns :[GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: {emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }.foregroundColor(.black)
                
            }
            Spacer()
            HStack {
                remove
                Spacer()
                Text("Shuffle")
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.center)
                Spacer()
                add
            }.font(.largeTitle)
                .padding(.horizontal)
        }
        .padding()
    }
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1 }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    var add: some View{
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1 }
            }, label: {
            Image(systemName: "plus.circle")
            })
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius : 10.0)
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth : 2.5)
                Text(content).font(.largeTitle)
            } else {
                shape.fill(.red)
                shape.strokeBorder(lineWidth : 2.5)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
            .preferredColorScheme(.light)
    }
}

//        return RoundedRectangle(cornerRadius : 20.0)
//            .stroke(lineWidth : 4)
//            .padding(.horizontal)
//            .foregroundColor(/*@START_MENU_TOKEN@*/.pink/*@END_MENU_TOKEN@*/)
        
//        Text("Hello, World!").foregroundColor(Color.red).padding()
