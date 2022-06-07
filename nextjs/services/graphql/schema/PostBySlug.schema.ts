const PostBySlug = `query PostBySlug($slug: String) {
  posts (
    pagination: { limit: 10 }
    filters: { slug: { eq: $slug } },
    sort: "title:ASC"
  ) {
    data {
      attributes {
        title
        slug
        excerpt
        content
        createdAt
        publishedAt
        cover {
          data { 
            attributes {
              url
              alternativeText
              caption
              name
            }
          }
        }
        author {
          data {
            attributes {
              name
              picture {
                data {
                  attributes {
                    url
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}`
export default PostBySlug