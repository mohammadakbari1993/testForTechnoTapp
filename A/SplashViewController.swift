//
//  SplashViewController.swift
//  technoTapp
//
//  Created by MacBook Pro on 1396/6/15 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit
import SystemConfiguration

class SplashViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var GifView: UIImageView!
    
    @IBOutlet weak var retry: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        
        
        
        GifView.loadGif(name: "200w_d-2")
       
        
        
        perform(#selector(SplashViewController.Showonboarding), with: nil, afterDelay: 5)

        // Do any additional setup after loading the view.
    }
    
    func Showonboarding() {
      
        
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: "onboardingComplete") {
            
           performSegue(withIdentifier: "showlogin", sender: self)
            
        } else {
            
             performSegue(withIdentifier: "showonboarding", sender: self)
            
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        internetcheck()
    }
    
    func internetcheck()  {
        if currentReachabilityStatus == .notReachable {
            let alert = UIAlertController(title: "خطا در اتصال به اینرنت", message: "لطفا اتصال به اینترنت خود را بررسی کنید", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        GifView.isHidden = true
        retry.isHidden = false
    }

    @IBAction func retrybtn(_ sender: Any) {

        internetcheck2()
        retry.isHidden = true
        GifView.isHidden = false
    }
    
    func internetcheck2()  {
        if currentReachabilityStatus == .notReachable {
            let alert = UIAlertController(title: "خطا در اتصال به اینرنت", message: "لطفا اتصال به اینترنت خود را بررسی کنید", preferredStyle: .alert)
           
            alert.addAction(UIAlertAction(title: "تایید", style: .default, handler: { (UIAlertAction) in
                self.GifView.isHidden = true
                self.retry.isHidden = false
            }))
    
            
            
            self.present(alert, animated: true, completion: nil)

            
        } else {
        
        perform(#selector(SplashViewController.Showonboarding), with: nil, afterDelay: 3)

        }
     
    }
    

}
