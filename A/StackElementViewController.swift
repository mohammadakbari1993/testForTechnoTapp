//
//  StackElementViewController.swift
//  StackedMenu
//
//  Created by Training on 14/08/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class StackElementViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    
    
    @IBOutlet weak var StackImage: UIImageView!
    
    
    var headerString:String? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        headerLabel.text = headerString
    }
    
    
    @IBOutlet weak var textView: UITextView!
    
    var textview:String? {
        didSet {
            configuretextView()
        }
    }
    
    func configuretextView() {
        textView.text = textview
    }

//    var stackimg:UIImage? {
//        didSet {
//            imgconfig()
//        }
//    }
    
//    func imgconfig() {
//        StackImage.image = stackimg
//    }

    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
