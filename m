Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56CBC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 20:43:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.4863.1678912996893044890
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Mar 2023 13:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=piPO9h4z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C8136FF806;
	Wed, 15 Mar 2023 20:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678912994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xIOMZbB7VEz+pcDTj7vI/tYFos5DwZnUe9NOGvdzUYQ=;
	b=piPO9h4z6d9A5isN4oGx0ylug2fwrhEuBeOf5isgu3mAGgY1kKmw9YelgwKq4bGNeLFU/e
	JNFBrdFet5lEDnj82U82pIzI2DBV/4HAQlNtV/TmXcGIDSNpljAWKlCW12WZaBBxfGXnch
	OLZavwzWwLCXT7agKm1xsYbBvfGYylzjrfelqruS9e7pFpgZQXLcGetwk2FO/fNSlhwWLP
	OxgzLi2ORhRp/1F4DOfrh6fV1iQu+T9GAu1NonUGHYHVcocTPmeQ7P8QVQc0gFJ/SUi39u
	92lyH3zR7UJ1EdKlm1H10VDZnW2FlVxf6QcEv8WzGW5SjWabHmBVp+08PxT9lA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] ref-manual: system-requirements.rst: simplify supported distro requirements
Date: Wed, 15 Mar 2023 21:42:47 +0100
Message-Id: <20230315204247.443297-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315204247.443297-1-michael.opdenacker@bootlin.com>
References: <20230315204247.443297-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Mar 2023 20:43:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3798

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
 documentation/brief-yoctoprojectqs/index.rst  |  6 +-
 documentation/poky.yaml.in                    | 12 +--
 .../ref-manual/system-requirements.rst        | 83 ++++++++-----------
 3 files changed, 42 insertions(+), 59 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index c8310e0066..7b8baf233a 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -70,11 +70,9 @@ Build Host Packages
 
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
index 44654aa62f..30e1050824 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -14,7 +14,7 @@ UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
      python3-subunit mesa-common-dev zstd liblz4-tool file locales
-     \n\      $ sudo locale-gen en_US.UTF-8"
+     \n\   $ sudo locale-gen en_US.UTF-8"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
@@ -25,12 +25,12 @@ OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget pyt
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
      zstd lz4 bzip2 gzip hostname
-     \n\      $ sudo pip3 install GitPython"
+     \n\   $ sudo pip3 install GitPython"
 ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
-     \n\      $ sudo yum install dnf-plugins-core
-     \n\      $ sudo dnf config-manager --set-enabled crb
-     \n\      $ sudo dnf makecache
-     \n\      $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
+     \n\   $ sudo yum install dnf-plugins-core
+     \n\   $ sudo dnf config-manager --set-enabled crb
+     \n\   $ sudo dnf makecache
+     \n\   $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 1bbe7b894d..0fbe3f12c8 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -110,8 +110,10 @@ function.
 Ubuntu and Debian
 -----------------
 
-Here are the required packages by function given a
-supported Ubuntu or Debian Linux distribution:
+Here are the packages needed to build an image on a headless system
+with a supported Ubuntu or Debian Linux distribution::
+
+   $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
 
 .. note::
 
@@ -123,80 +125,63 @@ supported Ubuntu or Debian Linux distribution:
          $ sudo apt build-dep qemu
          $ sudo apt remove oss4-dev
 
--  *Essentials:* Packages needed to build an image on a headless system::
-
-      $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
+Here are the packages needed to build Project documentation manuals::
 
--  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals::
-
-      $ sudo apt install make python3-pip inkscape texlive-latex-extra
-      &PIP3_HOST_PACKAGES_DOC;
+   $ sudo apt install make python3-pip inkscape texlive-latex-extra
+   &PIP3_HOST_PACKAGES_DOC;
 
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
 
-      $ sudo dnf install make python3-pip which inkscape texlive-fncychap
-      &PIP3_HOST_PACKAGES_DOC;
+   $ sudo dnf install make python3-pip which inkscape texlive-fncychap
+   &PIP3_HOST_PACKAGES_DOC;
 
 openSUSE Packages
 -----------------
 
-Here are the required packages by function given a
-supported openSUSE Linux distribution:
+Here are the packages needed to build an image on a headless system
+with a supported openSUSE distribution::
 
--  *Essentials:* Packages needed to build an image for a headless
-   system::
+   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
 
-      $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
+Here are the packages needed to build Project documentation manuals::
 
--  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals::
-
-      $ sudo zypper install make python3-pip which inkscape texlive-fncychap
-      &PIP3_HOST_PACKAGES_DOC;
+   $ sudo zypper install make python3-pip which inkscape texlive-fncychap
+   &PIP3_HOST_PACKAGES_DOC;
 
 
 AlmaLinux Packages
 ------------------
 
-Here are the required packages by function given a
-supported AlmaLinux Linux distribution:
-
--  *Essentials:* Packages needed to build an image for a headless
-   system::
+Here are the packages needed to build an image on a headless system
+with a supported AlmaLinux distribution::
 
-      $ sudo dnf install &ALMALINUX8_HOST_PACKAGES_ESSENTIAL;
+   $ sudo dnf install &ALMALINUX8_HOST_PACKAGES_ESSENTIAL;
 
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
 
-      -  The ``PowerTools/CRB`` repo provides additional packages such as
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
 
-      $ sudo dnf install make python3-pip which inkscape texlive-fncychap
-      &PIP3_HOST_PACKAGES_DOC;
+   $ sudo dnf install make python3-pip which inkscape texlive-fncychap
+   &PIP3_HOST_PACKAGES_DOC;
 
 .. _system-requirements-buildtools:
 
-- 
2.34.1


