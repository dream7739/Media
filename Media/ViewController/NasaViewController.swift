//
//  NasaViewController.swift
//  Media
//
//  Created by 홍정민 on 7/1/24.
//

import UIKit
import SnapKit

final class NasaViewController: UIViewController {
    let fetchButton = UIButton()
    let progressBar = UIProgressView()
    let progressLabel = UILabel()
    let nasaImage = UIImageView()
    
    var session: URLSession!
    
    var total: Double = 0
    var buffer = Data(){
        didSet {
            let percent = (Double(buffer.count) / total) * 100
            progressLabel.text = "\(Double(buffer.count))/\(total)" + " (" + String(format: "%.f", percent) + "%)"
            progressBar.progress = Float(Double(buffer.count)/total)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        session.invalidateAndCancel()
    }
    
    func configureHierarchy(){
        view.addSubview(fetchButton)
        view.addSubview(progressBar)
        view.addSubview(progressLabel)
        view.addSubview(nasaImage)
    }
    
    func configureLayout(){
        fetchButton.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(fetchButton.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nasaImage.snp.makeConstraints { make in
            make.top.equalTo(progressLabel.snp.bottom).offset(10)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
    }
    
    func configureUI(){
        view.backgroundColor = .white
        fetchButton.backgroundColor = .black
        fetchButton.setTitle("이미지 가져오기", for: .normal)
        progressBar.tintColor = .systemTeal
        progressLabel.backgroundColor = .systemOrange
        
        fetchButton.addTarget(self, action: #selector(fetchButtonClicked), for: .touchUpInside)
    }
    
    @objc func fetchButtonClicked(){
        buffer = Data()
        fetchButton.isEnabled = false
        callNasaImage()
    }
}

extension NasaViewController: URLSessionDataDelegate {
    enum Nasa: String, CaseIterable {
        
        static let baseURL = "https://apod.nasa.gov/apod/image/"
        
        case one = "2308/sombrero_spitzer_3000.jpg"
        case two = "2212/NGC1365-CDK24-CDK17.jpg"
        case three = "2307/M64Hubble.jpg"
        case four = "2306/BeyondEarth_Unknown_3000.jpg"
        case five = "2307/NGC6559_Block_1311.jpg"
        case six = "2304/OlympusMons_MarsExpress_6000.jpg"
        case seven = "2305/pia23122c-16.jpg"
        case eight = "2308/SunMonster_Wenz_960.jpg"
        case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
         
        static var photo: URL {
            return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
        }
    }
    
    func callNasaImage(){
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .current)
        session.dataTask(with: Nasa.photo).resume()
    }
    
  
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        if let response = response as? HTTPURLResponse,
           (200...299).contains(response.statusCode){
            if let content = response.value(forHTTPHeaderField: "Content-Length"),
                let contentLength = Double(content){
                total = contentLength
            }
            return .allow
        }else{
            return .cancel
        }
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        buffer.append(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: (any Error)?) {
        if let error {
            print(error.localizedDescription)
            progressLabel.text = "다운로드 과정에서 문제가 발생하였습니다."
            nasaImage.image = UIImage(named: "icon_sad")
        }else{
            if buffer.isEmpty{ return }
            let image = UIImage(data: buffer)
            nasaImage.image = image
        }
        
        fetchButton.isEnabled = true
    }
    
}


