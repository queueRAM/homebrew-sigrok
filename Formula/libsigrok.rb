class Libsigrok < Formula
  desc "Client software that supports various hardware logic analyzers, core library"
  homepage "https://sigrok.org/"
  url "https://sigrok.org/download/source/libsigrok/libsigrok-0.5.2.tar.gz"
  sha256 "4d341f90b6220d3e8cb251dacf726c41165285612248f2c52d15df4590a1ce3c"
  license "GPL-3.0-or-later"
  head "git://sigrok.org/libsigrok"

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "autoconf-archive" => :build
  depends_on "automake" => :build
  depends_on "glib"
  depends_on "libtool"
  depends_on "glibmm"
  depends_on "doxygen"
  depends_on "libzip"
  depends_on "libusb"
  depends_on "libftdi" => :optional
  depends_on "libserialport" => :optional

  def install
    system "./autogen.sh" if build.head?

    system "./configure", "--disable-java",
                          "--disable-sysclk-lwla",
                          "--enable-ruby",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end
