require 'formula'

class Scalate <Formula
  url 'http://repo1.maven.org/maven2/org/fusesource/scalate/scalate-distro/1.1/scalate-distro-1.1-unix-bin.tar.gz'
  version '1.1'
  homepage 'http://scalate.fusesource.org/'
  md5 'fbbca51775da58464e1eddd30c736596'

  def startup_script
    <<-EOS.undent
    #!/usr/bin/env bash
    # This is a startup script for Scalate that calls the 
    # real startup script installed to Homebrew's cellar.
    # to avoid issues with the local rather than absolute symblinks
    
    #{libexec}/bin/scalate $*
    EOS
  end

  def install
    rm_f Dir["bin/*.bat"]

    prefix.install %w{ LICENSE.txt ReadMe.html }
    libexec.install Dir['*']
    
    (bin+'scalate').write startup_script
  end
  
  def caveats
    <<-EOS.undent
    Software was installed to:
      #{libexec}
    EOS
  end

end
