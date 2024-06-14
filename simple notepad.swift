import Foundation

// Not sınıfını tanımlama
struct Memo {
    var heading: String
    var body: String
}

// Notları saklamak için dizi
var memos = [Memo]()

// Notları listeleme işlevi
func displayMemos() {
    if memos.isEmpty {
        print("Henüz hiç not eklenmemiş.")
    } else {
        print("Notlar:")
        for (index, memo) in memos.enumerated() {
            print("\(index + 1). \(memo.heading)")
        }
    }
}

// Yeni not ekleme işlevi
func createMemo() {
    print("Not başlığı:")
    guard let heading = readLine(), !heading.isEmpty else {
        print("Geçersiz başlık. Not eklenemedi.")
        return
    }
    
    print("Not içeriği:")
    guard let body = readLine(), !body.isEmpty else {
        print("Geçersiz içerik. Not eklenemedi.")
        return
    }
    
    let newMemo = Memo(heading: heading, body: body)
    memos.append(newMemo)
    print("Yeni not eklendi.")
}

// Not görüntüleme işlevi
func showMemo() {
    displayMemos()
    
    if memos.isEmpty {
        return
    }
    
    print("Görüntülemek istediğiniz notun numarasını girin:")
    if let input = readLine(), let index = Int(input), index > 0 && index <= memos.count {
        let memo = memos[index - 1]
        print("Başlık: \(memo.heading)")
        print("İçerik: \(memo.body)")
    } else {
        print("Geçersiz not numarası.")
    }
}

// Ana menüyü gösterme işlevi
func showMainMenu() {
    print("""
    Not Defteri Uygulaması
    1. Notları Listele
    2. Yeni not ekle
    3. Not görüntüle
    4. Çıkış
    Seçiminizi yapın:
    """)
}

// Ana döngü
func mainLoop() {
    var shouldExit = false
    
    while !shouldExit {
        showMainMenu()
        
        if let choice = readLine() {
            switch choice {
            case "1":
                displayMemos()
            case "2":
                createMemo()
            case "3":
                showMemo()
            case "4":
                shouldExit = true
                print("Çıkış yapılıyor...")
                print("Çıkış yapıldı.")
                
            default:
                print("Geçersiz seçim. Lütfen tekrar deneyin.")
            }
        }
    }
}

mainLoop()
