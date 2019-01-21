//
//  ViewController.swift
//  Geography
//
//  Created by Esteban Ordonez on 1/19/19.
//  Copyright © 2019 Esteban Ordonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var score: Int = 0;
    
    let countryImage: [String] = [
        "Austria",
        "Barbados",
        "Belgium",
        "Canada",
        "Chile",
        "China",
        "Denmark",
        "Ecuador",
        "Finland",
        "Germany",
        "Gibraltar",
        "Honduras",
        "Ireland",
        "Jamaica",
        "Kenya",
        "Liberia",
        "Morocco",
        "Nigeria",
        "Oman",
        "Pakistan",
        "Russia",
        "Somalia",
        "Switzerland",
        "Turkey",
        "Ukraine",
        "Uruguay",
        "Zambia"
    ];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(countryImage.count)
        label.text = "Hit the flag button to start the game. You have one minute!"
    }
    
    @IBAction func getFlag(_ sender: UIButton) {
        score = 0;
        label.text = "Hit the flag button to start the game. You have one minute! Score: \(score)"
        perform(#selector(timer), with: self, afterDelay: 60);
        view.backgroundColor = .white;
        imageView.isHidden = false;
        textField.isHidden = false;
        
        if let flag:Int = Int (arc4random_uniform(27)){
            imageView.image = UIImage(named: countryImage[flag]);
            print(flag)
        }
    }
    
    @IBAction func uInput(_ sender: UITextField) {
        sender.resignFirstResponder()
        if let flag:Int = Int (arc4random_uniform(27)){
            imageView.image = UIImage(named: countryImage[flag]);
        }
        if countryImage.contains(sender.text!){ // Wrong logic.
            score += 1;
            label.text = ("Good job! Total Score: \(score)")
        }else{
            score += 0;
            label.text = "Oups! Wrong Answer... Try this one"
        }
    }
    
    @objc func timer(){
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [],
            animations: {
                self.view.backgroundColor = .black;
                self.label.text = "Time's up. Your final score is: \(self.score)";
                self.imageView.isHidden = true;
                self.textField.isHidden = true;
        },
            completion: nil
        );
    }
}

