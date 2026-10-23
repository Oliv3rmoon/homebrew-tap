class Welp < Formula
  desc "Fixes the command you just typed wrong. A fast successor to thefuck"
  homepage "https://github.com/Oliv3rmoon/welp"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.3.0/welp-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "a556bc87f5d621dddcda6da7b58090b032b2a26a8acf7ca735e0927825a6f5fb"
    end
    on_intel do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.3.0/welp-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "5977b58bb4776a7cf006aeda26945bf9137546e27458e00b7e47f2d1be9bb6a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.3.0/welp-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b55e9869306f57c87bb5ab802b72d8a90d215d2aaf6d0b6f7dff808ab7a5fdc"
    end
    on_intel do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.3.0/welp-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ecf77403acccb650cb2519feea85ef3a5d469701015fafbdfb56c5915028097e"
    end
  end

  def install
    bin.install "welp"
  end

  def caveats
    <<~EOS
      Add welp to your shell (zsh shown; also bash, fish, tcsh, powershell):
        eval "$(welp init zsh)"
      Coming from thefuck? This moves your alias and settings over:
        welp migrate
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/welp --version")
    assert_equal "git status", shell_output("#{bin}/welp fix 'gti status' --yes 2>/dev/null").strip
  end
end
