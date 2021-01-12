class Libsigrokdecode < Formula
  desc "C library providing protocol decoding for logic analyzers"
  homepage "https://sigrok.org/"
  url "https://sigrok.org/download/source/libsigrokdecode/libsigrokdecode-0.5.3.tar.gz"
  sha256 "c50814aa6743cd8c4e88c84a0cdd8889d883c3be122289be90c63d7d67883fc0"
  license "GPL-3.0-or-later"
  head "git://sigrok.org/libsigrokdecode"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on "libsigrok"
  depends_on "python3"

  def install
    ENV.append "LDFLAGS", "-Wl,-undefined,dynamic_lookup"
    system "./autogen.sh" if build.head?

    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
