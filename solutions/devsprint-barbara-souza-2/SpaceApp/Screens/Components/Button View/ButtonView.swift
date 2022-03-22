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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupButton() {
        backgroundColor = .buttonColor
                setTitleColor(.white, for: .normal)
        setTitle("See more", for: .normal) // default title
        layer.cornerRadius = 14
        addTarget(self,
                  action: #selector(touchUpInside),
                  for: .touchUpInside)
    }

    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 56).isActive = true
    }

    @objc func touchUpInside() {
        delegate?.onTap()
    }
}
