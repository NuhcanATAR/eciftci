enum ProfileViewStrings {
  menuNameSurnameEditText('Ad Soyad güncelle'),
  menuEmailEditText('E-mail Adresini değiştir'),
  menuCityDistrictEditText('Şehir ve İlçe güncelle'),
  menuPhoneNumberEditText('Telefon Numaranızı değiştirin'),
  menuAccountExitText('Hesaptan Çıkış Yap'),

  exitDialogTitleText('Hesaptan Çıkış Yapma'),
  exitDialogSubTitleText(
      'Hesabınızdan çıkış yapmak istediğinize eminmisiniz, çıkış yaparsanız geri girişte bilgilerinizi girmek zorunda kalırsınız!'),

  nameInputText('Ad *'),
  surnameInputText('Soyad *'),
  nameSurnameUpdateButtonText('Ad Soyad Güncelle'),

  emilaUpdateTitleText('E-mail Adresiniz Değişmez'),
  emailUpdateSubTitleText(
      'Uygulamaya kayıtlı e-mail adresinizi değiştiremezsiniz, daha fazla bilgi için bizle iletişime geçin.'),

  cityInputText('Şehir *'),
  districtInputText('İlçe *'),
  cityDistrictUpdateButtonText('Şehir ve İlçe Güncelle'),

  phoneNumberInputText('Telefon Numarası *'),
  phoneNumberUpdateButtonText('Telefon Numarasını Güncelle');

  final String value;
  const ProfileViewStrings(this.value);
}
