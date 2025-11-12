import UIKit

class ViewController: UIViewController, URLSessionDelegate, XMLParserDelegate {
    var dataStore: Data?
//    var elementText = ""
    
    var cityName: String?
    var temperature: String?
    var minimum: String?
    var maximum: String?
    var humidity: String?
    var wind: String?
    var precipitation: String?

    var parsingCurrent = false
//    var parsingCityName = false
//    var parsingTemperature = false
//    var parsingMinimum = false
//    var parsingMaximum = false
//    var parsingHumidity = false
//    var parsingWind = false
//    var parsingPrecipitation = false
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    
    func fetchData() {
        var city = "Sault Ste. Marie"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city),ca&appid=5dc1d31216585332c40c29eca6c261cb&mode=xml&units=metric"
        let url = NSURL(string: urlString)! as URL
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            self.dataStore = data
            self.parseXML()
            
            DispatchQueue.main.async {
                self.textView.text = "\(self.cityName)\n\(self.temperature)\n\(self.minimum)\n\(self.maximum)\n\(self.humidity)\n\(self.wind)\n\(self.precipitation)"
            }
        })
        task.resume()
    }
    
    func parseXML() {
        let parser = XMLParser(data: self.dataStore!)
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("elementName: ", elementName)
        dump(attributeDict) // attribute dict contains key-value pairs of xml items
        
        if elementName == "current" {
            parsingCurrent = true
        }
        else if parsingCurrent == true && elementName == "city" {
//            parsingCityName = true
            cityName = attributeDict["name"]
        }
        else if parsingCurrent == true && elementName == "temperature" {
//            parsingTemperature = true
//            parsingMinimum = true
//            parsingMaximum = true
            
            temperature = attributeDict["value"]
            maximum = attributeDict["max"]
            minimum = attributeDict["min"]
        }
        else if parsingCurrent == true && elementName == "humidity" {
//            parsingHumidity = true
            
            humidity = attributeDict["value"]
        }
        else if parsingCurrent == true && elementName == "speed" {
//            parsingWind = true
            
            wind = attributeDict["value"]
        }
        else if parsingCurrent == true && elementName == "precipitation" {
//            parsingPrecipitation = true
            
            precipitation = attributeDict["mode"]
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
//        if parsingCityName || parsingTemperature || parsingMinimum || parsingMaximum || parsingHumidity || parsingWind || parsingPrecipitation {
//            elementText.append(string)
//        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        print("elementName2: ", elementName) // only shows XML tags
        
//        if parsingCityName {
//            
//        }
//        else if parsingTemperature
    }
    
    @IBAction func refreshTapped(_ sender: UIBarButtonItem) {
        fetchData()
    }
    
    @IBAction func settingsTapped(_ sender: UIBarButtonItem) {
        
    }
}

