

type UploadFileResponse = {
  data: UploadFileEntity
}

type UploadFileEntity = {
  attributes: UploadFileAttribute
  id: string
}

type UploadFileAttribute = {
  alternativeText: string
  caption: string
  createdAt: Date
  ext: string
  formats: JSON
  hash: string
  height: Number
  mime: string
  name: string
  previewUrl: string
  provider: string
  provider_metadata: JSON
  related: any
  size: Number
  updatedAt: Date
  url: string
  width: Number
}

export default UploadFileResponse