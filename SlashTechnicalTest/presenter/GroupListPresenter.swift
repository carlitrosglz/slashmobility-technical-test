//
//  GroupListPresenter.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 2/1/22.
//

import Foundation
import SwiftyJSON

class GroupListPresenter {
    private weak var _delegate: GroupListDelegate?
    
    private var _list: [Group]?
    
    init(view: GroupListDelegate) {
        self._delegate = view
        self._list     = [Group]()
    }
    
    public func getData(isNewSearch: Bool) {
        if isNewSearch { _list?.removeAll() }
        
        let httpObject = HttpObject(messageError: Literals.msg_error_download_groups, url: UrlPetition.GROUP_LIST)
        
        onHttpExecute(httpObject: httpObject)
    }
    
    private func saveDataFromAPI(data: JSON) {
        for object in data.arrayValue {
            let group = Group(name: object["name"].stringValue,
                              descriptionShort: object["descriptionShort"].stringValue,
                              date: object["date"].intValue,
                              urlImage: object["defaultImageUrl"].stringValue)
            
            _list?.append(group)
        }
        
        
        _delegate?.updateView()
    }
    
    public var list: [Group] {
        get { return _list! }
        set { _list = newValue }
    }
}

extension GroupListPresenter: HttpInterface {
    func onHttpExecute(httpObject: HttpObject) {
        GlobalVariables.HTTP_SERVICE().execute(objectHttp: httpObject, httpInterface: self)
    }
    
    func onHttpResponse(response: HttpObject) {
        if response.isResponseOk() {
            switch response.url {
                case UrlPetition.GROUP_LIST:
                    saveDataFromAPI(data: response.data!)
                
                default:
                    return
            }
            
        } else {
            _delegate?.showErrorAlert(message: response.getResponseMessage())
        }
    }
}
