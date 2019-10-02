//
//  ItemInteractor.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import Alamofire

class ItemInteractor: ItemInteractorInput {
    
    weak var output: ItemInteractorOutput?
    
    func fecth(category: Category) {
        
        let parameters: [String: Any] = [ "category": category]
        Alamofire.request(RouterManager.feed(parameters: parameters)).responseJSON { response in
            switch response.result {
            case .success:
                if response.response?.statusCode == 200 {
                    
                    guard let data = response.data, let listModel = self.getList(data: data) else {
                        self.output?.didError(with: .serve)
                        return
                    }
                    self.output?.fetched(list: listModel.list)
                } else {
                    self.output?.didError(with: .unauthorized)
                }
            case .failure:
                self.output?.didError(with: .serve)
            }
        }
        
    }
    
    func getList(data: Data) -> ItemsModel? {
        do {
            let decoder = JSONDecoder()
            let items = try decoder.decode(ItemsModel.self, from: data)
            return items
        } catch {
            return nil
        }
    }
    
    
}
