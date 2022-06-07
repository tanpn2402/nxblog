import { useRouter } from 'next/router'
import ErrorPage from 'next/error'
import Container from '@/components/container'
import PostBody from '@/components/post-body'
import Header from '@/components/header'
import PostHeader from '@/components/post-header'
import Layout from '@/components/layout'
import { getPostBySlug, getAllPosts } from '@/services/graphql/api'
import PostTitle from '@/components/post-title'
import Head from 'next/head'
import PostEntity from '@/services/entity/Post.entity'


type Props = {
  post: PostEntity
  morePosts: PostEntity[]
  preview?: boolean
}

const Post = ({ post, morePosts, preview }: Props) => {
  const router = useRouter()
  if (!router.isFallback && !post?.attributes?.slug) {
    return <ErrorPage statusCode={404} />
  }
  return (
    <Layout preview={preview}>
      <Container>
        <Header />
        {router.isFallback ? (
          <PostTitle>Loading…</PostTitle>
        ) : (
          <>
            <article className="cke_reset cke-editor mb-32">
              <Head>
                <title>
                  {post.attributes.title} | Blog.
                </title>
                <meta property="og:image" content={post.attributes.cover.data.attributes.url} />
              </Head>
              <PostHeader
                title={post.attributes.title}
                coverImage={post.attributes.cover.data.attributes.url}
                date={post.attributes.createdAt.toString()}
                author={post.attributes.author}
              />
              <PostBody content={post.attributes.content} />
            </article>
          </>
        )}
      </Container>
    </Layout>
  )
}

export default Post

type Params = {
  params: {
    slug: string
  }
}

export async function getStaticProps({ params }: Params) {
  const post = await getPostBySlug(params.slug, [
    'title',
    'date',
    'slug',
    'author',
    'content',
    'ogImage',
    'coverImage',
  ])

  if (post !== null) {
    // const content = await markdownToHtml(post?.attributes?.content || '')
    // post.attributes.content = content
    return {
      props: {
        post
      },
    }
  }
  else {
    return {
      props: {
        
      },
    }
  }
}

export async function getStaticPaths() {
  const posts = await getAllPosts(['slug'])

  return {
    paths: posts.map((post) => {
      return {
        params: {
          slug: post.attributes.slug,
        },
      }
    }),
    fallback: false,
  }
}
