#!/usr/bin/env bash
set -euo pipefail

# Example WordPress REST publisher.
#
# Required environment variables:
#   WP_BASE_URL       Example: https://www.skyx.co.uk
#   WP_USER           WordPress username
#   WP_APP_PASSWORD   WordPress application password
#
# This script does not store credentials. It reads package files from this
# directory and creates the category, uploads the featured image, and creates
# the post.

PACKAGE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WP_BASE_URL="${WP_BASE_URL:-https://www.skyx.co.uk}"

if [[ -z "${WP_USER:-}" || -z "${WP_APP_PASSWORD:-}" ]]; then
  echo "Missing WP_USER or WP_APP_PASSWORD." >&2
  exit 1
fi

auth_args=(-u "${WP_USER}:${WP_APP_PASSWORD}")
category_file="${PACKAGE_DIR}/category.json"
meta_file="${PACKAGE_DIR}/post-meta.json"
content_file="${PACKAGE_DIR}/article.blocks.html"
image_file="${PACKAGE_DIR}/assets/ai-coding-governance-featured.svg"

category_id="$(
  curl -sS "${auth_args[@]}" \
    -H "Content-Type: application/json" \
    -d @"${category_file}" \
    "${WP_BASE_URL}/wp-json/wp/v2/categories" |
    node -e "let data='';process.stdin.on('data',c=>data+=c);process.stdin.on('end',()=>{const j=JSON.parse(data); if(!j.id){console.error(data); process.exit(1)} console.log(j.id);})"
)"

echo "Category ID: ${category_id}"

media_id="$(
  curl -sS "${auth_args[@]}" \
    -H "Content-Disposition: attachment; filename=ai-coding-governance-featured.svg" \
    -H "Content-Type: image/svg+xml" \
    --data-binary @"${image_file}" \
    "${WP_BASE_URL}/wp-json/wp/v2/media" |
    node -e "let data='';process.stdin.on('data',c=>data+=c);process.stdin.on('end',()=>{const j=JSON.parse(data); if(!j.id){console.error(data); process.exit(1)} console.log(j.id);})"
)"

echo "Media ID: ${media_id}"

node \
  -e '
const fs = require("fs");
const meta = JSON.parse(fs.readFileSync(process.argv[1], "utf8"));
const content = fs.readFileSync(process.argv[2], "utf8");
const payload = {
  title: meta.title,
  slug: meta.slug,
  status: meta.status,
  excerpt: meta.excerpt,
  content,
  categories: [Number(process.argv[3])],
  featured_media: Number(process.argv[4]),
  meta: {
    _yoast_wpseo_title: meta.seo.meta_title,
    _yoast_wpseo_metadesc: meta.seo.meta_description,
    _yoast_wpseo_focuskw: meta.seo.focus_keyphrase
  }
};
process.stdout.write(JSON.stringify(payload));
' \
  "${meta_file}" \
  "${content_file}" \
  "${category_id}" \
  "${media_id}" >"${PACKAGE_DIR}/.post-payload.generated.json"

post_url="$(
  curl -sS "${auth_args[@]}" \
    -H "Content-Type: application/json" \
    -d @"${PACKAGE_DIR}/.post-payload.generated.json" \
    "${WP_BASE_URL}/wp-json/wp/v2/posts" |
    node -e "let data='';process.stdin.on('data',c=>data+=c);process.stdin.on('end',()=>{const j=JSON.parse(data); if(!j.link){console.error(data); process.exit(1)} console.log(j.link);})"
)"

echo "Published: ${post_url}"
