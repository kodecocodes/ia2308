
import Foundation

class ColorModel: ObservableObject {
  private let titleText = "Color Picker"
  private let cornerRadius: CGFloat = 0
  private let borderWidth: CGFloat = 1
  private let labelTextSize: CGFloat = 18
  private let buttonTitle = "Set Color"
  private let backgroundColor = Color.white
  private let paddingAmount: CGFloat = 20
  private let colorScale: ClosedRange<Double> = 0...255
}
