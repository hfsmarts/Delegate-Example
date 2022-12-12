//
//  ViewController.swift
//  DelegateExmple
//
//  Created by Harun Fazlic on 12. 12. 2022..
//

import UIKit
//RECEIVER

protocol DataDelegate { /*STEP-1*/
    func printThisString(string: String)
}
class ViewControllerReceiver: UIViewController, DataDelegate /*STEP-2*/ {
    
    func printThisString(string: String) {/*STEP-3*/
        print(string)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        perform(#selector(advance), with: nil, afterDelay: 5)
        
    }
    @objc func advance() {
        var vc = ViewControllerSender()
        vc.delegate = self /*STEP-6*/
        present(vc, animated: true, completion: nil)
    }
}

//SENDER
class ViewControllerSender: UIViewController {
    
    var delegate: DataDelegate? /*STEP-4*/

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        delegate?.printThisString(string: "Move this from sender to reciver") /*STEP-5*/
    }
}

//STEPS
//STEP-1 Protocol Declaration
//STEP-2 Reciver ViewController class conforms to that protocol
//STEP-3 In order to conform to the protocol Reciever ViewController class must include conforming protocol methods
//STEP-4 Sender contains optional var delegate of protocol type inside ViewController class
//STEP-5 In viewDidLoad function is called delegate optional . Function name with parameter
//STEP-6 Associate delegate when passing variable to VC vc.delegate = self





