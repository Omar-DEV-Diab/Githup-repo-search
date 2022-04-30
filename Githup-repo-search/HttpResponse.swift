//
//  HttpResponse.swift
//  Githup-repo-search
//
//  Created by Omar Diab on 4/30/22.
//

import Foundation

class HttpResponse {

    var response: Data?
    var success: Bool?
    var errorMessage: String?
    var statusCode: Int?
    
    init?(_ response:Data?,_ urlResponse:HTTPURLResponse?,_ error: Error?) {
        guard response != nil,
              urlResponse != nil else{
            return nil
        }
        self.response = response!
        self.statusCode = urlResponse!.statusCode;
        
        guard isUrlResponseSuccess(urlResponse),
              nil == error else{
            self.success = false;
            self.errorMessage = !error!.localizedDescription.isEmpty ? error!.localizedDescription : "error-with-code-\(urlResponse!.statusCode)"
            return
        }
        
        self.success = true
        self.errorMessage = nil
    }
    
    fileprivate func isUrlResponseSuccess(_ urlResponse: HTTPURLResponse?) -> Bool {
        return urlResponse?.statusCode == 200
    }
}
