Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32F0C54E59
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.12665.1709042502687453718
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=obzXHiqO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ECCEE0014;
	Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=js1fErLrJGGSE7dFQmISvrvV6z8jwMudw02kJDWYt0Q=;
	b=obzXHiqOd+DKJRWU3SrWbBW6wXsNfCIt+hUeD8AO435/lAf+g2Kq8rpw7Iixl2XSUH5eNJ
	LrmqwdrCGSEeg6SQutnSzNZGMyqxO5NZoH00xufFIdAWLXniqhJpmJdMmQUpSH+zSTSHrm
	uysULASSA0r2wJvWVxoNdV9oFvBL0LEQgdmYOtp9yO9n8W0DqAVSF6XtTYmbz68IMbaoDx
	Y4EEeP/zgJlTf/7ZD6IptsYhnOrq8qloI2j1Mk3w54nxD6c+TUNxkF1+7YjrWKZeB2yrsQ
	6QTUKggcvpxDGM7X0Kg4IVa9mI33AmWp3pOW7/xBhI/rTVIF6HgJHzf6gpvT2Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 13/16] ref-manual: system-requirements.rst: simplify supported distro requirements
Date: Tue, 27 Feb 2024 15:01:25 +0100
Message-Id: <20240227140128.481522-14-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4904

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- This allows to continue sharing the updated Ubuntu/Debian requirements
  with the brief-yoctoprojectqs/index.rst without indentation mismatches
  (caused by using the same macro in two different contexts: in direct
  text and in a bullet list).

- Update poky.yaml.in to adapt the number of spaces at the beginning
  of lines.

- brief-yoctoprojectqs/index.rst: fix bad number of spaces
  before quote block.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst  |   6 +-
 documentation/poky.yaml.in                    |  25 ++--
 .../ref-manual/system-requirements.rst        | 120 ++++++------------
 3 files changed, 48 insertions(+), 103 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index f52b7fa0e0..db17437aa8 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -76,11 +76,9 @@ Build Host Packages
 
 You must install essential host packages on your build host. The
 following command installs the host packages based on an Ubuntu
-distribution:
+distribution::
 
-.. code-block:: shell
-
-  $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
+   $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
 
 .. note::
 
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 8c6549d571..b9cdd844e4 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -13,7 +13,8 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool"
+     python3-subunit mesa-common-dev zstd liblz4-tool file locales
+     \n\   $ sudo locale-gen en_US.UTF-8"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
@@ -22,20 +23,14 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
      perl-File-Copy perl-locale zstd lz4"
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel \
-     zstd lz4
-     \n\      $ sudo pip3 install GitPython"
-CENTOS7_HOST_PACKAGES_ESSENTIAL : "-y epel-release
-     \n\      $ sudo yum makecache
-     \n\      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
-     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
-     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip xz \
-     which SDL-devel xterm mesa-libGL-devel zstd lz4
-     \n\      $ sudo pip3 install GitPython jinja2"
-CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
-     \n\      $ sudo dnf config-manager --set-enabled PowerTools
-     \n\      $ sudo dnf makecache
-     \n\      $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
+     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
+     zstd lz4 bzip2 gzip hostname
+     \n\   $ sudo pip3 install GitPython"
+ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
+     \n\   $ sudo yum install dnf-plugins-core
+     \n\   $ sudo dnf config-manager --set-enabled crb
+     \n\   $ sudo dnf makecache
+     \n\   $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel xterm \
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 8499c1b1e8..c5fe4da036 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -155,8 +155,10 @@ function.
 Ubuntu and Debian
 -----------------
 
-Here are the required packages by function given a
-supported Ubuntu or Debian Linux distribution:
+Here are the packages needed to build an image on a headless system
+with a supported Ubuntu or Debian Linux distribution::
+
+   $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
 
 .. note::
 
@@ -168,21 +170,10 @@ supported Ubuntu or Debian Linux distribution:
          $ sudo apt build-dep qemu
          $ sudo apt remove oss4-dev
 
-   -  For Debian-8, ``python3-git`` and ``pylint3`` are no longer
-      available via ``apt``.
-      ::
-
-         $ sudo pip3 install GitPython pylint==1.9.5
-
--  *Essentials:* Packages needed to build an image on a headless system::
+Here are the packages needed to build Project documentation manuals::
 
-      $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
-
--  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals::
-
-      $ sudo apt install make python3-pip
-      &PIP3_HOST_PACKAGES_DOC;
+   $ sudo apt install make python3-pip inkscape texlive-latex-extra
+   &PIP3_HOST_PACKAGES_DOC;
 
    .. note::
 
@@ -193,94 +184,55 @@ supported Ubuntu or Debian Linux distribution:
 Fedora Packages
 ---------------
 
-Here are the required packages by function given a
-supported Fedora Linux distribution:
-
--  *Essentials:* Packages needed to build an image for a headless
-   system::
+Here are the packages needed to build an image on a headless system
+with a supported Fedora Linux distribution::
 
-      $ sudo dnf install &FEDORA_HOST_PACKAGES_ESSENTIAL;
+   $ sudo dnf install &FEDORA_HOST_PACKAGES_ESSENTIAL;
 
--  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals::
+Here are the packages needed to build Project documentation manuals::
 
-      $ sudo dnf install make python3-pip which
-      &PIP3_HOST_PACKAGES_DOC;
+   $ sudo dnf install make python3-pip which inkscape texlive-fncychap
+   &PIP3_HOST_PACKAGES_DOC;
 
 openSUSE Packages
 -----------------
 
-Here are the required packages by function given a
-supported openSUSE Linux distribution:
-
--  *Essentials:* Packages needed to build an image for a headless
-   system::
-
-      $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
-
--  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals::
-
-      $ sudo zypper install make python3-pip which
-      &PIP3_HOST_PACKAGES_DOC;
-
-
-CentOS-7 Packages
------------------
-
-Here are the required packages by function given a
-supported CentOS-7 Linux distribution:
+Here are the packages needed to build an image on a headless system
+with a supported openSUSE distribution::
 
--  *Essentials:* Packages needed to build an image for a headless
-   system::
+   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
 
-      $ sudo yum install &CENTOS7_HOST_PACKAGES_ESSENTIAL;
+Here are the packages needed to build Project documentation manuals::
 
-   .. note::
-
-      -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is
-         a collection of packages from Fedora built on RHEL/CentOS for
-         easy installation of packages not included in enterprise Linux
-         by default. You need to install these packages separately.
+   $ sudo zypper install make python3-pip which inkscape texlive-fncychap
+   &PIP3_HOST_PACKAGES_DOC;
 
-      -  The ``makecache`` command consumes additional Metadata from
-         ``epel-release``.
 
--  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals::
+AlmaLinux Packages
+------------------
 
-      $ sudo yum install make python3-pip which
-      &PIP3_HOST_PACKAGES_DOC;
+Here are the packages needed to build an image on a headless system
+with a supported AlmaLinux distribution::
 
-CentOS-8 Packages
------------------
+   $ sudo dnf install &ALMALINUX8_HOST_PACKAGES_ESSENTIAL;
 
-Here are the required packages by function given a
-supported CentOS-8 Linux distribution:
-
--  *Essentials:* Packages needed to build an image for a headless
-   system::
-
-      $ sudo dnf install &CENTOS8_HOST_PACKAGES_ESSENTIAL;
-
-   .. note::
+.. note::
 
-      -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is
-         a collection of packages from Fedora built on RHEL/CentOS for
-         easy installation of packages not included in enterprise Linux
-         by default. You need to install these packages separately.
+   -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is
+      a collection of packages from Fedora built on RHEL/CentOS for
+      easy installation of packages not included in enterprise Linux
+      by default. You need to install these packages separately.
 
-      -  The ``PowerTools`` repo provides additional packages such as
-         ``rpcgen`` and ``texinfo``.
+   -  The ``PowerTools/CRB`` repo provides additional packages such as
+      ``rpcgen`` and ``texinfo``.
 
-      -  The ``makecache`` command consumes additional Metadata from
-         ``epel-release``.
+   -  The ``makecache`` command consumes additional Metadata from
+      ``epel-release``.
 
--  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals::
+Here are the packages needed to build Project documentation manuals::
 
-      $ sudo dnf install make python3-pip which
-      &PIP3_HOST_PACKAGES_DOC;
+   $ sudo dnf install make python3-pip which inkscape texlive-fncychap
+   &PIP3_HOST_PACKAGES_DOC;
 
 .. _system-requirements-buildtools:
 
-- 
2.34.1


