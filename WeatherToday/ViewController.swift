//
//  ViewController.swift
//  WeatherToday
//
//  Created by 쭌이 on 2022/08/13.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    
    let country: [String] = ["한국", "독일", "이탈리아", "미국", "프랑스", "일본"]
    let countryImg: [String] = ["flag_kr","flag_de","flag_it", "flag_us", "flag_fr", "flag_jp"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let text: String = country[indexPath.row]
       
        
        cell.textLabel?.text = text
        cell.imageView?.image = UIImage(named: countryImg[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        
        nextViewController.titleSet = cell.textLabel?.text
    }
}

