//
//  GameState.swift
//  猜拳遊戲
//
//  Created by 王昱淇 on 2021/10/19.
//

import Foundation

enum GameState {
    case start
    case win
    case lose
    case draw
    
    var status: String {
        switch self {
        case .start:
            return "Rock,Paper,Scissors？"
        case .win:
            return "You Won！"
        case .lose:
            return "You Lose！"
        case .draw:
            return "It's a Draw！"
        }
    }
}
