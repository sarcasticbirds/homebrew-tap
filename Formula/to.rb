class To < Formula
  desc "Command-line measurement unit converter"
  homepage "https://github.com/sarcasticbirds/to"
  url "https://github.com/sarcasticbirds/to/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "a020a49002bf525097456c70015bb2dbb65cac2e86b5ee60db2af57f1fa5aa67"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X github.com/sarcasticbird/to/internal/cli.Version=v#{version}"), "./cmd/to"
  end

  test do
    assert_equal "to v#{version}\n", shell_output("#{bin}/to --version")
    assert_equal "62.14 mph\n", shell_output("#{bin}/to 100km/h mph")
  end
end
