//
//  WeatherViewController.swift
//  Media
//
//  Created by 홍정민 on 6/6/24.
//

import UIKit
import Alamofire
import Kingfisher
import SnapKit

class WeatherViewController: UIViewController {

    let dateLabel = UILabel()
    
    let locImageView = UIImageView()
    
    let nameLabel = UILabel()
    
    let tempTextView = UITextView()
    
    let humidityTextView = UITextView()
    
    let windTextView = UITextView()
    
    let weatherImageView = UIImageView()
    
    let announceTextView = UITextView()

    lazy var textViewList = [tempTextView, humidityTextView, windTextView, announceTextView]
    
    let latitude = 37.517742
    let longitude = 126.886463

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        callWeather()
    }
    
    
    func configureHierarchy(){
        view.addSubview(dateLabel)
        view.addSubview(locImageView)
        view.addSubview(nameLabel)
        view.addSubview(tempTextView)
        view.addSubview(windTextView)
        view.addSubview(humidityTextView)
        view.addSubview(weatherImageView)
        view.addSubview(announceTextView)
    }
    
    func configureLayout(){
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(3)
            make.leading.equalToSuperview().offset(20)
        }
        
        locImageView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.leading.equalTo(dateLabel)
            make.size.equalTo(25)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locImageView)
            make.leading.equalTo(locImageView.snp.trailing).offset(6)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        tempTextView.snp.makeConstraints { make in
            make.top.equalTo(locImageView.snp.bottom).offset(10)
            make.leading.equalTo(locImageView)
            make.width.equalTo(100).priority(.low)
            make.height.equalTo(35)
            make.trailing.lessThanOrEqualTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        humidityTextView.snp.makeConstraints { make in
            make.top.equalTo(tempTextView.snp.bottom).offset(10)
            make.leading.equalTo(locImageView)
            make.width.equalTo(100).priority(.low)
            make.height.equalTo(35)
            make.trailing.lessThanOrEqualTo(view.safeAreaLayoutGuide).inset(20)      
        }
        
        windTextView.snp.makeConstraints { make in
            make.top.equalTo(humidityTextView.snp.bottom).offset(10)
            make.leading.equalTo(locImageView)
            make.width.equalTo(100).priority(.low)
            make.height.equalTo(35)
            make.trailing.lessThanOrEqualTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.top.equalTo(windTextView.snp.bottom).offset(10)
            make.leading.equalTo(locImageView)
            make.width.equalTo(170)
            make.height.equalTo(100)
        }
        
        announceTextView.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView.snp.bottom).offset(10)
            make.leading.equalTo(locImageView)
            make.width.equalTo(100).priority(.low)
            make.height.equalTo(35)
            make.trailing.lessThanOrEqualTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    func configureUI(){
        view.backgroundColor = UIColor.weatherBackground
        
        let date = Date()
        let locale = Locale(identifier: "ko-kr")
        
        dateLabel.text = date.formatted(.dateTime.locale(locale).month().day().hour().minute())
        dateLabel.textColor = .white
        dateLabel.font = .secondary
        
        locImageView.image = UIImage(systemName: "location.fill")
        locImageView.contentMode = .scaleAspectFill
        locImageView.tintColor = .white
        
        nameLabel.textColor = .white
        nameLabel.font = .primary
        nameLabel.text = "서울, 청년취업사관학교 영등포 캠퍼스"
        
        for textView in textViewList {
            textView.backgroundColor = .white
            textView.font = .secondary
            textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            textView.layer.cornerRadius = 5
            textView.clipsToBounds = true
            textView.isEditable = false
            textView.isScrollEnabled = false
        }
        
        weatherImageView.contentMode  = .scaleAspectFill
        weatherImageView.backgroundColor = .white
        weatherImageView.layer.cornerRadius = 5
        weatherImageView.clipsToBounds = true

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
                //dump(value)
                self.tempTextView.text = value.main.tempDescription
                self.humidityTextView.text = value.main.humidityDescription
                self.windTextView.text = value.wind.windDescription
                
                let imageURL = APIURL.weatherIconURL + "\(value.weather[0].iconDescription)"
                self.weatherImageView.kf.setImage(with: URL(string: imageURL))
                
                self.announceTextView.text = "오늘도 행복한 하루 보내세요"
            case .failure(let error):
                print(error)
            }
        }
    }
}
