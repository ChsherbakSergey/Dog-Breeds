//
//  jsonHandler.swift
//  Breeds
//
//  Created by Sergey on 11/12/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import Foundation

struct BreedsData: Codable {
    let id: Int
    let name: String
    let bred_for: String?
    let breed_group: String?
    let life_span: String?
    let temperament: String?
    let origin: String?
    let weight: Weight
    let height: Height
}

struct Weight: Codable {
    let imperial: String
    let metric: String
}

struct Height: Codable {
    let imperial: String
    let metric: String
}

var result: [BreedsData]?

func getBreeds(completed: @escaping () -> ()) {
    let urlString = "https://api.thedogapi.com/v1/breeds?e1575cb0-c3de-4545-b202-39d972a7f3ef"

    guard let url = URL(string: urlString) else {
        return
    }

    let task = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
        guard let data = data, error == nil else {
            return
        }


        do {
            result = try JSONDecoder().decode([BreedsData].self, from: data)
            DispatchQueue.main.async {
                completed()
            }
        }
        catch {
            print("Got an error: \(error)")
        }

        guard let finalResult = result else {
            return
        }

//        print(finalResult.count)
//
//        for i in 0..<finalResult.count {
//            print(finalResult[i].name)
//        }

        })

    task.resume()

}



//func loadGoods(goodsID: Int, completed: @escaping () -> ()) {
//    let urlString = "https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(goodsID)"
//    let url = URL(string: urlString)
//
//    URLSession.shared.dataTask(with: url!) { (data, response, error) in
//        if let data = data {
//            do {
//                let goods = try JSONDecoder().decode(Goods.self, from: data)
//                listOfGoods = goods
//                DispatchQueue.main.async {
//                    completed()
//                }
//            } catch {
//                print(error)
//            }
//        }
//    }.resume()
//    URLSession.shared.dataTask(with: url!) { (data, response, error) in
//        if let data = data {
//            do {
//                let goods = try JSONDecoder().decode(Goods.self, from: data)
//                listOfGoods = goods
//                DispatchQueue.main.async {
//                    completed()
//                }
//            } catch {
//                do {
//                    let goodsArray = try JSONDecoder().decode([Goods].self, from: data)
//                    listOfGoodsInArray = goodsArray
//                } catch {
//                    print(error)
//                }
//                print(error)
//            }
//        }
//    }.resume()
//}
//

/*
 "weight": {
     "imperial": "6 - 13",
     "metric": "3 - 6"
 },
 "height": {
     "imperial": "9 - 11.5",
     "metric": "23 - 29"
 },
 "id": 1,
 "name": "Affenpinscher",
 "bred_for": "Small rodent hunting, lapdog",
 "breed_group": "Toy",
 "life_span": "10 - 12 years",
 "temperament": "Stubborn, Curious, Playful, Adventurous, Active, Fun-loving",
 "origin": "Germany, France"
 */

