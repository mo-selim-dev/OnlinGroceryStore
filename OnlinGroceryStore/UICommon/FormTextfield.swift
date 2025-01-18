//
//  FormTextfield.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 15/01/2025.
//

import SwiftUI

struct FormTextfield: View {
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            TextField(placholder, text: $txt)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(height:40)
            
            Divider()
        }
    }
}

struct FormSecureField: View {
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if (isShowPassword) {
                TextField(placholder, text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier( ShowEyeButton(isShow: $isShowPassword))
                    .frame(height:40)
            }else{
                SecureField(placholder, text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier( ShowEyeButton(isShow: $isShowPassword))
                    .frame(height:40)
                
            }
            Divider()
        }
    }
}


// error: 'Previewable()' is only available in iOS 17.0 or newer
//#Preview {
//    @State static var text = "text"
//    FormTextfield(txt: $text) // فقط تمرير txt بدون isShowText
//}

struct FormTextfield_Previews: PreviewProvider {
    @State static var text = "" // استخدم @State لتوفير قيمة قابلة للتعديل لـ Binding
    static var previews: some View {
        FormTextfield(txt: $text) // فقط تمرير txt بدون isShowText
            .padding(20)
    }
}
