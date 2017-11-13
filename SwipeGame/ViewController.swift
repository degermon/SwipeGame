//
//  ViewController.swift
//  SwipeGame
//
//  Created by Daniel Suskevic on 11/11/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    
    var number : Int = 0
    var timer = Timer()
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label1.text = String(number)
        timerExample()
        animate1()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func label1SwipeRight(_ sender: UISwipeGestureRecognizer) {
        number -= 1
        label1.text = String(number)
    }
    
    func animate1() {
        /*animator = UIViewPropertyAnimator(duration: 4.0, curve: .easeInOut, animations: {
            let num1 : CGFloat = CGFloat(arc4random_uniform(667))
            let num2 : CGFloat = CGFloat(arc4random_uniform(375))
            self.label1.frame.origin.y = num1
            self.label1.frame.origin.x = num2
        }) */
        
        UIView.animate(withDuration: 4.0, delay: 0.0, options: .allowUserInteraction, animations: {
            let num1 : CGFloat = CGFloat(arc4random_uniform(667))
            let num2 : CGFloat = CGFloat(arc4random_uniform(375))
            self.label1.frame.origin.y = num1
            self.label1.frame.origin.x = num2
        }, completion: {(bool) in
            self.animate1()
            print("Animation1 completed")
        })
        
        /*
        UIView.animate(withDuration: 4.0, animations: {
            let num1 : CGFloat = CGFloat(arc4random_uniform(667))
            let num2 : CGFloat = CGFloat(arc4random_uniform(375))
            self.label1.frame.origin.y = num1
            self.label1.frame.origin.x = num2
        }, completion: {(bool) in
            self.animate1()
            print("Animation1 completed")
        }) */
    }
    
    func timerExample() {
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        number += 1
        label1.text = String(number)
    }
    
}

