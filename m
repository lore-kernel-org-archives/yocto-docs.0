Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D63CE77174
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 12:23:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.12808.1733315022327714800
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 04:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iELhy9VX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2A591BF207;
	Wed,  4 Dec 2024 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733315020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Qor3LfcYJQpDcXihpZXD/4WOU+aOpc6/nnwk+tyPk8=;
	b=iELhy9VXwJInhJZ3FHErQ3tDUWx8fKrI41QOyx9BQulO8+Ro4THFI40T9iTK8HzTdVZsyH
	28LBf2f9Ez2AqDIR4xuTWxWa33XeJjnyoaHr8NXPqXGMPAWxXbqmk8EarttadtNyOrRZyp
	k4Bgwl1pjOGKLeTu7odOHm6n+v7nmmA7SqpCaSG+Jgb81kYxB+xpvA5gH5cjZn7X/9OzGL
	j989ZBR/dQojrLdn7yMklB9hHguue/LhuUbjuH56Odz7rmIBte5nk2KmrO/syxV9buqJM8
	JiW4Gpib/kCGdwDcpT5XlV2JzJBU5ZA+rhDjRV4dM5aJBeqs7GtIN5Br24SA+g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 04 Dec 2024 13:23:09 +0100
Subject: [yocto-docs PATCH v2 1/6] Gather dependencies in poky.yaml.in
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241204-update-doc-deps-v2-1-1d9b4063476f@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
In-Reply-To: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9522;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Awd8RvoTWM1q6ya3fCklQmTLygWzPm1Oxp0b/pcrRtQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnUEnLevK4Ici/Wgmv65G+DSGYXZ8LrMNYMi/yt
 max6YZAfzuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1BJywAKCRDRgEFAKaOo
 Ni/+EACfijl4z1C4HUcNu5iO+vshjC/3pqTyWSiv4hSp0/1NLJ4OOdXzr+hLgQmaYSsl9yFUpi5
 9DluHKaQC7kwXtNnk6gbBHgh+gxoLgCNypcCpy+IbUvcz1kFPTR7zFR5n6Dunzev9VXtxOnyyz3
 VZfysAda+Zf7Q/Lxfav00uePtso9iw3zcNjyqwyxo2+bSxNMeRvZIDP8cpiTAuZyNdQAqsqS5yT
 GHRexwcf1xwNI1mK71NhxOmB1b1Cljn1Sl4OfTYX4HKz8erQRzamED28T1JgTyJjR0dw65p05+v
 6YRC5PbwWIhjbYh7cngiHuXv5PbItQC8NInOfZqemN4s3MK7iEMa0gRi0ipvnlg3XeuL3mmVODT
 WjnjibRXHfGYy7ncZvo82J2eJCJoiSbvR7Eiik4W7CSAJWTAf3RURwIO8Q0qtuRkGD6PLcyzUyY
 ItoOQrrgGmlNMAdiVeS+oJYSUcNnwYobcRnxjgJUbX0zo6kI0caqQlyu7WcpD8qosVqsVrp+ut8
 CcVu4dV95N3SS+16OrHhJXFK4VQOB/OwAMe82Z6NaCCslHXprk/iWEi4gkEpw5jnJinvwH7c+eZ
 SfebQFsBXkxCWMZumkEz0vLbxJHbNs0N2r7lfXPud5b5C2o1VEqulQ4IsZHAlSCPtIWt9DihYix
 SuJMKXdKmKRRUmg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 12:23:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5883

We used to have packages here and there in system-requirements.rst for
each distro. Instead, gather all the dependencies in poky.yaml.in so we
have an overview of what we provide for each distro.

Use yaml ">" to list the dependencies in alphabetical order, one entry
per line, which makes them easier to read and compare among distros.

Rename UBUNTU_… variables to UBUNTU_DEBIAN_…, since these are used for
both distros.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst     |   2 +-
 documentation/poky.yaml.in                       | 218 ++++++++++++++++++++---
 documentation/ref-manual/system-requirements.rst |  22 ++-
 3 files changed, 207 insertions(+), 35 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index c5400e4ac8dafb9e3d1e4c14a065d02ac3e2f7a7..3d249eefaae35239b92c8a2f8dedf27ec2dbdca0 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -78,7 +78,7 @@ You must install essential host packages on your build host. The
 following command installs the host packages based on an Ubuntu
 distribution::
 
-   $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
+   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL;
 
 .. note::
 
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 66f758fe85fcd10291f00902639b43a1da639b0f..d03809f557960d10a6b9a2753a65c80937c62e13 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -1,3 +1,7 @@
+#
+# Macros used in the documentation
+#
+
 DISTRO : "5.1"
 DISTRO_NAME_NO_CAP : "styhead"
 DISTRO_NAME : "Styhead"
@@ -10,31 +14,6 @@ BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
-UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
-     build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
-     xz-utils debianutils iputils-ping python3-git python3-jinja2 \
-     python3-subunit zstd liblz4-tool file locales libacl1"
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
@@ -46,3 +25,192 @@ MIN_DISK_SPACE : "90"
 MIN_DISK_SPACE_RM_WORK : "40"
 # RAM (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64) on a 4 core system
 MIN_RAM : "8"
+
+#
+# Dependencies
+#
+
+# Shared between distros
+PIP3_HOST_PACKAGES_DOC: sphinx sphinx_rtd_theme pyyaml
+
+UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
+  build-essential
+  chrpath
+  cpio
+  debianutils
+  diffstat
+  file
+  gawk
+  gcc
+  git
+  iputils-ping
+  libacl1
+  liblz4-tool
+  locales
+  python3
+  python3-git
+  python3-jinja2
+  python3-pexpect
+  python3-pip
+  python3-subunit
+  socat
+  texinfo
+  unzip
+  wget
+  xz-utils
+  zstd
+
+UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
+  git
+  inkscape
+  make
+  python3-saneyaml
+  python3-sphinx-rtd-theme
+  sphinx
+  texlive-latex-extra
+
+
+FEDORA_HOST_PACKAGES_ESSENTIAL: >-
+  bzip2
+  ccache
+  chrpath
+  cpio
+  cpp
+  diffstat
+  diffutils
+  file
+  findutils
+  gawk
+  gcc
+  gcc-c++
+  git
+  glibc-devel
+  glibc-langpack-en
+  gzip
+  hostname
+  libacl
+  lz4
+  make
+  patch
+  perl
+  perl-Data-Dumper
+  perl-File-Compare
+  perl-File-Copy
+  perl-FindBin
+  perl-Text-ParseWords
+  perl-Thread-Queue
+  perl-bignum
+  perl-locale
+  python
+  python3
+  python3-GitPython
+  python3-jinja2
+  python3-pexpect
+  python3-pip
+  rpcgen
+  socat
+  tar
+  texinfo
+  unzip
+  wget
+  which
+  xz
+  zstd
+
+FEDORA_HOST_PACKAGES_DOC: >-
+  git
+  inkscape
+  make
+  python3-pip
+  python3-saneyaml
+  python3-sphinx-rtd-theme
+  sphinx
+  texlive-fncychap
+  texlive-latex-extra
+  which
+
+OPENSUSE_HOST_PACKAGES_ESSENTIAL: >-
+  bzip2
+  chrpath
+  diffstat
+  gcc
+  gcc-c++
+  git
+  gzip
+  hostname
+  libacl1
+  lz4
+  make
+  makeinfo
+  patch
+  python
+  python-curses
+  python-xml
+  python3
+  python3-Jinja2
+  python3-curses
+  python3-pexpect
+  python3-pip
+  rpcgen
+  socat
+  tar
+  wget
+  which
+  xz
+  zstd
+
+OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
+
+OPENSUSE_HOST_PACKAGES_DOC: >-
+  git
+  inkscape
+  make
+  python3-pip
+  texlive-fncychap
+  which
+
+ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
+  bzip2
+  ccache
+  chrpath
+  cpio
+  cpp
+  diffstat
+  diffutils
+  gawk
+  gcc
+  gcc-c++
+  git
+  glibc-devel
+  glibc-langpack-en
+  gzip
+  libacl
+  lz4
+  make
+  patch
+  perl
+  perl-Data-Dumper
+  perl-Text-ParseWords
+  perl-Thread-Queue
+  python3
+  python3-GitPython
+  python3-jinja2
+  python3-pexpect
+  python3-pip
+  rpcgen
+  socat
+  tar
+  texinfo
+  unzip
+  wget
+  which
+  xz
+  zstd
+
+ALMALINUX_HOST_PACKAGES_DOC: >-
+  git
+  inkscape
+  make
+  python3-pip
+  texlive-fncychap
+  which
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 43c3c5834b1a3c7d164512a9b42b68e06eacaafa..0b40c3f5e5ae87d703d9a2d338de084ca9f93b2b 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -150,7 +150,7 @@ Ubuntu and Debian
 Here are the packages needed to build an image on a headless system
 with a supported Ubuntu or Debian Linux distribution::
 
-   $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
+   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL;
 
 You also need to ensure you have the ``en_US.UTF-8`` locale enabled::
 
@@ -181,8 +181,7 @@ If this is not the case, you can reconfigure the ``locales`` package to add it
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo apt install git make inkscape texlive-latex-extra
-   $ sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme
+   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_DOC;
 
 Fedora Packages
 ---------------
@@ -194,8 +193,8 @@ with a supported Fedora Linux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
-   &PIP3_HOST_PACKAGES_DOC;
+   $ sudo dnf install &FEDORA_HOST_PACKAGES_DOC;
+   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
 openSUSE Packages
 -----------------
@@ -204,11 +203,12 @@ Here are the packages needed to build an image on a headless system
 with a supported openSUSE distribution::
 
    $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
+   $ sudo pip3 install &OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL;
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo zypper install git make python3-pip which inkscape texlive-fncychap
-   &PIP3_HOST_PACKAGES_DOC;
+   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_DOC;
+   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
 
 AlmaLinux Packages
@@ -217,6 +217,10 @@ AlmaLinux Packages
 Here are the packages needed to build an image on a headless system
 with a supported AlmaLinux distribution::
 
+   $ sudo dnf install -y epel-release
+   $ sudo yum install dnf-plugins-core
+   $ sudo dnf config-manager --set-enabled crb
+   $ sudo dnf makecache
    $ sudo dnf install &ALMALINUX_HOST_PACKAGES_ESSENTIAL;
 
 .. note::
@@ -234,8 +238,8 @@ with a supported AlmaLinux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
-   &PIP3_HOST_PACKAGES_DOC;
+   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_DOC;
+   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
 .. _system-requirements-buildtools:
 

-- 
2.46.1


