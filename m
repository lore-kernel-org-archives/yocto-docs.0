Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6E3E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 16:09:09 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
 by mx.groups.io with SMTP id smtpd.web10.85154.1734451748288042566
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 08:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YCMFG0x0DzXdw;
	Tue, 17 Dec 2024 17:09:06 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YCMFF5BWvzMfG;
	Tue, 17 Dec 2024 17:09:05 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 17 Dec 2024 17:08:50 +0100
Subject: [PATCH RFC v2 1/2] docs: use literalinclude for system
 requirements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-instructions-shell-container-v2-1-ce687b0cfac2@cherry.de>
References: <20241217-instructions-shell-container-v2-0-ce687b0cfac2@cherry.de>
In-Reply-To: <20241217-instructions-shell-container-v2-0-ce687b0cfac2@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 16:09:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5972

From: Quentin Schulz <quentin.schulz@cherry.de>

The YAML variables for the host dependencies are updated by hand and
actually only used inside code blocks.

Let's migrate all instructions into separate shell scripts that are then
literalinclude'd into the Sphinx documentation.

This allows a few things:
- ability to run shellcheck on the scripts if we ever want to
- manually calling the appropriate script from a supported distro to
  build stuff (distro or bitbake/yocto stuff)
- use this script to create containers to do CI of documentation on
  different distros, to make sure our instructions are all up to date,

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/poky.yaml.in                         | 234 ---------------------
 documentation/ref-manual/system-requirements.rst   |  82 +++++---
 .../tools/host_packages_scripts/almalinux_docs.sh  |   1 +
 .../host_packages_scripts/almalinux_docs_pdf.sh    |   1 +
 .../host_packages_scripts/almalinux_essential.sh   |   5 +
 .../tools/host_packages_scripts/fedora_docs.sh     |   1 +
 .../tools/host_packages_scripts/fedora_docs_pdf.sh |   1 +
 .../host_packages_scripts/fedora_essential.sh      |   1 +
 .../tools/host_packages_scripts/opensuse_docs.sh   |   1 +
 .../host_packages_scripts/opensuse_docs_pdf.sh     |   1 +
 .../host_packages_scripts/opensuse_essential.sh    |   2 +
 .../tools/host_packages_scripts/pip3_docs.sh       |   1 +
 .../tools/host_packages_scripts/ubuntu_docs.sh     |   1 +
 .../tools/host_packages_scripts/ubuntu_docs_pdf.sh |   1 +
 .../host_packages_scripts/ubuntu_essential.sh      |   1 +
 15 files changed, 65 insertions(+), 269 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 0933cbbd351985899ecaea94ae42748bd7ba1753..d637952bbed13b22afac95bd77aef9f2e35fa630 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -25,237 +25,3 @@ MIN_DISK_SPACE : "90"
 MIN_DISK_SPACE_RM_WORK : "40"
 # RAM (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) on a 4 core system
 MIN_RAM : "8"
-
-#
-# Dependencies
-#
-
-# Shared between distros
-PIP3_HOST_PACKAGES_DOC: sphinx sphinx_rtd_theme pyyaml
-
-UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
-  build-essential
-  chrpath
-  cpio
-  debianutils
-  diffstat
-  file
-  gawk
-  gcc
-  git
-  iputils-ping
-  libacl1
-  liblz4-tool
-  locales
-  python3
-  python3-git
-  python3-jinja2
-  python3-pexpect
-  python3-pip
-  python3-subunit
-  socat
-  texinfo
-  unzip
-  wget
-  xz-utils
-  zstd
-
-UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
-  git
-  librsvg2-bin
-  locales
-  make
-  python3-saneyaml
-  python3-sphinx-rtd-theme
-  sphinx
-
-UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF: >-
-  fonts-freefont-otf
-  latexmk
-  tex-gyre
-  texlive-fonts-extra
-  texlive-fonts-recommended
-  texlive-lang-all
-  texlive-latex-extra
-  texlive-latex-recommended
-  texlive-xetex
-
-FEDORA_HOST_PACKAGES_ESSENTIAL: >-
-  bzip2
-  ccache
-  chrpath
-  cpio
-  cpp
-  diffstat
-  diffutils
-  file
-  findutils
-  gawk
-  gcc
-  gcc-c++
-  git
-  glibc-devel
-  glibc-langpack-en
-  gzip
-  hostname
-  libacl
-  lz4
-  make
-  patch
-  perl
-  perl-Data-Dumper
-  perl-File-Compare
-  perl-File-Copy
-  perl-FindBin
-  perl-Text-ParseWords
-  perl-Thread-Queue
-  perl-bignum
-  perl-locale
-  python
-  python3
-  python3-GitPython
-  python3-jinja2
-  python3-pexpect
-  python3-pip
-  rpcgen
-  socat
-  tar
-  texinfo
-  unzip
-  wget
-  which
-  xz
-  zstd
-
-FEDORA_HOST_PACKAGES_DOC: >-
-  git
-  glibc-locale-source
-  librsvg2-tools
-  make
-  python3-pip
-  which
-
-FEDORA_HOST_PACKAGES_DOC_PDF: >-
-  'texlive-collection-lang*'
-  latexmk
-  texlive-collection-fontsextra
-  texlive-collection-fontsrecommended
-  texlive-collection-latex
-  texlive-collection-latexextra
-  texlive-collection-latexrecommended
-  texlive-collection-xetex
-  texlive-fncychap
-  texlive-gnu-freefont
-  texlive-tex-gyre
-  texlive-xetex
-
-OPENSUSE_HOST_PACKAGES_ESSENTIAL: >-
-  bzip2
-  chrpath
-  diffstat
-  gcc
-  gcc-c++
-  git
-  gzip
-  hostname
-  libacl1
-  lz4
-  make
-  makeinfo
-  patch
-  python
-  python-curses
-  python-xml
-  python3
-  python3-Jinja2
-  python3-curses
-  python3-pexpect
-  python3-pip
-  rpcgen
-  socat
-  tar
-  wget
-  which
-  xz
-  zstd
-
-OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
-
-OPENSUSE_HOST_PACKAGES_DOC: >-
-  git
-  glibc-i18ndata
-  make
-  python3-pip
-  rsvg-convert
-  which
-
-OPENSUSE_HOST_PACKAGES_DOC_PDF: >-
-  'texlive-collection-lang*'
-  texlive-collection-fontsextra
-  texlive-collection-fontsrecommended
-  texlive-collection-latex
-  texlive-collection-latexextra
-  texlive-collection-latexrecommended
-  texlive-collection-xetex
-  texlive-fncychap
-  texlive-gnu-freefont
-  texlive-latexmk
-  texlive-tex-gyre
-  texlive-xetex
-
-ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
-  bzip2
-  ccache
-  chrpath
-  cpio
-  cpp
-  diffstat
-  diffutils
-  gawk
-  gcc
-  gcc-c++
-  git
-  glibc-devel
-  glibc-langpack-en
-  gzip
-  libacl
-  lz4
-  make
-  patch
-  perl
-  perl-Data-Dumper
-  perl-Text-ParseWords
-  perl-Thread-Queue
-  python3
-  python3-GitPython
-  python3-jinja2
-  python3-pexpect
-  python3-pip
-  rpcgen
-  socat
-  tar
-  texinfo
-  unzip
-  wget
-  which
-  xz
-  zstd
-
-ALMALINUX_HOST_PACKAGES_DOC: >-
-  git
-  glibc-locale-source
-  librsvg2-tools
-  make
-  python3-pip
-  which
-
-ALMALINUX_HOST_PACKAGES_DOC_PDF: >-
-  latexmk
-  texlive-collection-fontsrecommended
-  texlive-collection-latex
-  texlive-collection-latexrecommended
-  texlive-collection-xetex
-  texlive-fncychap
-  texlive-gnu-freefont
-  texlive-tex-gyre
-  texlive-xetex
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index b087d374d23a71104dc9c050e96e4a2c20f5abb0..93b95a7fb251c4a0192c2d29a1dbf365eb69871e 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -158,9 +158,10 @@ Ubuntu and Debian
 -----------------
 
 Here are the packages needed to build an image on a headless system
-with a supported Ubuntu or Debian Linux distribution::
+with a supported Ubuntu or Debian Linux distribution:
 
-   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL;
+.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
+   :language: shell
 
 You also need to ensure you have the ``en_US.UTF-8`` locale enabled::
 
@@ -189,64 +190,71 @@ If this is not the case, you can reconfigure the ``locales`` package to add it
          $ sudo apt build-dep qemu
          $ sudo apt remove oss4-dev
 
-Here are the packages needed to build Project documentation manuals::
+Here are the packages needed to build Project documentation manuals:
 
-   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_DOC;
+.. literalinclude:: ../tools/host_packages_scripts/ubuntu_docs.sh
+   :language: shell
 
 In addition to the previous packages, here are the packages needed to build the
-documentation in PDF format::
+documentation in PDF format:
 
-   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF;
+.. literalinclude:: ../tools/host_packages_scripts/ubuntu_docs_pdf.sh
+   :language: shell
 
 Fedora Packages
 ---------------
 
 Here are the packages needed to build an image on a headless system
-with a supported Fedora Linux distribution::
+with a supported Fedora Linux distribution:
 
-   $ sudo dnf install &FEDORA_HOST_PACKAGES_ESSENTIAL;
+.. literalinclude:: ../tools/host_packages_scripts/fedora_essential.sh
+   :language: shell
 
-Here are the packages needed to build Project documentation manuals::
+Here are the packages needed to build Project documentation manuals:
 
-   $ sudo dnf install &FEDORA_HOST_PACKAGES_DOC;
-   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
+.. literalinclude:: ../tools/host_packages_scripts/fedora_docs.sh
+   :language: shell
+
+.. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
+   :language: shell
 
 In addition to the previous packages, here are the packages needed to build the
-documentation in PDF format::
+documentation in PDF format:
 
-   $ sudo dnf install &FEDORA_HOST_PACKAGES_DOC_PDF;
+.. literalinclude:: ../tools/host_packages_scripts/fedora_docs_pdf.sh
+   :language: shell
 
 openSUSE Packages
 -----------------
 
 Here are the packages needed to build an image on a headless system
-with a supported openSUSE distribution::
+with a supported openSUSE distribution:
 
-   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
-   $ sudo pip3 install &OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL;
+.. literalinclude:: ../tools/host_packages_scripts/opensuse_essential.sh
+   :language: shell
 
-Here are the packages needed to build Project documentation manuals::
+Here are the packages needed to build Project documentation manuals:
 
-   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_DOC;
-   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
+.. literalinclude:: ../tools/host_packages_scripts/opensuse_docs.sh
+   :language: shell
+
+.. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
+   :language: shell
 
 In addition to the previous packages, here are the packages needed to build the
-documentation in PDF format::
-
-   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_DOC_PDF;
+documentation in PDF format:
 
+.. literalinclude:: ../tools/host_packages_scripts/opensuse_docs_pdf.sh
+   :language: shell
 
 AlmaLinux Packages
 ------------------
 
 Here are the packages needed to build an image on a headless system
-with a supported AlmaLinux distribution::
+with a supported AlmaLinux distribution:
 
-   $ sudo dnf install -y epel-release
-   $ sudo yum install dnf-plugins-core
-   $ sudo dnf config-manager --set-enabled crb
-   $ sudo dnf makecache
-   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_ESSENTIAL;
+.. literalinclude:: ../tools/host_packages_scripts/almalinux_essential.sh
+   :language: shell
 
 .. note::
 
@@ -261,15 +269,13 @@ with a supported AlmaLinux distribution::
    -  The ``makecache`` command consumes additional Metadata from
       ``epel-release``.
 
-Here are the packages needed to build Project documentation manuals::
+Here are the packages needed to build Project documentation manuals:
 
-   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_DOC;
-   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
+.. literalinclude:: ../tools/host_packages_scripts/almalinux_docs.sh
+   :language: shell
 
-In addition to the previous packages, here are the packages needed to build the
-documentation in PDF format::
-
-   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_DOC_PDF;
+.. literalinclude:: ../tools/host_packages_scripts/pip3_docs.sh
+   :language: shell
 
 .. warning::
 
@@ -278,6 +284,12 @@ documentation in PDF format::
    ``texlive-collection-latexextra``, so you may run into issues. These may be
    installed using `tlmgr <https://tug.org/texlive/tlmgr.html>`_.
 
+In addition to the previous packages, here are the packages needed to build the
+documentation in PDF format:
+
+.. literalinclude:: ../tools/host_packages_scripts/almalinux_docs_pdf.sh
+   :language: shell
+
 .. _system-requirements-buildtools:
 
 Required Git, tar, Python, make and gcc Versions
diff --git a/documentation/tools/host_packages_scripts/almalinux_docs.sh b/documentation/tools/host_packages_scripts/almalinux_docs.sh
new file mode 100644
index 0000000000000000000000000000000000000000..8188d529a1e9b8034e5b14ed4e9e633e7ae0600b
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/almalinux_docs.sh
@@ -0,0 +1 @@
+sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which
diff --git a/documentation/tools/host_packages_scripts/almalinux_docs_pdf.sh b/documentation/tools/host_packages_scripts/almalinux_docs_pdf.sh
new file mode 100644
index 0000000000000000000000000000000000000000..8341eb8c252d50b8a5cd3ff09ff013b1d49249bf
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/almalinux_docs_pdf.sh
@@ -0,0 +1 @@
+sudo dnf install latexmk texlive-collection-fontsrecommended texlive-collection-latex texlive-collection-latexrecommended texlive-collection-xetex texlive-fncychap texlive-gnu-freefont texlive-tex-gyre texlive-xetex
diff --git a/documentation/tools/host_packages_scripts/almalinux_essential.sh b/documentation/tools/host_packages_scripts/almalinux_essential.sh
new file mode 100644
index 0000000000000000000000000000000000000000..16f25fa1f29c84d512df97988f527d1ea834bea7
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/almalinux_essential.sh
@@ -0,0 +1,5 @@
+sudo dnf install -y epel-release
+sudo yum install dnf-plugins-core
+sudo dnf config-manager --set-enabled crb
+sudo dnf makecache
+sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl lz4 make patch perl perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
diff --git a/documentation/tools/host_packages_scripts/fedora_docs.sh b/documentation/tools/host_packages_scripts/fedora_docs.sh
new file mode 100644
index 0000000000000000000000000000000000000000..8188d529a1e9b8034e5b14ed4e9e633e7ae0600b
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/fedora_docs.sh
@@ -0,0 +1 @@
+sudo dnf install git glibc-locale-source librsvg2-tools make python3-pip which
diff --git a/documentation/tools/host_packages_scripts/fedora_docs_pdf.sh b/documentation/tools/host_packages_scripts/fedora_docs_pdf.sh
new file mode 100644
index 0000000000000000000000000000000000000000..816f1c36ec35e046782d341bb70dff1834bfd8a1
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/fedora_docs_pdf.sh
@@ -0,0 +1 @@
+sudo dnf install 'texlive-collection-lang*' latexmk texlive-collection-fontsextra texlive-collection-fontsrecommended texlive-collection-latex texlive-collection-latexextra texlive-collection-latexrecommended texlive-collection-xetex texlive-fncychap texlive-gnu-freefont texlive-tex-gyre texlive-xetex
diff --git a/documentation/tools/host_packages_scripts/fedora_essential.sh b/documentation/tools/host_packages_scripts/fedora_essential.sh
new file mode 100644
index 0000000000000000000000000000000000000000..4841853e1e224683b563c8d6112446f0633a081b
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
@@ -0,0 +1 @@
+sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl lz4 make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
diff --git a/documentation/tools/host_packages_scripts/opensuse_docs.sh b/documentation/tools/host_packages_scripts/opensuse_docs.sh
new file mode 100644
index 0000000000000000000000000000000000000000..7d36eb0f99668168dc4fed44d71181338bdc59a3
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/opensuse_docs.sh
@@ -0,0 +1 @@
+sudo zypper install git glibc-i18ndata make python3-pip rsvg-convert which
diff --git a/documentation/tools/host_packages_scripts/opensuse_docs_pdf.sh b/documentation/tools/host_packages_scripts/opensuse_docs_pdf.sh
new file mode 100644
index 0000000000000000000000000000000000000000..ee9f07886ce1c0eac8e1d1118cda8ddc496f0139
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/opensuse_docs_pdf.sh
@@ -0,0 +1 @@
+sudo zypper install 'texlive-collection-lang*' texlive-collection-fontsextra texlive-collection-fontsrecommended texlive-collection-latex texlive-collection-latexextra texlive-collection-latexrecommended texlive-collection-xetex texlive-fncychap texlive-gnu-freefont texlive-latexmk texlive-tex-gyre texlive-xetex
diff --git a/documentation/tools/host_packages_scripts/opensuse_essential.sh b/documentation/tools/host_packages_scripts/opensuse_essential.sh
new file mode 100644
index 0000000000000000000000000000000000000000..a784f4a5dc05f3734177f08ed97663a04d20a978
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/opensuse_essential.sh
@@ -0,0 +1,2 @@
+sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname libacl1 lz4 make makeinfo patch python python-curses python-xml python3 python3-Jinja2 python3-curses python3-pexpect python3-pip rpcgen socat tar wget which xz zstd
+sudo pip3 install GitPython
diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
new file mode 100644
index 0000000000000000000000000000000000000000..fd6ad98053fb6aa1ff55669191dc99578c830455
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
@@ -0,0 +1 @@
+sudo pip3 install sphinx sphinx_rtd_theme pyyaml
diff --git a/documentation/tools/host_packages_scripts/ubuntu_docs.sh b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
new file mode 100644
index 0000000000000000000000000000000000000000..d2a1832e279057519321a1fb7820efd60d886564
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
@@ -0,0 +1 @@
+sudo apt install git librsvg2-bin locales make python3-saneyaml python3-saneyaml python3-sphinx-rtd-theme sphinx
diff --git a/documentation/tools/host_packages_scripts/ubuntu_docs_pdf.sh b/documentation/tools/host_packages_scripts/ubuntu_docs_pdf.sh
new file mode 100644
index 0000000000000000000000000000000000000000..d6310bd21deae81df32d0cb843aab4a5622ac4fa
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/ubuntu_docs_pdf.sh
@@ -0,0 +1 @@
+sudo apt install fonts-freefont-otf latexmk tex-gyre texlive-fonts-extra texlive-fonts-recommended texlive-lang-all texlive-latex-extra texlive-latex-recommended texlive-xetex
diff --git a/documentation/tools/host_packages_scripts/ubuntu_essential.sh b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
new file mode 100644
index 0000000000000000000000000000000000000000..f3388c88c93d885e3b035651e434c669654ee241
--- /dev/null
+++ b/documentation/tools/host_packages_scripts/ubuntu_essential.sh
@@ -0,0 +1 @@
+sudo apt-get install build-essential chrpath cpio debianutils diffstat file gawk gcc git iputils-ping libacl1 liblz4-tool locales python3 python3-git python3-jinja2 python3-pexpect python3-pip python3-subunit socat texinfo unzip wget xz-utils zstd

-- 
2.47.1


