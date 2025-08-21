#!/bin/bash

# download audio files for each video_id
# format: opus, thumbnail embedded, metadata embedded
download_opus() {
  local video_id="$1"
  echo "Processing ID: $video_id"
  /opt/homebrew/bin/yt-dlp -x --no-warnings --embed-thumbnail --add-metadata --audio-format opus --output "%(artist|uploader)s - %(title)s - [%(id)s].%(ext)s" "https://music.youtube.com/watch?v=$video_id"
}

# Check if a URL was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <youtube_music_url>"
  exit 1
fi

# Get the video IDs from the URL and loop through them
/opt/homebrew/bin/yt-dlp --no-warnings --get-id "$1" | while read -r id; do
  download_opus "$id"
done