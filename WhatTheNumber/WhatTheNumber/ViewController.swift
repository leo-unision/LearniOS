import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var btnText: UIButton!
    
    //設定變數的最大及最小值
    var maxNumber = 100
    var minNumber = 1
    //設定變數，遊戲正在進行中
    var isOver = false
    
    //取得1-100的亂數，並轉型為實數
    var answer = Int(arc4random_uniform(100) + 1)

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //畫面載入時，文字輸入鍵盤就自動升起
        inputTextField.becomeFirstResponder()
    }
    
    
    //MARK: Action Button
    
    @IBAction func btnGuess(_ sender: UIButton)
    {
        if isOver == false
        {
            //Playing Game
            print("answer = \(answer)")
            //取得文字輸入框的文字，並強制拆解（就是一定有有文字），存到常數inputText內
            let inputText = inputTextField.text!
            
            //輸入完文字框後，自動清空文字框
//            inputTextField.text = ""
            
            //取出input text的字串，並轉為實數
            let inputNumber = Int(inputText)
            print("inputNumber = \(String(describing: inputNumber))")
            
            if inputNumber == nil
            {
                //沒有輸入內容
                print("沒有輸入內容")
                lblMessage.text = "尚未輸入！ 正確的數字介於 \(minNumber) ~ \(maxNumber)"
            } else {
                if inputNumber! > maxNumber {
                    //user input too large
                    print("too large")
                    lblMessage.text = "太大了！正確的數字介於 \(minNumber) ~ \(maxNumber)"
                } else if inputNumber! < minNumber {
                    //user input too small
                    print("too small")
                    lblMessage.text = "太小了！正確的數字介於 \(minNumber) ~ \(maxNumber)"
                } else {
                    //check answer
                    print("check answer")
                    if inputNumber == answer {
                        //Bingo! right anwer
                        lblMessage.text = "好棒棒！！"
                        inputTextField.text = "O"
                        btnText.setTitle("再玩一次", for: .normal)
                        isOver = true
                    } else {
                        //wrong answer
                        if inputNumber! > answer {
                            //large than answer
                            maxNumber = inputNumber!
                        } else {
                            //small than answer
                            minNumber = inputNumber!
                        }
                        lblMessage.text = "正確的數字介於 \(minNumber) ~ \(maxNumber)"
                        inputTextField.text = "X"
                        btnText.setTitle("再試一次", for: .normal)
                    }
                }
            }

        } else {
            //Game is Over
            maxNumber = 100
            minNumber = 1
            lblMessage.text = "正確的數字介於 \(minNumber) ~ \(maxNumber)"
            answer = Int(arc4random_uniform(100) + 1)
            isOver = false
        }
        
        //設定文字輸入框回到初始狀態，重新輸入數字後再清除原內容
        inputTextField.becomeFirstResponder()
        inputTextField.clearsOnInsertion = true
    }
}

