import SwiftUI


struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)

  private let titleText = "Color Picker"
  private let cornerRadius: CGFloat = 0
  private let borderWidth: CGFloat = 10
  private let buttonTitle = "Set Color"
  private let backgroundColor = Color.white
  private let paddingAmount: CGFloat = 20
  private let sliderPadding: CGFloat = 10
  private let sliderTintOpacity: Double = 0.5
  private let buttonFrameWidth: CGFloat = 100
  private let buttonFrameHeight: CGFloat = 50
  private let buttonCornerRadius: CGFloat = 10
  private let buttonStrokeWidth: CGFloat = 1

  var body: some View {
    VStack {
      Text(titleText)
        .font(.largeTitle)

      RoundedRectangle(cornerRadius: cornerRadius)
        .foregroundColor(foregroundColor)
        .overlay(
          Rectangle()
            .stroke(foregroundColor.opacity(sliderTintOpacity), lineWidth: borderWidth)
        )
        .padding(.trailing)
        .padding(.leading)
        .padding(paddingAmount)

      ColorSliderView(value: $redColor, label: "Red")
        .padding()
        .tint(Color.red)
      ColorSliderView(value: $greenColor, label: "Green")
        .padding()
        .tint(Color.green)
      ColorSliderView(value: $blueColor, label: "Blue")
        .padding()
        .tint(Color.blue)

      ZStack {
        RoundedRectangle(cornerRadius: buttonCornerRadius)
          .frame(width: buttonFrameWidth, height: buttonFrameHeight)
          .foregroundColor(.blue)
          .overlay(
            RoundedRectangle(cornerRadius: buttonCornerRadius)
              .stroke(Color.white, lineWidth: buttonStrokeWidth)
          )

        Button(buttonTitle) {
          foregroundColor = Color(
            red: redColor / 255,
            green: greenColor / 255,
            blue: blueColor / 255
          )
        } .foregroundColor(.white)
      }
      .padding(paddingAmount)
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.light)
    ContentView()
      .preferredColorScheme(.dark)
  }
}
