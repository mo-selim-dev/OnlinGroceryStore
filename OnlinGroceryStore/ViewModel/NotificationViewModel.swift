//
//  NotificationViewModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 20/02/2025.
//


import SwiftUI

class NotificationViewModel: ObservableObject
{
    static var shared: NotificationViewModel = NotificationViewModel()
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [NotificationModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    
    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.Endpoints.notificationList, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    
                    
                    self.listArr = (response.value(forKey: ResponseKeys.payload) as? NSArray ?? []).map({ obj in
                        return NotificationModel(dict: obj as? NSDictionary ?? [:])
                    })
                
                }else{
                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    func serviceCallReadAll(){
        ServiceCall.post(parameter: [:], path: Globs.Endpoints.readAllNotifications, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: ResponseKeys.status) as? String ?? "" == "1" {
                    self.serviceCallList()
                }else{
                    self.errorMessage = response.value(forKey: ResponseKeys.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    
    
    
}



//
//import SwiftUI
//
//class NotificationViewModel: ObservableObject {
//    static var shared: NotificationViewModel = NotificationViewModel()
//    
//    @Published var showError = false
//    @Published var errorMessage = ""
//    
//    @Published var listArr: [NotificationModel] = []
//    
//    init() {
//        serviceCallList()
//    }
//    
//    //MARK: ServiceCall
//    func serviceCallList(){
//        ServiceCall.post(parameter: [:], path: Globs.Endpoints.notificationList, isToken: true) { responseObj in
//            if let response = responseObj as? NSDictionary,
//               let responseDict = response as? [String: Any] { // هنا تحويل NSDictionary لـ Swift Dictionary
//               
//                if responseDict[ResponseKeys.status] as? String ?? "" == "1" {
//                    
//                    self.listArr = (responseDict[ResponseKeys.payload] as? [[String: Any]] ?? []).map { obj in
//                        return NotificationModel(dict: obj)
//                    }
//                    
//                } else {
//                    self.errorMessage = responseDict[ResponseKeys.message] as? String ?? "Fail"
//                    self.showError = true
//                }
//            }
//        } failure: { error in
//            self.errorMessage = error?.localizedDescription ?? "Fail"
//            self.showError = true
//        }
//    }
//    
//    func serviceCallReadAll(){
//        ServiceCall.post(parameter: [:], path: Globs.Endpoints.readAllNotifications, isToken: true) { responseObj in
//            if let response = responseObj as? NSDictionary,
//               let responseDict = response as? [String: Any] { // نفس التحويل هنا
//                
//                if responseDict[ResponseKeys.status] as? String ?? "" == "1" {
//                    self.serviceCallList()
//                } else {
//                    self.errorMessage = responseDict[ResponseKeys.message] as? String ?? "Fail"
//                    self.showError = true
//                }
//            }
//        } failure: { error in
//            self.errorMessage = error?.localizedDescription ?? "Fail"
//            self.showError = true
//        }
//    }
//}
