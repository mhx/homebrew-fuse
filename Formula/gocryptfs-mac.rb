require_relative "../require/macfuse"

class GocryptfsMac < Formula
  desc "Encrypted overlay filesystem written in Go"
  homepage "https://nuetzlich.net/gocryptfs/"
  url "https://github.com/rfjakob/gocryptfs/releases/download/v2.5.3/gocryptfs_v2.5.3_src-deps.tar.gz"
  sha256 "4b6d874b5383be5ed33d7ef7a5a6152d2b6a5d1965215a426ec855c043138ee2"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/fuse"
    sha256 cellar: :any, arm64_sonoma: "9a6e12efa94e5bfac64e8550a2ab7f1d90e2b518ea0d87a1e5ecf08871506a8c"
    sha256 cellar: :any, ventura:      "ef83ab47b9520b45482beb97b02b163e6a4d448ca00f98cb8fb395443862e59b"
  end

  depends_on "go" => :build
  depends_on "pkg-config" => :build
  depends_on MacfuseRequirement
  depends_on :macos
  depends_on "openssl@3"

  def install
    setup_fuse
    system "./build.bash"
    bin.install "gocryptfs", "gocryptfs-xray/gocryptfs-xray"
    man1.install "Documentation/gocryptfs.1", "Documentation/gocryptfs-xray.1"
  end

  test do
    (testpath/"encdir").mkpath
    pipe_output("#{bin}/gocryptfs -init #{testpath}/encdir", "password", 0)
    assert_path_exists testpath/"encdir/gocryptfs.conf"
  end
end
