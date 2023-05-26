//
//  Peripheral.swift
//  LockServer
//
//  Created by Khazan on 2023/5/25.
//

import Foundation
import CoreBluetooth

let advertisementDataLocalName = "LockServer"
var advertisementDataServiceUUID = "E923AD71-D18B-47AF-9D55-4567F32D6F57"

class Peripheral: NSObject {
    
    func startAdvertising() -> Void {
        let uuid = CBUUID(string: advertisementDataServiceUUID)
        let info: [String : Any] = [CBAdvertisementDataLocalNameKey: advertisementDataLocalName,
                                 CBAdvertisementDataServiceUUIDsKey: [uuid]]
        print("startAdvertising with info: \(info)")
        
        self.manager!.startAdvertising(info)
    }
    
    override init() {
        super.init()
        
        self.manager = CBPeripheralManager(delegate: self, queue: nil)
        
        let service = CBMutableService(type: CBUUID(), primary: true)
        
        let notify = CBMutableCharacteristic(type: CBUUID(), properties: .notify, value: nil, permissions: [.readable, .writeable])
        
        service.characteristics = [notify]
        
        self.manager.add(service)
        
    }
    
    var manager: CBPeripheralManager!
    
    var bleState: CBManagerState = .poweredOff
    
}


extension Peripheral: CBPeripheralManagerDelegate {
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        print("peripheralManagerDidUpdateState")
        
        self.bleState = peripheral.state
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        print("peripheralManagerDidStartAdvertising")
        
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        print("peripheralManager didAdd")
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        print("peripheralManager didSubscribeTo")
        
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        print("peripheralManager didUnsubscribeFrom")
        
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        print("peripheralManager didReceiveRead")

    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        print("peripheralManager didReceiveWrite")
    }
    
}
