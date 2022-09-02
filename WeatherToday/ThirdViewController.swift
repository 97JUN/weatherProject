//
//  ThirdViewController.swift
//  WeatherToday
//
//  Created by 쭌이 on 2022/08/14.
//

import UIKit

class ThirdViewController: UIViewController {
    
    

    @IBOutlet weak var ThirdImageView: UIImageView!
    @IBOutlet  weak var weatherLabel: UILabel!
    @IBOutlet weak var temperateLabel: UILabel!
    @IBOutlet weak var rainfallLabel: UILabel!
    
    
    var city: String?
    var ThirdTitle: String?
    var labelOne: String?
    var labelTwo: String?
    var labelThree: String?
    var ThirdImage: UIImage?
   
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        super.viewWillAppear(animated)
        
        
        
        
        self.weatherLabel.text = labelTwo
        self.temperateLabel.text = labelThree
        self.rainfallLabel.text = labelOne
        //self.ThirdImageView.image = UIImage(named: city!)
        self.ThirdImageView.image = ThirdImage
       
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // updateUI()
        self.weatherLabel.text = labelTwo
        self.temperateLabel.text = labelThree
        self.rainfallLabel.text = labelOne
        //self.ThirdImageView.image = UIImage(named: city!)
        
      
        
      
        
        
        // Do any additional setup after loading the view.
    }
}
