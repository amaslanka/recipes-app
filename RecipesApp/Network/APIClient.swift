//
//  APIClient.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 28/02/2021.
//

import Foundation
import RxSwift


class APIClient {
    static let shared = APIClient()

    private let baseURL = URL(string: "https://recipesapi.herokuapp.com/api/")!
    
    private init() { }

    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
