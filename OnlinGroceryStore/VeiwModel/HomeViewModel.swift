//
//
//import SwiftUI
//
//@MainActor
//class HomeViewModel: ObservableObject {
//    static var shared: HomeViewModel = HomeViewModel()
//    
//    @Published var selectTab: Int = 0
//    @Published var txtSearch: String = ""
//    @Published var showError = false
//    @Published var errorMessage = ""
//    
//    @Published var offerArr: [ProductModel] = []
////    {
////        didSet {
////            if offerArr != oldValue {
////                Task {
////                    await serviceCallList()
////                }
////            }
////        }
////    }
//    
//    @Published var bestArr: [ProductModel] = []
//    @Published var listArr: [ProductModel] = []
//    @Published var typeArr: [ProductType] = []
//    
//    @Published var isLoading = true
//    
//    init() {
//        Task {
//            await serviceCallList()
//        }
//    }
//    
//    // MARK: - Service Call
//    func serviceCallList() async {
//        guard !isLoading else { return }
//        isLoading = true
//        defer { isLoading = false }
//        
//        do {
//            let response = try await ServiceCall.post(parameter: [:], path: Globs.SV_HOME, isToken: true)
//            guard let responseDict = response as? [String: Any] else {
//                self.errorMessage = "Invalid response format"
//                self.showError = true
//                return
//            }
//            
//            guard let status = responseDict["status"] as? String, status == "1" else {
//                self.errorMessage = responseDict["message"] as? String ?? "Unauthorized access"
//                self.showError = true
//                return
//            }
//            
//            if let payloadObj = responseDict["payload"] as? [String: Any] {
//                let jsonData = try JSONSerialization.data(withJSONObject: payloadObj, options: .fragmentsAllowed)
//                
//                // الآن، استخدم JSONDecoder لتحويل jsonData إلى كائنات
//                let decoder = JSONDecoder()
//                if let offerList = try? decoder.decode([ProductModel].self, from: jsonData) {
//                    self.offerArr = offerList
//                }
//                
//                if let bestSellList = try? decoder.decode([ProductModel].self, from: jsonData) {
//                    self.bestArr = bestSellList
//                }
//                
//                if let list = try? decoder.decode([ProductModel].self, from: jsonData) {
//                    self.listArr = list
//                }
//                
//                if let typeList = try? decoder.decode([ProductType].self, from: jsonData) {
//                    self.typeArr = typeList
//                }
//                
//                self.isLoading = false
//            } else {
//                self.errorMessage = "No payload found"
//                self.showError = true
//            }
//            
//        } catch {
//            debugPrint("Error: \(error)")
//            self.errorMessage = error.localizedDescription
//            self.showError = true
//        }
//    }
//    
//}

import SwiftUI

class HomeViewModel: ObservableObject
{
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectTab: Int = 0
    @Published var txtSearch: String = ""
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var offerArr: [ProductModel] = []
    @Published var bestArr: [ProductModel] = []
    @Published var listArr: [ProductModel] = []
//    @Published var typeArr: [TypeModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    
    
    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_HOME, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        self.offerArr = (payloadObj.value(forKey: "offer_list") as? NSArray ?? []).map({ obj in
                            
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.bestArr = (payloadObj.value(forKey: "best_sell_list") as? NSArray ?? []).map({ obj in
                            
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.listArr = (payloadObj.value(forKey: "list") as? NSArray ?? []).map({ obj in
                            
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.listArr = (payloadObj.value(forKey: "type_list") as? NSArray ?? []).map({ obj in
                            
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                    }
                    
                    
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
}

