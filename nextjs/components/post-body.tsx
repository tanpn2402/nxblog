import cn from 'classnames'
import markdownStyles from './markdown-styles.module.css'
import styled from 'styled-components'

const Markdown = styled.div`
  .image {
    display: table;
    clear: both;
    text-align: center;
    margin: 0.9em auto;
    min-width: 50px;
  }

  .image.image_resized {
    max-width: 100%;
    display: block;
    box-sizing: border-box;
  }

  .image-style-side {
    float: right;
    margin-left: 1.5em;
    max-width: 50%;
  }

  p + .image-style-side {
    margin-top: 0px;
  }

  .image > figcaption {
    caption-side: bottom;
    word-break: break-word;
    color: #333333;
    background-color: #f7f7f7;
    padding: 0.6em;
    font-size: 0.75em;
    outline-offset: -1px;
  }

  blockquote {
    overflow: hidden;
    padding-right: 1.5em;
    padding-left: 1.5em;
    margin-left: 0px;
    margin-right: 0px;
    font-style: italic;
    border-left: 5px solid rgb(204, 204, 204);
  }

  ul, ol {
    list-style: initial;
    margin-left: 32px;
  }

  pre {
    padding: 1em;
    color: rgb(255 255 255);
    background: rgb(0 0 0);
    border: 1px solid rgb(0 0 0);
    border-radius: 2px;
    text-align: left;
    direction: ltr;
    tab-size: 4;
    white-space: pre-wrap;
    font-style: normal;
    min-width: 200px;
    font-size: 0.8em;
  }
  
  pre code {
    background: unset;
    padding: 0px;
    border-radius: 0px;
  }

  .table {
    margin: 0.9em auto;
    display: table;
  }

  .table table {
    border-collapse: collapse;
    border-spacing: 0px;
    width: 100%;
    height: 100%;
    border: 1px double rgb(179, 179, 179);
  }

  .table table td, .table table th {
    min-width: 2em;
    padding: 0.4em;
    border: 1px solid rgb(191, 191, 191);
  }
`


type Props = {
  content: string
}

const PostBody = ({ content }: Props) => {
  return (
    <div className="max-w-2xl mx-auto">
      <Markdown
        className={cn(markdownStyles['markdown'], 'markdown')}
        dangerouslySetInnerHTML={{ __html: content }}
      />
    </div>
  )
}

export default PostBody