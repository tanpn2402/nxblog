import AllPosts from '@/services/graphql/schema/AllPosts.schema'
import PostEntity from '@/services/entity/Post.entity'
import PostBySlug from '@/services/graphql/schema/PostBySlug.schema'

async function graphQL(query : string, { variables } : any = {}) {
  const GRAPHQL_URL = `${process.env.GRAPHQL_HTTP}://${process.env.GRAPHQL_HOST}:${process.env.GRAPHQL_PORT}/graphql`;
  console.log(GRAPHQL_URL);
  console.log(`Token = ` + process.env.GRAPHQL_BEARER_TOKEN);
  const res = await fetch(GRAPHQL_URL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${process.env.GRAPHQL_BEARER_TOKEN}`
    },
    body: JSON.stringify({
      query,
      variables,
    }),
  })

  const json = await res.json()
  if (json.errors) {
    console.error(json.errors)
    throw new Error('Failed to fetch API')
  }

  return json.data
}

export async function getPostBySlug(slug: string, fields: string[] = []) : Promise<PostEntity | null> {
  let resp = await graphQL(PostBySlug, {
    variables: {
      slug
    },
  })

  if(resp.posts.data?.length > 0) {
    return resp.posts.data[0];
  }
  else {
    return null;
  }
}

export async function getAllPosts(fields: string[] = []) : Promise<PostEntity[]> {
  let posts : PostEntity[] =  [];

  let resp = await graphQL(AllPosts, {
    variables: {
      limit: 10
    },
  })

  console.log(resp);

  resp.posts.data?.map?.((post : PostEntity) => {
    posts.push(post)
  });

  return posts
}
