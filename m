Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1570.1601923081549758444
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.137
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPA id 9A75DC000A;
	Mon,  5 Oct 2020 18:37:59 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2 4/8] docs: remove OE_INIT_FILE variable
Date: Mon,  5 Oct 2020 20:37:24 +0200
Message-Id: <20201005183728.9832-4-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005183728.9832-1-foss@0leil.net>
References: <20201005183728.9832-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's probably no need for such a variable (the name of the script is
unlikely to change any time soon) and not all instances of
oe-init-build-env were actually using this variable.

For consistency sake, let's just remove the OE_INIT_FILE variable.

Suggested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Quentin Schulz <foss@0leil.net>
---

added in v2

 documentation/adt-manual/adt-prepare.rst                    | 2 +-
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst | 2 +-
 documentation/bsp-guide/bsp.rst                             | 2 +-
 documentation/poky.yaml                                     | 1 -
 documentation/ref-manual/ref-structure.rst                  | 5 ++---
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/documentation/adt-manual/adt-prepare.rst b/documentation/adt-manual/adt-prepare.rst
index 9b6bd0514..eac03785b 100644
--- a/documentation/adt-manual/adt-prepare.rst
+++ b/documentation/adt-manual/adt-prepare.rst
@@ -107,7 +107,7 @@ the tarball using either of these methods:
       configuration information.
 
    $ cd ~ $ git clone git://git.yoctoproject.org/poky $ cd poky $ git
-   checkout -b DISTRO_NAME origin/DISTRO_NAME $ source OE_INIT_FILE $
+   checkout -b DISTRO_NAME origin/DISTRO_NAME $ source oe-init-build-env $
    bitbake adt-installer
 
 Configuring and Running the ADT Installer Script
diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index 7e24b9e68..55939e3b2 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -177,7 +177,7 @@ an entire Linux distribution, including the toolchain, from source.
    .. code-block:: shell
 
       $ cd ~/poky
-      $ source &OE_INIT_FILE;
+      $ source oe-init-build-env
       You had no conf/local.conf file. This configuration file has therefore been
       created for you with some default values. You may wish to edit it to, for
       example, select a different MACHINE (target hardware). See conf/local.conf
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 024a240c2..7954f08b7 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -233,7 +233,7 @@ section.
    setup script to define the OpenEmbedded build environment on your
    build host. ::
 
-      $ source &OE_INIT_FILE;
+      $ source oe-init-build-env
 
    Among other things, the script creates the :term:`Build Directory`, which is
    ``build`` in this case and is located in the :term:`Source Directory`.  After
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index ec21271a3..14f45055d 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -58,7 +58,6 @@ YOCTO_DOCS_BRIEF_URL : "&YOCTO_DOCS_URL;/&YOCTO_DOC_VERSION;/brief-yoctoprojectq
 YOCTO_ADTPATH_DIR : "/opt/poky/&DISTRO;"
 YOCTO_POKY_TARBALL : "&YOCTO_POKY;.tar.bz2"
 OE_INIT_PATH : "&YOCTO_POKY;/oe-init-build-env"
-OE_INIT_FILE : "oe-init-build-env"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip texinfo gcc-multilib \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
index 93807b52a..5a074a258 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/ref-structure.rst
@@ -188,7 +188,7 @@ your choice. For example, the following command creates a Build
 Directory named ``mybuilds/`` that is outside of the :term:`Source Directory`:
 ::
 
-   $ source OE_INIT_FILE ~/mybuilds
+   $ source oe-init-build-env ~/mybuilds
 
 The OpenEmbedded build system uses the template configuration files, which
 are found by default in the ``meta-poky/conf/`` directory in the Source
@@ -200,8 +200,7 @@ information.
 .. note::
 
    The OpenEmbedded build system does not support file or directory
-   names that contain spaces. If you attempt to run the
-   OE_INIT_FILE
+   names that contain spaces. If you attempt to run the ``oe-init-build-env``
    script from a Source Directory that contains spaces in either the
    filenames or directory names, the script returns an error indicating
    no such file or directory. Be sure to use a Source Directory free of
-- 
2.26.2

