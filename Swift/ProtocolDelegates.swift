//
//  MyTimer.swift
//  SwiftProtocol


    //create protocol so our delegate (Class B) knows what function to call
    protocol DelegateA {
        required func callBack()
    }

    //Class A
    class A = {
        //make sure our delegate is of type DelegateA
        var delegate: DelegateA?
        init(){
            self.dothat()
        }
        func doThat(){
            self.delegate?.callBack()
        }

    }

    //Class B
    class B : DelegateA = {
        var classA = A()
        init(){
            //assign the delegate to this class
            classA.delegate = self
        }
        func callBack(){
            println("done")
        } 

    }









import UIKit

// set up the MyTimerDelegate protocol with a single option timer finished function
@objc protocol MyTimerDelegate{
    optional func timerFinished()
}


class MyTimer: UIViewController {
    
    // this is where we declare our protocol
    var delegate:MyTimerDelegate?
    
    // set up timer variables and labels
        var timer:NSTimer! = NSTimer()      //timer for countdown
        var labelTimer:NSTimer! = NSTimer() //timer for label
        var timerLabel:UILabel! = UILabel() //label
        var timerCount = 0
        var duration = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
            timerLabel = UILabel(frame: self.view.frame)
            timerLabel.textAlignment = NSTextAlignment.Center
        
        //add to view
            self.view.addSubview(timerLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTimer(timerDuration:Double){
        //set variable to argument 
        self.duration = Int(timerDuration)
        
        timerLabel.text = String(format: "%d", duration)
        
        //countdown timer
        timer =         NSTimer.scheduledTimerWithTimeInterval(timerDuration,   target: self, selector: Selector("timerFired:"), userInfo: nil, repeats: false)
        
        //update ui label every second
        labelTimer =    NSTimer.scheduledTimerWithTimeInterval(1.0,             target: self, selector: Selector("updateLabel:"), userInfo: nil, repeats: true)
        
        
    }
    
    func timerFired(timer:NSTimer){
        
        if(timer.valid){
            timer.invalidate()
        }
        if(labelTimer.valid){
            labelTimer.invalidate()
        }

        // ************************************** \\
        // ************************************** \\
        // This is the important part right here
        // we want to call our protocol method
        // so the class implementing this delegate will know
        // when the timer has finished
        // ************************************** \\
        // ************************************** \\
        
        /*
            if there's a delegate, 
            and this class (once instatiated) has a reference to it, 
            call it's timerFinished method
        */
        delegate?.timerFinished!()
        
    }
    
    func updateLabel(timer:NSTimer){
        duration = duration - 1
        timerLabel.text = String(format: "%d", duration)
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}


// add our MyTimerDelegate to our class
class ViewController: UIViewController, MyTimerDelegate {
    
    //create Timer Class
    var timer:MyTimer = MyTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer.view.frame = self.view.frame
        
       
        
        /*
            This is where we let the delegate know 
            we are listening for the timerFinished method

            
            within the MyTimer class, there's a property called delegate
            set this variable to reference the current class (so it has a reference for later on)
            so once the timer is done, it'll call timerFinished() within ViewController class

        */
        timer.delegate = self


        self.view.addSubview(timer.view)
        
        //begin time
        timer.startTimer(10.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ************************ \\
    // This is where our delegate method is fired
    // ************************ \\
    func timerFinished(){
        timer.startTimer(10.0)
        println("Hey my delegate is working")
    }

}




/*
 { (parameters) -> (return type) in
     statements
 }
*/


protocol BeerDelegate {
    
    func getMoreBeer()
    
}



class Beer : NSObject {
    
    var timer: NSTimer! = NSTimer()
    
    var ct = 5
    
    override init(){
    
        
        
        super.init()
        
        
        
    }
    
    func startDrinking(){
        println("yepp")
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
            target : self,
            selector : Selector("startDrinking:"),
            userInfo : nil,
            repeats: true
        
        )
    }
    
    
    
    func drink(timer: NSTimer){

        println("yepp")
        
        print(timer)
        
        self.ct = self.ct - 1; 
        
        print(self.ct)
        
        if self.ct < 1 {
            timer.invalidate()
        }
        
        
        
    }
    
    func outofBeer(){
        
        
    }
  
}

class Brain : BeerDelegate {
    
    var delegate: BeerDelegate?
    
    func getMoreBeer(){
        
    }
    
}


