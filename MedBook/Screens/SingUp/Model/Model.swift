//
//  Model.swift
//  MedBook
//
//  Created by Chandru M on 09/08/23.
//

import Foundation


struct CountryListModel: Codable {
    let status: String?
    let version:String?
    let access: String?
    let data: CountryDetails?
    
}

struct CountryDetails: Codable {
    let DZ: CountryModel?
    let AO: CountryModel?
    let BJ: CountryModel?
    let BW: CountryModel?
    let BF: CountryModel?
    let BI: CountryModel?
    let CV: CountryModel?
    let CM: CountryModel?
    let CF: CountryModel?
    let TD: CountryModel?
    let KM: CountryModel?
    let CD: CountryModel?
    let CG: CountryModel?
    let CI: CountryModel?
    let DJ: CountryModel?
    let EG: CountryModel?
    let GQ: CountryModel?
    let ER: CountryModel?
    let SZ: CountryModel?
    let ET: CountryModel?
    let GA: CountryModel?
    let GM: CountryModel?
    let GH: CountryModel?
    let GN: CountryModel?
    let GW: CountryModel?
    let KE: CountryModel?
    let LS: CountryModel?
    let LR: CountryModel?
    let LY: CountryModel?
    let MG: CountryModel?
    let MW: CountryModel?
    let ML: CountryModel?
    let MR: CountryModel?
    let MU: CountryModel?
    let YT: CountryModel?
    let MA: CountryModel?
    let MZ: CountryModel?
    let NA: CountryModel?
    let NE: CountryModel?
    let NG: CountryModel?
    let RE: CountryModel?
    let RW: CountryModel?
    let SH: CountryModel?
    let ST: CountryModel?
    let SN: CountryModel?
    let SC: CountryModel?
    let SL: CountryModel?
    let SO: CountryModel?
    let ZA: CountryModel?
    let SS: CountryModel?
    let SD: CountryModel?
    let TZ: CountryModel?
    let TG: CountryModel?
    let TN: CountryModel?
    let UG: CountryModel?
    let EH: CountryModel?
    let ZM: CountryModel?
    let ZW: CountryModel?
    let AE: CountryModel?
    let BV: CountryModel?
    let TF: CountryModel?
    let HM: CountryModel?
    let GS: CountryModel?
    let AF: CountryModel?
    let AM: CountryModel?
    let AZ: CountryModel?
    let BD: CountryModel?
    let BT: CountryModel?
    let IO: CountryModel?
    let BN: CountryModel?
    let KH: CountryModel?
    let CN: CountryModel?
    let GE: CountryModel?
    let HK: CountryModel?
    let IN: CountryModel?
    let ID: CountryModel?
    let JP: CountryModel?
    let KZ: CountryModel?
    let KP: CountryModel?
    let KR: CountryModel?
    let KG: CountryModel?
    let LA: CountryModel?
    let MO: CountryModel?
    let MY: CountryModel?
    let MV: CountryModel?
    let MN: CountryModel?
    let MM: CountryModel?
    let NP: CountryModel?
    let PK: CountryModel?
    let PH: CountryModel?
    let SG: CountryModel?
    let LK: CountryModel?
    let TW: CountryModel?
    let TJ: CountryModel?
    let TH: CountryModel?
    let TL: CountryModel?
    let TM: CountryModel?
    let UZ: CountryModel?
    let VN: CountryModel?
    let BZ: CountryModel?
   
}

struct CountryModel: Codable {
    let country: String?
    let region: String?
}


