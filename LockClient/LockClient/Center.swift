//
//  Center.swift
//  LockClient
//
//  Created by Khazan on 2023/5/25.
//

import Foundation
import CoreBluetooth

var advertisementDataServiceUUID = "E923AD71-D18B-47AF-9D55-4567F32D6F57"

class Center: NSObject {
    
    func scan() -> Void {
        
        centerManager.scanForPeripherals(withServices: [CBUUID(string: advertisementDataServiceUUID)])
        
    }
    
    
    override init() {
        super.init()
        
        centerManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    
    var centerManager: CBCentralManager!
    
    var peripheral: CBPeripheral?
}


extension Center: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("didDiscover peripheral:\(peripheral) advertisementData:\(advertisementData)")
        
        self.peripheral = peripheral
        
        central.connect(peripheral)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("didConnect peripheral:\(peripheral)")
        
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("didFailToConnect peripheral:\(peripheral) error:\(error)")
        self.peripheral = nil
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("didDisconnectPeripheral peripheral:\(peripheral) error:\(error)")
        self.peripheral = nil
    }
    
    
}

extension Center: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("didDiscoverServices error:\(error)")

        peripheral.services?.forEach({ service in
            peripheral.discoverCharacteristics(nil, for: service)
        })
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("didDiscoverCharacteristicsFor:\(service) error:\(error)")
    }
    
}
