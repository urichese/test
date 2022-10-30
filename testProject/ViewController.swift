//
//  ViewController.swift
//  testProject
//
//  Created by urichese on 26.10.2022.
//

import UIKit

class ViewController: UIViewController, ChildTableViewCellDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    private var childArray: [Child] = []
    private var myTableView: UITableView!
    // userView
    let userView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.05)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let userDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.text = "Персональные данные"
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // nameView
    let nameView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5;
        view.layer.masksToBounds = true;
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .gray
        label.text = "Имя"
        label.font = UIFont.systemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .yellow
        return textField
    }()
    
    // ageView
    let ageView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 5;
        view.layer.masksToBounds = true;
        view.layer.borderColor = UIColor.gray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .gray
        label.text = "Возраст"
        label.font = UIFont.systemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .yellow
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    // childView
    let childView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.05)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.text = "Дети (макс.5)"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let addChildButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect()
        button.setTitle("+ Добавить ребенка", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25.0;
        button.layer.masksToBounds = true;
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.addTarget(self, action: #selector(addChildButtonTouch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let clearChildrenButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect()
        button.setTitle("Очистить", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25.0;
        button.layer.masksToBounds = true;
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.addTarget(self, action: #selector(clearChildrenButtonTouch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let childrenTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .red
        tableView.register(ChildTableViewCell.self, forCellReuseIdentifier: ChildTableViewCell.reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    @objc func clearChildrenButtonTouch(){
        print("123")
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        // create an action
        let firstAction: UIAlertAction = UIAlertAction(title: "Сбросить данные", style: .default) {_ in
            print("First Action pressed")
            self.childArray.removeAll()
            self.childrenTableView.reloadData()
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        // add actions
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(cancelAction)

        // present an actionSheet...
         present(actionSheetController, animated: true, completion: nil)   // doesn't work for iPad

    }
    func addChild() {
        let newChild = Child()
        childArray.append(newChild)
    }
    
    func removeChild(for cell: ChildTableViewCell) {
        DispatchQueue.main.async {
            self.childArray.remove(at: cell.deleteButton.tag)
            
            print("childArray.count = \(self.childArray.count)")
            self.childrenTableView.reloadData()
        }
    }
    
    @objc func addChildButtonTouch(){
        print("789")
        addChild()
        childrenTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childrenTableView.dataSource = self
        childrenTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        // first layer
        self.view.addSubview(userView)
        self.view.addSubview(childView)
//        self.view.addSubview(childrenTableView)
        
        // userView layer
        userView.addSubview(userDescriptionLabel)
        // nameView layer
        userView.addSubview(nameView)
        nameView.addSubview(nameLabel)
        nameView.addSubview(nameTextField)
        // ageView layer
        userView.addSubview(ageView)
        ageView.addSubview(ageLabel)
        ageView.addSubview(ageTextField)
        
        // childView layer
        childView.addSubview(tableDescriptionLabel)
        childView.addSubview(addChildButton)
        childView.addSubview(childrenTableView)
        childView.addSubview(clearChildrenButton)
        
               
    }

    func setupConstraints(){
        
        userView.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        bottom: nil,
                        trailing: view.trailingAnchor,
                        padding: Constants.userViewInsets,
        size: CGSize(width: 0, height: Constants.userViewHeight))
        
        userDescriptionLabel.anchor(top: userView.topAnchor,
                                    leading: userView.leadingAnchor,
                                    bottom: nameView.topAnchor,
                                    trailing: nil,
                                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 25, right: 0))
        // nameView constraints
        nameView.anchor(top: userDescriptionLabel.bottomAnchor,
                        leading: userView.leadingAnchor,
                        bottom: nil,
                        trailing: userView.trailingAnchor,
                        padding: Constants.nameViewInsets,
                        size: CGSize(width: 0, height: Constants.nameViewHeight))
        nameLabel.anchor(top: nameView.topAnchor,
                         leading: nameView.leadingAnchor,
                         bottom: nil,
                         trailing: nil,
                         padding: Constants.nameLabelInsets)
        nameTextField.anchor(top: nameLabel.bottomAnchor,
                             leading: nameView.leadingAnchor,
                             bottom: nil,
                             trailing: nameView.trailingAnchor,
                             padding: Constants.nameTextFieldInsets,
                             size: CGSize(width: 0, height: Constants.nameTextFieldHeight))
        
        // ageView constraints
        ageView.anchor(top: nameView.bottomAnchor,
                        leading: userView.leadingAnchor,
                        bottom: nil,
                        trailing: userView.trailingAnchor,
                        padding: Constants.nameViewInsets,
                        size: CGSize(width: 0, height: Constants.nameViewHeight))
        ageLabel.anchor(top: ageView.topAnchor,
                         leading: ageView.leadingAnchor,
                         bottom: nil,
                         trailing: nil,
                         padding: Constants.nameLabelInsets)
        ageTextField.anchor(top: ageLabel.bottomAnchor,
                             leading: ageView.leadingAnchor,
                             bottom: nil,
                             trailing: ageView.trailingAnchor,
                             padding: Constants.nameTextFieldInsets,
                             size: CGSize(width: 0, height: Constants.nameTextFieldHeight))
        // childView constraints
        childView.anchor(top: userView.bottomAnchor,
                                 leading: view.leadingAnchor,
                                 bottom: view.bottomAnchor,
                                 trailing: view.trailingAnchor,
                                 padding: Constants.childViewInsets)
        tableDescriptionLabel.anchor(top: childView.topAnchor,
                                     leading: childView.leadingAnchor,
                                     bottom: nil,
                                     trailing: nil,
                                     padding: UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0),
                                     size: CGSize(width: 0, height: 30))
        addChildButton.anchor(top: childView.topAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: childView.trailingAnchor,
                              padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0),
                              size: CGSize(width: 220, height: 50))
        
        
        
        clearChildrenButton.topAnchor.constraint(equalTo: childrenTableView.bottomAnchor, constant: 10.0).isActive = true
        clearChildrenButton.centerXAnchor.constraint(equalTo: childView.centerXAnchor).isActive = true
        clearChildrenButton.widthAnchor.constraint(equalTo: addChildButton.widthAnchor).isActive = true
        clearChildrenButton.heightAnchor.constraint(equalTo: addChildButton.heightAnchor).isActive = true
        clearChildrenButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50.0).isActive = true
  
        childrenTableView.leftAnchor.constraint(equalTo: childView.leftAnchor, constant: -20.0).isActive = true
        childrenTableView.topAnchor.constraint(equalTo: addChildButton.bottomAnchor, constant: 15.0).isActive = true
        childrenTableView.rightAnchor.constraint(equalTo: childView.rightAnchor, constant: 0.0).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildTableViewCell.reuseId, for: indexPath as IndexPath) as! ChildTableViewCell
//        let cell = ChildTableViewCell()
        //cell.textLabel!.text = "\(myArray[indexPath.row])"
        cell.delegate = self
        cell.deleteButton.tag = indexPath.row
        print("indexPath.row = \(indexPath.row)")
        
        cell.ageTextField.delegate = self
        cell.nameTextField.delegate = self
        
//        cell.setupCell(myArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
            
    }
}
