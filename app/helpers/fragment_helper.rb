module FragmentHelper
  def make_translatable(text)
    Translation.all.each do |translation|
      text.gsub!(translation.source_lang, "<span class='translated' data-translation='#{translation.target_lang}'>#{translation.source_lang}</span>")
    end
    "<div class='translatable'>#{text}</div>".html_safe
  end
end
