# AI Job Booster 🚀

> **AI-Powered CV & Cover Letter Assistant** - Analyze your resume against any job posting, get actionable insights, and generate personalized cover letters—all powered by AI.

[![Flutter](https://img.shields.io/badge/Flutter-3.10+-02569B?logo=flutter)](https://flutter.dev)
[![Python](https://img.shields.io/badge/Python-3.10+-3776AB?logo=python)](https://www.python.org)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.109-009688?logo=fastapi)](https://fastapi.tiangolo.com)
[![OpenAI](https://img.shields.io/badge/OpenAI-GPT--4o--mini-412991?logo=openai)](https://openai.com)

A full-stack mobile application that helps job seekers optimize their applications by providing AI-powered analysis and personalized cover letter generation. Built with Flutter (frontend) and Python FastAPI (backend), demonstrating clean architecture, AI integration, and modern mobile development practices.

---

## 📋 Table of Contents

- [Features](#-features)
- [Screenshots](#-screenshots)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [API Documentation](#-api-documentation)
- [Configuration](#-configuration)
- [Usage Guide](#-usage-guide)
- [Troubleshooting](#-troubleshooting)
- [Future Enhancements](#-future-enhancements)
- [Learning Journey](#-learning-journey)
- [Contributing](#-contributing)
- [License](#-license)

---

## ✨ Features

### Core Functionality
- **📊 CV Analysis**: Instantly analyze how well your CV matches any job posting
- **🎯 Match Score**: Get a percentage score (0-100%) with color-coded feedback
- **💪 Strengths Identification**: Discover what makes you a strong candidate
- **📈 Improvement Areas**: Get specific, actionable feedback on gaps
- **⚠️ Missing Skills**: See exactly what skills you need to develop
- **✍️ Cover Letter Generation**: Generate personalized, professional cover letters
- **📋 One-Click Copy**: Copy generated cover letters to clipboard instantly

### User Experience
- **🎨 Modern UI**: Material Design 3 with beautiful gradients and animations
- **📱 Mobile-First**: Optimized for mobile devices with responsive design
- **⚡ Fast & Responsive**: Lightweight frontend, heavy processing on backend
- **🔄 Smart Caching**: CV and job content cached for seamless cover letter generation
- **💬 Clear Feedback**: User-friendly error messages and loading states

---

## 🖼️ Screenshots

*Note: Add screenshots of your app here*

- Home screen with CV input and job URL
- Analysis results with match score
- Cover letter generation screen

---

## 🏗️ Tech Stack

### Frontend
- **Flutter 3.10+** - Cross-platform mobile framework
- **Provider 6.1.1** - State management
- **Material Design 3** - Modern UI components
- **http 1.2.0** - HTTP client for API calls
- **flutter_markdown 0.7.7+1** - Markdown rendering for cover letters
- **file_picker 10.3.7** - File selection (future: PDF parsing)

### Backend
- **Python 3.10+** - Programming language
- **FastAPI 0.109.0** - Modern, fast web framework
- **Uvicorn 0.27.0** - ASGI server
- **OpenAI 1.12.0** - GPT-4o-mini for AI analysis
- **BeautifulSoup4 4.12.3** - Web scraping
- **Requests 2.31.0** - HTTP library
- **Pydantic 2.5.3** - Data validation
- **python-dotenv 1.0.0** - Environment variable management

### Architecture Patterns
- **Clean Architecture** - Separation of concerns (core, data, presentation)
- **Repository Pattern** - Data layer abstraction
- **Provider Pattern** - State management
- **RESTful API** - Backend API design

---

## 🏛️ Architecture

### System Overview

```
┌─────────────────┐
│  Flutter App    │  (Mobile UI - Presentation Layer)
│  (Dart)         │
└────────┬────────┘
         │ HTTP/JSON
         ▼
┌─────────────────┐
│  FastAPI Server │  (Backend - Business Logic)
│  (Python)       │
└────────┬────────┘
    ┌────┴────┐
    │         │
    ▼         ▼
┌────────┐ ┌──────────┐
│Scraper │ │  OpenAI  │
│(BS4)   │ │  API     │
└────────┘ └──────────┘
```

### Frontend Architecture (Clean Architecture)

```
lib/
├── core/
│   └── constants/
│       └── api_constants.dart      # API endpoints & configuration
├── data/
│   ├── datasources/
│   │   └── job_api.dart            # HTTP client (data source)
│   ├── models/
│   │   ├── job_analysis_model.dart  # Analysis data model
│   │   └── cover_letter_model.dart  # Cover letter data model
│   └── repositories/
│       └── job_repository.dart      # Data layer boundary
└── presentation/
    ├── providers/
    │   └── job_provider.dart       # State management (Provider)
    └── screens/
        ├── home_screen.dart         # Input screen
        ├── analysis_result_screen.dart  # Results display
        └── cover_letter_screen.dart     # Cover letter display
```

**Layer Responsibilities**:
- **Core**: Shared constants and utilities
- **Data**: API calls, models, data transformation
- **Presentation**: UI, state management, user interaction

### Backend Architecture

```
backend/
├── app.py              # FastAPI application & endpoints
├── scraper.py          # Web scraping utilities
├── requirements.txt    # Python dependencies
└── .env               # Environment variables (not in repo)
```

**Key Components**:
- **FastAPI App**: Three main endpoints for analysis, cover letter, and job fetching
- **Scraper Module**: Handles web scraping with BeautifulSoup
- **OpenAI Integration**: Structured prompts for analysis and generation

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** 3.10 or higher ([Install Flutter](https://docs.flutter.dev/get-started/install))
- **Python 3.10+** ([Install Python](https://www.python.org/downloads/))
- **OpenAI API Key** ([Get API Key](https://platform.openai.com/api-keys))
- **Git** (for cloning the repository)

### Installation

#### 1. Clone the Repository

```bash
git clone <repository-url>
cd ai_job_booster
```

#### 2. Backend Setup

```bash
# Navigate to backend directory
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On macOS/Linux:
source venv/bin/activate
# On Windows:
venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Create .env file
# Copy the example (if exists) or create new:
echo "OPENAI_API_KEY=your_api_key_here" > .env
echo "PORT=8000" >> .env

# Edit .env and add your OpenAI API key
# OPENAI_API_KEY=sk-proj-...
# PORT=8000
```

#### 3. Start the Backend Server

```bash
# Option 1: Using Python directly
python app.py

# Option 2: Using Uvicorn (recommended for development)
uvicorn app:app --reload --port 8000
```

The API will be available at `http://localhost:8000`

**Verify Backend is Running**:
- Open `http://localhost:8000` in browser (should see API info)
- Open `http://localhost:8000/docs` for interactive API documentation (Swagger UI)

#### 4. Frontend Setup

```bash
# Navigate to Flutter project root
cd ai_job_booster  # (if not already there)

# Install Flutter dependencies
flutter pub get

# Configure API URL
# Edit lib/core/constants/api_constants.dart
# Set baseUrl based on your testing environment:
```

**API URL Configuration**:

```dart
// lib/core/constants/api_constants.dart
class ApiConstants {
  // For Android emulator:
  static const String baseUrl = 'http://10.0.2.2:8000';
  
  // For iOS simulator:
  // static const String baseUrl = 'http://127.0.0.1:8000';
  
  // For physical device (same network):
  // static const String baseUrl = 'http://192.168.1.XXX:8000';
  // Replace XXX with your computer's LAN IP address
}
```

**Finding Your LAN IP**:
- **macOS/Linux**: Run `ifconfig` or `ip addr` and look for your network interface IP
- **Windows**: Run `ipconfig` and look for IPv4 Address

#### 5. Run the Flutter App

```bash
# List available devices
flutter devices

# Run on specific device
flutter run

# Or run on specific device
flutter run -d <device-id>
```

---

## 📁 Project Structure

```
ai_job_booster/
├── lib/
│   ├── core/
│   │   └── constants/
│   │       └── api_constants.dart      # API configuration
│   ├── data/
│   │   ├── datasources/
│   │   │   └── job_api.dart            # HTTP client
│   │   ├── models/
│   │   │   ├── job_analysis_model.dart # Analysis DTO
│   │   │   └── cover_letter_model.dart # Cover letter DTO
│   │   └── repositories/
│   │       └── job_repository.dart     # Repository pattern
│   └── presentation/
│       ├── providers/
│       │   └── job_provider.dart       # State management
│       └── screens/
│           ├── home_screen.dart         # Main input screen
│           ├── analysis_result_screen.dart
│           └── cover_letter_screen.dart
├── backend/
│   ├── app.py                          # FastAPI application
│   ├── scraper.py                      # Web scraping
│   ├── requirements.txt               # Python dependencies
│   └── .env                           # Environment variables (gitignored)
├── README.md                          # This file
├── PROJECT_ARTICLE.md                 # Detailed technical article
└── pubspec.yaml                       # Flutter dependencies
```

---

## 📡 API Documentation

### Base URL
- Development: `http://localhost:8000`
- Interactive Docs: `http://localhost:8000/docs` (Swagger UI)

### Endpoints

#### 1. Analyze Job Match

**POST** `/api/analyze-job`

Analyzes CV content against a job posting URL and returns match analysis.

**Request Body**:
```json
{
  "cv_content": "Your CV text here...",
  "job_posting_url": "https://linkedin.com/jobs/view/..."
}
```

**Response**:
```json
{
  "job_content": "Job posting preview...",
  "analysis": {
    "match_percentage": 75.5,
    "strengths": [
      "Strong experience in Python",
      "Relevant project portfolio"
    ],
    "improvements": [
      "Add more cloud experience",
      "Highlight leadership skills"
    ],
    "missing_skills": [
      "AWS",
      "Docker"
    ],
    "summary": "Overall strong match with minor gaps..."
  }
}
```

#### 2. Generate Cover Letter

**POST** `/api/generate-cover-letter`

Generates a personalized cover letter based on CV and job posting.

**Request Body**:
```json
{
  "cv_content": "Your CV text...",
  "job_posting_content": "Job posting text...",
  "match_percentage": 75.5
}
```

**Response**:
```json
{
  "cover_letter": "Dear Hiring Manager,\n\nI am writing to express..."
}
```

#### 3. Fetch Job Posting

**POST** `/api/fetch-job-posting`

Fetches and returns job posting content from a URL.

**Request Body**:
```json
{
  "url": "https://linkedin.com/jobs/view/..."
}
```

**Response**:
```json
{
  "content": "Job posting full text...",
  "url": "https://linkedin.com/jobs/view/..."
}
```

---

## ⚙️ Configuration

### Backend Configuration

**Environment Variables** (`.env` file):

```env
OPENAI_API_KEY=sk-proj-your-key-here
PORT=8000
```

**Important Notes**:
- Never commit `.env` file to version control
- Keep your API key secure
- Default port is 8000 (change if needed)

### Frontend Configuration

**API Constants** (`lib/core/constants/api_constants.dart`):

```dart
class ApiConstants {
  // Change based on your testing environment
  static const String baseUrl = 'http://10.0.2.2:8000';  // Android emulator
  // static const String baseUrl = 'http://127.0.0.1:8000';  // iOS simulator
  // static const String baseUrl = 'http://192.168.1.100:8000';  // Physical device
}
```

---

## 📱 Usage Guide

### Step-by-Step Workflow

1. **Start Backend**
   - Navigate to `backend/` directory
   - Activate virtual environment
   - Run `python app.py` or `uvicorn app:app --reload`

2. **Start Flutter App**
   - Ensure backend is running
   - Run `flutter run` on your device/emulator

3. **Analyze a Job**
   - Paste your CV content in the text field
   - Paste a job posting URL (LinkedIn, Indeed, etc.)
   - Tap "Analyze & Match" button
   - Wait for analysis (usually 5-10 seconds)

4. **Review Results**
   - View match percentage (color-coded)
   - Read strengths and improvement areas
   - Check missing skills list

5. **Generate Cover Letter**
   - Tap "Generate Cover Letter" button
   - Wait for generation (usually 5-10 seconds)
   - Review the generated letter
   - Tap copy icon to copy to clipboard

### Tips for Best Results

- **CV Content**: Paste full CV text, including skills, experience, and education
- **Job URLs**: Use public job postings (LinkedIn public posts work best)
- **Match Score**: 70%+ is excellent, 50-69% is good, below 50% needs improvement
- **Cover Letters**: Review and edit generated letters before sending

---

## 🔧 Troubleshooting

### Common Issues

#### Backend Issues

**Problem**: `ModuleNotFoundError: No module named 'fastapi'`
- **Solution**: Ensure virtual environment is activated and dependencies are installed
  ```bash
  source venv/bin/activate  # or venv\Scripts\activate on Windows
  pip install -r requirements.txt
  ```

**Problem**: `OPENAI_API_KEY not found`
- **Solution**: Create `.env` file in `backend/` directory with your API key
  ```bash
  echo "OPENAI_API_KEY=sk-proj-your-key" > backend/.env
  ```

**Problem**: `Port 8000 already in use`
- **Solution**: Change port in `.env` file or kill the process using port 8000
  ```bash
  # Find process
  lsof -i :8000  # macOS/Linux
  netstat -ano | findstr :8000  # Windows
  
  # Kill process or change PORT in .env
  ```

#### Frontend Issues

**Problem**: `Connection refused` error
- **Solution**: Check API URL configuration in `api_constants.dart`
  - Android emulator: `http://10.0.2.2:8000`
  - iOS simulator: `http://127.0.0.1:8000`
  - Physical device: Your computer's LAN IP
  - Ensure backend is running

**Problem**: `CORS error` in browser console
- **Solution**: Backend CORS is configured, but ensure backend is running and URL is correct

**Problem**: `Failed to analyze job: 400`
- **Solution**: Check that job URL is accessible and public. Some sites block scraping.

**Problem**: App crashes on analysis
- **Solution**: Check that CV content is not empty and job URL is valid

### Debug Mode

**Backend**:
```bash
# Run with auto-reload for development
uvicorn app:app --reload --port 8000 --log-level debug
```

**Flutter**:
```bash
# Run with verbose logging
flutter run --verbose
```

---

## 🚀 Future Enhancements

### Short-Term (Planned)
- [ ] PDF/DOCX CV parsing
- [ ] Cover letter templates (formal, casual, creative)
- [ ] Analysis history (save previous analyses)
- [ ] Export cover letters as PDF
- [ ] Better error messages and validation

### Medium-Term (Ideas)
- [ ] Multi-language support
- [ ] Advanced scraping (Selenium/Playwright for JS-heavy sites)
- [ ] CV templates and suggestions
- [ ] A/B testing for cover letters (multiple variations)
- [ ] Offline mode with local storage

### Long-Term (Vision)
- [ ] Job recommendations based on CV
- [ ] Interview question generator
- [ ] Salary insights and expectations
- [ ] Career path suggestions
- [ ] Integration with job boards

---

## 📚 Learning Journey

This project represents a learning journey from Flutter-only development to full-stack engineering. Key learnings include:

- **Backend Development**: First Python FastAPI backend
- **API Design**: RESTful endpoints, request/response models
- **Integration**: Connecting mobile apps to backend servers
- **AI Integration**: Practical LLM usage with OpenAI
- **Web Scraping**: BeautifulSoup for job posting extraction
- **Clean Architecture**: Applied to full-stack application
- **CORS & Networking**: Understanding cross-origin requests
- **Error Handling**: User-friendly error messages

For a detailed technical article covering the entire development process, challenges, and solutions, see [PROJECT_ARTICLE.md](./PROJECT_ARTICLE.md).

---

## 🤝 Contributing

Contributions are welcome! This is an educational project, so feel free to:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

**Areas for Contribution**:
- PDF parsing implementation
- Better error handling
- UI/UX improvements
- Additional features
- Documentation improvements
- Bug fixes

---

## 📄 License

This project is for educational purposes. Feel free to use it as a learning resource, build upon it, and create something amazing.

**Note**: This project was built as part of the LLM Engineering course (Week 1). It demonstrates how foundational concepts (web scraping, LLM calls, prompt engineering) can be transformed into a real, useful application.

---

## 🙏 Acknowledgments

- **LLM Engineering Course** - Week 1 concepts that inspired this project
- **FastAPI** - Excellent documentation and framework
- **Flutter Team** - Amazing mobile framework
- **OpenAI** - Powerful AI capabilities
- **BeautifulSoup** - Simple and effective web scraping

---

## 📞 Support

If you encounter issues or have questions:

1. Check the [Troubleshooting](#-troubleshooting) section
2. Read the detailed [PROJECT_ARTICLE.md](./PROJECT_ARTICLE.md)
3. Review the code comments (they're extensive!)
4. Open an issue on GitHub

---

## ⭐ Show Your Support

If this project helped you learn or build something, consider giving it a star! It helps others discover the project.

---

**Built with ❤️ using Flutter, Python, and AI**

*From mobile developer to full-stack engineer—one project at a time.*
