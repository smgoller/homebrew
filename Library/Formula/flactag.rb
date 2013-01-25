require 'formula'

class Flactag < Formula
  homepage 'http://flactag.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/flactag/v2.0.4/flactag-2.0.4.tar.gz'
  version '2.0.4'
  sha1 'eb62b3b8657fe26c6f838b0098fd4f176ccb454d'

  depends_on 'pkg-config' => :build
  depends_on 'libmusicbrainz'
  depends_on 'libdiscid'
  depends_on 'flac'
  depends_on 's-lang'
  depends_on 'neon'
  depends_on 'unac'
  depends_on 'jpeg'
  depends_on 'asciidoc'

  def install
    ENV.append 'PKG_CONFIG_PATH', "#{HOMEBREW_PREFIX}/neon/lib/pkgconfig", ':'
    ENV['XML_CATALOG_FILES'] = "#{etc}/xml/catalog"
    system "./configure", "LIBS=-liconv", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "flactag"
  end
end
