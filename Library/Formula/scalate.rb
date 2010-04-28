require 'formula'

class Scalate <Formula
  # when 1.1 is out...
  # url 'http://repo.fusesource.com/nexus/content/repositories/public/org/fusesource/scalate/scalate-distro/1.1/scalate-distro-1.1-unix-bin.tar.gz'
  
  url 'http://repo.fusesource.com/nexus/service/local/artifact/maven/redirect?r=snapshots&g=org.fusesource.scalate&a=scalate-distro&v=1.1-SNAPSHOT&e=tar.gz&c=unix-bin'
  version '1.1-SNAPSHOT'
  homepage 'http://scalate.fusesource.org/'
  md5 '0cc46b70850fd83ee1e4811cc1ea77bc'

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
