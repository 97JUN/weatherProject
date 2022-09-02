//
//  weather.swift
//  WeatherToday
//
//  Created by 쭌이 on 2022/08/13.
//

//{
//   "city_name":"파리",
//   "state":10,
//   "celsius":11.3,
//   "rainfall_probability":90
//}




import Foundation

struct Weather: Codable  {
    
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state
        case celsius
        case rainfallProbability = "rainfall_probability"
    }
    
    var celsiusString: String {
        return "섭씨 " + "\(self.celsius)" + "도 / " + "화씨 " + "\(self.celsius + 32)" + "도"
    }
    
    var rainfallProbabilityString: String {
        return "강수확률 " + "\(self.rainfallProbability)" + "%"
    }
    
    
}
