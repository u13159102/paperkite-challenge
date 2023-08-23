# Infrastructure

Given the fact that the API gets hit quite frequently it would help to make use of some form of caching for things that don't change often such as images, the vendor outlets and plate numbers etc. Something like CloudFront on AWS can be used for this.

On the application side we could also store the images in an S3 bucket (if not on the server itself, but I would suggest using S3) this way we don't have to keep fetching the image with every reload. If images are stored in S3 they can also be cached with a CDN like CloudFront making loading much faster for the user.
