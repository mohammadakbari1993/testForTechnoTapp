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
    
    var isfind = false
    
    @IBOutlet weak var UsernameTxt: UITextField!
    
    @IBOutlet weak var PasswordTxt: UITextField!
    
    @IBOutlet weak var btnvorod: UIButton!
    
    @IBOutlet weak var btnsabt: UIButton!
    
    var managedObjectContext : NSManagedObjectContext!
    
    @IBOutlet weak var Vorodbtn: UIButton!
    
    @IBOutlet weak var SabtBtn: UIButton!
    
    @IBOutlet weak var actind: UIActivityIndicatorView!
    
    
    @IBOutlet weak var loading: UIView!
    
    @IBOutlet weak var loadingimage: UIImageView!
    
    @IBOutlet weak var pleasewait: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        btnsabt.layer.cornerRadius = 10
        btnvorod.layer.cornerRadius = 10
        
        UsernameTxt.text = ""
        PasswordTxt.text = ""
        
        PasswordTxt.isSecureTextEntry = true
        
        actind.stopAnimating()
        loading.layer.cornerRadius = 10
       

        self.hideKeyboard()
        
        
        internetcheck()

        }
        
    
    func internetcheck()  {
        if currentReachabilityStatus == .notReachable {
            let alert = UIAlertController(title: "خطا در اتصال به اینرنت", message: "لطفا اتصال به اینترنت خود را بررسی کنید", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
    }
        
        
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
                
                actind.startAnimating()
                
                pleasewait.isHidden = false
                
                loading.isHidden = false
                
                self.disable()
                
                isfind = true
                
                
            }
            }
            if (isfind == false){
                let wrongalert = UIAlertController(title: "خطا در ورود اطلاعات", message: "لطفا نام کاربری و رمز عبور خود را به درستی وارد نمایید", preferredStyle: .alert)
                wrongalert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(wrongalert, animated: true, completion: nil)
            }

            
//            UsernameTxt.placeholder = UsernameTxt.text
//            UsernameTxt.isUserInteractionEnabled = false
//            
//            UsernameTxt.text = ""
//            PasswordTxt.isUserInteractionEnabled = false
//            PasswordTxt.placeholder = "******"
//            PasswordTxt.text = ""
//            Vorodbtn.alpha = 0.5
//            SabtBtn.alpha = 0.5
//            Vorodbtn.isUserInteractionEnabled = false
//            SabtBtn.isUserInteractionEnabled = false
           
            
        }  else {
            
            actind.stopAnimating()
            
            pleasewait.isHidden = true
            
            loading.isHidden = true

            
            
            
            let Alert2 = UIAlertController(title: "خطا در ورود", message: "لطفا نام کاربری و رمز عبور خود را وارد کنید", preferredStyle: .alert)
            
            Alert2.addAction(UIAlertAction(title: "تایید", style: .default, handler: nil))
            
            self.present(Alert2, animated: true, completion: nil)
            
        }
        
        
        
  
        
    }


    @IBAction func SabtNamBtn(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "signup") as! SignupViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    
//    func displaySignUpPendingAlert() -> UIAlertController {
//        //create an alert controller
//        let pending = UIAlertController(title: "Creating New User", message: nil, preferredStyle: .alert)
//        
//        //create an activity indicator
//        let indicator = UIActivityIndicatorView(frame: pending.view.bounds)
//        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        
//        //add the activity indicator as a subview of the alert controller's view
//        pending.view.addSubview(indicator)
//        indicator.isUserInteractionEnabled = false // required otherwise if there buttons in the UIAlertController you will not be able to press them
//        indicator.startAnimating()
//        
//        self.present(pending, animated: true, completion: nil)
//        
//        return pending
//    }
    
    func disable() {
        UsernameTxt.placeholder = UsernameTxt.text
        UsernameTxt.isUserInteractionEnabled = false
        
        UsernameTxt.text = ""
        PasswordTxt.isUserInteractionEnabled = false
        PasswordTxt.placeholder = "******"
        PasswordTxt.text = ""
        Vorodbtn.alpha = 0.5
        SabtBtn.alpha = 0.5
        Vorodbtn.isUserInteractionEnabled = false
        SabtBtn.isUserInteractionEnabled = false
    }

    
}

extension LoginViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(LoginViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}


