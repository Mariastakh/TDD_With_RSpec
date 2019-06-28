require 'word_wrap'

describe "#wrap" do

    it "Returns an empty string when called with nothing" do
      expect(wrap("", 1)).to eq("")
    end

    it "Returns the word if shorter than the length" do
      expect(wrap("word", 5)).to eq("word")
    end

    it "splits a long word on the length column" do
      expect(wrap("longword", 4)).to eq("long\nword")
    end

    it "splits a really long word on the column" do
      expect(wrap("longlongword", 4)).to eq("long\nlong\nword")
    end

    it "splits a word on a whitespace" do
      expect(wrap("long word", 5)).to eq("long\nword")
    end

    it "splits a whitespace that's before the column" do
      expect(wrap("long word", 4)).to eq("long\nword")
    end

    it "splits early when the space is before column" do
      expect(wrap("long word", 6)).to eq("long\nword")
    end

    it "keeps as many words on the line as possible" do
      expect(wrap("long long word", 10)).to eq("long long\nword")
    end

    it "words with a space after them which falls on the maximum length itself are kept" do
      expect(wrap("long long word", 9)).to eq("long long\nword")
    end

    it "can wrap a long sentence" do
      expect(wrap("my mother collected cats when she was young", 9)).to eq("my mother\ncollected\ncats when\nshe was\nyoung")
    end

    it "can break on multiple spaces that fall on the break index" do
      expect(wrap("cats on a pedestal", 5)).to eq("cats\non a\npedes\ntal")
    end

    it "Makes a new line when it sees a paragraph (two new line characters in a row)" do
      expect(wrap("A paragraph appears.\n\nIt is two sentences.", 5)).to eq("A\nparag\nraph\nappea\nrs.\n\nIt is\ntwo\nsente\nnces.")
    end

    it "Splits text with multiple paragraphs" do
      expect(wrap("A postmodern\n\nPoem\n\nIt is\n\nsparse.", 5)).to eq("A\npostm\nodern\n\nPoem\n\nIt is\n\nspars\ne.")
    end

    xit "Makes a new line if a full stop doesn't fit on the end of a word" do
      expect(wrap("An elephant appears. It is big.", 7)).to eq("An\nelephan\nt\nappe\nars. It\nis big")
    end

    xit "It splits a long word elegantly (specify what you mean) in two" do
      expect(wrap("An elephant appears. It is big.", 7)).to eq("An\neleph\nant\nappe\nars. It\nis big")
    end
end
