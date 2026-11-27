class Aerless < Formula
  desc "Aerless, picture tool and coding assistant for the terminal"
  homepage "https://aerless.io"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.5/aerless-darwin-arm64"
      sha256 "5ca1ddcb43b8d6984874ecd0320faf984105f22980696bdf3bec4e9365e0b912"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.5/aerless-code-darwin-arm64"
        sha256 "1e416823ff1c51c60a7e3a6cbce545b81426574d064605d11f01dd96e600d2f9"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.5/aerless-darwin-x64"
      sha256 "faad7a0c0df28a49ae59ee13311aeae1292a30039c447cdd68e412b394e4e46b"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.5/aerless-code-darwin-x64"
        sha256 "b35f2dbcc0a0cf5b40b0d6f57446ce111f455c3adc6fd0cb60847354e1903061"
      end
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.5/aerless-linux-arm64"
      sha256 "2f6b4d24c891d3e857e80c381f475b0e4b3f6700cb54d03001e05da04c4b740d"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.5/aerless-code-linux-arm64"
        sha256 "99bd0c4875b3372155b2d2f0b6c91dcb7ccb63267b714d2a6032f31d94950948"
      end
    end
    on_intel do
      url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.5/aerless-linux-x64"
      sha256 "7ee888655c8b79526615eef054053e3268e6f97134926e8c5f08f47418313dd1"
      resource "aerless-code" do
        url "https://github.com/aerless-ai/aerless-code/releases/download/v0.2.5/aerless-code-linux-x64"
        sha256 "be94583224a18cdbd4dd0690c327ea823e7b3748d0261dded0d101b82083a316"
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
