//
//  DetailViewController.swift
//  almachitable
//
//  Created by MacBook Pro on 1396/4/19 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    
    @IBOutlet weak var Detailimage: UIImageView!
    
    @IBOutlet weak var Detailname: UILabel!
    
    @IBOutlet weak var Detailfamily: UILabel!
    
    var sentdata1 : String!
    var sentdata2 : String!
    var sentdata3 : String!
    
    
    var id : [String] = []
    var name : [String] = []
    var icon : [String] = []
    
    

    @IBAction func Dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
 //var url = URL(string : "http://www.almachii.ir/test-2.php")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Detailname.text = sentdata1
        Detailfamily.text = sentdata2

        let imgurl = URL(string : sentdata3)
        
        let imgdata = NSData(contentsOf: imgurl!)
        if imgdata != nil {
        Detailimage.image = UIImage(data: imgdata! as Data)
        }
        
        
        Detailimage.layer.cornerRadius = Detailimage.frame.width / 2
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


