Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.4432.1606295738433031152
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 01:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=On7A1xP3;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id x22so1314746wmc.5
        for <docs@lists.yoctoproject.org>; Wed, 25 Nov 2020 01:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9XaqCbKytVSPJy7+dpiWgonBIAiMN8IJ9MEBQaf1jIw=;
        b=On7A1xP3NvEUEkfvUpAbwgD9+ywKOCvYYd+LNAc5NPDlufm/fz8gXtqRV1ucgP/Gvd
         XNSrhMyhST0IZJq1bFHm1WK9eSDiHUCrepV6XFgc0ihE22RH4K9alFBlvOTLQnMVFc0t
         5VhnCBDL3858wgKCTKw2B6Ke4IVPdkhNNSGkFvcIYYRAJhHYtVl5ZVu/VMLlIE7+jONg
         5jBrTqo1c5LtiXGr2nPvr9Qlhbjb6chG/iSsnMUfm9u8BChr91wPmVeWx2XzMFiUWZSr
         T7fEDmfNN1tNXJMwWMepUlWz4hGtpTHE7kVKVKcoWD2yvjJ7Jgk9ZA2Grzg++ytyUryr
         5z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9XaqCbKytVSPJy7+dpiWgonBIAiMN8IJ9MEBQaf1jIw=;
        b=q4XHIvJnaO6hfF51baQNJzIbOO3MDirMQs7z4X3YSy+fqmjwQK4bYhlr/0K0jqH7bg
         ZQCUdoBLDxAzRGZjILbRqO4EiT9d/uDBA0Fe7gFLt6b3+N3VD8P2GvpbfK+DlPDUIkm4
         jrR39oFPQ0JImWEmApiF6FGKD/fARM4oV1t4+NivGJM2Gkg7rdEr3a/m5lM7OWdL9Re2
         cnJVt0gZY8jSDXPbFbFO/UXFHi4DsrFz7zM4sjO3HmuAr3ykeTa2nfXodCrPJ+lGvld0
         uz7HLjkAsK5NrXiPYvpdRr06xnhI7hPrxKRKoWiGgw3NknotCV1DNGbX4/AcnUmPUG+P
         ScFg==
X-Gm-Message-State: AOAM531g4YCM7fnFeNujll18MLug51S1J+Xdru5SilMNV1K08T4sREzl
	G/S+84JQEqZCfUE0q7A2zTuv4v+o9QBOT8pjmNc=
X-Google-Smtp-Source: ABdhPJxFZXd8h61Yp1XsWrANJMkeoJZ3uh84Wy/GQG+1zgpjWDZEpblsyRFJa3w/SouFw/VllJLbiw==
X-Received: by 2002:a1c:4c11:: with SMTP id z17mr2633955wmf.13.1606295733408;
        Wed, 25 Nov 2020 01:15:33 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id c187sm4032973wmd.23.2020.11.25.01.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 01:15:32 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] {dev,kernel,sdk}-manual: replace hardcoded release version with &DISTRO;
Date: Wed, 25 Nov 2020 10:15:26 +0100
Message-Id: <20201125091526.46021-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the Docbook files we had DISTRO, but somehow it was lost during the
migration to Sphinx.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/dev-manual/dev-manual-qemu.rst   |  2 +-
 documentation/kernel-dev/kernel-dev-common.rst |  4 ++--
 .../sdk-manual/sdk-appendix-obtain.rst         |  8 ++++----
 documentation/sdk-manual/sdk-extensible.rst    |  4 ++--
 documentation/sdk-manual/sdk-intro.rst         |  4 ++--
 documentation/sdk-manual/sdk-using.rst         | 18 +++++++++---------
 .../sdk-manual/sdk-working-projects.rst        | 10 +++++-----
 7 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentation/dev-manual/dev-manual-qemu.rst
index c91e8b538..63640411d 100644
--- a/documentation/dev-manual/dev-manual-qemu.rst
+++ b/documentation/dev-manual/dev-manual-qemu.rst
@@ -81,7 +81,7 @@ available. Follow these general steps to run QEMU:
       your :term:`Build Directory`.
 
    -  If you have not built an image, you can go to the
-      :yocto_dl:`machines/qemu </releases/yocto/yocto-3.1.2/machines/qemu/>` area and download a
+      :yocto_dl:`machines/qemu </releases/yocto/yocto-&DISTRO;/machines/qemu/>` area and download a
       pre-built image that matches your architecture and can be run on
       QEMU.
 
diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
index 72d9d7879..e548fa3a9 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/kernel-dev-common.rst
@@ -147,8 +147,8 @@ section:
    ::
 
       $ cd ~/poky/build/tmp/deploy/sdk
-      $ ./poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-3.1.2.sh
-      Poky (Yocto Project Reference Distro) Extensible SDK installer version 3.1.2
+      $ ./poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-&DISTRO;.sh
+      Poky (Yocto Project Reference Distro) Extensible SDK installer version &DISTRO;
       ============================================================================
       Enter target directory for SDK (default: ~/poky_sdk):
       You are about to install the SDK to "/home/scottrif/poky_sdk". Proceed [Y/n]? Y
diff --git a/documentation/sdk-manual/sdk-appendix-obtain.rst b/documentation/sdk-manual/sdk-appendix-obtain.rst
index eef425bdf..1a2e4c387 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.rst
+++ b/documentation/sdk-manual/sdk-appendix-obtain.rst
@@ -15,7 +15,7 @@ and then run the script to hand-install the toolchain.
 Follow these steps to locate and hand-install the toolchain:
 
 1. *Go to the Installers Directory:* Go to
-   :yocto_dl:`/releases/yocto/yocto-3.1.2/toolchain/`
+   :yocto_dl:`/releases/yocto/yocto-&DISTRO;/toolchain/`
 
 2. *Open the Folder for Your Build Host:* Open the folder that matches
    your :term:`Build Host` (i.e.
@@ -202,7 +202,7 @@ Follow these steps to extract the root filesystem:
    Image File:* You need to find and download the root filesystem image
    file that is appropriate for your target system. These files are kept
    in machine-specific folders in the
-   :yocto_dl:`Index of Releases </releases/yocto/yocto-3.1.2/machines/>`
+   :yocto_dl:`Index of Releases </releases/yocto/yocto-&DISTRO;/machines/>`
    in the "machines" directory.
 
    The machine-specific folders of the "machines" directory contain
@@ -256,7 +256,7 @@ Follow these steps to extract the root filesystem:
 
    Following is an example command that extracts the root filesystem
    from a previously built root filesystem image that was downloaded
-   from the :yocto_dl:`Index of Releases </releases/yocto/yocto-3.1.2/machines/>`.
+   from the :yocto_dl:`Index of Releases </releases/yocto/yocto-&DISTRO;/machines/>`.
    This command extracts the root filesystem into the ``core2-64-sato``
    directory:
    ::
@@ -285,7 +285,7 @@ Within the figure, italicized text is used to indicate replaceable
 portions of the file or directory name. For example, install_dir/version
 is the directory where the SDK is installed. By default, this directory
 is ``/opt/poky/``. And, version represents the specific snapshot of the
-SDK (e.g. 3.1.2). Furthermore, target represents the target architecture
+SDK (e.g. &DISTRO;). Furthermore, target represents the target architecture
 (e.g. ``i586``) and host represents the development system's
 architecture (e.g. ``x86_64``). Thus, the complete names of the two
 directories within the ``sysroots`` could be ``i586-poky-linux`` and
diff --git a/documentation/sdk-manual/sdk-extensible.rst b/documentation/sdk-manual/sdk-extensible.rst
index 10e4d2061..1a17da4f6 100644
--- a/documentation/sdk-manual/sdk-extensible.rst
+++ b/documentation/sdk-manual/sdk-extensible.rst
@@ -47,7 +47,7 @@ Host` by running the ``*.sh`` installation script.
 You can download a tarball installer, which includes the pre-built
 toolchain, the ``runqemu`` script, the internal build system,
 ``devtool``, and support files from the appropriate
-:yocto_dl:`toolchain </releases/yocto/yocto-3.1.2/toolchain/>` directory within the Index of
+:yocto_dl:`toolchain </releases/yocto/yocto-&DISTRO;/toolchain/>` directory within the Index of
 Releases. Toolchains are available for several 32-bit and 64-bit
 architectures with the ``x86_64`` directories, respectively. The
 toolchains the Yocto Project provides are based off the
@@ -78,7 +78,7 @@ is the general form:
 
        release_version is a string representing the release number of the Yocto Project:
 
-                  3.1.2, 3.1.2+snapshot
+                  &DISTRO;, &DISTRO;+snapshot
 
 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
diff --git a/documentation/sdk-manual/sdk-intro.rst b/documentation/sdk-manual/sdk-intro.rst
index ca6138cce..bbd33b8a7 100644
--- a/documentation/sdk-manual/sdk-intro.rst
+++ b/documentation/sdk-manual/sdk-intro.rst
@@ -184,7 +184,7 @@ You just need to follow these general steps:
    root filesystem images.
 
    If you are going to develop your application on hardware, go to the
-   :yocto_dl:`machines </releases/yocto/yocto-3.1.2/machines/>` download area and choose a
+   :yocto_dl:`machines </releases/yocto/yocto-&DISTRO;/machines/>` download area and choose a
    target machine area from which to download the kernel image and root
    filesystem. This download area could have several files in it that
    support development using actual hardware. For example, the area
@@ -194,7 +194,7 @@ You just need to follow these general steps:
 
    If you are going to develop your application and then run and test it
    using the QEMU emulator, go to the
-   :yocto_dl:`machines/qemu </releases/yocto/yocto-3.1.2/machines/qemu>` download area. From this
+   :yocto_dl:`machines/qemu </releases/yocto/yocto-&DISTRO;/machines/qemu>` download area. From this
    area, go down into the directory for your target architecture (e.g.
    ``qemux86_64`` for an Intel-based 64-bit architecture). Download the
    kernel, root filesystem, and any other files you need for your
diff --git a/documentation/sdk-manual/sdk-using.rst b/documentation/sdk-manual/sdk-using.rst
index 3a1cae773..29fb50465 100644
--- a/documentation/sdk-manual/sdk-using.rst
+++ b/documentation/sdk-manual/sdk-using.rst
@@ -43,7 +43,7 @@ Host` by running the ``*.sh`` installation script.
 
 You can download a tarball installer, which includes the pre-built
 toolchain, the ``runqemu`` script, and support files from the
-appropriate :yocto_dl:`toolchain </releases/yocto/yocto-3.1.2/toolchain/>` directory within
+appropriate :yocto_dl:`toolchain </releases/yocto/yocto-&DISTRO;/toolchain/>` directory within
 the Index of Releases. Toolchains are available for several 32-bit and
 64-bit architectures with the ``x86_64`` directories, respectively. The
 toolchains the Yocto Project provides are based off the
@@ -72,7 +72,7 @@ immediately followed by a string representing the target architecture.
 
        release_version is a string representing the release number of the Yocto Project:
 
-                  3.1.2, 3.1.2+snapshot
+                  &DISTRO;, &DISTRO;+snapshot
 
 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
@@ -109,16 +109,16 @@ architecture. The example assumes the SDK installer is located in
 
 ::
 
-   $ ./Downloads/poky-glibc-x86_64-core-image-sato-i586-toolchain-3.1.2.sh
-   Poky (Yocto Project Reference Distro) SDK installer version 3.1.2
+   $ ./Downloads/poky-glibc-x86_64-core-image-sato-i586-toolchain-&DISTRO;.sh
+   Poky (Yocto Project Reference Distro) SDK installer version &DISTRO;
    ===============================================================
-   Enter target directory for SDK (default: /opt/poky/3.1.2):
-   You are about to install the SDK to "/opt/poky/3.1.2". Proceed [Y/n]? Y
+   Enter target directory for SDK (default: /opt/poky/&DISTRO;):
+   You are about to install the SDK to "/opt/poky/&DISTRO;". Proceed [Y/n]? Y
    Extracting SDK........................................ ..............................done
    Setting it up...done
    SDK has been successfully set up and is ready to be used.
    Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
-    $ . /opt/poky/3.1.2/environment-setup-i586-poky-linux
+    $ . /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
 Again, reference the "`Installed Standard SDK Directory
 Structure <#sdk-installed-standard-sdk-directory-structure>`__" section
@@ -131,7 +131,7 @@ Running the SDK Environment Setup Script
 Once you have the SDK installed, you must run the SDK environment setup
 script before you can actually use the SDK. This setup script resides in
 the directory you chose when you installed the SDK, which is either the
-default ``/opt/poky/3.1.2`` directory or the directory you chose during
+default ``/opt/poky/&DISTRO;`` directory or the directory you chose during
 installation.
 
 Before running the script, be sure it is the one that matches the
@@ -143,7 +143,7 @@ then source the environment setup script. In this example, the setup
 script is for an IA-based target machine using i586 tuning:
 ::
 
-   $ source /opt/poky/3.1.2/environment-setup-i586-poky-linux
+   $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
 When you run the
 setup script, the same environment variables are defined as are when you
diff --git a/documentation/sdk-manual/sdk-working-projects.rst b/documentation/sdk-manual/sdk-working-projects.rst
index 5c828fd58..4f9764032 100644
--- a/documentation/sdk-manual/sdk-working-projects.rst
+++ b/documentation/sdk-manual/sdk-working-projects.rst
@@ -86,11 +86,11 @@ project:
    the string "environment-setup" and contains the machine architecture,
    which is followed by the string "poky-linux". For this example, the
    command sources a script from the default SDK installation directory
-   that uses the 32-bit Intel x86 Architecture and the 3.1.2 Yocto
+   that uses the 32-bit Intel x86 Architecture and the &DISTRO; Yocto
    Project release:
    ::
 
-      $ source /opt/poky/3.1.2/environment-setup-i586-poky-linux
+      $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
 3. *Create the configure Script:* Use the ``autoreconf`` command to
    generate the ``configure`` script.
@@ -229,14 +229,14 @@ a null value for the compiler variable (i.e.
 
 Running the
 SDK setup script for a 64-bit build host and an i586-tuned target
-architecture for a ``core-image-sato`` image using the current 3.1.2
+architecture for a ``core-image-sato`` image using the current &DISTRO;
 Yocto Project release and then echoing that variable shows the value
 established through the script:
 ::
 
-   $ source /opt/poky/3.1.2/environment-setup-i586-poky-linux
+   $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
    $ echo ${CC}
-   i586-poky-linux-gcc -m32 -march=i586 --sysroot=/opt/poky/3.1.2/sysroots/i586-poky-linux
+   i586-poky-linux-gcc -m32 -march=i586 --sysroot=/opt/poky/&DISTRO;/sysroots/i586-poky-linux
 
 To illustrate variable use, work through this simple "Hello World!"
 example:
-- 
2.29.2

