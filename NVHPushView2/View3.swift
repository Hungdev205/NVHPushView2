//
//  View3.swift
//  NVHPushView2
//
//  Created by Hùng Nguyễn  on 7/4/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit

class View3: UIViewController {
    
    @IBOutlet weak var lbl_p1: UILabel!
    @IBOutlet weak var lbl_p2: UILabel!
    @IBOutlet weak var lbl_p3: UILabel!
    @IBOutlet weak var lbl_right: UILabel!
    @IBOutlet weak var lbl_wrong: UILabel!
    @IBOutlet weak var lbl_timer: UILabel!
    
    @IBOutlet weak var btn_b1: UIButton!
    @IBOutlet weak var btn_b2: UIButton!
    @IBOutlet weak var btn_b3: UIButton!
    
    
    // var counter = 0
    var counter = 30
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl_right.textColor = UIColor.blueColor()
        lbl_wrong.textColor = UIColor.redColor()
        
        setRandom()
    }

    @IBAction func btn1_acc(sender: UIButton) {
        click(btn_b1.currentTitle!)
        setRandom()
    }
    @IBAction func btn2_acc(sender: UIButton) {
        click(btn_b2.currentTitle!)
        setRandom()
    }
    @IBAction func btn3_acc(sender: UIButton) {
        click(btn_b3.currentTitle!)
        setRandom()
    }
    
    @IBAction func startTimerButtonTapped(sender: UIButton){
        timer.invalidate() // just in case this button is tapped multiple times
        
        // start the timer
        //        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(timerCountAction), userInfo: nil, repeats: true)
        //        timerCountAction()
        
        // Count Down Clock
        lbl_timer.text = "30"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(timerCountDown), userInfo: nil, repeats: true)
        
        timerCountDown()
    }
    
    
    func setRandom() {
        // lấy 2 số ngẫy nhiên từ 1 đến 10
        let random1 = Int(arc4random_uniform(4)) + 1
        // random ra 1 so tu 1 den 10
        let random2 = Int(arc4random_uniform(4)) + 1
        // hiển thị 2 số lấy được lên 2 lable View
        lbl_p1.text = String(random1)
        lbl_p2.text = String(random2)
        // random phep tinh +, -
        if (random1 >= random2 ) {
            lbl_p3.text = "-"
            setResultMinus(random1, randomB: random2)
        } else {
            lbl_p3.text = "+"
            setResultSum(random1, randomB: random2)
        }
        
    }
    
    func setResultSum(randomA: Int, randomB: Int) {
        // random ket qua o cac vi tri khac nhau
        btn_b1.setTitle(String(randomA), forState: .Normal)
        btn_b2.setTitle(String(randomB), forState: .Normal)
        btn_b3.setTitle(String(sum(randomA, p2: randomB)), forState: .Normal)
        if (randomA == randomB ) {
            btn_b1.setTitle(String(randomA), forState: .Normal)
            btn_b2.setTitle(String(sum(randomA, p2: randomA)), forState: .Normal)
            btn_b3.setTitle(String(randomA), forState:  .Normal)
        } else {
            btn_b1.setTitle(String(sum(randomA, p2: randomB)), forState: .Normal)
            btn_b2.setTitle(String(randomB), forState: .Normal)
            btn_b3.setTitle(String(randomA), forState: .Normal)
        }
        
    }
    
    func setResultMinus(randomA: Int, randomB: Int) {
        // random ket qua o cac vi tri khac nhau
        btn_b1.setTitle(String(minus(randomA, p2: randomB)), forState: .Normal)
        btn_b2.setTitle(String(randomB), forState: .Normal)
        btn_b3.setTitle(String(randomA), forState: .Normal)
        if randomB == randomA  {
            btn_b1.setTitle(String(randomA), forState: .Normal)
            btn_b2.setTitle(String(minus(randomA, p2: randomA)), forState: .Normal)
            btn_b3.setTitle(String(randomA), forState:  .Normal)
        } else {
            btn_b1.setTitle(String(randomA), forState: .Normal)
            btn_b2.setTitle(String(randomB), forState: .Normal)
            btn_b3.setTitle(String(minus(randomA, p2: randomB)), forState: .Normal)
        }
    }
    
    func click(value: String)
    {
        var countRight :Int = 0
        var countWrong :Int = 0
        if (lbl_p3.text == "-")  {
            if (minus(Int(lbl_p1.text!)!, p2: Int(lbl_p2.text!)!) == Int(value)!) {
                countRight = Int(lbl_right.text!)! + 1
                lbl_right.text = String(countRight)
            } else {
                countWrong = Int(lbl_wrong.text!)! + 1
                lbl_wrong.text = String(countWrong)
            }
        }
        
        if (lbl_p3.text == "+") {
            if (sum(Int(lbl_p1.text!)!, p2: Int(lbl_p2.text!)!) == Int(value)!)  {
                countRight = Int(lbl_right.text!)! + 1
                lbl_right.text = String(countRight)
            } else {
                countWrong = Int(lbl_wrong.text!)! + 1
                lbl_wrong.text = String(countWrong)
            }
        }
    }
    
    func sum(p1: Int, p2: Int) -> Int {
        return p1 + p2
    }
    
    func minus(p1: Int, p2: Int) -> Int {
        return p1 - p2
    }
    
    func timerCountAction() {
        counter += 1
        lbl_timer.text = String(counter)
    }
    func timerCountDown() {
        counter -= 1
        lbl_timer.text = String(counter)
        if counter == 0 {
            timer.invalidate()
            counter = 30
            
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
