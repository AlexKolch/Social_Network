
import Foundation

struct DataPhoto {
    static let shared = DataPhoto()

    private init () {}
    //из сети
    let urlImages: [String] = [
        "https://cdnn1.ukraina.ru/img/07e6/0c/02/1041436899_0:206:2905:1840_1280x0_80_0_0_2e27b1a255208559105c5380bee0810b.jpg",
        "https://img.kanal-o.ru/img/2020-06-29/fmt_81_24_shutterstock_547953349.jpg",
        "https://api.rbsmi.ru/attachments/83e29ebdbbb7a7ec28adacead486606c93473fcc/store/crop/0/0/1000/775/1600/0/0/913437240a1af58adf331e5e359bbbca3913d1bb933547c840eb904c9693/9547a490e64a46044ddbf0005e674cff.jpg",
        "https://n1s1.hsmedia.ru/c4/b6/5f/c4b65f949f5aebd8c1248b13265d68b3/728x486_1_93c15f59aa398ceb091fc5f6e5095488@5000x3337_0xac120003_7370101621665656889.jpeg"
       ]

    let photos = [
        "p1",
        "p2",
        "p3",
        "p4"
    ]
}
