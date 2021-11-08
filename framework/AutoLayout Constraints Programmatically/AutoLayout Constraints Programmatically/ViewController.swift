import UIKit
import SnapKit

class ViewController: UIViewController {
    private let myView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .link
        return myView
    }()

    private let secondView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .systemRed
        return myView
    }()
    
    private var titleView: UILabel = UILabel()
    private var idField: UITextField = UITextField()
    private var pwField: UITextField = UITextField()
    private var loginButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(myView)
        myView.addSubview(secondView)
        addConstraints()
        secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //setupLayout()
        setupLayoutWithSnapKit()
    }
    
    private func setupLayoutWithSnapKit() {
        view.addSubview(titleView)
        view.addSubview(idField)
        view.addSubview(pwField)
        view.addSubview(loginButton)
        
        // MARK: - titleView Constraints
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        titleView.backgroundColor = .systemPink
        titleView.text = "Service Login"
        titleView.font = .systemFont(ofSize: 28)
        titleView.textAlignment = .center
        titleView.textColor = .white
        // MARK: - idField
        idField.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.leading.equalTo(titleView.snp.leading)
            make.trailing.equalTo(titleView.snp.trailing)
            make.height.equalTo(44)
        }
        idField.backgroundColor = .white
        idField.placeholder = "Enter your ID"
        // MARK: - pwField
        pwField.snp.makeConstraints { make in
            make.top.equalTo(idField.snp.bottom).offset(16)
            make.leading.equalTo(idField.snp.leading)
            make.trailing.equalTo(idField.snp.trailing)
            make.height.equalTo(44)
        }
        pwField.backgroundColor = .white
        pwField.placeholder = "Enter your PW"
        // MARK: - LoginBtn
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwField.snp.bottom).offset(16)
            make.leading.equalTo(pwField.snp.leading)
            make.trailing.equalTo(pwField.snp.trailing)
            make.height.equalTo(44)
        }
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.backgroundColor = .systemGray
    }
    
    private func setupLayout() {
        view.addSubview(titleView)
        view.addSubview(idField)
        view.addSubview(pwField)
        view.addSubview(loginButton)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        idField.translatesAutoresizingMaskIntoConstraints = false
        pwField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - titleView Constraints
        titleView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        titleView.backgroundColor = .systemPink
        titleView.text = "Service Login"
        titleView.font = .systemFont(ofSize: 28)
        titleView.textAlignment = .center
        titleView.textColor = .white
        
        // MARK: - idField
        idField.backgroundColor = .white
        idField.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 16).isActive = true
        idField.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        idField.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        idField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        idField.placeholder = "Enter your ID"
        
        // MARK: - pwField
        pwField.backgroundColor = .white
        pwField.topAnchor.constraint(equalTo: idField.bottomAnchor, constant: 16).isActive = true
        pwField.leadingAnchor.constraint(equalTo: idField.leadingAnchor).isActive = true
        pwField.trailingAnchor.constraint(equalTo: idField.trailingAnchor).isActive = true
        pwField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        pwField.placeholder = "Enter your PW"
        
        // MARK: - loginButton
        loginButton.backgroundColor = .systemGray
        loginButton.topAnchor.constraint(equalTo: pwField.bottomAnchor, constant: 16).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: pwField.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: pwField.trailingAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
    }
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        // Add
        constraints.append(myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        constraints.append(secondView.widthAnchor.constraint(equalTo: myView.widthAnchor,
                                                             multiplier: 0.5))
        constraints.append(secondView.heightAnchor.constraint(equalTo: myView.heightAnchor,
                                                             multiplier: 0.5))
        constraints.append(secondView.centerXAnchor.constraint(equalTo: myView.centerXAnchor))
        constraints.append(secondView.centerYAnchor.constraint(equalTo: myView.centerYAnchor))
        
        // Activate (Applying)
        NSLayoutConstraint.activate(constraints)
        
    }
}

