//
//  ViewController.swift
//  Notatki
//
//  Created by Iga Łukiewska on 18/06/2020.
//  Copyright © 2020 Iga Łukiewska. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate
{
    func textViewDidChange(_ textView: UITextView) {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("saving.txt")
        print(path)
        do{
            try textView.text.write(to: path!, atomically: true, encoding: .utf8)
        }catch
        {
            
        }
    }
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("saving.txt")
        do{
            let input = try String(contentsOf: path!)
            textView.text = input
    }catch
    {
        }
    }

}

