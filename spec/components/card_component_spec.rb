# frozen_string_literal: true

require "rails_helper"

RSpec.describe CardComponent, type: :component do
  it "renders content and custom classes" do
    render_inline(described_class.new(class: "test", variant: :dark)) { 'foo bar <a href="https://google.com">Test Link</a>'.html_safe }

    expect(page).to have_css(".bg-slate-800.test", text: /foo bar/)
    expect(page).to have_link("Test Link", href: "https://google.com")
  end

  context "variants" do
    it "defaults to base (no space-y-4 unless passed)" do
      render_inline(described_class.new) { "base" }
      expect(page).to have_css(".rounded-md.border.bg-white")
      expect(page).to have_no_css(".space-y-4")
    end

    it "applies dashed" do
      render_inline(described_class.new(variant: :dashed)) { "dashed" }
      expect(page).to have_css(".border-dashed.bg-gray-50", text: /dashed/)
    end

    it "applies dark" do
      render_inline(described_class.new(variant: :dark)) { "dark" }
      expect(page).to have_css(".bg-slate-800.text-white", text: /dark/)
    end

    it "applies show_card spacing" do
      render_inline(described_class.new(variant: :show_card)) { "<p>one</p><p>two</p>".html_safe }
      expect(page).to have_css(".space-y-4.text-lg", text: /one/)
      expect(page).to have_css(".space-y-4.text-lg", text: /two/)
    end
  end

  context "href wrapper" do
    it "renders <a> when href present" do
      render_inline(described_class.new(href: "https://example.com")) { "link" }
      expect(page).to have_css("a[href='https://example.com']", text: /link/)
    end

    it "renders <div> when href absent" do
      render_inline(described_class.new) { "div" }
      expect(page).to have_css("div", text: /div/)
    end
  end
end
