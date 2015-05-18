//
//  ViewController.swift
//  SwiftFizzBuzz
//
//  Created by John Dyer on 18/05/2015.
//  Copyright (c) 2015 John Dyer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    //Set up the two alerts
    let startAlert = UIAlertController(title: "New Game", message: "Fizz if divisable by 3. Buzz if divisable by 5. Fizz buzz if divisable by both.",preferredStyle: UIAlertControllerStyle.Alert)
    let endAlert = UIAlertController(title: "Wrong choice", message: "You lost the game please try again", preferredStyle: UIAlertControllerStyle.Alert)
    //Number that is currently in the view
    var currentNum = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberLabel.text = currentNum.description
        //Add action to the alerts
        startAlert.addAction(UIAlertAction(title: "Begin", style: UIAlertActionStyle.Default,handler: nil))
        endAlert.addAction(UIAlertAction(title: "Start again", style: UIAlertActionStyle.Default,handler: nil))
    }
    
    override func viewDidAppear(animated: Bool)
    {
        //Show alert at begining of game
        self.presentViewController(startAlert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //The buttons simply send a varible to updateGame with what was selected
    @IBAction func fizzButton(sender: AnyObject)
    {
        updateGame("fizz")
    }
    @IBAction func buzzButton(sender: AnyObject)
    {
        updateGame("buzz")
    }
    @IBAction func fizzBuzzButton(sender: AnyObject)
    {
        updateGame("fizzbuzz")
    }
    @IBAction func nextButton(sender: AnyObject)
    {
        updateGame("none")
    }

    //Calls checkAnswer() and updates view or restarts game
    func updateGame(fizzBuzz: String)
    {
        var answerCorrect: Bool = checkAnswer(fizzBuzz)
        
        if (answerCorrect)
        {
            currentNum++
            numberLabel.text = currentNum.description
        }
        else
        {
            self.presentViewController(endAlert, animated: true, completion: nil)
            currentNum = 1
            numberLabel.text = currentNum.description
        }
    }

    //Checks mod to check if divisable by 3/5 or both. Returns true if correct answer.
    func checkAnswer(answer: String) -> Bool
    {
        switch(answer)
        {
        case "fizz":
            if currentNum%3==0
            {
                return true
            }
            else
            {
                return false
            }
        case "buzz":
            if currentNum%5==0
            {
                return true
            }
            else
            {
                return false
            }
        case "fizzbuzz":
            if ((currentNum%3)==0)&&((currentNum%5)==0)
            {
                return true
            }
            else
            {
                return false
            }
        case "none":
            //Slight issue of not being able to use != but greater than works.
            if ((currentNum%3)>0)&&((currentNum%5)>0)
            {
                return true
            }
        default:
            return false
        }
        return false
    }
}

