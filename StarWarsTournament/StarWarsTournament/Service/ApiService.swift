//
//  ApiService.swift
//  StarWarsTournament
//
//  Created by Jigar on 18/05/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import Foundation
import Alamofire

class ApiService {
    
    
    func fetchMatchInfo(completion : @escaping (_ results: MatchInfoArray? ,_ error : NSError?) -> Void) -> Void {
        
        Alamofire.request(AppConstant.MatchListURL).responseJSON { response in
           
            let playerInfo = convertDataToMatchInfo(jsonData: response.data!)
            completion(playerInfo, nil)
            
        }
        
        
    }
    
    func fetchPlayerInfo(completion : @escaping (_ results: Players? ,_ error : NSError?) -> Void) -> Void {
        
        
        Alamofire.request(AppConstant.PlayerListURL).responseJSON { response in
            
            let playerInfo = convertDataToPlayerInfo(jsonData: response.data!)
            completion(playerInfo, nil)
            
        }
    }
    
}
