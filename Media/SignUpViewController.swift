//
//  SignUpViewController.swift
//  Media
//
//  Created by 홍정민 on 6/4/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "NETFLIX"
        label.textColor = .red
        label.font = .systemFont(ofSize: 40, weight: .heavy)
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 13
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 주소 또는 전화번호"
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "닉네임"
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let locationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "위치"
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let recommandTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "추천 코드 입력"
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.tintColor = .black
        return button
    }()
    
    let additionalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.text = "추가 정보 입력"
        return label
    }()
    
    let additionalSwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .red
        switchButton.isOn = true
        return switchButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
       
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

}
