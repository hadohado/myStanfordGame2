//
//  EMGameViewModel.swift
//  myStanfordGame1
//
//  Created by ha tuong do on 5/17/21.
//

import SwiftUI

class EMGameViewModel : ObservableObject {
    static let emojis: Array<String> = ["π", "π", "π", "βοΈ", "π©ββ€οΈβπ¨", "π§²", "πΈ", "πΊπ³","π¦" ]
    static let myImage = UIImage(named: "parrot")
    static let emojisImage: Array<UIImage> = [myImage!]
    // @Published  var model: MGameModel<String> = MGameModel(numPairsOfCards: emojis.count, emojis: emojis)
    
    @Published  var model: MGameModel<String>
        = MGameModel<String>( numberOfPairsOfCards: emojis.count) { pairIndex  in return emojis[pairIndex] }
        // = MGameModel(numPairsOfCards: emojis.count, emojis: emojis)
    
    
    
    var cards: Array<MGameModel<String>.Card> {
        return model.cards
    }
    
    // I need this to make game choose !
    // MARK: - Intents
    
    func choose(card: MGameModel<String>.Card) {
        // objectWillChange.send() // re-active, dont need object..() since we have @Published above
        model.chooseCard(card: card)
    }
}
