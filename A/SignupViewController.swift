//
//  SignupViewController.swift
//  technoTapp
//
//  Created by MacBook Pro on 1396/6/11 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit
import CoreData
import CryptoSwift

class SignupViewController: UIViewController {
    
    var managedObjectContext : NSManagedObjectContext!
    
    var Users : Array<AnyObject> = []
    
    var picker = Bool()
    
    @IBOutlet weak var Citytxt: UITextField!
    @IBOutlet weak var Datetxt: UITextField!
    
    @IBOutlet weak var Usenametxt: UITextField!
    
    @IBOutlet weak var Emailtxt: UITextField!
    
    @IBOutlet weak var Passwordtxt: UITextField!
    
    @IBOutlet weak var btnsabt: UIButton!
    
    @IBOutlet weak var btnvorod: UIButton!
    
    let City = ["یزد","شیراز","اصفهان","زاهدان","بوشهر","کرمان","تبریز","مشهد","کرج","تهران"]
    
    let CityPicker = UIPickerView()

    
    // variable for datepicker
    var CitySelector : String?
  



    override func viewDidLoad() {
        super.viewDidLoad()

        btnvorod.layer.cornerRadius = 10
        btnsabt.layer.cornerRadius = 10
        Passwordtxt.isSecureTextEntry = true
        CreateCityPicker()
        CreateToolbar()
               
        
        
    }
    


    
    func CreateCityPicker() {
        CityPicker.delegate = self

  
        Citytxt.inputView = CityPicker
        
         // Customize 
        CityPicker.backgroundColor = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        
        return
      
    }
    
    func CreateToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
         // Customize 
        toolbar.barTintColor = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        toolbar.tintColor = .black
        
        
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector (SignupViewController.DismissKeyboard))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        Citytxt.inputAccessoryView = toolbar
        
    }
    
    
    
    func DismissKeyboard() {
        view.endEditing(true)
    }
    

    
    @IBAction func SabtBtn(_ sender: Any) {
        
        
        if (Usenametxt.text != "") && (Emailtxt.text != "") && (Passwordtxt.text != "") {
            
     
        
         self.managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let theEnt = NSEntityDescription.entity(forEntityName: "Users", in: self.managedObjectContext)
        
        
        let newitem = users(entity: theEnt!, insertInto: self.managedObjectContext)
        
        newitem.username = self.Usenametxt.text!
      
        newitem.email = self.Emailtxt.text!
       
        newitem.password = self.Passwordtxt.text!.sha256()
            
            print(newitem.password)
        
        
        do {
            
            try self.managedObjectContext.save()
            
        } catch _ {
            
        }
            self.navigationController?.popToRootViewController(animated: true)
        
        
        
        
        let Alert = UIAlertController(title: "\(newitem.username )عزیز", message: "اطلاعات شما ثبت و به صفحه ورود به برنامه هدایت خواهید شد!!!", preferredStyle: .alert)
        
        Alert.addAction(UIAlertAction(title: "تایید", style: .default, handler: { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(Alert, animated: true, completion: nil)
        } else {
            
            let Alert = UIAlertController(title: "خطا در ثبت نام", message: "تمام فیلدها باید پر شوند", preferredStyle: .alert)
            
            Alert.addAction(UIAlertAction(title: "تایید", style: .default, handler: nil))
            
            self.present(Alert, animated: true, completion: nil)
        }
            

        
    
}


    @IBAction func VorodBtn(_ sender: Any) {
    
        self.dismiss(animated: true, completion: nil)
       
    }
    
}

extension SignupViewController : UIPickerViewDelegate , UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    
            return 1

        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
       
    return City.count
        
            }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
                return City[row]
            
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CitySelector = City[row]
        Citytxt.text = CitySelector
    }
    
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        var label = UILabel()
//        if let view = view as? UILabel {
//            label = view
//        } else {
//            label = UILabel()
//        }
//        label.textColor = .black
//        label.textAlignment = .center
//        label.font = UIFont(name: "Kohinoor Arabic Light.TTF", size: 17)
//        label.text = City[row]
//
//        return label
//    }
}

















