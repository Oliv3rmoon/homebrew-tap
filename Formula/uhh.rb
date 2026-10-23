class Uhh < Formula
  desc "Explains a shell command flag by flag, from your own man pages"
  homepage "https://github.com/Oliv3rmoon/uhh"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Oliv3rmoon/uhh/releases/download/v0.1.0/uhh-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "9eb38f9acdb324f7ddb3fbffce45ce6bef4994090343c126751919e10f9dd461"
    end
    on_intel do
      url "https://github.com/Oliv3rmoon/uhh/releases/download/v0.1.0/uhh-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "ea4eb3e64926d09cbe5f149ae67034fd1dcef4436f011f1e15c19ff871c13b8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Oliv3rmoon/uhh/releases/download/v0.1.0/uhh-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "797d1a57fbd6c9fdf6c291bbad481b354789914eae0e038da92f2f3498acf094"
    end
    on_intel do
      url "https://github.com/Oliv3rmoon/uhh/releases/download/v0.1.0/uhh-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0007cabafdcf8ddee08eb1eb66e9e3e3c59f541c16da95a3dcc408b33692af48"
    end
  end

  def install
    bin.install "uhh"
  end

  def caveats
    <<~EOS
      To make plain `uhh` explain your last command (zsh shown; also bash, fish):
        eval "$(uhh --init zsh)"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uhh --version")
    assert_match "sends what", shell_output("NO_COLOR=1 #{bin}/uhh 'echo hi | cat'")
  end
end
