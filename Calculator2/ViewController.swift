//
//  ViewController.swift
//  Calculator2
//
//  Created by Денис Хафизов on 17.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let resultLable = UILabel()
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var checkSign = false
    var operation: Int = 0
    var result: Double = 0
    
    var historyArray: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = "Калькулятор"
        
        let historyButton = UIButton()
        view.addSubview(historyButton)
        historyButton.setTitle("История", for: .normal)
        historyButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            historyButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            historyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        historyButton.addTarget(self, action: #selector(historyButtonAction), for: .touchUpInside)
        
        
        resultLable.text = "0"
        resultLable.adjustsFontSizeToFitWidth = true
        resultLable.minimumScaleFactor = 0.5
        view.backgroundColor = UIColor.black
        let actionColorButton: UIColor = UIColor(red: 1, green: 158/255, blue: 11/255, alpha: 1)
        let digitColorButton: UIColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        let actionColorButton2: UIColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
        
        view.addSubview(resultLable)
        resultLable.textColor = UIColor.white
        resultLable.font = .boldSystemFont(ofSize: 100)
        resultLable.textAlignment = .right
        resultLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            resultLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        
        let firstButton = CustomButton(title: "1",
                                       backgroundColor: digitColorButton,
                                       titleColor: .white,
                                       tagNumber: 1)
        firstButton.addTarget(self, action: #selector(digitButtons), for: .touchUpInside)
        let secondButton = CustomButton(title: "2",
                                        backgroundColor: digitColorButton,
                                        titleColor: .white,
                                        tagNumber: 2)
        secondButton.addTarget(self, action: #selector(digitButtons), for: .touchUpInside)
        let thirdButton = CustomButton(title: "3",
                                       backgroundColor: digitColorButton,
                                       titleColor: .white,
                                       tagNumber: 3)
        thirdButton.addTarget(self, action: #selector(digitButtons), for: .touchUpInside)
        let fourthButton = CustomButton(title: "4",
                                        backgroundColor: digitColorButton,
                                        titleColor: .white,
                                        tagNumber: 4)
        fourthButton.addTarget(self, action: #selector(digitButtons), for: .touchUpInside)
        let fifthButton = CustomButton(title: "5",
                                       backgroundColor: digitColorButton,
                                       titleColor: .white,
                                       tagNumber: 5)
        fifthButton.addTarget(self, action: #selector(digitButtons), for: .touchUpInside)
        let sixthButton = CustomButton(title: "6",
                                       backgroundColor: digitColorButton,
                                       titleColor: .white,
                                       tagNumber: 6)
        sixthButton.addTarget(self, action: #selector(digitButtons), for: .touchUpInside)
        let seventhButton = CustomButton(title: "7",
                                         backgroundColor: digitColorButton,
                                         titleColor: .white,
                                         tagNumber: 7)
        seventhButton.addTarget(self, action: #selector(digitButtons), for: .touchUpInside)
        let eighthButton = CustomButton(title: "8",
                                        backgroundColor: digitColorButton,
                                        titleColor: .white,
                                        tagNumber: 8)
        eighthButton.addTarget(self, action: #selector(digitButtons), for: .touchUpInside)
        let ninthButton = CustomButton(title: "9",
                                       backgroundColor: digitColorButton,
                                       titleColor: .white,
                                       tagNumber: 9)
        ninthButton.addTarget(self, action: #selector(digitButtons), for: .touchUpInside)
        let zeroButton = CustomButton(title: "0",
                                      backgroundColor: digitColorButton,
                                      titleColor: .white,
                                      tagNumber: 0,
                                      buttonSize: 169,
                                      cornerRadius: 169/4)
        zeroButton.addTarget(self, action: #selector(digitButtons), for: .touchUpInside)
        
        let resetButton = CustomButton(title: "AC",
                                       backgroundColor: actionColorButton2,
                                       titleColor: .black,
                                       tagNumber: 11)
        resetButton.addTarget(self, action: #selector(actionButtons), for: .touchUpInside)
        let negativeButton = CustomButton(title: "+/-",
                                          backgroundColor: actionColorButton2,
                                          titleColor: .black,
                                          tagNumber: 12)
        negativeButton.addTarget(self, action: #selector(actionButtons), for: .touchUpInside)
        let percentButton = CustomButton(title: "%",
                                         backgroundColor: actionColorButton2,
                                         titleColor: .black,
                                         tagNumber: 13)
        percentButton.addTarget(self, action: #selector(actionButtons), for: .touchUpInside)
        let divisionButton = CustomButton(title: "÷",
                                          backgroundColor: actionColorButton,
                                          titleColor: .white,
                                          tagNumber: 14)
        divisionButton.addTarget(self, action: #selector(actionButtons), for: .touchUpInside)
        let multiplicationButton = CustomButton(title: "✕",
                                                backgroundColor: actionColorButton,
                                                titleColor: .white,
                                                tagNumber: 15)
        multiplicationButton.addTarget(self, action: #selector(actionButtons), for: .touchUpInside)
        let subtractionButton = CustomButton(title: "-",
                                             backgroundColor: actionColorButton,
                                             titleColor: .white,
                                             tagNumber: 16)
        subtractionButton.addTarget(self, action: #selector(actionButtons), for: .touchUpInside)
        let additionButton = CustomButton(title: "+",
                                          backgroundColor: actionColorButton,
                                          titleColor: .white,
                                          tagNumber: 17)
        additionButton.addTarget(self, action: #selector(actionButtons), for: .touchUpInside)
        let resultButton = CustomButton(title: "=",
                                        backgroundColor: actionColorButton,
                                        titleColor: .white,
                                        tagNumber: 18)
        resultButton.addTarget(self, action: #selector(actionButtons), for: .touchUpInside)
        let commaButton = CustomButton(title: ",",
                                       backgroundColor: digitColorButton,
                                       titleColor: .white,
                                       tagNumber: 19)
        commaButton.addTarget(self, action: #selector(actionButtons), for: .touchUpInside)
        
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        
        let stackView2 = UIStackView()
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.spacing = 15
        
        let stackView3 = UIStackView()
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        stackView3.spacing = 15
        
        let stackView4 = UIStackView()
        stackView4.translatesAutoresizingMaskIntoConstraints = false
        stackView4.spacing = 15
        
        let stackView5 = UIStackView()
        stackView5.translatesAutoresizingMaskIntoConstraints = false
        stackView5.spacing = 15
        stackView5.alignment = .top
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 15
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: resultLable.bottomAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.heightAnchor.constraint(equalToConstant: 445)
        ])
        
        stackView.addArrangedSubview(resetButton)
        stackView.addArrangedSubview(negativeButton)
        stackView.addArrangedSubview(percentButton)
        stackView.addArrangedSubview(divisionButton)
        stackView2.addArrangedSubview(seventhButton)
        stackView2.addArrangedSubview(eighthButton)
        stackView2.addArrangedSubview(ninthButton)
        stackView2.addArrangedSubview(multiplicationButton)
        stackView3.addArrangedSubview(fourthButton)
        stackView3.addArrangedSubview(fifthButton)
        stackView3.addArrangedSubview(sixthButton)
        stackView3.addArrangedSubview(subtractionButton)
        stackView4.addArrangedSubview(firstButton)
        stackView4.addArrangedSubview(secondButton)
        stackView4.addArrangedSubview(thirdButton)
        stackView4.addArrangedSubview(additionButton)
        stackView5.addArrangedSubview(zeroButton)
        stackView5.addArrangedSubview(commaButton)
        stackView5.addArrangedSubview(resultButton)
        
        mainStackView.addArrangedSubview(stackView)
        mainStackView.addArrangedSubview(stackView2)
        mainStackView.addArrangedSubview(stackView3)
        mainStackView.addArrangedSubview(stackView4)
        mainStackView.addArrangedSubview(stackView5)
        
    }
    
    @objc func digitButtons(_ sender: UIButton) {
        if checkSign == true || resultLable.text == "0"{
            resultLable.text = String(sender.tag)
            checkSign = false
        }
        else {
            resultLable.text = resultLable.text! + String(sender.tag)
        }
        secondNumber = Double(resultLable.text!)!
    }
    
    @objc func actionButtons(_ sender: UIButton) {
        if resultLable.text != "" && sender.tag != 11 && sender.tag != 18 && sender.tag != 13{
            firstNumber = Double(resultLable.text!)!
            if sender.tag == 12 && resultLable.text != "0"{
                if operation == 0 {
                    secondNumber *= -1
                    resultLable.text = String(secondNumber)
                } else
                {
                    result *= -1
                    resultLable.text = String(result)
                }
            }
            else if sender.tag == 14 {
                resultLable.text = "÷"
            }
            else if sender.tag == 15 {
                resultLable.text = "✕"
            }
            else if sender.tag == 16 {
                resultLable.text = "-"
            }
            else if sender.tag == 17 {
                resultLable.text = "+"
            }
            else if sender.tag == 19 {
                if !resultLable.text!.contains("."){
                    resultLable.text = resultLable.text! + "."
                }
            }
            
            operation = sender.tag
            if sender.tag != 19 {
                checkSign = true
            }
        }
        else if sender.tag == 13 {
            if firstNumber == 0 {
                secondNumber /= 100
                resultLable.text = String(secondNumber)
            } else if operation == 16 || operation == 17{
                secondNumber = firstNumber * secondNumber/100
                resultLable.text = String(secondNumber)
            }
            else if operation == 14 || operation == 15 {
                secondNumber = secondNumber/100
                resultLable.text = String(secondNumber)
            }
        }
        else if sender.tag == 18 {
            if operation == 13 {
                resultLable.text = String(firstNumber + secondNumber)
            }
            else if operation == 14 {
                resultLable.text = String(firstNumber / secondNumber)
                result = Double(resultLable.text!)!
            }
            else if operation == 15 {
                resultLable.text = String(firstNumber * secondNumber)
                result = Double(resultLable.text!)!
            }
            else if operation == 16 {
                resultLable.text = String(firstNumber - secondNumber)
                result = Double(resultLable.text!)!
            }
            else if operation == 17 {
                resultLable.text = String(firstNumber + secondNumber)
                result = Double(resultLable.text!)!
            }
            if operation != -1 {
                historyArray.append(String(firstNumber))
                historyArray.append(String(operation))
                historyArray.append(String(secondNumber))
                historyArray.append(String(result))
            }
            print(historyArray)
        }
        else if sender.tag == 11 {
            resultLable.text = "0"
            firstNumber = 0
            secondNumber = 0
            operation = -1
        }
    }
    
    @objc func historyButtonAction(){
        let controller = HistoryTableViewController()
        controller.historyArray = historyArray
        navigationController?.pushViewController(controller, animated: true)
    }
}

class CustomButton: UIButton {
    
    init(title: String, backgroundColor: UIColor, titleColor: UIColor, tagNumber: Int, buttonSize: Double = 77, cornerRadius: Double = 77/2) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = cornerRadius
        self.tag = tagNumber
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: buttonSize),
            self.heightAnchor.constraint(equalToConstant: buttonSize)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
