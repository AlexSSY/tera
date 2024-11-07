# app/helpers/application_helper.rb
module ApplicationHelper
  include Pagy::Frontend

  # Overwriting the default `pagy_nav` method with `pagy_anchor`
  # def pagy_nav(pagy)
  #   link = pagy_anchor(pagy) # Updated to use `pagy_anchor`
  #   html = +%(<nav class="flex justify-center items-center space-x-2 mt-4">)

  #   pagy.series.each do |item|
  #     html << if item.is_a?(Integer)
  #               link.call(item, class: "px-3 py-1 border rounded-md text-gray-700 hover:bg-gray-100 hover:text-blue-500 #{'bg-blue-500 text-white' if item == pagy.page}")
  #     elsif item == :gap
  #               %(<span class="px-3 py-1 text-gray-500">…</span>)
  #     else
  #               link.call(item, class: "px-3 py-1 border rounded-md text-gray-700 hover:bg-gray-100 hover:text-blue-500")
  #     end
  #   end

  #   html << %(</nav>)
  # end

  def pagy_nav(pagy, id: nil, aria_label: nil, **vars)
    id = %( id="#{id}") if id
    a  = pagy_anchor(pagy, **vars)

    html = %(<nav#{id} class="flex justify-center items-center space-x-2" #{nav_aria_label(pagy, aria_label:)}>#{
               prev_a(pagy, a)})
    pagy.series(**vars).each do |item| # series example: [1, :gap, 7, 8, "9", 10, 11, :gap, 36]
      html << case item
      when Integer
                a.(item, classes: "px-3 py-1 border rounded-md text-gray-700 hover:bg-gray-100 hover:text-blue-500 #{'bg-blue-500 text-white' if item == pagy.page}")
      when String
                %(<a role="link" aria-disabled="true" aria-current="page" class="px-3 py-1 border rounded-md text-gray-700 hover:bg-gray-100 hover:text-blue-500">#{pagy.label_for(item)}</a>)
      when :gap
                # %(<a role="link" aria-disabled="true" class="px-3 py-1 text-gray-500">#{pagy_t('pagy.gap')}</a>)
                %(<span class="px-3 py-1 text-gray-500">…</span>)
      else
                raise InternalError, "expected item types in series to be Integer, String or :gap; got #{item.inspect}"
      end
    end
    html << %(#{next_a(pagy, a)}</nav>)
  end
end
