enum IncomeCategoryViewStrings {
  createIncomeTitleText('Gelir Kategorisi Oluşturun'),
  createIncomeSubTitleText(
      'Gelir kategorilerinizi kendinize özel kategoriler haline getirebilirsiniz.'),

  incomecategoryInputText('Gelir Kategoriniz *'),
  goescategoryInputText('Gider Kategoriniz *'),

  savedCategoryButton('Kategoriyi Kaydet'),

  dialogTitleText('Kategoriyi Kaydetmek istediğinize eminmisiniz?'),
  dialogSubTitleText(
      'Kategoriyi kaydettikten sonra kategoriyi silemezsiniz kaydetmek istediğinize eminmisiniz?'),

  listIncomeErrorTitleText('Gelir Kategorileri Yüklenemedi!'),
  listIncomeErrorSubTitleText(
      'Gelir kategorileriniz yüklenirken bir sorun oluştu, lütfen daha sonra tekrar deneyiniz.'),
  listIncomeNoTitleText('Gelir Kategoriniz Bulunmamaktadır!'),
  listIncomeNoSubTitleText(
      'Henüz gelir kategorisi oluşturmadınız, gelir kategorisi oluşturmaya başlayın.'),

  updateIncomeTitleText('Gelir Kategorinizi Güncelleyin'),
  updateIncomeSubTitleText('Gelir Kategorinizi güncelleyebilirsiniz.'),
  updateCategoryButtonText('Kategoriyi Güncelle');

  final String value;
  const IncomeCategoryViewStrings(this.value);
}
