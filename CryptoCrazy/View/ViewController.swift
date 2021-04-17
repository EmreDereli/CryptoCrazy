//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by TOS ANALYTICS on 14.04.2021.
//

import UIKit

class ViewController: UIViewController ,  UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListViewModel : CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      getData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos{
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
       let cryptoViewModel = cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceLabel.text = cryptoViewModel.price
        cell.currencyLabel.text = cryptoViewModel.name
        return cell
    }

}

