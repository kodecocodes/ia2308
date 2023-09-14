
import SwiftUI

struct ButtonView: View {
  
  @Binding var backgroundColor: Color
  var redValue: Double
  var greenValue: Double
  var blueValue: Double

  var body: some View {
    Button("Set Color" .uppercased())
    {
      backgroundColor = Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
    }
    .padding(20)
    .background(Color(.blue))
    .foregroundColor(.white)
    .cornerRadius(21.0)
  }
}

//struct Button_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView()
//    }
//}
