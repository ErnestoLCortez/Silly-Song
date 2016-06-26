//
//  ViewController.swift
//  Silly Song
//
//  Created by louie on 6/25/16.
//  Copyright © 2016 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func reset(sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(sender: AnyObject) {
        if nameField.text != "" {
            lyricsView.text = lyricsForName(bananaFanaTemplate, fullName: nameField.text!)
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

func shortNameFromName(fullName: String) -> String {
    let vowelSet = NSCharacterSet(charactersInString: "aeiouö")
    let lowerCaseName = fullName.lowercaseString
    
    if let vowelRange = lowerCaseName.rangeOfCharacterFromSet(vowelSet) {
        return lowerCaseName.substringFromIndex(vowelRange.startIndex)
    }
    
    return lowerCaseName
    
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    return lyricsTemplate.stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName).stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortNameFromName(fullName))
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")
