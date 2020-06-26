//
//  ViewController.swift
//  kalkulator
//
//  Created by Iga Łukiewska on 18/06/2020.
//  Copyright © 2020 Iga Łukiewska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dzialania: UILabel!
    @IBOutlet weak var wynik: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var zapamietana:Double = 0
    var pierwsza:Double = 0
    var drugastr:String = ""
    var druga:Double = 0
    var dzialanie:Int = 0
    var czy_byla_pierwsza:Bool = false
    var czy_byla_druga:Bool = false
    var czy_bylo_dzialanie:Bool = false
    var byl_przecinek_dla_drugiej:Bool = false
    var wyniki:Double = 0
    var bylo_rowna_sie:Bool = false
    var byl_przecinek:Bool = false
    var ile_razy = 0
    @IBAction func usuwanie(_ sender: UIButton)
    {
        if(bylo_rowna_sie == true)
        {
            wynik.text = ""
            dzialania.text = ""
            bylo_rowna_sie = false
            czy_byla_pierwsza = false
            czy_byla_druga = false
            czy_bylo_dzialanie = false
            byl_przecinek = false
            byl_przecinek_dla_drugiej = false
            drugastr=""
            dzialanie = 0
        }
        else if(czy_byla_druga == true)
        {
            czy_byla_druga = false
            dzialania.text = String(pierwsza)
            if(dzialanie == 12)
            {
                dzialania.text = dzialania.text! +
                                   "+"
            }else if(dzialanie == 13)
            {
                dzialania.text = dzialania.text! +
                "-"
            }else if(dzialanie == 14)
            {
                dzialania.text = dzialania.text! +
                "*"
            }else if(dzialanie == 15)
            {
                dzialania.text = dzialania.text! +
                "/"
            }else if(dzialanie == 16)
            {
                dzialania.text = dzialania.text! +
                "^"
            }
        }else if(czy_bylo_dzialanie == true)
        {
            dzialania.text = String(pierwsza)
            czy_bylo_dzialanie = false
            dzialanie = 0
        }else if(czy_byla_pierwsza == true)
        {
            dzialania.text = ""
            czy_byla_pierwsza = false
            dzialanie = 0
        }
    }
    @IBAction func zapamietanie(_ sender: UIButton)
    {
        if(dzialania.text == "")
        {
            dzialania.text = String(zapamietana)
            czy_byla_pierwsza = true
        }else if(czy_byla_pierwsza == true && czy_byla_druga == false && czy_bylo_dzialanie == true)
        {
            dzialania.text = dzialania.text! + String(zapamietana)
            drugastr = String(zapamietana)
            czy_byla_druga = true
        }
        else
        {
            if(ile_razy == 0)
            {
                zapamietana = wyniki
                ile_razy += 1
            }else
            {
                wynik.text = ""
                dzialania.text = String(zapamietana)
                pierwsza = zapamietana
                czy_byla_pierwsza = true
                czy_bylo_dzialanie = false
                czy_byla_druga = false
                byl_przecinek_dla_drugiej=false
                drugastr=""
                dzialanie = 0
                byl_przecinek = false
                
            }
        }
    }
    
    @IBAction func zapomnienie(_ sender: UIButton)
    {
        zapamietana = 0
        ile_razy = 0
    }
    @IBAction func rowna_sie(_ sender: UIButton)
    {
        if(czy_bylo_dzialanie == true && czy_byla_pierwsza == true && czy_byla_druga == true)
        {
            if(dzialanie == 12)
            {
                wyniki = pierwsza + Double(drugastr)!
                wynik.text = String(wyniki)
            }else if(dzialanie == 13)
            {
                wyniki = pierwsza - Double(drugastr)!
                wynik.text = String(wyniki)
            }else if(dzialanie == 14)
            {
                wyniki = pierwsza * Double(drugastr)!
                wynik.text = String(wyniki)
            }else if(dzialanie == 15)
            {
                wyniki = pierwsza / Double(drugastr)!
                wynik.text = String(wyniki)
            }else if(dzialanie == 16)
            {
                wyniki = pow(pierwsza,  Double(drugastr)!)
                wynik.text = String(wyniki)
            }
            bylo_rowna_sie = true
        }
    }
    @IBAction func dzialanie(_ sender: UIButton)
    {
        if(czy_byla_pierwsza == true)
        {
            pierwsza = Double(dzialania.text!)!
            dzialanie = sender.tag
            czy_bylo_dzialanie = true
            if(dzialanie == 12)
            {
                dzialania.text = dzialania.text! +
                                   "+"
            }else if(dzialanie == 13)
            {
                dzialania.text = dzialania.text! +
                "-"
            }else if(dzialanie == 14)
            {
                dzialania.text = dzialania.text! +
                "*"
            }else if(dzialanie == 15)
            {
                dzialania.text = dzialania.text! +
                "/"
            }else if(dzialanie == 16)
            {
                dzialania.text = dzialania.text! +
                "^"
            }
        }
    }
   
    @IBAction func numbers(_ sender: UIButton)
    {
        if(wynik.text != "")
        {
            czy_byla_pierwsza = false
            czy_byla_druga = false
            czy_bylo_dzialanie = false
            wynik.text=""
            dzialania.text=""
            byl_przecinek_dla_drugiej=false
            drugastr=""
            dzialanie = 0
            byl_przecinek = false
            
        }
        if(czy_bylo_dzialanie == false)
        {
            if(sender.tag != 11)
            {
                dzialania.text = dzialania.text! +
                    String(sender.tag - 1)
                czy_byla_pierwsza = true
            }else if(sender.tag == 11 && dzialania.text != "" && byl_przecinek == false)
            {
                dzialania.text = dzialania.text! +
            "."
                byl_przecinek = true;
            }
            
        }
        else if(czy_byla_pierwsza == true && czy_bylo_dzialanie == true)
        {
            
            if(sender.tag != 11)
            {
                dzialania.text = dzialania.text! +
                    String(sender.tag - 1)
                drugastr = drugastr + String(sender.tag - 1)
                czy_byla_druga = true
            }else if(czy_byla_druga == true && sender.tag == 11 && byl_przecinek_dla_drugiej == false)
            {
                dzialania.text = dzialania.text! +
            "."
                drugastr = drugastr + "."
                byl_przecinek_dla_drugiej = true;
            }
        }
    }
}

