//
//  BookSearchViewModel.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/12.
//

import Foundation

import Alamofire

class BookSearchViewModel: ObservableObject {
    static let shared: BookSearchViewModel = BookSearchViewModel()
    
    private init() { }
    
    @Published var bookList = [Book]()
    
    private let baseURL: String = Storage().naverBaseURL
    private let clientID: String = Storage().naverClientID
    private let clientSecret: String = Storage().naverClientSecret
    private let jsonDecoder: JSONDecoder = JSONDecoder()
    
    /// URLSession으로 네트워크 통신하여 도서 검색 리스트 가져오는 함수
    /// - Parameter query: 검색어
    func requestSearchBookWithURLSession(query: String) {
        let query: String = baseURL + "?query=" + query
        let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let queryURL: URL = URL(string: encodedQuery)!
        
        var requestURL = URLRequest(url: queryURL)
        requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: requestURL) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else {
                print(error!)
                return
            }
            
            do {
                let searchResult = try self.jsonDecoder.decode(BookList.self, from: data)
                DispatchQueue.main.async {
                    self.bookList = searchResult.items
                }
                print("\(#file) > \(#function) :: SUCCESS")
            } catch {
                print("\(#file) > \(#function) :: FAILURE : \(error)")
            }
        }
        task.resume()
    }
    
    
    /// Almofire로 네트워크 통신하여 도서 검색 리스트 가져오는 함수
    /// - Parameter query: 검색어
    func requestSearchBookWithAlamofire(query: String) {
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": clientID,
            "X-Naver-Client-Secret": clientSecret,
        ]

        let parameters: Parameters = [
            "query": query,
            "display": 50
        ]

        AF.request(baseURL,
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: headers)
        .validate(statusCode: 200...500)
        .responseDecodable(of: BookList.self) { response in
            switch response.result {
            case .success(let data):
                guard let statusCode = response.response?.statusCode else { return }
                if statusCode == 200 {
                    DispatchQueue.main.async {
                        self.bookList = data.items
                    }
                }
                print("\(#file) > \(#function) :: SUCCESS")
            case .failure(let error):
                print("\(#file) > \(#function) :: FAILURE : \(error)")
            }
        }
    }
}
