import UIKit

// MARK: - WPTableViewCell Classes

class InstructionTableViewCell: WPTableViewCell {

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var instr1Label: UILabel!
    @IBOutlet weak var instr2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

class SiteTypeTableViewCell: WPTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: - ImmuTableRow Structs

struct InstructionRow: ImmuTableRow {
    typealias CellType = InstructionTableViewCell
    
    static let cell: ImmuTableCell = {
        let nib = UINib(nibName: "InstructionTableViewCell", bundle: Bundle(for: CellType.self))
        return ImmuTableCell.nib(nib, CellType.self)
    }()
    
    let step: String
    let instr1: String
    let instr2: String?
    let action: ImmuTableAction?

    func configureCell(_ cell: UITableViewCell) {
        let cell = cell as! CellType
        cell.backgroundColor = UIColor.clear
        cell.stepLabel.text = step
        cell.instr1Label.text = instr1
        cell.selectionStyle = .none
        
        cell.instr2Label.isHidden = true
        if let instr2 = instr2, !instr2.isEmpty {
                cell.instr2Label.isHidden = false
                cell.instr2Label.text = instr2
        }
    }
}

