enum PasswordViewStrings {
  titleText('Kullanıcı Şifrenizimi Unuttunuz?'),
  subTitleText(
      'E-Çiftçi hesabınıza kayıtlı e-mail adresinizi girerek şifrenizi yenileyebilirsiniz.'),

  emailInputText('E-mail *'),
  sendResetMailBtnText('Şifre Sıfırla'),

  sendSuccessTitleText('E-mail Adresinizi Bağlantı Gönderdik!'),
  sendSuccessSubTitleText(
      'E-mail adresinize şifrenizi yenilemeniz için bağlantı gönderdik, e-mail adresinizi kontrol ediniz.'),

  loginBtnText('Giriş Yap');

  final String value;
  const PasswordViewStrings(this.value);
}
