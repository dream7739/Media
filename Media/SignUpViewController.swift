//
//  SignUpViewController.swift
//  Media
//
//  Created by 홍정민 on 6/4/24.
//

import UIKit
import SnapKit

enum Placeholder {
    case email
    case password
    case nickname
    case location
    case recommand
    
    var titleText: String {
        switch self {
        case .email:
            return "이메일 또는 전화번호"
        case .password:
            return "비밀번호"
        case .nickname:
            return "닉네임"
        case .location:
            return "위치"
        case .recommand:
            return "추천 코드 입력"
        }
    }
}

class SignUpViewController: UIViewController {
    
    let titleLabel = UILabel()
    
    let stackView = UIStackView()
    
    let emailTextField =  UITextField()
    
    let passwordTextField =  UITextField()
    
    let nicknameTextField = UITextField()
    
    let locationTextField = UITextField()
    
    let recommandTextField = UITextField()
    
    let signUpButton = UIButton(type: .system)
    
    let additionalLabel = UILabel()
    
    let additionalSwitch = UISwitch()
    
    lazy var textFieldList = [emailTextField, passwordTextField, nicknameTextField, locationTextField, recommandTextField]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy(){
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(nicknameTextField)
        stackView.addArrangedSubview(locationTextField)
        stackView.addArrangedSubview(recommandTextField)
        
        view.addSubview(signUpButton)
        
        view.addSubview(additionalLabel)
        
        view.addSubview(additionalSwitch)
        
    }
    
    func configureLayout(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(60)
            make.width.equalTo(300)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(stackView.snp.bottom).offset(15)
            make.leading.trailing.equalTo(stackView)
        }
        
        additionalLabel.snp.makeConstraints { make in
            make.leading.equalTo(signUpButton)
            make.top.equalTo(signUpButton.snp.bottom).offset(30)
        }
        
        additionalSwitch.snp.makeConstraints { make in
            make.trailing.equalTo(signUpButton)
            make.centerY.equalTo(additionalLabel)
        }
        
    }
    
    func configureUI(){
        titleLabel.text = "NETFLIX"
        titleLabel.textColor = .red
        titleLabel.font = .extream
        
        stackView.spacing = 13
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        for item in textFieldList {
            designTextField(item)
        }
        
        designTextFieldContent(emailTextField, Placeholder.email)
        designTextFieldContent(passwordTextField, Placeholder.password)
        designTextFieldContent(nicknameTextField, Placeholder.nickname)
        designTextFieldContent(locationTextField, Placeholder.location)
        designTextFieldContent(recommandTextField, Placeholder.recommand)
        
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = 5
        signUpButton.tintColor = .black
        
        additionalLabel.textAlignment = .left
        additionalLabel.textColor = .white
        additionalLabel.font = .secondary
        additionalLabel.text = "추가 정보 입력"

        additionalSwitch.onTintColor = .red
        additionalSwitch.isOn = true
    }
    
    func designTextField(_ sender: UITextField){
        sender.font = .systemFont(ofSize: 13)
        sender.backgroundColor = .darkGray
        sender.tintColor = .white
        sender.textColor = .white
        sender.layer.cornerRadius = 10
        sender.textAlignment = .center
    }
    
    func designTextFieldContent(_ sender: UITextField, _ placeHolderType: Placeholder){
        let placeholderText =  NSAttributedString(string: placeHolderType.titleText, attributes: [.foregroundColor : UIColor.white, .font : UIFont.tertiary])
        sender.attributedPlaceholder = placeholderText
        
    }
}
