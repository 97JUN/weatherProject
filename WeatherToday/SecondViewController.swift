//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by 쭌이 on 2022/08/13.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
   
    
    @IBOutlet weak var secondTableview: UITableView!
    
    
    let cellIdentifierTwo: String = "CustomCell"
    var stateOfWeather: Int? //Json데이터 날씨 상태
    var weathers: [Weather] = []
    var titleSet: String?
    let weatherimages = ["cloudy", "sunny", "rainy", "snowy"]
    var weatherImage: UIImage? = nil
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifierTwo, for: indexPath) as! CustomCell
        
        let weather: Weather = self.weathers[indexPath.row]
        
        
        
        
        cell.cityLabel.text = weather.cityName
        cell.celsiusLabel.text = weather.celsiusString
        cell.rainfallLabel.text = weather.rainfallProbabilityString
        
        
        if weather.celsius < 10 {
            cell.celsiusLabel.textColor = .blue
        } else {
            cell.celsiusLabel.textColor = .black
        }
        
        if weather.rainfallProbability > 50 {
            cell.rainfallLabel.textColor = .orange
        }else {
            cell.rainfallLabel.textColor = .black
        }
        
        
        switch weather.state {
        case 10:
            cell.secondImageView.image = UIImage(named: weatherimages[1])
            
        case 11:
            cell.secondImageView.image = UIImage(named: weatherimages[0])
            
        case 12:
            cell.secondImageView.image = UIImage(named: weatherimages[2])
            
        case 13:
            cell.secondImageView.image = UIImage(named: weatherimages[3])
            
        default:
            cell.secondImageView.image = nil
            
        }
        
        self.stateOfWeather = weather.state
        
        
      
       
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomCell
        vc.ThirdImage = cell.secondImageView.image
        vc.labelTwo = cell.cityLabel.text
        vc.labelOne = cell.rainfallLabel.text
        vc.labelThree = cell.celsiusLabel.text
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = titleSet
    

        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        var dataAsset: NSDataAsset?
        
        
        
        
        
        if titleSet == "한국" {
            dataAsset = NSDataAsset(name: "kr")
        } else if titleSet == "미국" {
            dataAsset = NSDataAsset(name: "us")
        } else if titleSet == "이탈리아" {
            dataAsset = NSDataAsset(name: "it")
        } else if titleSet == "일본" {
            dataAsset = NSDataAsset(name: "jp")
        } else if titleSet == "독일" {
            dataAsset = NSDataAsset(name: "de")
        } else if titleSet == "프랑스" {
            dataAsset = NSDataAsset(name: "fr")
        }
        
        
        do {
            self.weathers = try jsonDecoder.decode([Weather].self, from: dataAsset!.data)
            
        }catch {
            print(error.localizedDescription)
        }
        
        self.secondTableview.reloadData()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    

    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {


//        if segue.identifier == "goToDetail" {
//           if let secondNextViewController = segue.destination as? ThirdViewController,
//             let index = sender as? SecondViewController{
//               secondNextViewController.ThirdImage = index.stateOfWeather
//
//            }
//            }
//        }

//        if segue.identifier == "goToDetail" {
//            if let destination = segue.destination as? ThirdViewController, let index = sender as? Int {
//               Int(destination.ThirdImage) = weatherimages[selectIndex!]
//
//            }
//
//
//
//            }
//
  
        


                guard let secondNextViewController: ThirdViewController = segue.destination as? ThirdViewController else {
                    return
                }



        guard let secondCell: CustomCell = sender as? CustomCell else {
         return
        }




        secondNextViewController.ThirdTitle = secondCell.cityLabel.text
        secondNextViewController.labelTwo = secondCell.celsiusLabel.text
        secondNextViewController.labelThree = secondCell.rainfallLabel.text
        
        


    }


    

}
