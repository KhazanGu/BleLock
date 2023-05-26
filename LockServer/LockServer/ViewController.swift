//
//  ViewController.swift
//  LockServer
//
//  Created by Khazan on 2023/5/25.
//

import Cocoa
import IOKit

class ViewController: NSViewController {

    let peripheral = Peripheral()
    
    @IBAction func pairing(_ sender: NSButton) {
                
        peripheral.startAdvertising()
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
//    func wakeUpScreen() {
//        let serviceDictionary = IOServiceMatching("IODisplayWrangler")
//        let iterator = UnsafeMutablePointer<io_iterator_t>.allocate(capacity: 1)
//
//        guard IOServiceGetMatchingServices(kIOMasterPortDefault, serviceDictionary, iterator) == KERN_SUCCESS else {
//            return
//        }
//
//        let service = IOIteratorNext(iterator.pointee)
//        IOObjectRelease(iterator.pointee)
//
//        if service != IO_OBJECT_NULL {
//            IORegistryEntrySetCFProperty(service, kIODisplayIsSleepKey as CFString, kCFBooleanFalse)
//            IOObjectRelease(service)
//        }
//    }


}

