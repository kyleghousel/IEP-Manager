# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  renders_one  :header
  renders_one  :footer

  def initialize(href: nil, variant: :solid, hover: true, class: nil, extra: nil)
    @href = href
    @variant = variant
    @hover = hover
    @extra = binding.local_variable_get(:class)
  end

  def classes
    base = "rounded-md border bg-white p-4 shadow-sm"
    base += " hover:shadow-md hover:text-blue-600 transition" if @hover
    base += " border-dashed" if @variant == :dashed
    [base, @extra].compact.join(" ")
  end
end
