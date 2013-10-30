module ApplicationHelper
  def image_for_post_kind(kind)
    if (kind == Post::LOST) || (kind == Post::FOUND)
      image_tag("ico-extraviado48px.png", alt: "Extraviado")
    elsif kind == Post::ADOPTION
      image_tag("ico-adoptar48px.png", alt: "Adopcion")
    elsif kind == Post::MATE
      image_tag("ico-pareja48px.png", alt: "Pareja")
    end
  end
end
