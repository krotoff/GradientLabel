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

        guard bounds.width * bounds.height > 0 else { return }

        UIGraphicsBeginImageContext(frame.size)
        gradientImage.draw(in: bounds)

        defer { UIGraphicsEndImageContext() }

        guard let myGradient = UIGraphicsGetImageFromCurrentImageContext() else { return }

        textColor = UIColor(patternImage: myGradient)
    }
}
