Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1F8D711B0
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:11:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15734.1732115456462042836
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 07:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BBAgQW7i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC86824000B;
	Wed, 20 Nov 2024 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732115455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=79HnPlN6P6auCtAqTJOM3IKJoiuk1WeZvcf6vA5umuQ=;
	b=BBAgQW7i9iEpN4ZKssWeiOvlX9jK3XjVkxC1rzSFzaw1zgNe9dXDGxJpIiw2DCkJi7Oess
	b55I2L4wqhaxF9uW+rLmn8JgQYUZXVue0TNd/hI4PEWiZ5VJ6PE/0vJHvafsAYEUsRzdCu
	rui5ymfCtoKcBWiiIRGz0/R3CIcd00naltUO2AFncFPyOqukhLKzRBesvFBwJGnv0QhxF2
	ZWw1rcXZQ0zMGL62q/X9w4xWVd4ki00ZC+TIKKZb7YcgLiQHUCHia8+xwK2cpmTSGqgjqQ
	rBDRt9qMwkbfFr5ei84gYAwYzhNVh9wegotVe4lP6COe4ME2JbcKd6FHWOPenA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 20 Nov 2024 16:10:34 +0100
Subject: [yocto-docs PATCH 1/5] Gather dependencies in poky.yaml.in
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241120-update-doc-deps-v1-1-50e267ae4123@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
In-Reply-To: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9768;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=d9rNK0N7J7rle9KwKQ3z6OJOkx3TIXbta5dI1ILB9OI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnPfv9GMx6DtNtzEUBZ7dl5ImISQ0j6o7tp8Q5K
 DBcRHyBZ+KJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZz37/QAKCRDRgEFAKaOo
 NiMWEADLSkzoEDHh1uCfFvXjNQU0z1yrZY0XA8maYGw7fQDS10gGIAC1Zh7mc76rCMSp22CqXoS
 rvaQOIeVzKrCUlDPd89uvA2uUDCwB/3h3rsCS+YQxU3rhOFc2GUJcYdHuoT3nuX+bjrNlBT3mcR
 Z5SzwbNtVZHdlm7bUwAzgivmCeRbgqV1u6R3dk286bca82R/lDQ3QyQJaLkzw5Xcu6V4nhtm5Tg
 FQ4EXt4v8DiVOt615Ac4Mkt+B0YbdmKmbHCH3WXGmQr7hnY+pYph3g+LI76hW7DJZhpSfNKfEjs
 ZI9G1NwLW4wxNoFG9ArwFw8yx8yUZUIK9ZtJD96mBnHIbPT0QAjciEBFKuOIL91IiMqCW7bgMsB
 MCYtGy68w4mjpVIvBByIa91Z23lFIwUW7Efuymxsvg7vPYDeb/c7rlt+xSsZ6h13KzkiFe4k40r
 iK3PSWfM2FO6OvgzcArYoXxHEDmrnmX937Q1lUaxEuA2xY8zSCc0Kaz99SQzKPd0qn5jFudD/ST
 4kBlmpfv/dSgqI6JaIPl7643kc+8gUIOC4UzbKrisF6L0NiljQABnH49ARxT+PUNat6a7PueOs5
 ES2Tr4YUGoi7MjgfEhXEMk7R+ovvR3LsvThPs1Rh9tPR2hJPWz8VvIstqa/poMlNXGU/aNAkv4F
 jGrIY+dkLNYPsSA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Nov 2024 15:11:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5774

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
 documentation/poky.yaml.in                       | 228 ++++++++++++++++++++---
 documentation/ref-manual/system-requirements.rst |  20 +-
 3 files changed, 214 insertions(+), 36 deletions(-)

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
index 66f758fe85fcd10291f00902639b43a1da639b0f..b840320a89bfadb259d5d9d0e11f951c55e13389 100644
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
@@ -46,3 +25,202 @@ MIN_DISK_SPACE : "90"
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
+  make
+  inkscape
+  texlive-latex-extra
+  sphinx
+  python3-saneyaml
+  python3-sphinx-rtd-theme
+  git
+  make
+  python3-pip
+  which
+  texlive-fncychap
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
+# note: indent below is for sphinx's code block (three spaces)
+ALMALINUX_HOST_PACKAGES_ESSENTIAL_CMDS: |-
+     $ sudo dnf install -y epel-release
+     $ sudo yum install dnf-plugins-core
+     $ sudo dnf config-manager --set-enabled crb
+     $ sudo dnf makecache
+     $ sudo dnf install &ALMALINUX_HOST_PACKAGES_ESSENTIAL;
+
+ALMALINUX_HOST_PACKAGES_DOC: >-
+  git
+  inkscape
+  make
+  python3-pip
+  texlive-fncychap
+  which
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index b33518c7f1e0c76caa70a719e023b9c405b744e2..ca75f849d0ad10344900c7525f7163726ffe5400 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -150,7 +150,7 @@ Ubuntu and Debian
 Here are the packages needed to build an image on a headless system
 with a supported Ubuntu or Debian Linux distribution::
 
-   $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
+   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL;
 
 You also need to ensure you have the locale ``en_US.UTF-8`` enabled::
 
@@ -172,8 +172,7 @@ If this is not the case, you can reconfigure the ``locales`` package to add it::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo apt install git make inkscape texlive-latex-extra
-   $ sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme
+   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_DOC;
 
 Fedora Packages
 ---------------
@@ -185,8 +184,8 @@ with a supported Fedora Linux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
-   &PIP3_HOST_PACKAGES_DOC;
+   $ sudo dnf install &FEDORA_HOST_PACKAGES_DOC;
+   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
 openSUSE Packages
 -----------------
@@ -195,11 +194,12 @@ Here are the packages needed to build an image on a headless system
 with a supported openSUSE distribution::
 
    $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
+   $ sudo pip3 install &OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL;
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo zypper install git make python3-pip which inkscape texlive-fncychap
-   &PIP3_HOST_PACKAGES_DOC;
+   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_DOC;
+   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
 
 AlmaLinux Packages
@@ -208,7 +208,7 @@ AlmaLinux Packages
 Here are the packages needed to build an image on a headless system
 with a supported AlmaLinux distribution::
 
-   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_ESSENTIAL;
+&ALMALINUX_HOST_PACKAGES_ESSENTIAL_CMDS;
 
 .. note::
 
@@ -225,8 +225,8 @@ with a supported AlmaLinux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
-   &PIP3_HOST_PACKAGES_DOC;
+   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_DOC;
+   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
 
 .. _system-requirements-buildtools:
 

-- 
2.46.1


