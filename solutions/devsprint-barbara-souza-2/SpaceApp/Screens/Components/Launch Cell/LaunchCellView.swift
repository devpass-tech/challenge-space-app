import UIKit

class LaunchCellView: UITableViewCell {

    private let badgeView: UIImageView = {
        let badgeView = UIImageView()
        badgeView.contentMode = .scaleAspectFit
        return badgeView
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        return titleLabel
    }()

    private let numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.font = .systemFont(ofSize: 20, weight: .regular)
        numberLabel.textColor = .textLabelColor
        return numberLabel
    }()

    private let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = .systemFont(ofSize: 20, weight: .regular)
        dateLabel.textColor = .textLabelColor
        return dateLabel
    }()

    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = .systemFont(ofSize: 20, weight: .regular)
        statusLabel.textColor = .textLabelColor
        return statusLabel
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .backgroundNextLaunchColor
        layer.cornerRadius = 10
        setupViews()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {

        contentView.addSubview(badgeView)
        contentView.addSubview(numberLabel)

        configureSubviewsConstraints()
    }

    private func setupStackView() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(statusLabel)

        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8

        configureStackViewConstraints()
    }

    private func configureStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: badgeView.trailingAnchor, constant: 16).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

    private func configureSubviewsConstraints() {
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        badgeView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        badgeView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        badgeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        badgeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true

        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
    }

    func updateLaunchView(model: LaunchCellModel) {

        badgeView.image = UIImage(named: model.badgeImage)
        titleLabel.text = model.rocketName
        numberLabel.text = "#\(model.number)"
        dateLabel.text = model.date
        statusLabel.text = model.status.rawValue
    }
}
