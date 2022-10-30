//
//  ChildTableViewCell.swift
//  testProject
//
//  Created by urichese on 26.10.2022.
//

import UIKit

protocol ChildTableViewCellDelegate: class {
    func removeChild(for cell: ChildTableViewCell)
}
class ChildTableViewCell: UITableViewCell {

    static let reuseId = "Cell"
    
    weak var delegate: ChildTableViewCellDelegate?
    
    //var child: Child
    
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
    
    let deleteButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setTitle("Удалить", for: .normal)
        button.setTitleColor(.blue, for: .normal)
//        button.addTarget(ChildTableViewCell.self, action: #selector(deleteButtonTouch), for: .touchUpInside)
        button.addTarget(self, action: #selector(deleteButtonTouch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupView(){
        contentView.addSubview(nameView)
        nameView.addSubview(nameLabel)
        nameView.addSubview(nameTextField)
        
        contentView.addSubview(ageView)
        ageView.addSubview(ageLabel)
        ageView.addSubview(ageTextField)
        
        contentView.addSubview(deleteButton)
        
        setupConstraits()
    }

    func setupConstraits(){
        deleteButton.centerYAnchor.constraint(equalTo: nameView.centerYAnchor).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: 30).isActive = true
        nameView.anchor(top: self.topAnchor,
                        leading: self.leadingAnchor,
                        bottom: nil,
                        trailing: self.trailingAnchor,
                        padding: UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 10),
                        size: CGSize(width: 0, height: Constants.nameViewHeight))
        nameView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        
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
                        leading: self.leadingAnchor,
                        bottom: nil,
                        trailing: self.trailingAnchor,
                        padding: UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 10),
                        size: CGSize(width: 0, height: Constants.nameViewHeight))
        ageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
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
    }
    
    @objc func deleteButtonTouch() {
        delegate?.removeChild(for: self)
        print("touched")
    }
    
}
