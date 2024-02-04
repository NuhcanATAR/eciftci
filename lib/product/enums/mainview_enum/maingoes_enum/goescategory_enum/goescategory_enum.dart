enum GoesCategoryViewStrings {
  createGoesTitleText('Gider Kategorisi Oluşturun'),
  createGoesSubTitleText(
      'Gider kategorilerinizi kendinize özel kategoriler haline getirebilirsiniz.'),

  goescategoryInputText('Gider Kategoriniz *'),

  savedCategoryButton('Kategoriyi Kaydet'),

  dialogTitleText('Kategoriyi Kaydetmek istediğinize eminmisiniz?'),
  dialogSubTitleText(
      'Kategoriyi kaydettikten sonra kategoriyi silemezsiniz kaydetmek istediğinize eminmisiniz?'),

  listGoesErrorTitleText('Gider Kategorileri Yüklenemedi!'),
  listGoesErrorSubTitleText(
      'Gider kategorileriniz yüklenirken bir sorun oluştu, lütfen daha sonra tekrar deneyiniz.'),
  listGoesNoTitleText('Gider Kategoriniz Bulunmamaktadır!'),
  listGoesNoSubTitleText(
      'Henüz gider kategorisi oluşturmadınız, gider kategorisi oluşturmaya başlayın.'),

  updateGoesTitleText('Gider Kategorinizi Güncelleyin'),
  updateGoesSubTitleText('Gider Kategorinizi güncelleyebilirsiniz.'),
  updateCategoryButtonText('Kategoriyi Güncelle');

  final String value;
  const GoesCategoryViewStrings(this.value);
}
