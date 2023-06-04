import UIKit.UILabel

public class GradientLabel: UILabel {

    // MARK: - Private properties

    private let gradientImage: UIImage

    // MARK: - Init

    public init(gradientImage: UIImage) {
        self.gradientImage = gradientImage

        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View lifecycle

    public override func layoutSubviews() {
        super.layoutSubviews()

        UIGraphicsBeginImageContext(frame.size)
        gradientImage.draw(in: bounds)
        let myGradient = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        textColor = UIColor(patternImage: myGradient!)
    }
}
