//
//  OnboardingViewController.swift
//  Blury
//
//  Created by MacBook Pro on 1396/6/1 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit
import PaperOnboarding

class OnboardingViewController: UIViewController , PaperOnboardingDataSource , PaperOnboardingDelegate {

    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBOutlet weak var onboarding: Onboarding!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboarding.delegate = self
        onboarding.dataSource = self
      
        
        
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        
        let backgroundColorOne = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        let backgroundColorTwo = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let backGtoundColorThree = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1)
        
        let titleFont = UIFont(name: "Verdana", size: 24)
        let descriptionFont =  UIFont(name: "Verdana", size: 16)
        
        return [(imageName: UIImage(named: "manager")!, title: "Managed Your business", description: "With making app for yur business you can managed better and improved your jub!", iconName: UIImage(named: "11")!, color: backgroundColorOne, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont!, descriptionFont: descriptionFont!) ,
                
                
                (imageName: UIImage(named: "loupe")!, title: "Improved Your business Rating", description: "Everyone use yor app can be rate your app and business with good produckt you mmust have high rating ", iconName: UIImage(named: "22")!, color: backgroundColorTwo, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont!, descriptionFont: descriptionFont!),
                
                
                (imageName: UIImage(named: "rating")!, title: "Everyone Can Find You", description: "Everyone in everywhere can be find you and use your app . ", iconName: UIImage(named: "323")!, color: backGtoundColorThree, titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont!, descriptionFont: descriptionFont!)
            ] [index]
        
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        
        
        if index == 1 {
            if self.getStartedButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.getStartedButton.alpha = 0
                })
                
            }
        }
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        
        if index == 2 {
            UIView.animate(withDuration: 0.4, animations: {
                self.getStartedButton.alpha = 1
            })
        }
        
    }
    
    
    @IBAction func getStarted(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "onboardingComplete")
        
        userDefaults.synchronize()

        
    }
    
}
