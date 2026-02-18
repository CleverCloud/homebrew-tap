class CleverTools < Formula
  desc "Command Line Interface for Clever Cloud."
  homepage "https://github.com/CleverCloud/clever-tools"
  url "https://clever-tools.clever-cloud.com/releases/4.6.0/clever-tools-4.6.0_macos.tar.gz"
  version "4.6.0"
  sha256 "1693c7326b86ea3ea3c10663b5e46a5bad9a38d198cf286e5612cec637954b98"

  depends_on "bash-completion" => :recommended
  depends_on "zsh-completions" => :recommended

  def install
    bin.install "clever"
    system "mkdir -p #{prefix}/completions/bash"
    system "mkdir -p #{prefix}/completions/zsh"
    system "#{prefix}/bin/clever --bash-autocomplete-script clever > #{prefix}/completions/bash/clever"
    system "#{prefix}/bin/clever --zsh-autocomplete-script clever >  #{prefix}/completions/zsh/_clever"

    bash_completion.install "#{prefix}/completions/bash/clever"
    zsh_completion.install "#{prefix}/completions/zsh/_clever"
  end

  test do
    system "clever --version"
  end
end