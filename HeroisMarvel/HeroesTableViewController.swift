//
//  HeroesTableViewController.swift
//  HeroisMarvel
//
//  Created by Eric Brito on 22/10/17.
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    var name: String?
    var heroes: [Hero] = []
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var loadingHeroes = false
    var currentPage = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Buscando heróis. Aguarde..."
        tableView.backgroundView = label
        loadHeroes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HeroViewController
        vc.hero = heroes[tableView.indexPathForSelectedRow!.row]
    }
    
    func loadHeroes() {
           loadingHeroes = true
           MarvelAPI.loadHeros(name: name, page: currentPage) { [weak self] (info) in
               guard let self = self else { return }
               if let info = info {
                   self.heroes += info.data.results
                   self.total = info.data.total
                   DispatchQueue.main.async {
                       self.loadingHeroes = false
                       if self.heroes.isEmpty {
                           self.label.text = "Não foram encontrados heróis com o nome \(self.name ?? "")"
                       } else {
                           self.label.text = ""
                       }
                       self.tableView.reloadData()
                   }
               } else {
                   DispatchQueue.main.async {
                       self.loadingHeroes = false
                       self.label.text = "Erro ao carregar heróis."
                   }
               }
           }
       }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = heroes.count == 0 ? label : nil
        return heroes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
        let hero = heroes[indexPath.row]
        cell.prepareCell(with: hero)
        return cell
    }
    
    // scroll infinito
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == heroes.count - 10 && !loadingHeroes && heroes.count != total {
            currentPage += 1
            loadHeroes()
        }
    }
}




