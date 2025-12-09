# AI Job Booster Backend (FastAPI)

FastAPI service that powers CV vs job-posting analysis and tailored cover-letter generation.

## Setup
```bash
pip install -r requirements.txt
cp .env.example .env  # add OPENAI_API_KEY, optional PORT
python app.py         # or uvicorn app:app --reload --port 8000
```

## Environment
```
OPENAI_API_KEY=your_api_key_here
PORT=8000
```

## API

### POST /api/analyze-job
Analyze CV and job URL.
Request:
```json
{
  "cv_content": "CV text...",
  "job_posting_url": "https://linkedin.com/jobs/..."
}
```
Response:
```json
{
  "job_content": "Fetched job content...",
  "analysis": {
    "match_percentage": 75.5,
    "strengths": ["Strength 1", "Strength 2"],
    "improvements": ["Improve 1", "Improve 2"],
    "missing_skills": ["Skill 1", "Skill 2"],
    "summary": "Brief summary..."
  }
}
```

### POST /api/generate-cover-letter
Create a personalized cover letter.
Request:
```json
{
  "cv_content": "CV text...",
  "job_posting_content": "Job content...",
  "match_percentage": 75.5
}
```
Response:
```json
{
  "cover_letter": "Cover letter text..."
}
```

### POST /api/fetch-job-posting
Fetch raw job posting content.
Request body:
```json
{ "url": "https://..." }
```
Response:
```json
{
  "content": "Job content...",
  "url": "https://..."
}
```

