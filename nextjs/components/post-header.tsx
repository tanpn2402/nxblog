import Avatar from './avatar'
import DateFormatter from './date-formatter'
import CoverImage from './CoverImage'
import PostTitle from './post-title'
import UserEntity from '@/services/entity/User.entity'

type Props = {
  title: string
  coverImage: string
  date: string
  author: UserEntity
}

const PostHeader = ({ title, coverImage, date, author }: Props) => {
  return (
    <>
      <div className="mb-8 md:mb-16 sm:mx-0">
        <CoverImage title={title} src={coverImage} />
      </div>
      <PostTitle>{title}</PostTitle>
      <div className="hidden md:flex items-center md:mb-12">
        <Avatar name={author.data.attributes.name} picture={author.data.attributes.picture.data.attributes.url} />
        <div className="ml-4 text-lg">
          <DateFormatter dateString={date} />
        </div>
      </div>
      <div className="max-w-2xl mx-auto">
        <div className="block md:hidden mb-6">
          <Avatar name={author.data.attributes.name} picture={author.data.attributes.picture.data.attributes.url} />
        </div>
      </div>
    </>
  )
}

export default PostHeader
