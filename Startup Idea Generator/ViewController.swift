//
//  ViewController.swift
//  Startup Idea Generator
//
//  Created by Edwin Cloud on 8/28/18.
//  Copyright © 2018 Edwin Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var companies = ["Make School", "Uber", "Netflix", "Facebook", "Google", "Kickstarter", "Spotify", "Airbnb", "Snapchat", "YouTube", "Dropbox", "Amazon", "Craigslist", "Tinder", "Instagram", "Tesla", "Twitter", "SpaceX"]
    var ideas = ["Dogs", "Books", "Gamers", "Star Wars", "Bitcoin", "Goats", "Zombies", "Rich People", "Swimmers", "Florida", "Vampires", "Dragons", "Internet of Things", "Mars", "Cryptocurrency", "Mosquito Repellent", "Fidget Spinners", "Sun Screen", "Water Bottles", "Lost Travelers", "Superheroes"]
    
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var forLabel: UILabel!
    @IBOutlet var mainView: UIView!
    
    @IBAction func generateButtonTapped(_ sender: UIButton) {
        generateIdea()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        generateIdea()
    }
    
    func setTheme() {
        label1.text = ""
        label2.text = ""
        forLabel.text = ""
        generateButton.backgroundColor = UIColor.gray
        generateButton.layer.cornerRadius = 5
    }
    
    func generateIdea() {
        label1.text = companies[Int(arc4random_uniform(UInt32(companies.count)))]
        label2.text = ideas[Int(arc4random_uniform(UInt32(companies.count)))]
        forLabel.text = "for"
        
        // Screen Flash Animation Logic Below
        let curBGColor = mainView.backgroundColor
        UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.mainView.layer.opacity = 0.6
                self.mainView.backgroundColor = UIColor.white
        }, completion: nil)
        UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.mainView.layer.opacity = 1.0
            self.mainView.backgroundColor = curBGColor
        }, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setTheme()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

