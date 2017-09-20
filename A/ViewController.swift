//
//  ViewController.swift
//  technoTapp
//
//  Created by MacBook Pro on 1396/6/11 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,  iCarouselDataSource , iCarouselDelegate , UITableViewDelegate , UITableViewDataSource, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var CollectionView1: UICollectionView!
    
    
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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        icarouselView.type = iCarouselType.cylinder
        icarouselView.contentMode = .scaleAspectFit
//        DownloadicarouselImages()
        icarouselView.reloadData(startTimer())
        sideMenus()
        scroller.contentInset = UIEdgeInsetsMake(0, 0, 13, 0)
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
        return names.count
        
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableViewCell
        
       cell.nameLbl.text = names[indexPath.row]
        cell.familyLbl.text = family[indexPath.row]
////        let imgurl = URL(string : "\(icon[indexPath.row])")
////        
////        let imgdata = NSData(contentsOf: imgurl!)
//        
//        cell.imageview.image = UIImage(data: imgdata! as Data)
        
        cell.Bgimabe.image  = UIImage(named: "\(tableimages[indexPath.row])")
        
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "DetailView") {
            
            let VC = segue.destination as! DetailViewController
            
            if let indexpath = self.tableView.indexPathForSelectedRow {
                let Name = names[indexpath.row] as String
                VC.sentdata1 = Name
                print(VC.sentdata1)
                
                let Id = family[indexpath.row] as String
                VC.sentdata2 = Id
                print(VC.sentdata2)
                
                let Icon = tableimages[indexpath.row] as String
                VC.sentdata3 = Icon
                print(VC.sentdata3)
            }
            
        }
        
    }


}

