import os
import json
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from dotenv import load_dotenv
from openai import OpenAI
from scraper import fetch_website_contents, fetch_linkedin_job_posting

# Load environment variables
load_dotenv()

app = FastAPI(title="AI Job Booster API", version="1.0.0")

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, specify exact origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Initialize OpenAI
api_key = os.getenv('OPENAI_API_KEY')
if not api_key:
    raise ValueError("OPENAI_API_KEY not found in environment variables")

openai = OpenAI(api_key=api_key)
MODEL = "gpt-4o-mini"  # Using mini for cost efficiency


# Request/Response models
class JobAnalysisRequest(BaseModel):
    cv_content: str
    job_posting_url: str


class CoverLetterRequest(BaseModel):
    cv_content: str
    job_posting_content: str
    match_percentage: float


@app.get("/")
def root():
    return {"message": "AI Job Booster API", "version": "1.0.0"}


@app.post("/api/analyze-job")
async def analyze_job(request: JobAnalysisRequest):
    """
    Analyze job posting and CV match
    Returns: match percentage, strengths, areas for improvement
    """
    try:
        # Fetch job posting content
        job_content = fetch_website_contents(request.job_posting_url)
        
        if "Error" in job_content:
            raise HTTPException(status_code=400, detail=job_content)
        
        # System prompt for job analysis
        system_prompt = """
You are an expert career advisor and recruiter. Analyze the CV and job posting to provide:
1. A match percentage (0-100)
2. Key strengths that match the job requirements
3. Areas that need improvement
4. Specific skills or experiences missing

Respond in JSON format with these keys:
- match_percentage: number
- strengths: array of strings
- improvements: array of strings
- missing_skills: array of strings
- summary: string (brief analysis)
"""
        
        user_prompt = f"""
CV Content:
{request.cv_content[:3000]}

Job Posting:
{job_content[:3000]}

Analyze how well the CV matches the job posting. Be specific and actionable.
"""
        
        response = openai.chat.completions.create(
            model=MODEL,
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt}
            ],
            response_format={"type": "json_object"},
            temperature=0.7
        )
        
        result = json.loads(response.choices[0].message.content)
        
        return {
            "job_content": job_content[:500],  # Return first 500 chars for preview
            "analysis": result
        }
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/generate-cover-letter")
async def generate_cover_letter(request: CoverLetterRequest):
    """
    Generate a personalized cover letter based on CV and job posting
    """
    try:
        system_prompt = """
You are a professional career coach helping write compelling cover letters.
Create a personalized, professional cover letter that:
1. Highlights relevant experience from the CV
2. Addresses key requirements from the job posting
3. Shows enthusiasm for the role
4. Is concise (3-4 paragraphs)
5. Is written in a professional but warm tone

Respond with the cover letter text only, no additional commentary.
"""
        
        user_prompt = f"""
CV Content:
{request.cv_content[:3000]}

Job Posting:
{request.job_posting_content[:3000]}

Match Percentage: {request.match_percentage}%

Generate a compelling cover letter for this job application.
"""
        
        response = openai.chat.completions.create(
            model=MODEL,
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt}
            ],
            temperature=0.8
        )
        
        cover_letter = response.choices[0].message.content
        
        return {
            "cover_letter": cover_letter
        }
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/fetch-job-posting")
async def fetch_job_posting(request: dict):
    """
    Fetch and return job posting content from URL
    """
    try:
        url = request.get("url", "")
        if not url:
            raise HTTPException(status_code=400, detail="URL is required")
        content = fetch_website_contents(url)
        return {
            "content": content,
            "url": url
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


if __name__ == "__main__":
    import uvicorn
    port = int(os.getenv("PORT", 8000))
    uvicorn.run(app, host="0.0.0.0", port=port)

