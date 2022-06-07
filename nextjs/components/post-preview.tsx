import Avatar from './avatar'
import DateFormatter from './date-formatter'
import CoverImage from './CoverImage'
import Link from 'next/link'
import UserEntity from '@/services/entity/User.entity'

type Props = {
  title: string
  coverImage: string
  date: string
  excerpt: string
  author: UserEntity
  slug: string
}

const PostPreview = ({
  title,
  coverImage,
  date,
  excerpt,
  author,
  slug,
}: Props) => {
  return (
    <div className="flex flex-col shadow-md hover:shadow-xl transition-shadow duration-200 rounded-md">
      <div className="mb-5 w-100">
        <CoverImage slug={slug} title={title} src={coverImage} />
      </div>
      <div className="px-3 flex-1">
        <h3 className="text-xl lg:text-2xl mb-3 leading-snug">
          <Link as={`/posts/${slug}`} href="/posts/[slug]">
            <a className="hover:underline">{title}</a>
          </Link>
        </h3>
        <p className="text-md leading-relaxed mb-4">{excerpt}</p>
      </div>
      <div className="md:flex items-center p-3 mb-4">
        <Avatar name={author.data.attributes?.name} picture={author.data.attributes?.picture?.data?.attributes?.url} />
        <div className="ml-4 text-lg">
          <DateFormatter dateString={date} />
        </div>
      </div>
    </div>
  )
}

export default PostPreview
