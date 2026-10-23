class Welp < Formula
  desc "Fixes the command you just typed wrong. A fast successor to thefuck"
  homepage "https://github.com/Oliv3rmoon/welp"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.3.1/welp-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "72dcc0e8678be22f421e5e999d4f2e270f0613d96fb792b9d8b97d825638d895"
    end
    on_intel do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.3.1/welp-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "53ef25a9b692f306a2d6ba73ef37a5e4533488ed1260f1b3958c05b161a4e7b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.3.1/welp-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da70938c6c87f4b7b55148f8a6e23a7849be2ad1eef95b6b2bdb106b36f65d29"
    end
    on_intel do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.3.1/welp-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cbfd3002ce98f9153675d98e8be0e4e3a1f8d1a258bff6a687927538159e0fb"
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
