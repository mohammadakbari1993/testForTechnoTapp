//
//  LoginViewController.swift
//  technoTapp
//
//  Created by MacBook Pro on 1396/6/11 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit
import CoreData
import CryptoSwift

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var UsernameTxt: UITextField!
    
    @IBOutlet weak var PasswordTxt: UITextField!
    
    @IBOutlet weak var btnvorod: UIButton!
    
    @IBOutlet weak var btnsabt: UIButton!
    
    var managedObjectContext : NSManagedObjectContext!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        btnsabt.layer.cornerRadius = 10
        btnvorod.layer.cornerRadius = 10
        
        UsernameTxt.text = ""
        PasswordTxt.text = ""
        
        PasswordTxt.isSecureTextEntry = true
        
        
    }
    
    @IBAction func VorodBtn(_ sender: Any) {
        
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let context : NSManagedObjectContext = managedObjectContext
      //  let theEnt = NSEntityDescription.entity(forEntityName: "Users", in: managedObjectContext)
     
        var usenames  = [Users]() // Where Locations = your NSManaged Class
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        usenames = try! context.fetch(fetchRequest) as! [Users]
        
        // Then you can use your properties.
        var number : Int = 1
        
        if (PasswordTxt.text != "") && (UsernameTxt.text != "") {
        for a in usenames {
            
                let pass = PasswordTxt.text?.sha256()
                print(pass as Any)
            
            if (UsernameTxt.text == a.username) && (pass == a.password) {
                    print("Your done")
                    print(number += 1)
                print("pass is this",pass as Any)
                print(a.password as Any)
                
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Mainapp") as! SWRevealViewController
                self.present(nextViewController, animated:true, completion:nil)
                
            }
            
            
            }
            
                        
            
        }  else {
            let Alert2 = UIAlertController(title: "خطا در ورود", message: "لطفا نام کاربری و رمز عبور خود را وارد کنید", preferredStyle: .alert)
            
            Alert2.addAction(UIAlertAction(title: "تایید", style: .default, handler: nil))
            
            self.present(Alert2, animated: true, completion: nil)
            
        }
        
        UsernameTxt.text = ""
        PasswordTxt.text = ""
        

            
        
    }

    

    
    

    @IBAction func SabtNamBtn(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "signup") as! SignupViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }


}
