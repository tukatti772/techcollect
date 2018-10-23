module ApplicationHelper
  #アプリケーション全体に渡って使うヘルパーメソッドを定義

#deviseのエラーメッセージのカスタマイズ。GitHubから拾ってきたもの。
  # A simple way to show error messages for the current devise resource. If you need
  # to customize this method, you can either overwrite it in your application helpers or
  # copy the views to your application.
  #
  # This method is intended to stay simple and it is unlikely that we are going to change
  # it to add more behavior or options.
  def devise_error_messages
    return "" if resource.errors.empty?

#rubyのmapメソッド,joinメソッドとrailsのcontent_tagメソッドが使用されている
    messages = resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
#   sentence = I18n.t("errors.messages.not_saved",
#                      count: resource.errors.count,
#                      resource: resource.class.model_name.human.downcase)

    #以下はヒアドキュメントになってる
    html = <<-HTML
    <div class="errormessage">
      #{messages}
    </div>
    HTML

    html.html_safe
  end

  #news.pictureがnilかどうか
  def picturenil?(instance)
    instance.picture.nil?
  end

end