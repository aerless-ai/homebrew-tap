class Aerless < Formula
  desc "Aerless, picture tool and coding assistant for the terminal"
  homepage "https://aerless.io"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.1/aerless-darwin-arm64"
      sha256 "77bdc2fc59d30c8b3fb4c0a9b2d0586c6fddf89f70504b864c14ead6c78407ef"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.1/aerless-code-darwin-arm64"
        sha256 "13f207c9446f5a3a0dbdbf5a99c14195e1dd4ba459a9599a30f88946a8c81950"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.1/aerless-darwin-x64"
      sha256 "83ec70e5d4fdc43e7c56525b81908fedadf5590c51002e87e5996322d912d0d6"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.1/aerless-code-darwin-x64"
        sha256 "045a6e9e9d2797c473d4b7ef0a7885bed9c4ef1e22abf02053a35a2840a5b7aa"
      end
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.1/aerless-linux-arm64"
      sha256 "5ccfd36ce110106b82334cac41ce56d81e4071d775837883d851a39d20c369a0"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.1/aerless-code-linux-arm64"
        sha256 "0e848fe0afdb0927fa3964e3dd288a395ba153c38245eedfc3a983bdefd0940d"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.1/aerless-linux-x64"
      sha256 "308ed3ab6af90a5620cc19318b89fb90667e00754b360d7744ea47f06c5fe701"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.1/aerless-code-linux-x64"
        sha256 "7fd7096fca2beb1fe84a08a5c0791c86b0df8d91a02a6878950f857df744c36d"
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
