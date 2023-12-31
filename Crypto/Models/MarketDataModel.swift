//
//  MarketDataModel.swift
//  Crypto
//
//  Created by MyBook on 11.06.2022.
//

import Foundation

// JSON data:
/*
 URL:
 https://api.coingecko.com/api/v3/global
 
 JSON:
 {
   "data": {
     "active_cryptocurrencies": 13414,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 637,
     "total_market_cap": {
       "btc": 42132152.04050153,
       "eth": 770255774.7438072,
       "ltc": 22095311405.616753,
       "bch": 7494183458.55965,
       "bnb": 4350152999.340579,
       "eos": 1048295157428.3992,
       "xrp": 3231319911592.449,
       "xlm": 9406729393123.277,
       "link": 160708347741.11975,
       "dot": 146154736462.6675,
       "yfi": 184119620.05523962,
       "usd": 1208849014584.215,
       "aed": 4440223315469.274,
       "ars": 147224766495490.03,
       "aud": 1714193838942.9731,
       "bdt": 113210567007898.19,
       "bhd": 455588598918.4688,
       "bmd": 1208849014584.215,
       "brl": 6028995442602.09,
       "cad": 1545364776717.127,
       "chf": 1194176005245.1948,
       "clp": 1006276014036118.9,
       "cny": 8110047153944.066,
       "czk": 28389819107510.297,
       "dkk": 8548315364181.554,
       "eur": 1149095607793.3206,
       "gbp": 981487483072.2039,
       "hkd": 9489222994683.197,
       "huf": 457446599853884.94,
       "idr": 17667267905697592,
       "ils": 4103123679262.332,
       "inr": 94503947643347.27,
       "jpy": 162487440295337.62,
       "krw": 1546456367377296.8,
       "kwd": 370780587451.2998,
       "lkr": 436478806648275.2,
       "mmk": 2239158363801313.2,
       "mxn": 24148959171526.28,
       "myr": 5311078145575.736,
       "ngn": 505273536114670.06,
       "nok": 11742856035592.258,
       "nzd": 1896977854193.1777,
       "php": 64141519043046.28,
       "pkr": 244187500946011.47,
       "pln": 5296148860245.631,
       "rub": 69659795118571.08,
       "sar": 4535624470851.255,
       "sek": 12123788537068.016,
       "sgd": 1677749458851.2893,
       "thb": 41958025066634.58,
       "try": 20690417963820.516,
       "twd": 35856879470597.02,
       "uah": 35732444179582.766,
       "vef": 121042051830.31743,
       "vnd": 28024142280598604,
       "zar": 19170906840978.32,
       "xdr": 882357028480.2388,
       "xag": 55223909975.70157,
       "xau": 645960559.4332235,
       "bits": 42132152040501.53,
       "sats": 4213215204050152.5
     },
     "total_volume": {
       "btc": 2478572.0987775098,
       "eth": 45313006.33224264,
       "ltc": 1299834442.6156273,
       "bch": 440871712.54983395,
       "bnb": 255913057.54365426,
       "eos": 61669651386.14074,
       "xrp": 190093764196.95264,
       "xlm": 553383957034.3512,
       "link": 9454234057.848793,
       "dot": 8598066663.01576,
       "yfi": 10831484.531522179,
       "usd": 71114796991.68617,
       "aed": 261211760830.16214,
       "ars": 8661014944927.835,
       "aud": 100843484496.4968,
       "bdt": 6660009970599.592,
       "bhd": 26801602460.63264,
       "bmd": 71114796991.68617,
       "brl": 354676871794.38043,
       "cad": 90911520833.8409,
       "chf": 70251605585.80127,
       "clp": 59197727418750.69,
       "cny": 477102061537.52484,
       "czk": 1670131007349.75,
       "dkk": 502884731186.85956,
       "eur": 67599592576.387314,
       "gbp": 57739454858.69299,
       "hkd": 558236933425.3397,
       "huf": 26910905903608.875,
       "idr": 1039339202293644.9,
       "ils": 241380688541.06122,
       "inr": 5559527261459.651,
       "jpy": 9558895437637.518,
       "krw": 90975737495524.4,
       "kwd": 21812472762.883976,
       "lkr": 25677401686629.83,
       "mmk": 131726369921173.66,
       "mxn": 1420647498839.4587,
       "myr": 312442860582.9724,
       "ngn": 29724493723002.43,
       "nok": 690814827161.0002,
       "nzd": 111596397375.6246,
       "php": 3773350559460.4893,
       "pkr": 14365188992320.607,
       "pln": 311564592840.12573,
       "rub": 4097982567362.6523,
       "sar": 266824069493.94955,
       "sek": 713224521989.0193,
       "sgd": 98699515596.7915,
       "thb": 2468328466820.227,
       "try": 1217186642350.3027,
       "twd": 2109407108367.3975,
       "uah": 2102086764509.464,
       "vef": 7120724622.7775345,
       "vnd": 1648618781259767,
       "zar": 1127796053679.724,
       "xdr": 51907757046.1867,
       "xag": 3248740826.711057,
       "xau": 38000902.92047756,
       "bits": 2478572098777.51,
       "sats": 247857209877750.97
     },
     "market_cap_percentage": {
       "btc": 45.24974888933554,
       "eth": 15.70945143739802,
       "usdt": 6.012190642552588,
       "usdc": 4.464440573607747,
       "bnb": 3.751599926420157,
       "ada": 1.6092636785352772,
       "busd": 1.4981085771900386,
       "xrp": 1.4964226912229481,
       "sol": 0.9933249047209519,
       "doge": 0.7897110072492438
     },
     "market_cap_change_percentage_24h_usd": -5.088400610620384,
     "updated_at": 1654954511
   }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
}
