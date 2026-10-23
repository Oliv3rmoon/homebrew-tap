class Welp < Formula
  desc "Fixes the command you just typed wrong. A fast successor to thefuck"
  homepage "https://github.com/Oliv3rmoon/welp"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.2.1/welp-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "64123736efd54015fa644b414492b3a820f4ecdb1ea55e5bba454f10c1beceb2"
    end
    on_intel do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.2.1/welp-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "c854095740f1598c91a53bbe80327daa5a40ae76332216a246acfb52844abe2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.2.1/welp-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cfa9da7c2b823a1c3e6a328f5b7f2259ba667962f3eccfe6c3f44b27de34e077"
    end
    on_intel do
      url "https://github.com/Oliv3rmoon/welp/releases/download/v0.2.1/welp-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c23c00a9b87d1f7dad81b0bd64357fe35c5b897768296ce39e3c17218793ef9"
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
