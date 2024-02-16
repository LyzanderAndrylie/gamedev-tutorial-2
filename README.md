# Tutorial 2 - Game Development 2023/2024

> Godot Version: 3.5.3

## Latihan: Playtest

Sekarang coba gerakkan objek landasan ke atas sehingga objek pesawatnya hampir menyentuh batas atas area permainan/window. Kemudian jawablah pertanyaan-pertanyaan berikut:

- Apa saja pesan log yang dicetak pada panel Output?

    Pesan log yang dicetak adalah sebagai berikut.

    ```text
    Platform initialized
    Reached objective!
    ```

- Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?

    Pesang log yang dicetak adalah sebagai berikut.

    ```text
    Reached objective!
    ```

- Buka scene `MainLevel` dengan tampilan workspace 2D. Apakah lokasi scene `ObjectiveArea` memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?

    Ya, lokasi scene `ObjectiveArea` memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya. Hal ini dikarenakan, ketika scene `BlueShip` menyentuh lokasi scene `ObjectiveArea`, pesan log `Reached objective!` dicetak pada panel Output. Lebih detail lagi, kita dapat melihat implementasinya pada `ObjectiveArea.gd` dari kode berikut.

    ```text
    extends Area2D

    func _on_ObjectiveArea_body_entered(body: RigidBody2D):
        if (body.name == "BlueShip"):
            print("Reached objective!")
    ```

    Signal `body_entered` akan dipancarkan ketika scene `BlueShip` memasuki area `ObjectiveArea` yang merupakan `Area2D`. Ketika signal tersebut dipancarkan, maka event handler `_on_ObjectiveArea_body_entered(body: RigidBody2D)` akan dipanggil yang menyebabkan kode `print("Reached objective!")` dijalankan dan mencetak pesan log `Reached objective!` pada panel Output.

## Latihan: Memanipulasi Node dan Scene

Sekarang coba kamu inspeksi _scene_-_scene_ pada contoh proyek tutorial 2
dan jawablah pertanyaan-pertanyaan berikut:

- _Scene_ `BlueShip` dan `StonePlatform` sama-sama memiliki sebuah _child node_ bertipe `Sprite`. Apa fungsi dari _node_ bertipe `Sprite`?

    Fungsi dari _node_ bertipe `Sprite` adalah  untuk merepresentasikan tekstur 2D berupa gambar pada folder `assets`, yaitu `playerShip1_blue.png` untuk _Scene_ `BlueShip` dan `stone.png` untuk scene `StonePlatform`.

- _Root node_ dari _scene_ `BlueShip` dan `StonePlatform` menggunakan tipe yang berbeda. `BlueShip` menggunakan tipe `RigidBody2D`, sedangkan `StonePlatform` menggunakan tipe `StaticBody2D`. Apa perbedaan dari masing-masing tipe _node_?

    Tipe node `RigidBody2D` mengimplementasikan simulasi fisika 2D. Melalui simulasi fisika, kita dapat menerapkan gaya (*force*) sedemikian hingga simulasi fisika akan menghitung dampak pergerakan yang terjadi berdasarkan karakteristik fisika, seperti massa dan hambatan, ketika suatu gaya diterapkan.

    Tipe Node `StaticBody2D` tidak bergerakan berdasarkan *physics engine* (tidak bergerak ketika terjadi *collision* ataupun ketika gaya diterapkan). Hal ini dikarenakan tipe node `StaticBody2D` bertujuan untuk digunakan pada objek yang merupakan bagian dari *environment*.

- Ubah nilai atribut `Mass` dan `Weight` pada tipe `RigidBody2D` secara bebas di _scene_ `BlueShip`, lalu coba jalankan _scene_ `MainLevel`. Apa yang terjadi?

    Ketika kita mengubah nilai atribut `Mass` dan `Weight` pada tipe `RigidBody2D` di _scene_ `BlueShip`, maka karakteristik fisika dari _scene_ `BlueShip` akan berubah. Namun, tidak ada perubahan ketika _scene_ `MainLevel` dijalankan karena kita hanya menggubah `Mass` dan `Weight` dari  _scene_ `BlueShip` saja. Hal ini dikarenakan, berdasarkan sifat fisika dan simulasi fisika yang dapat dilihat pada game, kecepatan pada gerak jatuh bebas hanya dipengaruhi oleh gravitasi dan ketinggian ($v_t = \sqrt{2gh}$ dengan $v_t$ adalah kecepatan saat t sekon (m/s), $g$ adalah gaya gravitas, dan $h$ adalah ketinggian).

- Ubah nilai atribut `Disabled` pada tipe `CollisionShape2D` di _scene_ `StonePlatform`, lalu coba jalankan _scene_ `MainLevel`. Apa yang terjadi?

    Ketika nilai nilai atribut `Disabled` berupa True pada tipe `CollisionShape2D`, efek yang terjadi adalah _scene_ `StonePlatform` tidak bisa bertabrakan dengan objek lain dan tidak memiliki efek apapun pada dunia game tersebut. Hal ini ditunjukkan, ketika _scene_ `MainLevel` dijalankan, _scene_ `BlueShip` tembus terhadap _scene_ `StonePlatform`.

- Pada _scene_ `MainLevel`, coba manipulasi atribut `Position`, `Rotation`, dan `Scale` milik _node_ `BlueShip` secara bebas. Apa yang terjadi pada visualisasi `BlueShip` di Viewport?

    Yang terjadi pada visualisasi `BlueShip` di Viewport adalah perubahan letak pada sumbu x dan y, kemiringan, dan perbesaran dari _node_ `BlueShip` sesuai dengan perubahan yang dilakukan.

- Pada _scene_ `MainLevel`, perhatikan nilai atribut `Position` _node_ `PlatformBlue`, `StonePlatform`, dan `StonePlatform2`. Mengapa nilai `Position` _node_ `StonePlatform` dan `StonePlatform2` tidak sesuai dengan posisinya di dalam _scene_ (menurut Inspector) namun visualisasinya berada di posisi yang tepat?

    Hal ini dikarenakan nilai atribut `Position` relatif terhadap _node parent_. Dalam hal di atas, nilai `Position` _node_ `StonePlatform` dan `StonePlatform2` relatif terhadap posisi _node_ `PlatformBlue` yang berposisi pada x = 35 dan y = 565 relatif terhadap _scene_ `MainLevel`. Dengan demikian, informasi yang ditampilkan oleh inspector tepat.
