import UploadFileResponse from "./UploadFileResponse.entity"
import UserEntity from "./User.entity"

type PostEntity = {
  id: string,
  attributes: PostAttribute
}

type PostAttribute = {
  author: UserEntity
  content: string
  cover: UploadFileResponse
  createdAt: Date
  excerpt: string
  publishedAt: Date
  slug: string
  title: string
  updatedAt: Date
}

export default PostEntity