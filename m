Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22822E77184
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 15:27:30 +0000 (UTC)
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
 by mx.groups.io with SMTP id smtpd.web10.12917.1733844440497821821
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 07:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.12, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Y72fG5MjXzjgg;
	Tue, 10 Dec 2024 16:27:18 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Y72fG2qd8zS82;
	Tue, 10 Dec 2024 16:27:18 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 10 Dec 2024 16:26:44 +0100
Subject: [PATCH RFC 1/2] docs: use literalinclude for system requirements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-instructions-shell-container-v1-1-6a7cdc404ff4@cherry.de>
References: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de>
In-Reply-To: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 15:27:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5925

From: Quentin Schulz <quentin.schulz@cherry.de>

The YAML variables for the host dependencies are updated by hand and
actually only used inside code blocks.

It's also slowly getting more difficult to make sense of the content of
those variables as they are both the list of packages to install with
the distro's package manager and sometimes additional commands, which
all need to have the indentation of the block where the variable is used
matched. This is impossible so we just guess it's going to be at a
specific indentation.

Instead, let's migrate all instructions into separate shell scripts that
are then literalinclude'd into the Sphinx documentation.

This allows a few things:
- ability to run shellcheck on the scripts if we ever want to
- manually calling the appropriate script from a supported distro to
  build stuff (distro or bitbake/yocto stuff)
- use this script to create containers to do CI of documentation on
  different distros, to make sure our instructions are all up to date,

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/poky.yaml.in                         | 26 -------------
 documentation/ref-manual/system-requirements.rst   | 45 ++++++++++++----------
 .../tools/almalinux_host_packages_docs.sh          |  2 +
 .../tools/almalinux_host_packages_essential.sh     |  5 +++
 documentation/tools/fedora_host_packages_docs.sh   |  2 +
 .../tools/fedora_host_packages_essential.sh        |  1 +
 documentation/tools/opensuse_host_packages_docs.sh |  2 +
 .../tools/opensuse_host_packages_essential.sh      |  2 +
 documentation/tools/ubuntu_host_packages_docs.sh   |  2 +
 .../tools/ubuntu_host_packages_essential.sh        |  2 +
 10 files changed, 42 insertions(+), 47 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index c770318f2be76cca3ea23a25d819ace46d157b4c..4f4684be4bf7f95ff0263a01136f8ee5a30f1937 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -10,32 +10,6 @@ BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
-UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
-     build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
-     xz-utils debianutils iputils-ping python3-git python3-jinja2 \
-     python3-subunit zstd liblz4-tool file locales libacl1
-     \n\   $ sudo locale-gen en_US.UTF-8"
-FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
-     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
-     ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
-     python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 rpcgen perl-FindBin perl-File-Compare \
-     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en libacl"
-OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
-     diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 rpcgen \
-     zstd lz4 bzip2 gzip hostname libacl1
-     \n\   $ sudo pip3 install GitPython"
-ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
-     \n\   $ sudo yum install dnf-plugins-core
-     \n\   $ sudo dnf config-manager --set-enabled crb
-     \n\   $ sudo dnf makecache
-     \n\   $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
-     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
-     socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
-     python3-GitPython python3-jinja2 python3-pexpect xz which \
-     rpcgen zstd lz4 cpio glibc-langpack-en libacl"
-PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 0fc92550a51ac62c39859acc63002ac065559e2a..0660d830ec2dc903fa4660a3ac62043661d955b1 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -148,9 +148,10 @@ Ubuntu and Debian
 -----------------
 
 Here are the packages needed to build an image on a headless system
-with a supported Ubuntu or Debian Linux distribution::
+with a supported Ubuntu or Debian Linux distribution:
 
-   $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
+   .. literalinclude:: ../tools/ubuntu_host_packages_essential.sh
+      :language: shell
 
 .. note::
 
@@ -162,45 +163,47 @@ with a supported Ubuntu or Debian Linux distribution::
          $ sudo apt build-dep qemu
          $ sudo apt remove oss4-dev
 
-Here are the packages needed to build Project documentation manuals::
+Here are the packages needed to build Project documentation manuals:
 
-   $ sudo apt install git make inkscape texlive-latex-extra
-   $ sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme
+   .. literalinclude:: ../tools/ubuntu_host_packages_docs.sh
+      :language: shell
 
 Fedora Packages
 ---------------
 
 Here are the packages needed to build an image on a headless system
-with a supported Fedora Linux distribution::
+with a supported Fedora Linux distribution:
 
-   $ sudo dnf install &FEDORA_HOST_PACKAGES_ESSENTIAL;
+   .. literalinclude:: ../tools/fedora_host_packages_essential.sh
+      :language: shell
 
-Here are the packages needed to build Project documentation manuals::
+Here are the packages needed to build Project documentation manuals:
 
-   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
-   &PIP3_HOST_PACKAGES_DOC;
+   .. literalinclude:: ../tools/fedora_host_packages_docs.sh
+      :language: shell
 
 openSUSE Packages
 -----------------
 
 Here are the packages needed to build an image on a headless system
-with a supported openSUSE distribution::
+with a supported openSUSE distribution:
 
-   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
+   .. literalinclude:: ../tools/opensuse_host_packages_essential.sh
+      :language: shell
 
-Here are the packages needed to build Project documentation manuals::
-
-   $ sudo zypper install git make python3-pip which inkscape texlive-fncychap
-   &PIP3_HOST_PACKAGES_DOC;
+Here are the packages needed to build Project documentation manuals:
 
+   .. literalinclude:: ../tools/opensuse_host_packages_docs.sh
+      :language: shell
 
 AlmaLinux Packages
 ------------------
 
 Here are the packages needed to build an image on a headless system
-with a supported AlmaLinux distribution::
+with a supported AlmaLinux distribution:
 
-   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_ESSENTIAL;
+   .. literalinclude:: ../tools/almalinux_host_packages_essential.sh
+      :language: shell
 
 .. note::
 
@@ -215,10 +218,10 @@ with a supported AlmaLinux distribution::
    -  The ``makecache`` command consumes additional Metadata from
       ``epel-release``.
 
-Here are the packages needed to build Project documentation manuals::
+Here are the packages needed to build Project documentation manuals:
 
-   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
-   &PIP3_HOST_PACKAGES_DOC;
+   .. literalinclude:: ../tools/almalinux_host_packages_docs.sh
+      :language: shell
 
 .. _system-requirements-buildtools:
 
diff --git a/documentation/tools/almalinux_host_packages_docs.sh b/documentation/tools/almalinux_host_packages_docs.sh
new file mode 100644
index 0000000000000000000000000000000000000000..93ed34ce01d803e85c67e01f75dc82ed53d864f0
--- /dev/null
+++ b/documentation/tools/almalinux_host_packages_docs.sh
@@ -0,0 +1,2 @@
+sudo dnf install git make python3-pip which inkscape texlive-fncychap
+sudo pip3 install sphinx sphinx_rtd_theme pyyaml
diff --git a/documentation/tools/almalinux_host_packages_essential.sh b/documentation/tools/almalinux_host_packages_essential.sh
new file mode 100644
index 0000000000000000000000000000000000000000..d2c5168e0bb53bfe14785b2f36220917ac55282e
--- /dev/null
+++ b/documentation/tools/almalinux_host_packages_essential.sh
@@ -0,0 +1,5 @@
+sudo dnf install -y epel-release
+sudo yum install dnf-plugins-core
+sudo dnf config-manager --set-enabled crb
+sudo dnf makecache
+sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip python3-GitPython python3-jinja2 python3-pexpect xz which rpcgen zstd lz4 cpio glibc-langpack-en libacl
diff --git a/documentation/tools/fedora_host_packages_docs.sh b/documentation/tools/fedora_host_packages_docs.sh
new file mode 100644
index 0000000000000000000000000000000000000000..93ed34ce01d803e85c67e01f75dc82ed53d864f0
--- /dev/null
+++ b/documentation/tools/fedora_host_packages_docs.sh
@@ -0,0 +1,2 @@
+sudo dnf install git make python3-pip which inkscape texlive-fncychap
+sudo pip3 install sphinx sphinx_rtd_theme pyyaml
diff --git a/documentation/tools/fedora_host_packages_essential.sh b/documentation/tools/fedora_host_packages_essential.sh
new file mode 100644
index 0000000000000000000000000000000000000000..448a6e5f1038838132603db0d993fb80eabf75ef
--- /dev/null
+++ b/documentation/tools/fedora_host_packages_essential.sh
@@ -0,0 +1 @@
+sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython python3-jinja2 rpcgen perl-FindBin perl-File-Compare perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en libacl
diff --git a/documentation/tools/opensuse_host_packages_docs.sh b/documentation/tools/opensuse_host_packages_docs.sh
new file mode 100644
index 0000000000000000000000000000000000000000..90f52d576451ee0a7c481b31b7605e4a870496cd
--- /dev/null
+++ b/documentation/tools/opensuse_host_packages_docs.sh
@@ -0,0 +1,2 @@
+sudo zypper install git make python3-pip which inkscape texlive-fncychap
+sudo pip3 install sphinx sphinx_rtd_theme pyyaml
diff --git a/documentation/tools/opensuse_host_packages_essential.sh b/documentation/tools/opensuse_host_packages_essential.sh
new file mode 100644
index 0000000000000000000000000000000000000000..ef24fcefd99c9ecc335c594965965bb36e43cd05
--- /dev/null
+++ b/documentation/tools/opensuse_host_packages_essential.sh
@@ -0,0 +1,2 @@
+sudo zypper install python gcc gcc-c++ git chrpath make wget python-xml diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip python3-pexpect xz which python3-Jinja2 rpcgen zstd lz4 bzip2 gzip hostname libacl1
+sudo pip3 install GitPython
diff --git a/documentation/tools/ubuntu_host_packages_docs.sh b/documentation/tools/ubuntu_host_packages_docs.sh
new file mode 100644
index 0000000000000000000000000000000000000000..1bfb256e34ba931784bcf97a60e211520c70a199
--- /dev/null
+++ b/documentation/tools/ubuntu_host_packages_docs.sh
@@ -0,0 +1,2 @@
+sudo apt install git make inkscape texlive-latex-extra
+sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme
diff --git a/documentation/tools/ubuntu_host_packages_essential.sh b/documentation/tools/ubuntu_host_packages_essential.sh
new file mode 100644
index 0000000000000000000000000000000000000000..5cab5b34068e3886fb2fb06ea66120a2ae12e3a3
--- /dev/null
+++ b/documentation/tools/ubuntu_host_packages_essential.sh
@@ -0,0 +1,2 @@
+sudo apt-get install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 python3-subunit zstd liblz4-tool file locales libacl1
+sudo locale-gen en_US.UTF-8

-- 
2.47.1


