enum MaintenanceServiceViewStrings {
  listErrorTitleText('Servis ve Bakım Bilgileri Yüklenmedi'),
  listErrorSubTitleText(
      'Seris ve bakım bilgileri yüklenirken hata oluştu, lütfen daha sonra tekrar deneyiniz.'),

  listNoTitleText('Servis ve Bakım Bilgisi Bulunmamakta'),
  listNoSubTitleText(
      'Ekipmanınızın Servis ve Bakım bilginiz bulunmuyor, servis ve bakım bilgisi oluşturabilirsiniz.'),

  careDateInputText('Bakım Tarihi *'),
  maintenancePeriodInputText('Bakım Periyodu *'),
  companyNameInputText('Bakım Şirketi '),
  companyPhoneNumberInputText('Şirketin Telefon Numarası'),
  caregiverInputText('Bakan Yapan Kişi *'),
  explanationInputText('Açıklama'),
  completionStatusInputText('Tamamlanma Durumu *'),
  maintanencaServiceSaveButtonText('Servisi Kaydet'),
  maintenanceServiceUpdateButtonText('Servisi Güncelle'),

  maintenanceServiceFilterStatusInputText('Servis Durumu'),
  maintenanceServiceFilterYearInputText('Servis Yılı'),

  maintenanceServiceDetailExplanation('Açıklama'),
  maintenanceServiceDetailCareDate('Bakım Tarihi'),
  maintenanceServiceDetailPeriod('Bakım Periyodu'),
  maintenanceServiceDetailCompanyName('Şirket Adı'),
  maintenanceServiceDetailPhoneNumber('Şirket Telefon Numarası'),
  maintenanceServiceDetailCaregiver('Bakımı Yapan Kişi'),
  maintenanceServiceDetailCompletionStatus('Servis ve Bakım Durumu');

  final String value;
  const MaintenanceServiceViewStrings(this.value);
}
