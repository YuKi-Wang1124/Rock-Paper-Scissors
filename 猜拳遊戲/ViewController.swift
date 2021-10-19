//
//  ViewController.swift
//  猜拳遊戲
//
//  Created by 王昱淇 on 2021/10/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var computerSignLabel: UILabel!
    @IBOutlet weak var userSignLabel: UILabel!
    @IBOutlet weak var computerWinAccountLabel: UILabel!
    @IBOutlet weak var userWinAccountLabel: UILabel!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    let statusLabel = UILabel()
    var computerWinAccount = 0
    var userWinAccount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        statusLabel.font = UIFont(name: "Nagurigaki-Crayon", size: 38)
        statusLabel.textAlignment = .center
        statusLabel.frame = CGRect(x: 0, y: 350, width: 414, height: 63)
        statusLabel.backgroundColor = .white
        view.addSubview(statusLabel)
        
        computerSignLabel.layer.cornerRadius = 20
        computerSignLabel.backgroundColor = UIColor.white
        userSignLabel.layer.cornerRadius = 20
        userSignLabel.backgroundColor = UIColor.white
        playAgainButton.isEnabled = false
        
        updateUI(forState: .start)
    }
    
    func updateUI(forState state: GameState) {
        statusLabel.text = state.status
        
        switch state {
        case .start:
            statusLabel.textColor = .black
            computerSignLabel.text = "✌🏻👊🏻🖐🏻"
            userSignLabel.text = "✌🏻👊🏻🖐🏻"
            computerSignLabel.backgroundColor = .white
            userSignLabel.backgroundColor = .white
            playAgainButton.isEnabled = false
            computerWinAccount = 0
            userWinAccount = 0
        case .win:
            statusLabel.textColor = .systemPink
            userWinAccount += 1
        case .lose:
            statusLabel.textColor = .brown
            computerWinAccount += 1
        case .draw:
            statusLabel.textColor = .systemBlue
        }
        
        computerWinAccountLabel.text = "\(computerWinAccount)"
        userWinAccountLabel.text = "\(userWinAccount)"
    }
    
    func play(userSign: Sign) {
        let computerSign = randomSign()
        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        computerSignLabel.text = computerSign.emoji
        userSignLabel.text = userSign.emoji
        
        switch computerSign {
        case .paper:
            computerSignLabel.backgroundColor = UIColor(red: 173/255, green: 211/255, blue: 241/255, alpha: 1)
        case .scissors:
            computerSignLabel.backgroundColor = UIColor(red: 235/255, green: 136/255, blue: 156/255, alpha: 1)
        case .rock:
            computerSignLabel.backgroundColor = UIColor(red: 247/255, green: 186/255, blue: 57/255, alpha: 1)
        }
        
        switch userSign {
        case .paper:
            userSignLabel.backgroundColor = UIColor(red: 173/255, green: 211/255, blue: 241/255, alpha: 1)
        case .scissors:
            userSignLabel.backgroundColor = UIColor(red: 235/255, green: 136/255, blue: 156/255, alpha: 1)
        case .rock:
            userSignLabel.backgroundColor = UIColor(red: 247/255, green: 186/255, blue: 57/255, alpha: 1)
        }
        playAgainButton.isEnabled = true
    }
    
    @IBAction func scissorsChosen(_ sender: Any) {
        play(userSign: .scissors)
    }
    
    @IBAction func rockChosen(_ sender: Any) {
        play(userSign: .rock)
    }
    
    @IBAction func paperChosen(_ sender: Any) {
        play(userSign: .paper)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        updateUI(forState: .start)
    }
    
}




