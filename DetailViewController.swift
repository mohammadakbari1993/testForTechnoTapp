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

//        let Detailurl = URL(string : sentdata3)
//        
//        let imgdata = NSData(contentsOf: Detailurl!)
//        
//        Detailimage.image = UIImage(data: imgdata! as Data)
        
          Detailimage.image = UIImage(named: sentdata3)
        
//        
//        let url = URL(string : "http://www.almachii.ir/test.php")
//        
//        do {
//            let data = try Data(contentsOf : url!)
//            let info = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
//            if let json = info["result"] {
//                for index in 0...json.count-1{
//                    
//                    let aObject = json[index] as! [String : AnyObject]
//                    
//                    id.append(aObject["id"] as! String)
//                    name.append(aObject["name"] as! String)
//                    icon.append(aObject["icon"] as! String)
//                }
//            }
//        }
//        catch{
//            print("error")
//        }
//   
//        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


