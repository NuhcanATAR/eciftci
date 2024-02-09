enum EquipmentCategoryViewStrings {
  createTitleText('Ekipman ve Malzeme Kategorisi Oluşturun!'),
  createSubTitleText(
      'Ekipman ve Malzeme Kategorisi oluşturarak kendinize özel ekipman kategorileri oluşturabilirsiniz.'),

  categoryNameInputText('Kategori Adı *'),

  createDialogTitleText('Kategoriyi Kaydetmek İstediğinize Eminmisiniz?'),
  createDialogSubTitleText(
      'Kategori kaydederseniz eğer geri kaldıramazsınız buna rağmen kaydetmek istiyormusunuz?'),

  saveButtonText('Kategoriyi Kaydet'),
  updateButtonText('Kategoriyi Güncelle'),

  categoryListErrorTitleText('Ekipman Kategorisi Yüklenmedi!'),
  categoryListErrorSubTitleText(
      'Ekipman Kategorisi yüklenirken hata oluştu daha sonra tekrar deneyiniz.');

  final String value;
  const EquipmentCategoryViewStrings(this.value);
}
