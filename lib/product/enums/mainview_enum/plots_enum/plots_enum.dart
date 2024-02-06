enum PlotsViewStrings {
  activeTitleText('Aktif Arazilerim'),
  closeTitleText('Kapalı Arazilerim'),
  searchInputText('Arazileri Ara'),

  plotsListErrorTitleText('Araziler Yüklenmedi!'),
  plotsListErrorSubTitleText(
      'Arazileriniz yüklenirken bir sorun oluştu, daha sonra tekrar deneyiniz.'),

  plotsListNoTitleText('Henüz Araziniz Bulunmuyor!'),
  plotsListNoSubTitleText(
      'Henüz araziniz bulunmamakta, arazi oluşturmaya başlayın.'),

  plotsInputTitleInputText('Arazi Başlığı *'),
  plotsInputExplanationInputText('Arazi Hakkında Açıklama *'),
  plotsInputCityInputText('İl *'),
  plotsInputDistirctInputText('İlçe *'),
  plotsInputNeighborhoodVillageInputText('Mahalle-Köy'),
  plotsInputNeighborhoodNumber('Mahalle No'),
  plotsInputIslandInputText('Ada'),
  plotsInputParcelInputText('Parsel'),
  plotsInputTitleDeedAreaInputText('Tapu Alanı'),
  plotsInputQalificationInputText('Nitelik'),
  plotsInputGroundTypeInputText('Zemin Tipi'),
  plotsInputSheetInputText('Pafta'),
  plotsInputLocationInputText('Mevkii'),
  plotsSaveButtonText('Araziyi Kaydet'),
  plotsUpdateButtonText('Araziyi Güncelle'),

  createPlotsDialogTitle('Araziyi Eklemek İstiyormsunuz?'),
  createPlotsDialogSubTitle(
      'Araziniz için gerekli bilgileri kontrol ettiyseniz ekleyin.'),

  noActivePlotsListTitleText('Aktif Araziniz Bulunmamaktadır!'),
  noActivePlotsListSubTitleText(
      'Henüz aktif araziniz bulunmamakta isterseniz arazi oluşturabilirsiniz.'),

  noClosePlotsListTitleText('Kapalı Araziniz Bulunmamaktadır!'),
  noClosePlotsListSubTitleText(
      'Henüz kapalı araziniz bulunmamakta isterseniz arazi oluşturabilirsiniz.'),

  plotsFilterStatusInputText('Arazi Durumu'),
  plotsFilterCreateYearSelectInputText('Arazi Oluşturma Yılı'),

  plotsFilterNoTitleText('Filtrenize Uygun Sonuç Bulunamadı!'),
  plotsFilterNoSubTitleText(
      'Filtrenize uygun arazi bulunamadı, farklı filtreleme yapabilirsiniz.'),

  deleteDialogTitleText('Araziyi Kaldırmak İstediğinize Eminmisiniz?'),
  deleteDialogSubTitleText(
      'Araziyi kaldırmak istediğinize eminmisiniz, araziyle beraber ona bağlı notlarda kaldırılır!'),

  updateDialogTitleText('Araziyi Güncellemek İstiyormusunuz?'),
  updateDialogSubTitleText('Araziyi gerçekten güncellemek istiyormusunuz.'),

  plotsNoteTitleInputText('Not Başlığı *'),
  plotsNoteExplanationInputText('Not Açıklaması *'),
  plotsNoteFutureDateInputText('İleri Tarih Durumu'),
  plotsNoteSaveButtonText('Notu Kaydet'),
  plotsNoteUpdateButtonText('Notu Güncelle'),

  plotsNoteListErrorTitleText('Arazi Notları Yüklenmedi!'),
  plotsNoteListErrorSubTitleText(
      'Arazi Notlarınız yüklenirken bir sorun oluştu, lütfen daha sonra tekrar deneyiniz.'),
  plotsNoteListNoTitleText('Arazi Notunuz Bulunmuyor!'),
  plotsNoteListNoSubTitleText(
      'Henüz araziye ait not bulunmuyor, isterseniz araziniz için notlar oluşturabilirsiniz.');

  final String value;
  const PlotsViewStrings(this.value);
}
