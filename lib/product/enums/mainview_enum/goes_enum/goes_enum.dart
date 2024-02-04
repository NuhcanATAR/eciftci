enum GoesViewStrings {
  noGoesListTitleText('Henüz Gider Oluşturmadınız!'),
  noGoesListSubTitleText(
      'Henüz gider kaydetmediniz isterseniz gider kaydetmeye başlayabilirsiniz.'),

  errorGoesListTitleText('Gider Yüklenemedi!'),
  errorGoesListSubTitleText(
      'Giderleriniz yüklenirken bir hata oluştu, daha sonra tekrar deneyiniz.'),

  goesCategoryInputText('Gider Kategorisi *'),
  goesTitleInputText('Gider başlık *'),
  goesExplanationInputText('Açıklama'),
  goesValueInputText('Gider Değeri'),
  goesSavedButtonText('Gider Kaydet'),

  goesFilterCategoryMenuText('Gider Kategorisi'),
  goesFilterYearMenuText('Yıl Seçimi'),

  filterListErrorTitleText('Filtrleme Hatası'),
  filterListErrorSubTitleText(
      'Filtreleme sonuçlarınızı görüntülerken hata oluştu, daha sonra tekrar deneyiniz.'),
  filterListNoTitleText('Uygun Sonuç Bulunamadı!'),
  filterListNoSubTitleText(
      'Filtreleme sonucunuza göre uygun gider bulunamadı.'),

  dialogGoesDeleteTitleText('Gideri Kaldırmak İstediğinize Eminmisiniz?'),
  dialogGoesDeleteSubTitleText(
      'Gideri gerçekten kaldırmak istediğinize eminmisiniz, gider kaldırıldıktan sonra geri alınamaz.'),

  goesUpdateButtonText('Gideri Güncelle');

  final String value;
  const GoesViewStrings(this.value);
}
