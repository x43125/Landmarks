//
//  ModelData.swift
//  Landmarks
//
//  Created by 王详 on 2023/3/20.
//

import Foundation
import Combine

// 调用该方法声明了一个全局变量
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    var hikes: [Hike] = load("hikeData.json")
    
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary (
            grouping: landmarks, by: { $0.category.rawValue}
        )
    }
}


// 声明了一个方法来读取json文件，并解析成Landmark
func load<T: Decodable>(_ filename: String) -> T {
    // 看来是类似局部变量, Data may be a common data class
    let data: Data
    
    // 看来是if机制
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    // 看来是异常处理机制
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
