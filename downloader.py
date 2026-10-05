import yt_dlp
import os

def download_video(url):
    os.makedirs("downloads", exist_ok=True)
    ydl_opts = {
        'format': 'best[ext=mp4][height<=720]/best',
        'outtmpl': 'downloads/%(id)s.%(ext)s',
        'quiet': True,
        'noplaylist': True,
    }
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        info = ydl.extract_info(url, download=True)
        path = ydl.prepare_filename(info)
        return path
