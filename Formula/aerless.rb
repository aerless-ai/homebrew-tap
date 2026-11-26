class Aerless < Formula
  desc "Aerless, picture tool and coding assistant for the terminal"
  homepage "https://aerless.io"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.3/aerless-darwin-arm64"
      sha256 "6303da0f8cae47a52b11e8e0bcb83f42cdd5e4524e0308861d92a7bd5fd6d919"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.3/aerless-code-darwin-arm64"
        sha256 "9f7e4e222252fc137b7b7f5449b0d831eb6708409e891f52aeca8f6ecb451469"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.3/aerless-darwin-x64"
      sha256 "8c68d1d048fdec675d00868092bb3a56ce65bdea0432212c27ec5017933fb467"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.3/aerless-code-darwin-x64"
        sha256 "b078886135f38f743b679af37773112aaa765fcc13ef3c5c3cfbe97d8b85f75e"
      end
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.3/aerless-linux-arm64"
      sha256 "0da24b481b86274ee6510756b2e8ff6a7bf8995858a0d4a54b0ea7e3906785c6"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.3/aerless-code-linux-arm64"
        sha256 "2bc3b3f1c781900bd4fb272d5b4442134ea3fe6f2aa2be6fd5eba82ee30e663a"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.3/aerless-linux-x64"
      sha256 "57424d18b8e865cfda6c489335e454ef1f35981f16066becf670c8b70f2851a8"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.1.3/aerless-code-linux-x64"
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
