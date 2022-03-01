# Microsoft Teams Group Creators
Bu PowerShell betiği Kullanıcıların Microsoft Teams üzerinde takım oluşturmasını engellemeye yaramaktadır.

Öncelikle MicrosoftTeamsGroupCreators.ps1 dosyamızı açarak içerisinde düzenlemeler yapmamız gerekmektedir.

![MicrosoftTeamsGroupCreators](https://user-images.githubusercontent.com/53214224/156131875-11b785de-4661-4306-bf2e-8862f3fd2381.png)

- Yeni oluşturacağımız güvenlik grubuna bir isim verelim.(Opsiyoneldir)
- Yeni oluşturduğumuz güvenlik grubunun görünen ismini düzenliyelim.(Opsiyoneldir)
- @("Test One","Test Two") alanı içerisine Microsoft Teams üzerinde takım oluşturmaya yetkili kullanıcı isimlerini (görünen isimlerini) yazalım. (Kesinlikle yapılması gerekir.)
- Oluşturduğumuz grubun ismini girelim. Eğer opsiyonel seçeneklerde bir değişiklik yapmadıysanız olduğu gibi bırakabilirsiniz.Değişiklik yaptıysanız grup ismini yazmanız gerekmeketedir.

Betiği çalıştırmanız için yapmanız gerekenler;

- PowerShell uygulamaasını yönetici olarak çalıştırın.
- cd MicrosoftTeamsGroupCreators.ps1 indirdiğiniz dosyanın dizinini girerek enter tuşuna basın.
- ./MicrosoftTeamsGroupCreators.ps1 dosyasını çalıştırın.
- Gelen ekrana Microsoft 365 Global admin hesap bilgilerinizi girin.

![Otomatikleştirme](https://user-images.githubusercontent.com/53214224/156134375-c51bf8cf-3344-43cc-8497-696eabf5516a.png)
