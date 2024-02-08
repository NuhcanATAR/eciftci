enum EquipmentViewStrings {
  equipmentCategoryInputText('Ekipman Kategorisi *'),
  equipmentTitleInputText('Ekipman Başlık *'),
  equipmentExplanationInputText('Ekipman Açıklama *'),
  equipmentStatusInputText('Ekipman Durumu *'),
  equipmentLocationCityInputText('Ekipman Bulunduğu Şehir *'),
  equipmentSaveButtonText('Ekipmanı Kaydet'),

  equipmentDetailSMButtonText('Servis ve Bakım Bilgileri'),
  equipmentDetailEditButtonText('Ekipmanı Güncelle'),
  equipmentDetailDeleteButtonText('Ekipmanı Kaldır'),

  equipmentDeleteDialogTitleText('Ekipmanı Kaldırmak İstiyormusunuz?'),
  equipmentDeleteDialogSubTitleText(
      'Ekipmanı gerçekten kaldırmak istiyormusunuz, kaldırdıktan sonra işlem geri alınamaz!'),

  equipmentUpdateButtonText('Ekipmanı Güncelle');

  final String value;
  const EquipmentViewStrings(this.value);
}
