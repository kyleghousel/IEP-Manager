# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  renders_one  :header
  renders_one  :footer

  def initialize(href: nil, variant: :solid, hover: true, class: nil)
    @href = href
    @variant = variant.to_sym
    @hover = hover
    @extra = binding.local_variable_get(:class)
  end

  def classes
    base = "block rounded-md border bg-white p-4 shadow-sm text-slate-800"
    base += " hover:shadow-md hover:text-blue-600 transition" if @hover

    case @variant
    when :dashed    then base += " border-dashed bg-gray-50"
    when :dark      then base += " bg-slate-800 text-white"
    when :show_card then base += " space-y-4 text-lg"
    end

    [base, @extra].compact.join(" ")
  end
end
