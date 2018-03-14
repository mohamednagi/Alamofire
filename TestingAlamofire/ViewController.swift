import UIKit
import Alamofire

class ViewController: UIViewController {

    
    
    @IBOutlet weak var Coinlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON { (response) in
           
            if let bitcoinJSON = response.result.value {
                
                let bitcoinObject :Dictionary = bitcoinJSON as! Dictionary<String,Any>
                let bpiObject:Dictionary = bitcoinObject["bpi"] as! Dictionary<String,Any>
                let usdObject:Dictionary = bpiObject["USD"] as! Dictionary<String,Any>
                let rate:Float = usdObject["rate_float"] as! Float
                
                self.Coinlbl.text="$\(rate)"
        }
    }
    }
}
