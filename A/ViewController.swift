//
//  ViewController.swift
//  technoTapp
//
//  Created by MacBook Pro on 1396/6/11 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController ,  iCarouselDataSource , iCarouselDelegate , UITableViewDelegate , UITableViewDataSource, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
 
    public var dnwstatus = ""
    
    
    @IBOutlet weak var CollectionView1: UICollectionView!
    
    var idtxt : UITextField!
    var nametxt : UITextField!
    var imagetxt : UITextField!
    
    
    var idd : String!
    var namee : String!
    var imagee: String!
    
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var icarouselView: iCarousel!
    var icarouselimages : [String] = []
    var images1 = ["1p.png","2p.png","3p.png","4p.png"]
    var images2 = ["1p.png","2p.png","3p.png","4p.png","1p.png","2p.png","3p.png","4p.png"]
    var tableimages = ["1p.png","2p.png","3p.png","4p.png","1p.png"]
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var timer: DispatchSourceTimer?
    
    
    var names = ["mohammad","hamed","ali","hasan","meysam"]
    var family = ["akbari","zad mahmood","mahmoodi","nahrevani","salehi"]
    

    var id : [String] = []
    var name : [String] = []
    var icon : [String] = []
    
    

    

    
    @IBAction func addinformation(_ sender: Any) {
     
        let Alert = UIAlertController(title: "دریافت اطلاعات", message: "اطلاعات را وارد کنید", preferredStyle:.alert)
        Alert.addTextField(configurationHandler: idtxt)
        Alert.addTextField(configurationHandler: nametxt)
        Alert.addTextField(configurationHandler: imagetxt)
        
        
        Alert.addAction(UIAlertAction(title: "ثبت", style: .default, handler: { (UIAlertAction) in
            
         
            print(self.imagetxt.text as Any)
            print(self.nametxt.text as Any)
            print(self.idtxt.text as Any)
            
            self.idd = self.idtxt.text
            self.namee = self.nametxt.text
            self.imagee = self.imagetxt.text
            
            
            self.Sentdata(id: self.idd, name: self.namee, image: self.imagee)
            
            self.id.removeAll()
            self.name.removeAll()
            self.icon.removeAll()
            
            self.DownloadData()
            self.tableView.reloadData()
         
            
        }))
        self.present(Alert, animated: true, completion: nil)
        
        Alert.addAction(UIAlertAction(title: "انصراف", style: .cancel, handler: nil))
        

    }
    
    
    func idtxt(textField : UITextField!)  {
        idtxt = textField
        idtxt?.placeholder = "id را وارد کنید"
        idtxt.textAlignment = .center

    }
    func nametxt(textField : UITextField!)  {
        nametxt = textField
        nametxt?.placeholder = "نام خود را وارد کنید"
        nametxt.textAlignment = .center

    }
    func imagetxt(textField : UITextField!)  {
        imagetxt = textField
        imagetxt?.placeholder = "آدرسURL عکس را وارد کنید"
        imagetxt.textAlignment = .center

    }

    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        icarouselView.type = iCarouselType.cylinder
        icarouselView.contentMode = .scaleAspectFit
//        DownloadicarouselImages()
        icarouselView.reloadData(startTimer())
        sideMenus()
        scroller.contentInset = UIEdgeInsetsMake(0, 0, 13, 0)
        DownloadData()
        
//        idtxt.layer.cornerRadius = 10
//        idtxt.alpha = 0.8
//        
//        imagetxt.layer.cornerRadius = 10
//        imagetxt.alpha = 0.8
//        
//        nametxt.layer.cornerRadius = 10
//        nametxt.alpha = 0.8
        
    
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
       
    }


    @IBAction func Dissmis(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func sideMenus () {
        
        if revealViewController() != nil {
            
         // revealViewController().rearViewRevealWidth = 279
            revealViewController().rightViewRevealWidth = 230
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    
    @IBAction func menuButton(_ sender: Any) {
        
        sideMenus()
    }
    
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var imageView : UIImageView
        
        if view == nil {
            imageView = UIImageView(frame : CGRect(x: 0, y: 0, width: 255, height: 255))
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView = view as! UIImageView
        }
        
//        let imgurl = URL(string : "\(icarouselimages[index])")
//        
//        let imgdata = NSData(contentsOf: imgurl!)
//        
//        imageView.image = UIImage(data: imgdata! as Data)
        
        imageView.image = UIImage(named: "\(images1[index])")
        
        return imageView
    }
    func numberOfItems(in carousel: iCarousel) -> Int {
        return images1.count
    }
    
    func startTimer() {
        let queue = DispatchQueue.main // you can also use `DispatchQueue.main`, if you want
        timer = DispatchSource.makeTimerSource(queue: queue)
        timer!.scheduleRepeating(deadline: .now(), interval: .seconds(5))
        // using `[weak self]` to avoid strong cycle and memory lake
        timer!.setEventHandler { [weak self] in
            // every 3 seconds scroll to the next item with 1 second duration
            self?.icarouselView.scroll(byNumberOfItems: 1, duration: 1)
        }
        timer!.resume()
    }
    
//    
//    func DownloadicarouselImages() {
//        
//        let url = URL(string : "http://www.almachii.ir/icarouselimages.php")
//        do {
//            let data = try Data(contentsOf : url!)
//            let info = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
//            
//            if let json = info["icarouselimages"] {
//                for index in 0...json.count-1{
//                    
//                    let aObject = json[index] as! [String : AnyObject]
//                    
//                    icarouselimages.append(aObject["image"] as! String)
//                }
//            }
//        }
//        catch{
//            print("error")
//        }
//        
//    }

    
    
    
    func Sentdata(id : String , name : String , image : String) {
        
        Alamofire.request("http://insdata.almachii.ir/get.php?id="+id+"&name="+name+"&icon="+image).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                let Alert2 = UIAlertController(title: "ثبت شد", message:"\(utf8Text)", preferredStyle: .alert)
                Alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              
                self.present(Alert2, animated: true, completion: nil)
                
                
 

                
                
            } else {
                let Alert3 = UIAlertController(title: "ثبت نشد", message:"خطا در ثبت اطلاعات", preferredStyle: .alert)
                Alert3.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               
                self.present(Alert3, animated: true, completion: nil)
            }
            
            self.id.removeAll()
            self.name.removeAll()
            self.icon.removeAll()
            
            self.DownloadData()
            self.tableView.reloadData()
            
            
        }
        return
    }
    
 
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images2.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
   
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = CollectionView1.dequeueReusableCell(withReuseIdentifier: "CellCell", for: indexPath) as! CollectionViewCell1
        cell.img1.image = UIImage(named: images2[indexPath.row])

        return cell
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
        
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableViewCell
        
        cell.nameLbl.text = name[indexPath.row]
        cell.familyLbl.text = id[indexPath.row]
        let nameee = name[indexPath.row]
        let famili = id[indexPath.row]
        print(nameee)
        print(famili)
       
        
        let imgurl = URL(string : "\(icon[indexPath.row])")
        
        let imgdataaa = NSData(contentsOf: imgurl!)
        if imgdataaa != nil {
        
        cell.Bgimabe.image = UIImage(data: imgdataaa! as Data)
        
        }
    //    cell.Bgimabe.image  = UIImage(named: "\(tableimages[indexPath.row])")
        
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "DetailView") {
            
            let VC = segue.destination as! DetailViewController
            
            if let indexpath = self.tableView.indexPathForSelectedRow {
                let Name = name[indexpath.row] as String
                VC.sentdata1 = Name
                print(VC.sentdata1)
                
                let Id = id[indexpath.row] as String
                VC.sentdata2 = Id
                print(VC.sentdata2)
                
                let Icon = icon[indexpath.row] as String
                VC.sentdata3 = Icon
                print(VC.sentdata3)
            }
            
        }
        
    }

    @IBAction func mapview(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mapView") as! MapViewController
        self.present(nextViewController, animated:true, completion:nil)

    }
    

    func DownloadData(){
       
        let url = URL(string : "http://www.almachii.ir/test.php")
        
        do {
            let data = try Data(contentsOf : url!)
            let info = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            
            print("yori json is :" , info)
            
            if let json = info["result"] as? [[String : Any]]{
                for index in 0...json.count-1{
                    
                    let aObject = json[index] as [String : AnyObject]
                    
                    id.append(aObject["id"] as! String)
                    name.append(aObject["name"] as! String)
                    icon.append(aObject["img"] as! String)
                    
                }
                  dnwstatus = "success"
            }
 
        }
        
        catch{
            print("error")
        }

    }
}

