# WordPress Publishing Package

This package contains the first article for the `AI Engineering Governance`
category on SkyX.

## Category

- Name: `AI Engineering Governance`
- Slug: `ai-engineering-governance`
- Payload: `category.json`

## Post

- Title: `AI Coding Without Governance Will Break at Scale`
- Slug: `ai-coding-without-governance-will-break-at-scale`
- Target URL:
  `https://www.skyx.co.uk/blog/ai-coding-without-governance-will-break-at-scale/`
- Block content: `article.blocks.html`
- Metadata: `post-meta.json`
- Featured image: `assets/ai-coding-governance-featured.svg`

## Publishing Notes

The public WordPress REST API showed that the category and post slugs did not
exist at preparation time.

Publishing requires authenticated WordPress access. Use the category ID returned
by WordPress when creating the post.

The featured image is provided as SVG. Some WordPress sites block SVG uploads by
default. If the media upload fails, convert the SVG to PNG in the WordPress
dashboard or with local image tooling before uploading.

## Suggested REST Flow

1. Create the category with `category.json`.
2. Upload the featured image.
3. Create the post using `article.blocks.html` as the post content.
4. Set the category to the created `AI Engineering Governance` category ID.
5. Add SEO metadata in the active SEO plugin using values from `post-meta.json`.

## Example Script

`publish.example.sh` provides a WordPress REST publishing flow that reads
credentials from environment variables:

```bash
WP_BASE_URL=https://www.skyx.co.uk \
WP_USER=wordpress-user \
WP_APP_PASSWORD=application-password \
bash publishing/wordpress/ai-engineering-governance/publish.example.sh
```

Do not commit real credentials.
