//
//  HttpService.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 30/12/21.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire
import SwiftyJSON

class HttpService {
    public func execute(objectHttp: HttpObject, httpInterface: HttpInterface) {
        if HttpCheckConnection.isInternetUp() {
            sendHttpPetition(objectHttp: objectHttp, httpInterface: httpInterface)
            
        } else {
            objectHttp.response = ["ko", "En estos momentos no hay conexión. Inténtalo de nuevo más tarde."]
            httpInterface.onHttpResponse(response: objectHttp)
        }
    }
    
    // TODO: Por falta de tiempo no se ha tenido en cuenta otros tipos de peticiones HTTP (POST, PUT, etc). Todas las peticiones serán de tipo GET
    private func sendHttpPetition(objectHttp: HttpObject, httpInterface: HttpInterface) {
        let url = HttpHelper.getUrlPetition(endpoint: objectHttp.url)
        
       _ = RxAlamofire.requestJSON(.get, url, parameters: nil, encoding: JSONEncoding.default)
            .subscribeOn(GeneralHelper.getInstanceToSubscribeOn())
            .observeOn(GeneralHelper.getInstanceToObserveOn())
            .subscribe(
                onNext: { [weak self] (r, json) in
                    self?.processResponse(data: JSON(json),
                                          objectHttp: objectHttp,
                                          httpInterface: httpInterface)
                },
                onError: { [weak self] (error) in
                    self?.processError(error: error,
                                       objectHttp: objectHttp,
                                       httpInterface: httpInterface)
                }
            )
    }
    
    private func processResponse(data: JSON, objectHttp: HttpObject, httpInterface: HttpInterface) {
        objectHttp.response = ["ok", "La petición se ha realizado correctamente."]
        objectHttp.data     = data
        
        httpInterface.onHttpResponse(response: objectHttp)
    }
    
    private func processError(error: Error, objectHttp: HttpObject, httpInterface: HttpInterface) {
        objectHttp.response = ["ko", objectHttp.messageError]
        
        httpInterface.onHttpResponse(response: objectHttp)
    }
}
