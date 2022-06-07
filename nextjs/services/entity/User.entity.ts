import UploadFileResponse from "./UploadFileResponse.entity"

type UserEntity = {
  data: UsersPermissionsRoleEntity
}

type UsersPermissionsRoleEntity = {
  id: string,
  attributes: UserAttribute
}

type UserAttribute = {
  blocked: boolean
  confirmed: boolean
  createdAt: Date
  email: string
  name: string
  picture: UploadFileResponse
  provider: string
  role: any
  updatedAt: Date
  username: string
}

export default UserEntity