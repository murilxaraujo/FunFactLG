//
//  FunFactViewController.swift
//  FunFact
//
//  Created by Murilo Araujo on 26/05/20.
//  Copyright © 2020 LG Sistemas SA. All rights reserved.
//

import UIKit

class FunFactViewController: UIViewController {

    public var funFact: TipoFunFact?
    
    let loadingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let doneView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        layoutSubviewLoading()
        getData()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = funFact?.rawValue
    }
    
    private func layoutSubviewLoading() {
        self.view.addSubview(loadingView)
        loadingView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        loadingView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        let loadingIndicator = UIActivityIndicatorView()
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.hidesWhenStopped = true
        
        loadingView.addSubview(loadingIndicator)
        loadingIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor, constant: -30).isActive = true
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        loadingView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: loadingIndicator.bottomAnchor, constant: 10).isActive = true
        label.text = "Carregando..."
        label.textColor = .systemGray
        loadingIndicator.startAnimating()
        
    }
    
    private func layoutSubviewDone(_ value: String) {
        DispatchQueue.main.async {
            self.loadingView.removeFromSuperview()
            self.view.addSubview(self.doneView)
            self.doneView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.doneView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.doneView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            self.doneView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .systemGray
            label.numberOfLines = 0
            label.textAlignment = .center
            self.doneView.addSubview(label)
            label.leftAnchor.constraint(equalTo: self.doneView.leftAnchor, constant: 30).isActive = true
            label.rightAnchor.constraint(equalTo: self.doneView.rightAnchor, constant: -30).isActive = true
            label.centerYAnchor.constraint(equalTo: self.doneView.centerYAnchor).isActive = true
            label.text = value
        }
    }
    
    private func getData() {
        if funFact != nil {
            FunFactService.shared.getFunFact(for: funFact!) { (value) in
                if value == nil {
                    self.layoutSubviewDone("Erro, não foi possível buscar a curiosidade")
                    return
                }
                self.layoutSubviewDone(value ?? "Default")
            }
        } else {
            layoutSubviewDone("Erro, não foi possível buscar a curiosidade")
        }
    }

}
