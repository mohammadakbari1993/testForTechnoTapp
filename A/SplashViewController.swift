//
//  SplashViewController.swift
//  technoTapp
//
//  Created by MacBook Pro on 1396/6/15 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var GifView: UIImageView!
    

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
