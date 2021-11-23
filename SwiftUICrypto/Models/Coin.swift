//
//  Coin.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 11/18/21.
//

import Foundation

// CoinGecko API Info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page1&sparkline=true&price_change_percentage=24h
 */

/*
 [
   {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 56961,
     "market_cap": 1078510980663,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1199799259099,
     "total_volume": 41071848968,
     "high_24h": 61237,
     "low_24h": 57133,
     "price_change_24h": -3273.140968968968,
     "price_change_percentage_24h": -5.43406,
     "market_cap_change_24h": -58238187256.63159,
     "market_cap_change_percentage_24h": -5.12322,
     "circulating_supply": 18877100,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -16.53402,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 84887.08264,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2021-11-18T22:53:41.058Z",
     "sparkline_in_7d": {
       "price": [
         65040.88104363001,
         65330.30933969824,
         65161.477708954255,
         65265.1121661448,
         65419.41141574062,
         64947.21819057796,
         65142.210102887424,
         65746.73956969603,
         65310.31990091317,
         65046.09775664769,
         65250.130412877836,
         64995.99929978834,
         64916.50713646828,
         64666.70495576598,
         65243.879252899154,
         64305.540117112476,
         64037.55678720265,
         63960.6487081776,
         64074.852385746606,
         64461.78770291081,
         63673.617395471614,
         63601.268441021675,
         63091.01059319875,
         63664.04689332009,
         64075.04998841115,
         64103.870010127954,
         64313.115969074905,
         64341.15804940664,
         64111.22781164685,
         64432.04794734522,
         64528.481713868576,
         64158.79882792767,
         64044.893804904685,
         64037.439352859146,
         63920.034836012834,
         63816.78934774921,
         63988.0515277715,
         64141.89793482077,
         64018.83642142079,
         63691.40314718218,
         63838.35372805033,
         63744.656477209624,
         63798.504488807695,
         63708.81601422374,
         64847.3634081264,
         64991.705536404064,
         64939.679887828795,
         64809.98545746471,
         64318.50974136553,
         64173.623907350535,
         64553.83791077381,
         64471.931312580025,
         64521.64887531047,
         64660.33535267343,
         65219.4830332113,
         64924.80152409708,
         64877.70494048529,
         64859.405867484864,
         64992.664375403896,
         64941.4746189243,
         64985.69935792312,
         64872.392807380726,
         64552.2586412053,
         64464.31405204806,
         64649.88259211724,
         64637.48558875219,
         64846.234779693914,
         64882.72708946906,
         64418.04901512429,
         64382.234299135795,
         63874.891513550705,
         64437.226342290676,
         64095.594918662646,
         64216.75532501951,
         64348.99963334829,
         64599.94250518817,
         64763.01284481214,
         65648.97779110243,
         66136.91246118222,
         66048.93559945014,
         65858.64308243476,
         65895.01872382086,
         65908.67959365404,
         65907.61314498713,
         65902.73668068614,
         65721.48842345788,
         65957.70288320165,
         66097.89726752994,
         66054.39600942818,
         65903.45576024672,
         65881.43482922636,
         65607.0871628345,
         65083.05923377397,
         64631.56904086273,
         64282.84963072226,
         64407.25780331131,
         63991.944473539064,
         64442.26594128704,
         64090.10247219344,
         64241.511397600945,
         64069.39325069164,
         63933.835442599324,
         63062.37966247905,
         62538.56998411904,
         61996.30795984991,
         61018.843342979875,
         61485.49432307213,
         61237.78015781398,
         60857.95585111462,
         60851.27957028375,
         61213.37594537302,
         60550.28649560303,
         60335.052943455375,
         60555.35407956122,
         60432.75620288849,
         60814.15866748995,
         61535.73093991336,
         60955.135137956466,
         60884.74959755211,
         60771.018595568996,
         60358.1689102862,
         60036.569017704765,
         59490.626899509116,
         60557.45155913346,
         60885.079624209946,
         60398.826068911396,
         59939.98261632082,
         59399.684263186486,
         59633.730077770924,
         59597.52017930507,
         59416.94117230693,
         59843.37383697803,
         59811.2358535871,
         60303.437667821025,
         59823.799339638565,
         59359.16519044653,
         60535.02331202257,
         60781.3328086338,
         60778.27443406724,
         60436.84265725278,
         59981.97447835297,
         59914.44577360263,
         60473.23528703941,
         60467.81227876397,
         60800.02195741346,
         60517.90172109344,
         60721.425416678416,
         60207.59035049635,
         60292.32561401822,
         60613.39049373961,
         60740.89088234443,
         60854.326333077595,
         60982.71569369057,
         60177.408383746995,
         60203.49556046677,
         59812.14377578161,
         60034.664623488425,
         60149.10358285096,
         59861.16898371055,
         59714.262341218826,
         60257.32737084914,
         59720.656936255444,
         59195.824876035615,
         59291.79490635646,
         58941.76853954497,
         58524.929863627876,
         57668.20812585506,
         57800.33266701027
       ]
     },
     "price_change_percentage_24h_in_currency": -5.434062693545515
   },
 */

class Coin {
    let id: String
    let symbol: String
}