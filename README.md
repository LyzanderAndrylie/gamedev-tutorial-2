# Tutorial 2 - Game Development 2023/2024

> Godot Version: 3.5.3

## Latihan: Playtest

Sekarang coba gerakkan objek landasan ke atas sehingga objek pesawatnya hampir menyentuh batas atas area permainan/window. Kemudian jawablah pertanyaan-pertanyaan berikut:

1. Apa saja pesan log yang dicetak pada panel Output?

    Pesan log yang dicetak adalah sebagai berikut.

    ```text
    Platform initialized
    Reached objective!
    ```

2. Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?

    Pesang log yang dicetak adalah sebagai berikut.

    ```text
    Reached objective!
    ```

3. Buka scene `MainLevel` dengan tampilan workspace 2D. Apakah lokasi scene `ObjectiveArea` memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?

    Ya, lokasi scene `ObjectiveArea` memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya. Hal ini dikarenakan, ketika scene `BlueShip` menyentuh lokasi scene `ObjectiveArea`, pesan log `Reached objective!` dicetak pada panel Output. Lebih detail lagi, kita dapat melihat implementasinya pada `ObjectiveArea.gd` dari kode berikut.

    ```text
    extends Area2D

    func _on_ObjectiveArea_body_entered(body: RigidBody2D):
        if (body.name == "BlueShip"):
            print("Reached objective!")
    ```

    Signal `body_entered` akan dipancarkan ketika scene `BlueShip` memasuki area `ObjectiveArea` yang merupakan `Area2D`. Ketika signal tersebut dipancarkan, maka event handler `_on_ObjectiveArea_body_entered(body: RigidBody2D)` akan dipanggil yang menyebabkan kode `print("Reached objective!")` dijalankan dan mencetak pesan log `Reached objective!` pada panel Output.
