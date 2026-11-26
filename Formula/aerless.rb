class Aerless < Formula
  desc "Aerless, picture tool and coding assistant for the terminal"
  homepage "https://aerless.io"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.2/aerless-darwin-arm64"
      sha256 "77338ffe5af0d859b703d5f70782eb984b85d41394a8c3f62a0142c488f10c6a"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.2/aerless-code-darwin-arm64"
        sha256 "9f7e4e222252fc137b7b7f5449b0d831eb6708409e891f52aeca8f6ecb451469"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.2/aerless-darwin-x64"
      sha256 "3bd6b7e5d8d8b78d9b2684601a835e0b64293fb7c3ef86ee240a3822df0b60b1"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.2/aerless-code-darwin-x64"
        sha256 "b078886135f38f743b679af37773112aaa765fcc13ef3c5c3cfbe97d8b85f75e"
      end
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.2/aerless-linux-arm64"
      sha256 "768c9b99518ad3ce309e2d88f059e122106022698d1f2f29b4a638090d6e54d6"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.2/aerless-code-linux-arm64"
        sha256 "2bc3b3f1c781900bd4fb272d5b4442134ea3fe6f2aa2be6fd5eba82ee30e663a"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.2/aerless-linux-x64"
      sha256 "42ac6b1c7db830fb620d8be150af91cbf8102806a2232ef9ae2953fe9801e8df"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.2/aerless-code-linux-x64"
        sha256 "62b324c87d3ee8a14c369a66b2e7778a3bb1286ffa72b0a3510aed8712b6c9c0"
      end
    end
  end

  def install
    bin.install Dir["aerless-*"].first => "aerless"
    resource("aerless-code").stage { bin.install Dir["aerless-code-*"].first => "aerless-code" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aerless --version")
  end
end
