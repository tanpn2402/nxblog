import cn from 'classnames'
import Link from 'next/link'
import styled from 'styled-components'

type Props = {
  title: string
  src: string
  slug?: string
}

type ImgProps = {
  slug?: string
  src?: string,
  alt?: string,
  className?: string
}

const Img = styled.img`
  aspect-ratio: ${(props : ImgProps) => props.slug ? '16 / 9' : 'unset'};
  object-fit: ${(props : ImgProps) => props.slug ? 'cover' : 'unset'};
`

const CoverImage = ({ title, src, slug }: Props) => {
  const image = (
    <Img
      src={src}
      slug={slug}
      alt={`Cover Image for ${title}`}
      className={cn('shadow-sm', {
        'w-full rounded-t-md': slug
      })}
    />
  )
  return (
    <div className="sm:mx-0 flex items-center justify-center">
      {slug ? (
        <Link as={`/posts/${slug}`} href="/posts/[slug]">
          <a aria-label={title} className="w-full">{image}</a>
        </Link>
      ) : (
        image
      )}
    </div>
  )
}

export default CoverImage
