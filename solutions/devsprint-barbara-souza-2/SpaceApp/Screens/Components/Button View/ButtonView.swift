import UIKit

protocol ButtonViewDelegate: AnyObject {
    func onTap()
}

class ButtonView: UIButton {

    weak var delegate: ButtonViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        setupConstraints()
    }

    var title: String = "See more" {
        didSet {
            setTitle(title, for: .normal)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton() {
        backgroundColor = .buttonColor
        setTitleColor(.white, for: .normal)
        setTitle(title, for: .normal)
        layer.cornerRadius = 14
        addTarget(self,
                  action: #selector(touchUpInside),
                  for: .touchUpInside)
    }

    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 56).isActive = true
    }

    @objc private func touchUpInside() {
        delegate?.onTap()
    }
}
