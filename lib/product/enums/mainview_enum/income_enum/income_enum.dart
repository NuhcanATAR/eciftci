enum IncomeViewStrings {
  noIncomeListTitleText('Henüz Gelir Oluşturmadınız!'),
  noIncomeListSubTitleText(
      'Henüz gelir kaydetmediniz isterseniz gelir kaydetmeye başlayabilirsiniz.'),

  errorIncomeListTitleText('Gelir Yüklenemedi!'),
  errorIncomeListSubTitleText(
      'Gelirleriniz yüklenirken bir hata oluştu, daha sonra tekrar deneyiniz.'),

  incomeCategoryInputText('Gelir Kategorisi *'),
  incomeTitleInputText('Gelir başlık *'),
  incomeExplanationInputText('Açıklama (isteğe bağlı)'),
  incomeValueInputText('Gelir Değeri'),
  incomeSavedButtonText('Geliri Kaydet'),

  incomeFilterCategoryMenuText('Gelir Kategorisi'),
  incomeFilterYearMenuText('Yıl Seçimi'),

  filterListErrorTitleText('Filtrleme Hatası'),
  filterListErrorSubTitleText(
      'Filtreleme sonuçlarınızı görüntülerken hata oluştu, daha sonra tekrar deneyiniz.'),
  filterListNoTitleText('Uygun Sonuç Bulunamadı!'),
  filterListNoSubTitleText(
      'Filtreleme sonucunuza göre uygun gelir bulunamadı.');

  final String value;
  const IncomeViewStrings(this.value);
}
