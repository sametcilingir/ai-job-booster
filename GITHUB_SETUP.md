# GitHub Repository Setup Guide

## 🚀 GitHub'a Yükleme Adımları

### 1. GitHub'da Yeni Repository Oluştur

1. GitHub.com'a git ve giriş yap
2. Sağ üstteki **"+"** butonuna tıkla → **"New repository"**
3. Repository bilgilerini doldur:
   - **Repository name**: `ai-job-booster` (veya istediğin isim)
   - **Description**: `AI-powered CV & Cover Letter Assistant - Flutter + Python FastAPI`
   - **Visibility**: ✅ **Public** seç
   - **Initialize repository**: ❌ **BOŞ BIRAK** (README, .gitignore, license ekleme)
4. **"Create repository"** butonuna tıkla

### 2. Local Repository'yi GitHub'a Bağla

Terminal'de şu komutları çalıştır:

```bash
cd /Users/sametcilingir/Developer/llm_engineering/ai_job_booster

# GitHub'dan aldığın URL'i kullan (örnek: https://github.com/kullaniciadi/ai-job-booster.git)
git remote add origin https://github.com/KULLANICI_ADIN/REPO_ADI.git

# Branch'i kontrol et
git branch -M main

# İlk push
git push -u origin main
```

**Not**: `KULLANICI_ADIN` ve `REPO_ADI` kısımlarını kendi bilgilerinle değiştir!

### 3. GitHub Credentials

İlk push'ta GitHub kullanıcı adı ve şifre (veya Personal Access Token) isteyebilir.

**Personal Access Token kullanmak için:**
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. "Generate new token" → "Generate new token (classic)"
3. Scopes: `repo` seç
4. Token'ı kopyala
5. Push yaparken şifre yerine bu token'ı kullan

### 4. Repository Ayarları (Opsiyonel)

GitHub'da repository'ye gidip:

1. **About** bölümüne:
   - Description ekle
   - Website URL (varsa)
   - Topics ekle: `flutter`, `python`, `fastapi`, `openai`, `ai`, `mobile-app`, `job-search`

2. **Settings** → **Pages** (eğer web sitesi host etmek istersen)

3. **Settings** → **Secrets and variables** → **Actions** (CI/CD için, şimdilik gerekli değil)

### 5. README Badge'lerini Güncelle (Opsiyonel)

README.md'deki repository URL'lerini kendi repo URL'inle değiştir.

---

## ✅ Kontrol Listesi

- [ ] GitHub'da public repository oluşturuldu
- [ ] Local repo GitHub'a bağlandı
- [ ] İlk push başarılı
- [ ] README.md görünüyor
- [ ] Tüm dosyalar yüklendi
- [ ] .env dosyası YÜKLENMEDİ (güvenlik için)
- [ ] Topics/tags eklendi

---

## 🔒 Güvenlik Kontrolü

**ÖNEMLİ**: Aşağıdaki dosyaların GitHub'a yüklenmediğinden emin ol:

```bash
# Kontrol et
git check-ignore backend/.env
git check-ignore backend/venv/
```

Eğer bu dosyalar listede görünüyorsa, `.gitignore` çalışıyor demektir ✅

---

## 📝 Sonraki Adımlar

1. **README'yi kontrol et** - GitHub'da düzgün görünüyor mu?
2. **Topics ekle** - Repository'yi keşfedilebilir yap
3. **Issues aç** - Gelecek özellikler için
4. **LICENSE ekle** - Eğer istersen (MIT, Apache, vs.)
5. **Releases oluştur** - v1.0.0 gibi

---

## 🎉 Başarılı!

Repository'n artık public ve herkes görebilir. Paylaşmak için:

- Repository URL'ini kopyala
- LinkedIn'de paylaş
- Portfolio'na ekle
- README'deki "⭐ Show Your Support" bölümü çalışacak

**İyi şanslar! 🚀**

