const AllPosts = `query AllPosts($limit: Int) {
  posts (
    pagination: { limit: $limit }
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
export default AllPosts