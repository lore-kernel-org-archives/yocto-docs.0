Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4251AC61DBE
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:22 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3401.1787708112361942152
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AWzp/RaQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-936ea476db3so30369785a.0
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708111; x=1788312911; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VejAsGiLFGIHFTUVfmxBm6mF6A+7uLZTQYCNOZKl1ug=;
        b=AWzp/RaQyOr9W/OcjPRybHGjJMib/zFPzEB6djEnvVOUuE8Uiaz2Bbm8TgvNV70eoz
         f/1ohdpBCHqfdd09wY3DXAFC5kqQPYoeDS5yrWS4E6vWn7QxZpvK4ibn3Z3ScsThSbQs
         Euh7XrtqfdThZDyzMfPkQhzfIsRvmICric1y3VBbDQPiWi9pcJq51ahA+uRuluYl8OHY
         9pAJlDhc95/OgL3Q6mmKo76r9GLPyUjN0IhDI6NTrebZRDpEQfzf/UM8bsViYWqO/J/R
         gJhvvOa5Bwg3Hpn0QmioVKDXc3NsxO84OCNYoEw5Uqb4hMUxfZn5VzjSgVkVvLm7qqT1
         tkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708111; x=1788312911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VejAsGiLFGIHFTUVfmxBm6mF6A+7uLZTQYCNOZKl1ug=;
        b=tJtqsWgb1Ii3+UTqsVAsHQQEpdt3lykaZ1pS8XXrJiriuCLxjPIyGkNhEnaCRcIJ7B
         /l4iRRm8pOAwD07XDZnScToM+hMgwj8Eqt+Q0hgD2ocscwwSf/e+L8Z0SvCXUMtmK1ZX
         WgXibod3eWz4+mfoncFN6AdT64Jxxvpze8HkMGWI7Aud2wN2CP8WpgkclPnyn/H0x2fC
         c3TI0jHiMi6AJ+UtNlKU5lRnK4fhNiKdi++kn6qhlk5BvqTXjkQV97KBODUuPzPbinNh
         SofQOQOBL3zmrk5CM0SYcyPdXsPHciMqGIF7rs1fnsTleqkz665HK1NL1MyJAjxnosyq
         Th6w==
X-Gm-Message-State: AFuF++m2L1gyjMkjXrEdZy9Vkwc+jBEwPjCdrG8V7pjD6CCAuWe699lo
	HAEh+tuRXK7T5E517u+rE7oDsS0WKI7gGtoQjtkc5l0BjKywj7ydIz8SEfnMkxVu
X-Gm-Gg: AR+sD118c4aYDbBLk5EuQFBZvL08DUS7y3CZQLUjhNVAujV/BgS+dopNO/Ndym2kugt
	kVcX22dtVFkcIihRxORI7NBNxjpFyyHo4a9HgshEToI7IVxFEthB6E7T/F/C/dod767FDZG8rn8
	voKKSicU25GcK0fYrUal+YfDVwb3ehLRVnx8fwierf7uT3GwQUOia2VHo8hNoyTKVZGy4lX2CSl
	ysqOTo3kXpGgkhRYbsuyYoMa+1glCD1NRgAJYNZVEA7m7GsfJAfGQpGLQGY6B1Yl/ZKFf3N+3Xm
	yom0okfKPKcTjKZNw3Simhnga1cr/Dcux1SIg8KQ51hQCfwS5P/3E3+Wr3ZqoxU0vSvEeNQVZQF
	QjQyJvt9VjKbV3vjxqxMkS/E0z78jfYItvEEsQpY8SaxyZjdhjJ1qkNI29M5Tv4rhx1ZHdHUkSX
	/7Qhr22+4sFq66QqaZLI7AxPcIye3xe5w5WtJzSUKlhQ2zG+tS12lZotuYbu+Bu+wCvN8avfR/D
	Lp3z3LGOz8FZu1Q2inx9hN05fvdy5o=
X-Received: by 2002:a05:620a:5236:b0:937:6c0a:9b65 with SMTP id af79cd13be357-93780186a21mr201677985a.7.1787708110696;
        Tue, 25 Aug 2026 18:35:10 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.08
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:08 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 02/10] ref-manual: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:34:47 -0400
Message-ID: <20260826013502.2674000-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10347

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 62 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

Blocks that only look like BitBake are left alone, as are blocks
already tagged "none" where the content is deliberately unhighlighted.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/ref-manual/classes.rst          | 168 +++++++++++++-----
 .../ref-manual/devtool-reference.rst          |   4 +-
 documentation/ref-manual/faq.rst              |  20 ++-
 documentation/ref-manual/features.rst         |  12 +-
 documentation/ref-manual/qa-checks.rst        |  20 ++-
 documentation/ref-manual/tasks.rst            |  20 ++-
 6 files changed, 183 insertions(+), 61 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f3d1aa64e703..5dec5008ec3f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -206,11 +206,15 @@ package in the :term:`SRC_URI` variable and inheriting this class.
 For RPMs and other packages that do not contain a subdirectory, you should set
 the :term:`SRC_URI` option ``subdir`` to :term:`BP` so that the contents are
 extracted to the directory expected by the default value of :term:`S`. For
-example::
+example:
+
+.. code-block:: bitbake
 
    SRC_URI = "https://example.com/downloads/somepackage.rpm;subdir=${BP}"
 
-This class can also be used for tarballs. For example::
+This class can also be used for tarballs. For example:
+
+.. code-block:: bitbake
 
    SRC_URI = "file://somepackage.tar.xz;subdir=${BP}"
 
@@ -372,7 +376,9 @@ make it inherit the :ref:`ref-classes-cargo` and
    bitbake -c update_crates recipe
 
 This creates a ``recipe-crates.inc`` file that you can include in your
-recipe::
+recipe:
+
+.. code-block:: bitbake
 
    require ${BPN}-crates.inc
 
@@ -395,7 +401,9 @@ files between builds.
 
 Recipes (including :ref:`ref-classes-native` ones) can make use of the host's
 ``ccache`` binary (via :term:`HOSTTOOLS`) if the following configuration
-statements are provided in a :term:`configuration file`::
+statements are provided in a :term:`configuration file`:
+
+.. code-block:: bitbake
 
    ASSUME_PROVIDED += "ccache-native"
    HOSTTOOLS += "ccache"
@@ -549,7 +557,9 @@ The :ref:`ref-classes-create-spdx` class provides support for
 automatically creating :term:`SPDX` :term:`SBOM` documents based upon image
 and SDK contents.
 
-This class is meant to be inherited globally from a configuration file::
+This class is meant to be inherited globally from a configuration file:
+
+.. code-block:: bitbake
 
    INHERIT += "create-spdx"
 
@@ -702,7 +712,9 @@ information about using :ref:`ref-classes-devshell`.
 The :ref:`ref-classes-devupstream` class uses
 :term:`BBCLASSEXTEND` to add a variant of the
 recipe that fetches from an alternative URI (e.g. Git) instead of a
-tarball. Here is an example::
+tarball. Here is an example:
+
+.. code-block:: bitbake
 
    BBCLASSEXTEND = "devupstream:target"
    SRC_URI:class-devupstream = "git://git.example.com/example;branch=main"
@@ -712,7 +724,9 @@ Adding the above statements to your recipe creates a variant that has
 :term:`DEFAULT_PREFERENCE` set to "-1".
 Consequently, you need to select the variant of the recipe to use it.
 Any development-specific adjustments can be done by using the
-``class-devupstream`` override. Here is an example::
+``class-devupstream`` override. Here is an example:
+
+.. code-block:: bitbake
 
    DEPENDS:append:class-devupstream = " gperf-native"
    do_configure:prepend:class-devupstream() {
@@ -785,7 +799,9 @@ be performed using the
    whole. Use the :ref:`ref-classes-useradd` class to add user and group
    configuration to a specific recipe.
 
-Here is an example that uses this class in an image recipe::
+Here is an example that uses this class in an image recipe:
+
+.. code-block:: bitbake
 
    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -802,7 +818,9 @@ passwords. First on host, create the (escaped) password hash::
 
    printf "%q" $(mkpasswd -m sha256crypt tester01)
 
-The resulting hash is set to a variable and used in ``useradd`` command parameters::
+The resulting hash is set to a variable and used in ``useradd`` command parameters:
+
+.. code-block:: bitbake
 
    inherit extrausers
    PASSWD = "\$X\$ABC123\$A-Long-Hash"
@@ -811,7 +829,9 @@ The resulting hash is set to a variable and used in ``useradd`` command paramete
        useradd -p '${PASSWD}' tester-sue; \
        "
 
-Finally, here is an example that sets the root password::
+Finally, here is an example that sets the root password:
+
+.. code-block:: bitbake
 
    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -1046,7 +1066,9 @@ specific override names are defined as ``grub_LABEL``.
 
 For example, for a label ``factory``, the override name would be
 ``grub_factory``. A custom GRUB menu entry titled "Factory Install" with the
-additional parameter ``factory=yes`` can be achieved as follows::
+additional parameter ``factory=yes`` can be achieved as follows:
+
+.. code-block:: bitbake
 
    LABELS:append = " factory"
    APPEND:grub_factory = "factory=yes"
@@ -1277,7 +1299,9 @@ configuration). However, to skip one or more checks in recipes, you
 should use :term:`INSANE_SKIP`. For example, to skip
 the check for symbolic link ``.so`` files in the main package of a
 recipe, add the following to the recipe. You need to realize that the
-package name override, in this example ``${PN}``, must be used::
+package name override, in this example ``${PN}``, must be used:
+
+.. code-block:: bitbake
 
    INSANE_SKIP:${PN} += "dev-so"
 
@@ -1370,7 +1394,9 @@ The :ref:`ref-classes-kernel-fit-extra-artifacts` class exposes the required ker
 artifacts to the :term:`DEPLOY_DIR_IMAGE` which are used by the
 :ref:`ref-classes-kernel-fit-image` class to create the FIT image.
 
-The simplest example for building a FIT image is to add::
+The simplest example for building a FIT image is to add:
+
+.. code-block:: bitbake
 
    KERNEL_CLASSES += "kernel-fit-extra-artifacts"
 
@@ -1383,7 +1409,9 @@ directory and a ``linux-yocto-fitimage`` package which can be installed.
 
 The same approach works for all variants of the ``linux-yocto`` kernel.
 For example, if the ``linux-yocto-rt`` kernel should be used, add the following
-lines to the machine configuration file::
+lines to the machine configuration file:
+
+.. code-block:: bitbake
 
    KERNEL_CLASSES += "kernel-fit-extra-artifacts"
    PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-rt"
@@ -1460,7 +1488,9 @@ allow configuration:
    U-Boot commands. When using a boot script the recipe which inherits the
    :ref:`ref-classes-kernel-fit-image` class should add the script to
    :term:`SRC_URI` and set the :term:`FIT_UBOOT_ENV` variable to the name of the
-   file like the following::
+   file like the following:
+
+   .. code-block:: bitbake
 
       FIT_UBOOT_ENV = "boot.txt"
       SRC_URI += "file://${FIT_UBOOT_ENV}"
@@ -1504,7 +1534,9 @@ variable in your kernel recipe or machine configuration when building FIT images
 It ensures that all necessary files are available for packaging into the FIT image,
 such as the kernel binary, device tree blobs (DTBs), and other related files.
 
-For example, to enable this class, set::
+For example, to enable this class, set:
+
+.. code-block:: bitbake
 
    KERNEL_CLASSES += "kernel-fit-extra-artifacts"
 
@@ -1780,7 +1812,9 @@ a couple different ways:
       caused by existing code that depends on that naming convention.
 
 -  Or, create a :ref:`ref-classes-native` variant of any target recipe (e.g.
-   ``myrecipe.bb``) by adding the following to the recipe::
+   ``myrecipe.bb``) by adding the following to the recipe:
+
+   .. code-block:: bitbake
 
       BBCLASSEXTEND = "native"
 
@@ -1822,7 +1856,9 @@ couple different ways:
       depends on the naming convention.
 
 -  Or, create a :ref:`ref-classes-nativesdk` variant of any target recipe (e.g.
-   ``myrecipe.bb``) by adding the following to the recipe::
+   ``myrecipe.bb``) by adding the following to the recipe:
+
+   .. code-block:: bitbake
 
        BBCLASSEXTEND = "nativesdk"
 
@@ -1889,7 +1925,9 @@ root filesystem read-only.
 
 To use this class, set a mount point for a partition ``overlayfs`` is going to use as upper
 layer in your machine configuration. The underlying file system can be anything that
-is supported by ``overlayfs``. This has to be done in your machine configuration::
+is supported by ``overlayfs``. This has to be done in your machine configuration:
+
+.. code-block:: bitbake
 
   OVERLAYFS_MOUNT_POINT[data] = "/data"
 
@@ -1903,7 +1941,9 @@ is supported by ``overlayfs``. This has to be done in your machine configuration
 The class assumes you have a ``data.mount`` systemd unit defined elsewhere in your BSP
 (e.g. in ``systemd-machine-units`` recipe) and it's installed into the image.
 
-Then you can specify writable directories on a recipe basis (e.g. in my-application.bb)::
+Then you can specify writable directories on a recipe basis (e.g. in my-application.bb):
+
+.. code-block:: bitbake
 
   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
 
@@ -1912,11 +1952,15 @@ want to have a writable location on the file system, but do not need that the da
 survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs``
 file system.
 
-In your machine configuration::
+In your machine configuration:
+
+.. code-block:: bitbake
 
   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
 
-and then in your recipe::
+and then in your recipe:
+
+.. code-block:: bitbake
 
   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
 
@@ -1948,7 +1992,9 @@ boot stage is required. The idea is to supply a custom init script that mounts
 ``/etc`` before launching the actual init program, because the latter already
 requires ``/etc`` to be mounted.
 
-Example usage in image recipe::
+Example usage in image recipe:
+
+.. code-block:: bitbake
 
    IMAGE_FEATURES += "overlayfs-etc"
 
@@ -1957,14 +2003,18 @@ Example usage in image recipe::
    This class must not be inherited directly. Use :term:`IMAGE_FEATURES` or :term:`EXTRA_IMAGE_FEATURES`
 
 Your machine configuration should define at least the device, mount point, and file system type
-you are going to use for ``overlayfs``::
+you are going to use for ``overlayfs``:
+
+.. code-block:: bitbake
 
   OVERLAYFS_ETC_MOUNT_POINT = "/data"
   OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p2"
   OVERLAYFS_ETC_FSTYPE ?= "ext4"
 
 To control more mount options you should consider setting mount options
-(``defaults`` is used by default)::
+(``defaults`` is used by default):
+
+.. code-block:: bitbake
 
   OVERLAYFS_ETC_MOUNT_OPTIONS = "wsync"
 
@@ -1976,7 +2026,9 @@ The class provides two options for ``/sbin/init`` generation:
   but it poses a restriction that package-management can't be used, because updating
   the init manager would remove the generated script.
 
-- If you wish to keep original init as is, you can set::
+- If you wish to keep original init as is, you can set:
+
+  .. code-block:: bitbake
 
    OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "0"
 
@@ -1994,7 +2046,9 @@ before attempting to fetch it from the upstream specified in
 :term:`SRC_URI` within each recipe.
 
 To use this class, inherit it globally and specify
-:term:`SOURCE_MIRROR_URL`. Here is an example::
+:term:`SOURCE_MIRROR_URL`. Here is an example:
+
+.. code-block:: bitbake
 
    INHERIT += "own-mirrors"
    SOURCE_MIRROR_URL = "http://example.com/my-source-mirror"
@@ -2129,7 +2183,9 @@ Previously, this class was called the ``task`` class.
 
 .. note::
 
-   If you're defining a packagegroup and need to set::
+   If you're defining a packagegroup and need to set:
+
+   .. code-block:: bitbake
 
       PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -2563,7 +2619,9 @@ installed by ``libtool``. Removing these files results in them being
 absent from both the sysroot and target packages.
 
 If a recipe needs the ``.la`` files to be installed, then the recipe can
-override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows::
+override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows:
+
+.. code-block:: bitbake
 
    REMOVE_LIBTOOL_LA = "0"
 
@@ -2596,7 +2654,9 @@ directory for a recipe when one of its tasks fails, or any other nominated
 directories. It is useful in cases where the environment in which builds are run
 is ephemeral or otherwise inaccessible for examination during debugging.
 
-To enable, add the following to your configuration::
+To enable, add the following to your configuration:
+
+.. code-block:: bitbake
 
    INHERIT += "retain"
 
@@ -2619,7 +2679,9 @@ recipe are no longer needed. However, by default, the build system
 preserves these files for inspection and possible debugging purposes. If
 you would rather have these files deleted to save disk space as the build
 progresses, you can enable :ref:`ref-classes-rm-work` by adding the following to
-your ``local.conf`` file, which is found in the :term:`Build Directory`::
+your ``local.conf`` file, which is found in the :term:`Build Directory`:
+
+.. code-block:: bitbake
 
    INHERIT += "rm_work"
 
@@ -2628,14 +2690,18 @@ recipe, enabling :ref:`ref-classes-rm-work` will potentially result in your
 changes to the source being lost. To exclude some recipes from having their work
 directories deleted by :ref:`ref-classes-rm-work`, you can add the names of the
 recipe or recipes you are working on to the :term:`RM_WORK_EXCLUDE` variable,
-which can also be set in your ``local.conf`` file. Here is an example::
+which can also be set in your ``local.conf`` file. Here is an example:
+
+.. code-block:: bitbake
 
    RM_WORK_EXCLUDE += "busybox glibc"
 
 Finally, if you are using this class for a recipe but want to prevent
 :term:`BitBake` from deleting specific folders or files in that recipe's
 :term:`WORKDIR` (other than ``temp``), you can preserve those folders or
-files with the :term:`RM_WORK_EXCLUDE_ITEMS` variable as follows::
+files with the :term:`RM_WORK_EXCLUDE_ITEMS` variable as follows:
+
+.. code-block:: bitbake
 
    RM_WORK_EXCLUDE_ITEMS += "items_to_keep"
 
@@ -3064,7 +3130,9 @@ You should set :term:`SYSTEMD_SERVICE` to the
 name of the service file. You should also use a package name override to
 indicate the package to which the value applies. If the value applies to
 the recipe's main package, use ``${``\ :term:`PN`\ ``}``. Here
-is an example from the connman recipe::
+is an example from the connman recipe:
+
+.. code-block:: bitbake
 
    SYSTEMD_SERVICE:${PN} = "connman.service"
 
@@ -3144,7 +3212,9 @@ images using QEMU and on actual hardware. The classes handle loading the
 tests and starting the image. To use the classes, you need to perform
 steps to set up the environment.
 
-To enable this class, add the following to your configuration::
+To enable this class, add the following to your configuration:
+
+.. code-block:: bitbake
 
    IMAGE_CLASSES += "testimage"
 
@@ -3157,7 +3227,9 @@ following::
    $ bitbake -c testimage image
 
 Alternatively, if you wish to have tests automatically run for each image
-after it is built, you can set :term:`TESTIMAGE_AUTO`::
+after it is built, you can set :term:`TESTIMAGE_AUTO`:
+
+.. code-block:: bitbake
 
    TESTIMAGE_AUTO = "1"
 
@@ -3310,7 +3382,9 @@ This class should not be inherited directly. It is inherited by the
 The :ref:`ref-classes-typecheck` class provides support for validating the values of
 variables set at the configuration level against their defined types.
 The OpenEmbedded build system allows you to define the type of a
-variable using the "type" varflag. Here is an example::
+variable using the "type" varflag. Here is an example:
+
+.. code-block:: bitbake
 
    IMAGE_FEATURES[type] = "list"
 
@@ -3325,12 +3399,16 @@ or more U-Boot build configurations.
 There are three ways to configure the recipe for your machine:
 
 -  Using the :term:`UBOOT_MACHINE` variable (and its companion variable
-   :term:`UBOOT_BINARY`). For example::
+   :term:`UBOOT_BINARY`). For example:
+
+   .. code-block:: bitbake
 
       UBOOT_MACHINE = "config"
       UBOOT_BINARY = "u-boot.bin"
 
--  Using :term:`UBOOT_CONFIG` variables. For example::
+-  Using :term:`UBOOT_CONFIG` variables. For example:
+
+   .. code-block:: bitbake
 
       UBOOT_CONFIG ??= "foo bar"
       UBOOT_CONFIG[foo] = "config"
@@ -3348,7 +3426,9 @@ There are three ways to configure the recipe for your machine:
    In this example, all possible configurations are selected (``foo`` and
    ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
    changing the value of :term:`UBOOT_CONFIG` to include either one or the
-   other.  For exmaple::
+   other.  For exmaple:
+
+   .. code-block:: bitbake
 
       UBOOT_CONFIG = "foo"
       UBOOT_CONFIG[foo] = "config"
@@ -3415,7 +3495,9 @@ There are three ways to configure the recipe for your machine:
       See the documentation of :term:`UBOOT_CONFIG_FRAGMENTS` for more information.
 
 -  Or, a legacy method using the :term:`UBOOT_CONFIG` variable by itself.
-   *This method is being deprecated, see note below.*  For example::
+   *This method is being deprecated, see note below.*  For example:
+
+   .. code-block:: bitbake
 
       UBOOT_CONFIG ??= "foo bar"
       UBOOT_CONFIG[foo] = "config,images,binary"
@@ -3797,7 +3879,9 @@ The :ref:`ref-classes-vex` class is used to generate metadata needed by external
 tools to check for vulnerabilities, for example CVEs.
 
 In order to use this class, inherit the class in the ``local.conf`` file and it
-will add the ``generate_vex`` task for every recipe::
+will add the ``generate_vex`` task for every recipe:
+
+.. code-block:: bitbake
 
    INHERIT += "vex"
 
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 6b21d302ff7e..dd3849e0e053 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -391,7 +391,9 @@ want to use it because the dependency on ``cdebconf`` is not easily
 satisfied. Maintainers can explicit the reason that is shown by adding
 the :term:`RECIPE_NO_UPDATE_REASON` variable to the corresponding recipe.
 See the :oe_git:`base-passwd_*.bb </openembedded-core/tree/meta/recipes-core/base-passwd/>`
-recipe for an example::
+recipe for an example:
+
+.. code-block:: bitbake
 
    RECIPE_NO_UPDATE_REASON = "Version 3.5.38 requires cdebconf for update-passwd utility"
 
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 374ecf8e887f..0b7814589660 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -120,7 +120,9 @@ fail.
 
 As an example, you could add a specific server for the build system to
 attempt before any others by adding something like the following to the
-``local.conf`` configuration file::
+``local.conf`` configuration file:
+
+.. code-block:: bitbake
 
    PREMIRRORS:prepend = "\
        git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
@@ -134,7 +136,9 @@ HTTPS requests and direct them to the ``http://`` sources mirror. You
 can use ``file://`` URLs to point to local directories or network shares
 as well.
 
-Another option is to set::
+Another option is to set:
+
+.. code-block:: bitbake
 
    BB_NO_NETWORK = "1"
 
@@ -142,7 +146,9 @@ This statement tells BitBake to issue an error
 instead of trying to access the Internet. This technique is useful if
 you want to ensure code builds only from local sources.
 
-Here is another technique::
+Here is another technique:
+
+.. code-block:: bitbake
 
    BB_FETCH_PREMIRRORONLY = "1"
 
@@ -150,7 +156,9 @@ This statement limits the build system to pulling source from the
 :term:`PREMIRRORS` only.  Again, this technique is useful for reproducing
 builds.
 
-Here is yet another technique::
+Here is yet another technique:
+
+.. code-block:: bitbake
 
    BB_GENERATE_MIRROR_TARBALLS = "1"
 
@@ -160,7 +168,9 @@ however, the technique can simply waste time during the build.
 
 Finally, consider an example where you are behind an HTTP-only firewall.
 You could make the following changes to the ``local.conf`` configuration
-file as long as the :term:`PREMIRRORS` server is current::
+file as long as the :term:`PREMIRRORS` server is current:
+
+.. code-block:: bitbake
 
    PREMIRRORS:prepend = "\
        git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 63d47d6eca16..56337992f264 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -390,7 +390,9 @@ these valid features is as follows:
       installed, you can either remove ``ssh-server-dropbear`` from
       ``IMAGE_FEATURES`` and add ``dropbear`` to :term:`IMAGE_INSTALL`
       instead, or alternatively still use the feature but set
-      :term:`BAD_RECOMMENDATIONS` as follows::
+      :term:`BAD_RECOMMENDATIONS` as follows:
+
+      .. code-block:: bitbake
 
          BAD_RECOMMENDATIONS += "openssh-sftp-server"
 
@@ -443,7 +445,9 @@ The :term:`DISTRO_FEATURES_OPTED_OUT` and :term:`MACHINE_FEATURES_OPTED_OUT`
 variables can be used to remove a feature provided by one of the
 :term:`DISTRO_FEATURES_DEFAULTS` of :term:`MACHINE_FEATURES_DEFAULTS` variables.
 
-For example, the two following assignments::
+For example, the two following assignments:
+
+.. code-block:: bitbake
 
    DISTRO_FEATURES_DEFAULTS = "a b c"
    DISTRO_FEATURES_OPTED_OUT = "b"
@@ -454,7 +458,9 @@ Would result in feature ``a`` and feature ``c`` making it to the final value of
 
 You can also opt out of all default features by setting
 :term:`DISTRO_FEATURES_OPTED_OUT` or :term:`MACHINE_FEATURES_OPTED_OUT` to
-``*``::
+``*``:
+
+.. code-block:: bitbake
 
    DISTRO_FEATURES_OPTED_OUT = "*"
 
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 09b0f628a74b..49852c1b641d 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -408,7 +408,9 @@ non-UTF-8 characters. Some package managers do not support such characters.
 ``<package>: invalid PACKAGECONFIG(s): <configs> [invalid-packageconfig]``
 
 Checks that no undefined features are being added to :term:`PACKAGECONFIG`.
-For example, any name "foo" for which the following form does not exist::
+For example, any name "foo" for which the following form does not exist:
+
+.. code-block:: bitbake
 
    PACKAGECONFIG[foo] = "..."
 
@@ -437,7 +439,9 @@ provided by the build system. Check to be sure that the :term:`LDFLAGS`
 variable is being passed to the linker command. A common workaround
 for this situation is to pass in :term:`LDFLAGS` using
 :term:`TARGET_CC_ARCH` within the recipe as
-follows::
+follows:
+
+.. code-block:: bitbake
 
    TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -789,13 +793,17 @@ the private version of the library.
 
 This warning indicated that there is missing spaces around an assignment.
 
-For example, the following assignments would print a warning::
+For example, the following assignments would print a warning:
+
+.. code-block:: bitbake
 
    FOO="bar"
    FOO= "bar"
    FOO ="bar"
 
-These should be replaced by::
+These should be replaced by:
+
+.. code-block:: bitbake
 
    FOO = "bar"
 
@@ -887,7 +895,9 @@ runtime.
 Typically, the way to solve this performance issue is to add "-fPIC"
 or "-fpic" to the compiler command-line options. For example, given
 software that reads :term:`CFLAGS` when you build it,
-you could add the following to your recipe::
+you could add the following to your recipe:
+
+.. code-block:: bitbake
 
    CFLAGS:append = " -fPIC"
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 3517d0b91456..405254c7b3a9 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -120,7 +120,9 @@ output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
 The :ref:`ref-tasks-deploy` task is not added as a task by default and
 consequently needs to be added manually. If you want the task to run
 after :ref:`ref-tasks-compile`, you can add it by doing
-the following::
+the following:
+
+.. code-block:: bitbake
 
       addtask deploy after do_compile
 
@@ -129,7 +131,9 @@ Adding :ref:`ref-tasks-deploy` after other tasks works the same way.
 .. note::
 
    You do not need to add ``before do_build`` to the ``addtask`` command
-   (though it is harmless), because the :ref:`ref-classes-base` class contains the following::
+   (though it is harmless), because the :ref:`ref-classes-base` class contains the following:
+
+   .. code-block:: bitbake
 
            do_build[recrdeptask] += "do_deploy"
 
@@ -335,7 +339,9 @@ and patch files needed to build the package.
 As mentioned earlier, the build system treats files whose file types are
 ``.patch`` and ``.diff`` as patch files. However, you can use the
 "apply=yes" parameter with the :term:`SRC_URI` statement to indicate any
-file as a patch file::
+file as a patch file:
+
+.. code-block:: bitbake
 
    SRC_URI = " \
        git://path_to_repo/some_package \
@@ -345,7 +351,9 @@ file as a patch file::
 Conversely, if you have a file whose file type is ``.patch`` or ``.diff``
 and you want to exclude it so that the :ref:`ref-tasks-patch` task does not apply
 it during the patch phase, you can use the "apply=no" parameter with the
-:term:`SRC_URI` statement::
+:term:`SRC_URI` statement:
+
+.. code-block:: bitbake
 
    SRC_URI = " \
        git://path_to_repo/some_package \
@@ -468,7 +476,9 @@ recipe and would be invoked with:
 
    $ bitbake -c listtasks recipename
 
-A typical definition of a manually-called task would look like::
+A typical definition of a manually-called task would look like:
+
+.. code-block:: bitbake
 
    addtask listtasks
    do_listtasks[nostamp] = "1"

