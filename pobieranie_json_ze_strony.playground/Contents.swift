import UIKit
var str = "http://api.openweathermap.org/data/2.5/weather?q=Gdansk%2Cpl&APPID=7eb03a29be8a7b93b78efa9dda943c8b&fbclid=IwAR3hrpAHIU84nrTjkpOhhLsleK-g4ubS4IzODiGYwk_9BLUG1gbtouP3cCo"
struct Coords:Codable
{
    let lon:Double
    let lat:Double
}
struct Weather:Codable {
    let id:Int
    let main:String
    let description:String
    let icon:String
}
struct Wind:Codable
{
    let speed:Double
    let deg:Int
}

struct Cloud:Codable
{
    let all:Int
}

struct Sys: Codable
{
    let type:Int
    let id:Int
    let country:String
    let sunrise:Int
    let sunset:Int
}
struct Data: Codable
{
    let temp:Double
    let feels_like:Double
    let temp_min:Double
    let temp_max:Double
    let pressure: Int
    let humidity: Int
}

struct Response: Codable
{
    let coord:Coords
    let weather:[Weather]
    let base:String
    let main:Data
    let visibility:Int
    let wind: Wind
    let clouds:Cloud
    let dt:Int
    let sys:Sys
    let timezone:Int
    let id:Int
    let name:String
    let cod:Int
}

if let url = URL(string: str) {
   URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
          do {
             let res = try JSONDecoder().decode(Response.self, from: data)
             print(res)
          } catch let error {
             print(error)
          }
       }
   }.resume()
}



