type Props = {
  name: string
  picture: string
}

const Avatar = ({ name, picture }: Props) => {
  return (
    <div className="flex items-center">
      <img src={picture} className="w-8 h-8 rounded-full mr-2" alt={name} />
      <div className="text-md">{name}</div>
    </div>
  )
}

export default Avatar
