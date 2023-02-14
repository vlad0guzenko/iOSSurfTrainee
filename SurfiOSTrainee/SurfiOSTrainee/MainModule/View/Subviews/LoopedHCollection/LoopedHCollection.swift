import UIKit

class LoopedHCollection: UIViewController {
    
    var data: [String]
    
    private lazy var loopedHCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(TagViewCell.self, forCellWithReuseIdentifier: TagViewCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.alwaysBounceHorizontal = true
        return collection
    }()
    
    init(data: [String]) {
        self.data = data
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
    }
    
    private func setupLayout() {
        loopedHCollection.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(CGFloat.normalInset)
        }
    }
    
    private func setupView() {
        view.addSubview(loopedHCollection)
    }
}

extension LoopedHCollection: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(withType: TagViewCell.self,
                                                    for: indexPath) as? TagViewCell else {
            return UICollectionViewCell()
        }
        
        var index = indexPath.item
        if index > data.count - 1 {
            index -= data.count
        }
        
        cell.tagButton.setTitle(data[index % data.count], for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        var offset = collectionView.contentOffset
        let width = collectionView.contentSize.width
        if offset.x < width/4 - 40 {
            offset.x += width/2
            collectionView.setContentOffset(offset, animated: false)
        } else if offset.x > width/4 * 3 - 40 {
            offset.x -= width/2
            collectionView.setContentOffset(offset, animated: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var index = indexPath.item
        if index > data.count - 1 {
            index -= data.count
        }
        
        let text = data[index % data.count]
        
        let width = UILabel.textWidth(font: .regular14, text: text)
        
        return CGSize(width: width + .bigInset * 2, height: .defaultHeight)
    }
}

extension UILabel {
    static func textWidth(font: UIFont, text: String) -> CGFloat {
      let text = text as NSString
      let rect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
      let labelSize = text.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
      return ceil(labelSize.width)
  }
}
