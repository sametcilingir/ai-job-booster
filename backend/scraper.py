from bs4 import BeautifulSoup
import requests


# Standard headers to fetch a website
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36"
}


def fetch_website_contents(url):
    """
    Return the title and contents of the website at the given url;
    truncate to 10,000 characters for job postings
    """
    try:
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()
        soup = BeautifulSoup(response.content, "html.parser")
        title = soup.title.string if soup.title else "No title found"
        if soup.body:
            for irrelevant in soup.body(["script", "style", "img", "input", "nav", "footer", "header"]):
                irrelevant.decompose()
            text = soup.body.get_text(separator="\n", strip=True)
        else:
            text = ""
        return (title + "\n\n" + text)[:10_000]
    except Exception as e:
        return f"Error fetching website: {str(e)}"


def fetch_linkedin_job_posting(url):
    """
    Fetch LinkedIn job posting content
    Note: LinkedIn may require authentication for full content
    This is a simplified version that works for public job postings
    """
    try:
        # LinkedIn job postings often have the job description in specific divs
        content = fetch_website_contents(url)
        # Extract job description if available
        return content
    except Exception as e:
        return f"Error fetching LinkedIn posting: {str(e)}"

