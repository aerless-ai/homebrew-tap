class Aerless < Formula
  desc "Aerless, picture tool and coding assistant for the terminal"
  homepage "https://aerless.io"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.3/aerless-darwin-arm64"
      sha256 "95bd1d0528f9be175ef9506b8001150c6a87bc9492252de91d1dc2055724fc6a"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.3/aerless-code-darwin-arm64"
        sha256 "c61ee77befd402098cb174e4e93ad03c8d376034aaba8e027dbda17e115045df"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.3/aerless-darwin-x64"
      sha256 "ee96f76fdcf53b98a96fee7dedf29275af1f2307e9a15e38000eda50c86738f6"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.3/aerless-code-darwin-x64"
        sha256 "d6d1611421355e5611faa6adf114b52015f8be60241be5b0de738e00db35af58"
      end
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.3/aerless-linux-arm64"
      sha256 "bd3fe6d902c6f80b091cbed1a0f5e470218d95fdd1b38548e22a3065031e8054"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.3/aerless-code-linux-arm64"
        sha256 "bdbc4f461fed4dad1d2ac6d05ab166097eeb4a842ae23cd366507f928328f0bc"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.3/aerless-linux-x64"
      sha256 "82b821bedf6efb303c09d161b6a078beb180bd572d364195a05a5077217deadb"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.3/aerless-code-linux-x64"
        sha256 "d972387c95b1bbcde4145d8afc6d3e02e67684a28117ec7b69e4b6ce2eeda56e"
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
