//
//  EmojiTranslateApp.swift
//  EmojiTranslate
//
//  Created by Артем Бакулев on 01.11.2020.
//

import SwiftUI


func getEmojiTranslation(sentence: String) -> String {
    if sentence.count == 0 {
        return "nothing here 😓"
    }
    var translatedSentence = ""
    for word in sentence.components(separatedBy: " ") {
        translatedSentence += "\(getWord(word: word.lowercased())) "
    }
    return translatedSentence
}

func copyToClipboard(sentence: String) {
    let pasteboard = UIPasteboard.general
    pasteboard.string = sentence
}


struct ContentView: View {
    @State var sentence: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text("😱").font(.system(size: 60)).padding(40)
            Text("😻 Emoji Translate 😻").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center)
            TextField("type smth", text: $sentence).padding(40).multilineTextAlignment(.center)
            Text("🔥Emojis🔥").font(.title).padding(10)
            Text(getEmojiTranslation(sentence: sentence)).padding()
            Button(action: {
                copyToClipboard(sentence: getEmojiTranslation(sentence: sentence))
            }) {
                Text("copy to clipboard")
            }
        }
    }
}
@main
struct EmojiTranslateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct EmojiTranslateApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
