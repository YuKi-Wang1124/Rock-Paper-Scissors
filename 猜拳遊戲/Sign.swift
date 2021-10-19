//
//  Sign.swift
//  猜拳遊戲
//
//  Created by 王昱淇 on 2021/10/19.
//

import Foundation
import CoreText



enum Sign {
    case paper
    case scissors
    case rock
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊🏻"
        case .paper:
            return "🖐🏻"
        case .scissors:
            return "✌🏻"
        }
    }
    
    func gameState(against opponentSign: Sign) -> GameState {
        if self == opponentSign {
            return .draw
        }
        switch self {
        case .paper:
            if opponentSign == .rock {
                return .win
            }
        case .scissors:
            if opponentSign == .paper {
                return .win
            }
        case .rock:
            if opponentSign == .scissors {
                return .win
            }
        }
        return .lose
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}
