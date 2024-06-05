//
//  LottoViewController.swift
//  NetworkBasic
//
//  Created by 홍정민 on 6/4/24.
//

import UIKit

import Alamofire
import SnapKit



class LottoViewController: UIViewController {
    
    let drwNoTextField = UITextField()
    
    let confirmButton = UIButton(type: .system)
    
    let drwNoLabel = UILabel()
    
    let stackView = UIStackView()
    
    let drwtNo1Label = UILabel()
    
    let drwtNo2Label = UILabel()
    
    let drwtNo3Label = UILabel()
    
    let drwtNo4Label = UILabel()
    
    let drwtNo5Label = UILabel()
    
    let drwtNo6Label = UILabel()
    
    let bonusNoLabel = UILabel()
    
    final let latestDrwNo = 1122
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        getLottoNumber(latestDrwNo)
        
    }
    
    func configureHierarchy(){
        view.addSubview(drwNoTextField)
        view.addSubview(confirmButton)
        view.addSubview(drwNoLabel)
        
        view.addSubview(stackView)
       
        stackView.addArrangedSubview(drwtNo1Label)
        stackView.addArrangedSubview(drwtNo2Label)
        stackView.addArrangedSubview(drwtNo3Label)
        stackView.addArrangedSubview(drwtNo4Label)
        stackView.addArrangedSubview(drwtNo5Label)
        stackView.addArrangedSubview(drwtNo6Label)
        stackView.addArrangedSubview(bonusNoLabel)
        
        

    }
    
    func configureLayout(){
        drwNoTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(drwNoTextField.snp.bottom).offset(10)
            make.leading.trailing.equalTo(drwNoTextField)
        }
        
        drwNoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(confirmButton)
            make.top.equalTo(confirmButton.snp.bottom).offset(15)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(drwNoLabel.snp.bottom).offset(15)
            make.leading.trailing.equalTo(drwNoLabel)
            make.height.equalTo(46)
        }
    }
    
    func configureUI(){
        view.backgroundColor = .white
        
        drwNoTextField.placeholder = "로또 회차를 입력해주세요"
        drwNoTextField.clearButtonMode = .whileEditing
        
        confirmButton.setTitle("확인", for: .normal)
        confirmButton.backgroundColor = .white
        confirmButton.layer.cornerRadius = 10
        confirmButton.clipsToBounds = true
        confirmButton.layer.borderWidth = 1
        confirmButton.tintColor = .black
        confirmButton.addTarget(self, action: #selector(confirmButtonClicked), for: .touchUpInside)
        
        drwNoLabel.text = "당첨 정보"
        drwNoLabel.font = .secondary
        drwNoLabel.textColor = .darkGray
        
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.distribution = .fillEqually
        
        drwtNo1Label.layer.cornerRadius = 23
        drwtNo1Label.clipsToBounds = true
        drwtNo1Label.backgroundColor = .orange
        drwtNo1Label.textAlignment = .center
        drwtNo1Label.textColor = .white
        
        drwtNo2Label.layer.cornerRadius = 23
        drwtNo2Label.clipsToBounds = true
        drwtNo2Label.backgroundColor = .orange
        drwtNo2Label.textAlignment = .center
        drwtNo2Label.textColor = .white
        
        drwtNo3Label.layer.cornerRadius = 23
        drwtNo3Label.clipsToBounds = true
        drwtNo3Label.backgroundColor = .systemMint
        drwtNo3Label.textAlignment = .center
        drwtNo3Label.textColor = .white
        
        drwtNo4Label.layer.cornerRadius = 23
        drwtNo4Label.clipsToBounds = true
        drwtNo4Label.backgroundColor = .systemMint
        drwtNo4Label.textAlignment = .center
        drwtNo4Label.textColor = .white
        
        drwtNo5Label.layer.cornerRadius = 23
        drwtNo5Label.clipsToBounds = true
        drwtNo5Label.backgroundColor = .lightGray
        drwtNo5Label.textAlignment = .center
        drwtNo5Label.textColor = .white
        
        drwtNo6Label.layer.cornerRadius = 23
        drwtNo6Label.clipsToBounds = true
        drwtNo6Label.backgroundColor = .lightGray
        drwtNo6Label.textAlignment = .center
        drwtNo6Label.textColor = .white
        
        bonusNoLabel.layer.cornerRadius = 23
        bonusNoLabel.clipsToBounds = true
        bonusNoLabel.backgroundColor = .orange
        bonusNoLabel.textAlignment = .center
        bonusNoLabel.textColor = .white
    }
    
    @objc func confirmButtonClicked(){
        guard let lottoNo = drwNoTextField.text, let convertedNo = Int(lottoNo), convertedNo < latestDrwNo else {
            return
        }
        
        getLottoNumber(convertedNo)
    }
    
    func getLottoNumber(_ drawNo: Int){
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drawNo)"
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                self.drwNoLabel.text = "1등 당첨자 수 : \(value.firstPrzwnerCo)명, 1등 상금 : \(value.firstWinamnt.formatted(.number))원"
                self.drwtNo1Label.text = "\(value.drwtNo1)"
                self.drwtNo2Label.text = "\(value.drwtNo2)"
                self.drwtNo3Label.text = "\(value.drwtNo3)"
                self.drwtNo4Label.text = "\(value.drwtNo4)"
                self.drwtNo5Label.text = "\(value.drwtNo5)"
                self.drwtNo6Label.text = "\(value.drwtNo6)"
                self.bonusNoLabel.text = "\(value.bnusNo)"
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
