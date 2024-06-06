//
//  WeatherViewController.swift
//  Media
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit
import Alamofire
import SnapKit

class WeatherViewController: UIViewController {

    let latitude = 37.609264
    let longitude = 127.019757
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        callWeather()
    }
    
    
    func configureHierarchy(){
        
    }
    
    func configureLayout(){
        
    }
    
    func configureUI(){
        
    }
    
    func callWeather(){
        var components = URLComponents(string: APIURL.weatherURL)
        
        let lat = URLQueryItem(name: "lat", value: "\(latitude)")
        let lon = URLQueryItem(name: "lon", value: "\(longitude)")
        let units = URLQueryItem(name: "units", value: "Metric")
        let appid = URLQueryItem(name: "appid", value: APIKey.weatherKey)
        
        components?.queryItems = [lat, lon, units, appid]
        
        guard let url = components?.url else { return }
        
        AF.request(url).responseDecodable(of: WeatherResult.self) { response in
            switch response.result {
            case .success(let value):
                dump(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
