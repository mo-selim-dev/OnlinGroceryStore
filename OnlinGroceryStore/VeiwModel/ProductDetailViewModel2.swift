//
//  ProductDetailViewModel.swift
//  App1
//
//  Created by Mohamed Selim on 05/01/2025.
//


//import SwiftUI
//@MainActor
//class ProductDetailViewModel: ObservableObject {
//    
//    @Published var selectTab: Int = 0
//    @Published var txtSearch: String = ""
//    @Published var showError = false
//    @Published var errorMessage = ""
//    
//    @Published var offerArr: [ProductModel] = [] {
//        didSet {
//            if offerArr != oldValue {
//                Task {
//                    await serviceCallDetail()
//                }
//            }
//        }
//    }
//    
//    @Published var bestArr: [ProductModel] = []
//
//    
//    @Published var isLoading = true
//    
//    init() {
//        Task {
//            await serviceCallDetail()
//        }
//    }
//    
//    // MARK: - Service Call
//    func serviceCallDetail() async {
////        guard !isLoading else { return }  // لا تقم بالاستدعاء إذا كانت البيانات قيد التحميل
//        isLoading = true
//        defer { isLoading = false }
//        
//        do {
//            let response = try await ServiceCall.post(parameter: [:], path: Globs.SV_PRODUCT_DETAIL, isToken: true)
//            // التعامل مع الاستجابة هنا...
//            print("Response: \(String(describing: response))")  // تحقق من الاستجابة
//            // التحقق من صحة الاستجابة
//            guard let responseDict = response as? [String: Any] else {
//                self.errorMessage = "Invalid response format"
//                self.showError = true
//                self.isLoading = false
//                return
//            }
//            
//            guard let status = responseDict["status"] as? String, status == "1" else {
//                self.errorMessage = responseDict["message"] as? String ?? "Unauthorized access"
//                self.showError = true
//                self.isLoading = false
//                return
//            }
//            
//            // إذا كانت الاستجابة صحيحة، تابع معالجة البيانات
//            if let payloadObj = responseDict["payload"] as? [String: Any] {
//                // تحديث البيانات
////                self.listArr = (payloadObj["list"] as? [[String: Any]] ?? []).compactMap { ProductModel(dict: $0) }
////                self.typeArr = (payloadObj["type_list"] as? [[String: Any]] ?? []).compactMap { TypeModel(dict: $0) }
//                
////                print("offerArr: \(self.offerArr)")
////                print("bestArr: \(self.bestArr)")
////                print("listArr: \(self.listArr)")
////                print("typeArr: \(self.typeArr)")
//                
//                // إنهاء التحميل
//                self.isLoading = false
//            } else {
//                self.errorMessage = "No payload found"
//                self.showError = true
//                self.isLoading = false
//            }
//            
//            
//        } catch {
//            // التعامل مع الخطأ
//            print("Entering catch block")
//            debugPrint("Error: \(error)")  // طباعة الأخطاء
//            self.errorMessage = error.localizedDescription
//            self.showError = true
//            self.isLoading = false
//        }
//    }
//    
//    
//    
//    
//}
