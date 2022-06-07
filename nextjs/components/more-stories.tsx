import PostPreview from './post-preview'
import PostEntity from '@/services/entity/Post.entity'

type Props = {
  posts: PostEntity[]
}

const MoreStories = ({ posts }: Props) => {
  return (
    <section>
      <div className="grid grid-cols-2 lg:grid-cols-3 xl:grid-cols-3 md:gap-4 lg:gap-16 mb-32">
        {posts.map((post) => (
          <PostPreview
            key={post.attributes.slug}
            title={post.attributes.title}
            coverImage={post.attributes.cover.data.attributes.url}
            date={post.attributes.createdAt.toString()}
            author={post.attributes.author}
            slug={post.attributes.slug}
            excerpt={post.attributes.excerpt}
          />
        ))}
      </div>
    </section>
  )
}

export default MoreStories
