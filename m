Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E444C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 17:48:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.14726.1638553717754974944
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 09:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.200,
 mailfrom: foss@0leil.net)
Received: from localhost.localdomain (84-115-236-2.cable.dynamic.surfer.at
 [84.115.236.2])
	(Authenticated sender: foss@0leil.net)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPA id DDDEA20002;
	Fri,  3 Dec 2021 17:48:34 +0000 (UTC)
From: Quentin Schulz <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [RFC] [PATCH] make the documentation a bit more inclusive
Date: Fri,  3 Dec 2021 18:48:19 +0100
Message-Id: <20211203174819.78042-1-foss@0leil.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Dec 2021 17:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2224

Except the name of variables which can't be changed only in the
documentation for obvious reasons and workflow or developement
explanations around the use of the "master" branch which cannot be
replaced with "development" branch instead, most of the non-inclusive
words that appear in https://inclusivenaming.org/word-lists/tier-1/
should have been replaced in this patch.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---

Please carefully read the changes to make sure they still do make sense.
I am not so sure about master image -> golden image change specifically.
This is supposed to start a discussion on how to make the docs use more
inclusive language as highlighted during OEDVM Nov 2021.

 documentation/bsp-guide/bsp.rst               |   2 +-
 documentation/dev-manual/common-tasks.rst     | 147 +++++++++---------
 documentation/kernel-dev/advanced.rst         |   6 +-
 documentation/kernel-dev/concepts-appx.rst    |   4 +-
 .../migration-guides/migration-1.6.rst        |   4 +-
 .../migration-guides/migration-3.3.rst        |   2 +-
 documentation/overview-manual/concepts.rst    |  11 +-
 .../development-environment.rst               |  43 +++--
 documentation/overview-manual/yp-intro.rst    |   2 +-
 documentation/ref-manual/classes.rst          |  12 +-
 documentation/ref-manual/images.rst           |   2 +-
 documentation/ref-manual/terms.rst            |   2 +-
 documentation/ref-manual/variables.rst        |  39 ++---
 .../sdk-manual/appendix-customizing.rst       |   9 +-
 14 files changed, 140 insertions(+), 145 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 65652ff89..e82e7299d 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1124,7 +1124,7 @@ list describes them in order of preference:
    the :term:`LICENSE_FLAGS_WHITELIST`, the build stops and provides you
    with the list of recipes that you have tried to include in the image
    that need entries in the :term:`LICENSE_FLAGS_WHITELIST`. Once you enter
-   the appropriate license flags into the whitelist, restart the build
+   the appropriate license flags into the list, restart the build
    to continue where it left off. During the build, the prompt will not
    appear again since you have satisfied the requirement.
 
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 2f5a02f4c..d822b6d94 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5604,10 +5604,10 @@ file::
      ./mkefidisk-201804191017-sda.direct
 
    The following build artifacts were used to create the image(s):
-     ROOTFS_DIR:                   /home/stephano/build/master/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
-     BOOTIMG_DIR:                  /home/stephano/build/master/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
-     KERNEL_DIR:                   /home/stephano/build/master/build/tmp-glibc/deploy/images/qemux86
-     NATIVE_SYSROOT:               /home/stephano/build/master/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
+     ROOTFS_DIR:                   /home/stephano/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
+     BOOTIMG_DIR:                  /home/stephano/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
+     KERNEL_DIR:                   /home/stephano/build/tmp-glibc/deploy/images/qemux86
+     NATIVE_SYSROOT:               /home/stephano/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: The image(s) were created using OE kickstart file:
      /home/stephano/build/master/openembedded-core/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -5704,10 +5704,10 @@ Computing (nuc) :term:`MACHINE` the
      ./directdisksdb-gpt-201710090938-sdb.direct
 
    The following build artifacts were used to create the image(s):
-     ROOTFS_DIR:                   /home/stephano/build/master/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
-     BOOTIMG_DIR:                  /home/stephano/build/master/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
-     KERNEL_DIR:                   /home/stephano/build/master/build/tmp-glibc/deploy/images/qemux86
-     NATIVE_SYSROOT:               /home/stephano/build/master/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
+     ROOTFS_DIR:                   /home/stephano/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
+     BOOTIMG_DIR:                  /home/stephano/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
+     KERNEL_DIR:                   /home/stephano/build/tmp-glibc/deploy/images/qemux86
+     NATIVE_SYSROOT:               /home/stephano/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: The image(s) were created using OE kickstart file:
      /home/stephano/poky/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
@@ -5731,10 +5731,10 @@ Mode) and uses a modified kickstart file. The example also uses the
 default output directory, which is the current directory::
 
    $ wic create /home/stephano/my_yocto/test.wks -o /home/stephano/testwic \
-        --rootfs-dir /home/stephano/build/master/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs \
-        --bootimg-dir /home/stephano/build/master/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share \
-        --kernel-dir /home/stephano/build/master/build/tmp/deploy/images/qemux86 \
-        --native-sysroot /home/stephano/build/master/build/tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native
+        --rootfs-dir /home/stephano/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs \
+        --bootimg-dir /home/stephano/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share \
+        --kernel-dir /home/stephano/build/tmp/deploy/images/qemux86 \
+        --native-sysroot /home/stephano/build/tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: Creating image(s)...
 
@@ -5742,10 +5742,10 @@ default output directory, which is the current directory::
      /home/stephano/testwic/test-201710091445-sdb.direct
 
    The following build artifacts were used to create the image(s):
-     ROOTFS_DIR:                   /home/stephano/build/master/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
-     BOOTIMG_DIR:                  /home/stephano/build/master/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
-     KERNEL_DIR:                   /home/stephano/build/master/build/tmp-glibc/deploy/images/qemux86
-     NATIVE_SYSROOT:               /home/stephano/build/master/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
+     ROOTFS_DIR:                   /home/stephano/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
+     BOOTIMG_DIR:                  /home/stephano/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
+     KERNEL_DIR:                   /home/stephano/build/tmp-glibc/deploy/images/qemux86
+     NATIVE_SYSROOT:               /home/stephano/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: The image(s) were created using OE kickstart file:
      /home/stephano/my_yocto/test.wks
@@ -7080,7 +7080,7 @@ Generating and Using Signed Packages
 In order to add security to RPM packages used during a build, you can
 take steps to securely sign them. Once a signature is verified, the
 OpenEmbedded build system can use the package in the build. If security
-fails for a signed package, the build system aborts the build.
+fails for a signed package, the build system stops the build.
 
 This section describes how to sign RPM packages during a build and how
 to use signed package feeds (repositories) when doing a build.
@@ -8375,11 +8375,11 @@ The OpenEmbedded build system can run tests on real hardware, and for
 certain devices it can also deploy the image to be tested onto the
 device beforehand.
 
-For automated deployment, a "master image" is installed onto the
+For automated deployment, a "golden image" is installed onto the
 hardware once as part of setup. Then, each time tests are to be run, the
 following occurs:
 
-1. The master image is booted into and used to write the image to be
+1. The golden image is booted into and used to write the image to be
    tested to a second partition.
 
 2. The device is then rebooted using an external script that you need to
@@ -8448,15 +8448,15 @@ not need any information in this section. You can skip down to the
 ":ref:`dev-manual/common-tasks:running tests`" section.
 
 If you did set :term:`TEST_TARGET` to "SystemdbootTarget", you also need to
-perform a one-time setup of your master image by doing the following:
+perform a one-time setup of your golden image by doing the following:
 
 1. *Set EFI_PROVIDER:* Be sure that :term:`EFI_PROVIDER` is as follows::
 
       EFI_PROVIDER = "systemd-boot"
 
-2. *Build the master image:* Build the ``core-image-testmaster`` image.
+2. *Build the golden image:* Build the ``core-image-testmaster`` image.
    The ``core-image-testmaster`` recipe is provided as an example for a
-   "master" image and you can customize the image recipe as you would
+   "golden" image and you can customize the image recipe as you would
    any other recipe.
 
    Here are the image recipe requirements:
@@ -9571,51 +9571,51 @@ If you examine the output or the log file, you see the failure during
    | /bin/mkdir -p include/near
    | /bin/mkdir -p include/near
    | /bin/mkdir -p include/near
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/types.h include/near/types.h
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/log.h include/near/log.h
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/plugin.h include/near/plugin.h
    | /bin/mkdir -p include/near
    | /bin/mkdir -p include/near
    | /bin/mkdir -p include/near
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/tag.h include/near/tag.h
    | /bin/mkdir -p include/near
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/adapter.h include/near/adapter.h
    | /bin/mkdir -p include/near
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/ndef.h include/near/ndef.h
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/tlv.h include/near/tlv.h
    | /bin/mkdir -p include/near
    | /bin/mkdir -p include/near
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/setting.h include/near/setting.h
    | /bin/mkdir -p include/near
    | /bin/mkdir -p include/near
    | /bin/mkdir -p include/near
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/device.h include/near/device.h
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/nfc_copy.h include/near/nfc_copy.h
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/snep.h include/near/snep.h
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/version.h include/near/version.h
-   | ln -s /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
+   | ln -s /home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/work/i586-poky-linux/neard/
      0.14-r0/neard-0.14/include/dbus.h include/near/dbus.h
    | ./src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
-   | i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/
+   | i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/pokybuild/yocto-autobuilder/nightly-x86/
      build/build/tmp/sysroots/qemux86 -DHAVE_CONFIG_H -I. -I./include -I./src -I./gdbus  -I/home/pokybuild/
-     yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
-     -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/
-     lib/glib-2.0/include  -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/
-     tmp/sysroots/qemux86/usr/include/dbus-1.0 -I/home/pokybuild/yocto-autobuilder/yocto-slave/
+     yocto-autobuilder/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/glib-2.0
+     -I/home/pokybuild/yocto-autobuilder/nightly-x86/build/build/tmp/sysroots/qemux86/usr/
+     lib/glib-2.0/include  -I/home/pokybuild/yocto-autobuilder/nightly-x86/build/build/
+     tmp/sysroots/qemux86/usr/include/dbus-1.0 -I/home/pokybuild/yocto-autobuilder/
      nightly-x86/build/build/tmp/sysroots/qemux86/usr/lib/dbus-1.0/include  -I/home/pokybuild/yocto-autobuilder/
-     yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/libnl3
+     nightly-x86/build/build/tmp/sysroots/qemux86/usr/include/libnl3
      -DNEAR_PLUGIN_BUILTIN -DPLUGINDIR=\""/usr/lib/near/plugins"\"
      -DCONFIGDIR=\""/etc/neard\"" -O2 -pipe -g -feliminate-unused-debug-types -c
      -o tools/snep-send.o tools/snep-send.c
@@ -10793,12 +10793,12 @@ package::
    LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly license_emgd_1.10"
 
 As a convenience, you do not need to specify the
-complete license string in the whitelist for every package. You can use
+complete license string in the list for every package. You can use
 an abbreviated form, which consists of just the first portion or
 portions of the license string before the initial underscore character
 or characters. A partial string will match any license that contains the
 given string as the first portion of its license. For example, the
-following whitelist string will also match both of the packages
+following value for the list will also match both of the packages
 previously mentioned as well as any other packages that have licenses
 starting with "commercial" or "license".
 ::
@@ -10811,8 +10811,8 @@ License Flag Matching
 License flag matching allows you to control what recipes the
 OpenEmbedded build system includes in the build. Fundamentally, the
 build system attempts to match :term:`LICENSE_FLAGS` strings found in
-recipes against :term:`LICENSE_FLAGS_WHITELIST` strings found in the
-whitelist. A match causes the build system to include a recipe in the
+recipes against strings found in :term:`LICENSE_FLAGS_WHITELIST`.
+A match causes the build system to include a recipe in the
 build, while failure to find a match causes the build system to exclude
 a recipe.
 
@@ -10820,18 +10820,19 @@ In general, license flag matching is simple. However, understanding some
 concepts will help you correctly and effectively use matching.
 
 Before a flag defined by a particular recipe is tested against the
-contents of the whitelist, the expanded string ``_${PN}`` is appended to
-the flag. This expansion makes each :term:`LICENSE_FLAGS` value
-recipe-specific. After expansion, the string is then matched against the
-whitelist. Thus, specifying ``LICENSE_FLAGS = "commercial"`` in recipe
-"foo", for example, results in the string ``"commercial_foo"``. And, to
-create a match, that string must appear in the whitelist.
+contents of the :term:`LICENSE_FLAGS_WHITELIST` list, the expanded
+string ``_${PN}`` is appended to the flag. This expansion makes each
+:term:`LICENSE_FLAGS` value recipe-specific. After expansion, the
+string is then matched against the list. Thus, specifying
+``LICENSE_FLAGS = "commercial"`` in recipe "foo", for example, results
+in the string ``"commercial_foo"``. And, to create a match, that string
+must appear in the :term:`LICENSE_FLAGS_WHITELIST` list.
 
 Judicious use of the :term:`LICENSE_FLAGS` strings and the contents of the
 :term:`LICENSE_FLAGS_WHITELIST` variable allows you a lot of flexibility for
 including or excluding recipes based on licensing. For example, you can
 broaden the matching capabilities by using license flags string subsets
-in the whitelist.
+in the :term:`LICENSE_FLAGS_WHITELIST` list.
 
 .. note::
 
@@ -10839,43 +10840,44 @@ in the whitelist.
    string that precedes the appended underscore character (e.g.
    ``usethispart_1.3``, ``usethispart_1.4``, and so forth).
 
-For example, simply specifying the string "commercial" in the whitelist
-matches any expanded :term:`LICENSE_FLAGS` definition that starts with the
-string "commercial" such as "commercial_foo" and "commercial_bar", which
+For example, simply specifying the string "commercial" in the
+:term:`LICENSE_FLAGS_WHITELIST` list variable matches any expanded
+:term:`LICENSE_FLAGS` definition that starts with the string
+"commercial" such as "commercial_foo" and "commercial_bar", which
 are the strings the build system automatically generates for
 hypothetical recipes named "foo" and "bar" assuming those recipes simply
 specify the following::
 
    LICENSE_FLAGS = "commercial"
 
-Thus, you can choose
-to exhaustively enumerate each license flag in the whitelist and allow
-only specific recipes into the image, or you can use a string subset
-that causes a broader range of matches to allow a range of recipes into
-the image.
+Thus, you can choose to exhaustively enumerate each license flag in the
+list and allow only specific recipes into the image, or you can use a
+string subset that causes a broader range of matches to allow a range of
+recipes into the image.
 
 This scheme works even if the :term:`LICENSE_FLAGS` string already has
 ``_${PN}`` appended. For example, the build system turns the license
 flag "commercial_1.2_foo" into "commercial_1.2_foo_foo" and would match
 both the general "commercial" and the specific "commercial_1.2_foo"
-strings found in the whitelist, as expected.
+strings found in the :term:`LICENSE_FLAGS_WHITELIST` list, as expected.
 
 Here are some other scenarios:
 
 -  You can specify a versioned string in the recipe such as
    "commercial_foo_1.2" in a "foo" recipe. The build system expands this
    string to "commercial_foo_1.2_foo". Combine this license flag with a
-   whitelist that has the string "commercial" and you match the flag
-   along with any other flag that starts with the string "commercial".
+   :term:`LICENSE_FLAGS_WHITELIST` list variable that has the string
+   "commercial" and you match the flag along with any other flag that
+   starts with the string "commercial".
 
--  Under the same circumstances, you can use "commercial_foo" in the
-   whitelist and the build system not only matches "commercial_foo_1.2"
-   but also matches any license flag with the string "commercial_foo",
-   regardless of the version.
+-  Under the same circumstances, you can add "commercial_foo" in the
+   :term:`LICENSE_FLAGS_WHITELIST` list and the build system not only
+   matches "commercial_foo_1.2" but also matches any license flag with
+   the string "commercial_foo", regardless of the version.
 
 -  You can be very specific and use both the package and version parts
-   in the whitelist (e.g. "commercial_foo_1.2") to specifically match a
-   versioned recipe.
+   in the :term:`LICENSE_FLAGS_WHITELIST` list (e.g.
+   "commercial_foo_1.2") to specifically match a versioned recipe.
 
 Other Variables Related to Commercial Licenses
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -10899,9 +10901,10 @@ file::
    LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly commercial_gst-plugins-bad commercial_qmmp"
 
 
-Of course, you could also create a matching whitelist for those
-components using the more general "commercial" in the whitelist, but
-that would also enable all the other packages with :term:`LICENSE_FLAGS`
+Of course, you could also create a matching list for those
+components using the more general "commercial" in the
+:term:`LICENSE_FLAGS_WHITELIST` list, but that would also enable all
+the other packages with :term:`LICENSE_FLAGS`
 containing "commercial", which you may or may not want::
 
    LICENSE_FLAGS_WHITELIST = "commercial"
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 2dbcca60c..3350c253d 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -764,7 +764,7 @@ Organizing Your Source
 ======================
 
 Many recipes based on the ``linux-yocto-custom.bb`` recipe use Linux
-kernel sources that have only a single branch - "master". This type of
+kernel sources that have only a single branch. This type of
 repository structure is fine for linear development supporting a single
 machine and architecture. However, if you work with multiple boards and
 architectures, a kernel source repository with multiple branches is more
@@ -773,7 +773,7 @@ board to boot. Sometimes, these patches are works-in-progress or
 fundamentally wrong, yet they are still necessary for specific boards.
 In these situations, you most likely do not want to include these
 patches in every kernel you build (i.e. have the patches as part of the
-lone "master" branch). It is situations like these that give rise to
+only branch). It is situations like these that give rise to
 multiple branches used within a Linux kernel sources Git repository.
 
 Here are repository organization strategies maximizing source reuse,
@@ -813,7 +813,7 @@ Machine Branches
 When you have multiple machines and architectures to support, or you are
 actively working on board support, it is more efficient to create
 branches in the repository based on individual machines. Having machine
-branches allows common source to remain in the "master" branch with any
+branches allows common source to remain in the main branch with any
 features specific to a machine stored in the appropriate machine branch.
 This organization method frees you from continually reintegrating your
 patches into a feature.
diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index cf2e75d85..910318e0f 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -211,8 +211,8 @@ view, there is a linear path that travels from the baseline
 ``kernel.org``, through a select group of features and ends with their
 BSP-specific commits. In other words, the divisions of the kernel are
 transparent and are not relevant to the developer on a day-to-day basis.
-From the developer's perspective, this path is the "master" branch in
-Git terms. The developer does not need to be aware of the existence of
+From the developer's perspective, this path is the development branch.
+The developer does not need to be aware of the existence of
 any other branches at all. Of course, it can make sense to have these
 branches in the tree, should a person decide to explore them. For
 example, a comparison between two BSPs at either the commit level or at
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index eea3d1767..46b11b5b6 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -231,8 +231,8 @@ Build Changes
 -------------
 
 Separate build and source directories have been enabled by default for
-selected recipes where it is known to work (a whitelist) and for all
-recipes that inherit the :ref:`cmake <ref-classes-cmake>` class. In
+selected recipes where it is known to work (stored in a list) and for
+all recipes that inherit the :ref:`cmake <ref-classes-cmake>` class. In
 future releases the :ref:`autotools <ref-classes-autotools>` class
 will enable a separate build directory by default as well. Recipes
 building Autotools-based software that fails to build with a separate
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index 28857e820..900492991 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -89,7 +89,7 @@ example::
    S = "${WORKDIR}/git/python/pythonmodule"
 
 then in ``setup.py`` it works with source code in a relative fashion, such
-as ``../../src``. This causes pseudo to abort as it isn't able to track
+as ``../../src``. This causes pseudo to fail as it isn't able to track
 the paths properly. This release introduces a new :term:`DISTUTILS_SETUP_PATH`
 variable so that recipes can specify it explicitly, for example::
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 89a5eb49f..fa45d8dc8 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1718,7 +1718,7 @@ inputs still exits - items already built and present in the
 :term:`Build Directory`. The checksum (or
 signature) for a particular task needs to add the hashes of all the
 tasks on which the particular task depends. Choosing which dependencies
-to add is a policy decision. However, the effect is to generate a master
+to add is a policy decision. However, the effect is to generate a
 checksum that combines the basehash and the hashes of the task's
 dependencies.
 
@@ -1735,12 +1735,9 @@ included in any checksum)::
        PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \\
        CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH SDKPKGSUFFIX"
 
-The
-previous example excludes
-:term:`WORKDIR` since that variable
-is actually constructed as a path within
-:term:`TMPDIR`, which is on the
-whitelist.
+The previous example excludes :term:`WORKDIR` since that variable is
+actually constructed as a path within :term:`TMPDIR`, which is in said
+list.
 
 The rules for deciding which hashes of dependent tasks to include
 through dependency chains are more complex and are generally
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index d719ba69e..26d9748a9 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -163,9 +163,9 @@ these tarballs gives you a snapshot of the released files.
 
    -  Be sure to always work in matching branches for both the selected
       BSP repository and the Source Directory (i.e. ``poky``)
-      repository. For example, if you have checked out the "master"
+      repository. For example, if you have checked out the "&DISTRO_NAME_NO_CAP;"
       branch of ``poky`` and you are going to use ``meta-intel``, be
-      sure to checkout the "master" branch of ``meta-intel``.
+      sure to checkout the "&DISTRO_NAME_NO_CAP;" branch of ``meta-intel``.
 
 In summary, here is where you can get the project files needed for
 development:
@@ -233,7 +233,7 @@ all diverging functionality. Although there is no need to use Git, many
 open source projects do so.
 
 For the Yocto Project, a key individual called the "maintainer" is
-responsible for the integrity of the "master" branch of a given Git
+responsible for the integrity of the development branch of a given Git
 repository. The "master" branch is the "upstream" repository from which
 final or most recent builds of a project occur. The maintainer is
 responsible for accepting changes from other developers and for
@@ -279,8 +279,8 @@ submitting patches and changes, see the
 ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
 section in the Yocto Project Development Tasks Manual.
 
-In summary, there is a single point of entry for changes into a "master"
-or development branch of the Git repository, which is controlled by the
+In summary, there is a single point of entry for changes into the
+development branch of the Git repository, which is controlled by the
 project's maintainer. A set of developers independently
 develop, test, and submit changes to "contrib" areas for the maintainer
 to examine. The maintainer then chooses which changes are going to
@@ -311,7 +311,7 @@ Book <https://book.git-scm.com>`__.
    host. You can name these branches anything you like. It is helpful to
    give them names associated with the particular feature or change on
    which you are working. Once you are done with a feature or change and
-   have merged it into your local master branch, simply discard the
+   have merged it into your local development branch, simply discard the
    temporary branch.
 
 -  *Merge Changes:* The ``git merge`` command allows you to take the
@@ -348,7 +348,7 @@ Book <https://book.git-scm.com>`__.
 
 -  *Patch Workflow:* This workflow allows you to notify the maintainer
    through an email that you have a change (or patch) you would like
-   considered for the "master" branch of the Git repository. To send
+   considered for the development branch of the Git repository. To send
    this type of change, you format the patch and then send the email
    using the Git commands ``git format-patch`` and ``git send-email``.
    For information on how to use these scripts, see the
@@ -433,17 +433,12 @@ development branch in the repository. To help illustrate, consider the
 following example Git commands::
 
    $ cd ~
-   $ git clone git://git.yoctoproject.org/poky
-   $ cd poky
-   $ git checkout -b &DISTRO_NAME_NO_CAP; origin/&DISTRO_NAME_NO_CAP;
+   $ git clone git://git.yoctoproject.org/poky -b &DISTRO_NAME_NO_CAP;
 
 In the previous example
 after moving to the home directory, the ``git clone`` command creates a
-local copy of the upstream ``poky`` Git repository. By default, Git
-checks out the "master" branch for your work. After changing the working
-directory to the new local repository (i.e. ``poky``), the
-``git checkout`` command creates and checks out a local branch named
-"&DISTRO_NAME_NO_CAP;", which tracks the upstream
+local copy of the upstream ``poky`` Git repository and checks out a
+local branch named "&DISTRO_NAME_NO_CAP;", which tracks the upstream
 "origin/&DISTRO_NAME_NO_CAP;" branch. Changes you make while in this
 branch would ultimately affect the upstream "&DISTRO_NAME_NO_CAP;" branch
 of the ``poky`` repository.
@@ -558,9 +553,9 @@ descriptions and strategies on how to use these commands:
 -  *git pull --rebase:* Retrieves information from an upstream Git
    repository and places it in your local Git repository. You use this
    command to make sure you are synchronized with the repository from
-   which you are basing changes (.e.g. the "master" branch). The
-   "--rebase" option ensures that any local commits you have in your
-   branch are preserved at the top of your local branch.
+   which you are basing changes (.e.g. the "&DISTRO_NAME_NO_CAP;"
+   branch). The "--rebase" option ensures that any local commits you
+   have in your branch are preserved at the top of your local branch.
 
 -  *git push repo-name local-branch:upstream-branch:* Sends
    all your committed local changes to the upstream Git repository that
@@ -571,13 +566,13 @@ descriptions and strategies on how to use these commands:
 
 -  *git merge:* Combines or adds changes from one local branch of
    your repository with another branch. When you create a local Git
-   repository, the default branch is named "master". A typical workflow
-   is to create a temporary branch that is based off "master" that you
-   would use for isolated work. You would make your changes in that
-   isolated branch, stage and commit them locally, switch to the
-   "master" branch, and then use the ``git merge`` command to apply the
+   repository, the default branch may be named "main". A typical
+   workflow is to create a temporary branch that is based off "main"
+   that you would use for isolated work. You would make your changes in
+   that isolated branch, stage and commit them locally, switch to the
+   "main" branch, and then use the ``git merge`` command to apply the
    changes from your isolated branch into the currently checked out
-   branch (e.g. "master"). After the merge is complete and if you are
+   branch (e.g. "main"). After the merge is complete and if you are
    done with working in that isolated branch, you can safely delete the
    isolated branch.
 
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 7aee9db04..a8ca9e944 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -371,7 +371,7 @@ Yocto Project:
 
 -  *AutoBuilder:* AutoBuilder is a project that automates build tests
    and quality assurance (QA). By using the public AutoBuilder, anyone
-   can determine the status of the current "master" branch of Poky.
+   can determine the status of the current development branch of Poky.
 
    .. note::
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5bc4472e3..a4c48d14a 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -214,13 +214,13 @@ the class.
 =====================
 
 The ``blacklist`` class prevents the OpenEmbedded build system from
-building specific recipes (blacklists them). To use this class, inherit
+building specific recipes. To use this class, inherit
 the class globally and set :term:`PNBLACKLIST` for
-each recipe you wish to blacklist. Specify the :term:`PN`
+each recipe to be ignored by OpenEmbedded. Specify the :term:`PN`
 value as a variable flag (varflag) and provide a reason, which is
 reported, if the package is requested to be built as the value. For
-example, if you want to blacklist a recipe called "exoticware", you add
-the following to your ``local.conf`` or distribution configuration::
+example, if you want to deny build of a recipe called "exoticware", you
+add the following to your ``local.conf`` or distribution configuration::
 
    INHERIT += "blacklist"
    PNBLACKLIST[exoticware] = "Not supported by our organization."
@@ -845,8 +845,8 @@ provided by the recipe ``icecc-create-env-native.bb``.
    icecc.
 
 If you do not want the Icecream distributed compile support to apply to
-specific recipes or classes, you can effectively "blacklist" them by
-listing the recipes and classes using the
+specific recipes or classes, you can ask them to be ignored by Icecream
+by listing the recipes and classes using the
 :term:`ICECC_USER_PACKAGE_BL` and
 :term:`ICECC_USER_CLASS_BL`, variables,
 respectively, in your ``local.conf`` file. Doing so causes the
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index c6a7239c7..76457134d 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -112,7 +112,7 @@ Following is a list of supported recipes:
    development headers and libraries to form a complete standalone SDK
    and is suitable for development using the target.
 
--  ``core-image-testmaster``: A "master" image designed to be used for
+-  ``core-image-testmaster``: A "golden" image designed to be used for
    automated runtime testing. Provides a "known good" image that is
    deployed to a separate partition so that you can boot into it and use
    it to deploy a second image to be tested. You can find more
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 89b140e3f..09e0a98bb 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -404,7 +404,7 @@ universal, the list includes them just in case:
 
    :term:`Upstream`
       A reference to source code or repositories that are not
-      local to the development system but located in a master area that is
+      local to the development system but located in a remote area that is
       controlled by the maintainer of the source code. For example, in
       order for a developer to work on a particular piece of code, they
       need to first get a copy of it from an "upstream" source.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 26b56e145..b5ed0ce4e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -400,7 +400,7 @@ system and gives an overview of their function and contents.
          where:
 
             action is:
-               ABORT:     Immediately abort the build when
+               ABORT:     Immediately stop the build when
                           a threshold is broken.
                STOPTASKS: Stop the build after the currently
                           executing tasks have finished when
@@ -438,7 +438,7 @@ system and gives an overview of their function and contents.
       The first example works only if you also provide the
       :term:`BB_DISKMON_WARNINTERVAL`
       variable in the ``conf/local.conf``. This example causes the build
-      system to immediately abort when either the disk space in
+      system to immediately stop when either the disk space in
       ``${TMPDIR}`` drops below 1 Gbyte or the available free inodes drops
       below 100 Kbytes. Because two directories are provided with the
       variable, the build system also issue a warning when the disk space
@@ -452,7 +452,7 @@ system and gives an overview of their function and contents.
       directory drops below 1 Gbyte. No disk monitoring occurs for the free
       inodes in this case.
 
-      The final example immediately aborts the build when the number of
+      The final example immediately stops the build when the number of
       free inodes in the ``${TMPDIR}`` directory drops below 100 Kbytes. No
       disk space monitoring for the directory itself occurs in this case.
 
@@ -652,7 +652,7 @@ system and gives an overview of their function and contents.
             "
 
       This next example shows an error message that occurs because invalid
-      entries are found, which cause parsing to abort:
+      entries are found, which cause parsing to fail:
 
       .. code-block:: none
 
@@ -2894,9 +2894,10 @@ system and gives an overview of their function and contents.
       :ref:`icecc <ref-classes-icecc>` class. You set this variable in
       your ``local.conf`` file.
 
-      When you list classes using this variable, you are "blacklisting"
-      them from distributed compilation across remote hosts. Any classes
-      you list will be distributed and compiled locally.
+      When you list classes using this variable, the recipes inheriting
+      those classes will not benefit from distributed compilation across
+      remote hosts. Any classes you list will be distributed and compiled
+      locally.
 
    :term:`ICECC_USER_PACKAGE_BL`
       Identifies user recipes that you do not want the Icecream distributed
@@ -2904,9 +2905,10 @@ system and gives an overview of their function and contents.
       :ref:`icecc <ref-classes-icecc>` class. You set this variable in
       your ``local.conf`` file.
 
-      When you list packages using this variable, you are "blacklisting"
-      them from distributed compilation across remote hosts. Any packages
-      you list will be distributed and compiled locally.
+      When you list classes using this variable, the recipes inheriting
+      those classes will not benefit from distributed compilation across
+      remote hosts. Any classes you list will be distributed and compiled
+      locally.
 
    :term:`ICECC_USER_PACKAGE_WL`
       Identifies user recipes that use an empty
@@ -4366,7 +4368,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LICENSE_FLAGS`
-      Specifies additional flags for a recipe you must whitelist through
+      Specifies additional flags for a recipe you must allow through
       :term:`LICENSE_FLAGS_WHITELIST` in
       order to allow the recipe to be built. When providing multiple flags,
       separate them with spaces.
@@ -4381,8 +4383,7 @@ system and gives an overview of their function and contents.
    :term:`LICENSE_FLAGS_WHITELIST`
       Lists license flags that when specified in
       :term:`LICENSE_FLAGS` within a recipe should not
-      prevent that recipe from being built. This practice is otherwise
-      known as "whitelisting" license flags. For more information, see the
+      prevent that recipe from being built.  For more information, see the
       ":ref:`dev-manual/common-tasks:enabling commercially licensed recipes`"
       section in the Yocto Project Development Tasks Manual.
 
@@ -5188,8 +5189,8 @@ system and gives an overview of their function and contents.
       .. note::
 
          You can use the :term:`PACKAGE_FEED_ARCHS`
-         variable to whitelist specific package architectures. If you do
-         not need to whitelist specific architectures, which is a common
+         variable to allow specific package architectures. If you do
+         not need to allow specific architectures, which is a common
          case, you can omit this variable. Omitting the variable results in
          all available architectures for the current machine being included
          into remote package feeds.
@@ -6585,9 +6586,9 @@ system and gives an overview of their function and contents.
       :ref:`populate-sdk-ext <ref-classes-populate-sdk-*>` class.
 
       This list overrides the variables specified using the
-      :term:`SDK_LOCAL_CONF_BLACKLIST`
-      variable as well as any variables identified by automatic
-      blacklisting due to the "/" character being found at the start of the
+      :term:`SDK_LOCAL_CONF_BLACKLIST` variable as well as any
+      any other variable automatically added due to the "/" character
+      being found at the start of the
       value, which is usually indicative of being a path and thus might not
       be valid on the system where the SDK is installed.
 
@@ -8246,7 +8247,7 @@ system and gives an overview of their function and contents.
       variable is used.
 
    :term:`TUNEABI_WHITELIST`
-      A whitelist of permissible :term:`TUNEABI` values. If
+      A list of permissible :term:`TUNEABI` values. If
       :term:`TUNEABI_WHITELIST` is not set, all tunes are allowed. Providers
       that use prebuilt libraries can use the :term:`TUNEABI_WHITELIST`,
       :term:`TUNEABI_OVERRIDE`, and :term:`TUNEABI`
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 4eccc28e9..b12627e3b 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -43,7 +43,7 @@ build system applies them against ``local.conf`` and ``auto.conf``:
    :term:`SDK_INHERIT_BLACKLIST`
    are disabled. Using :term:`SDK_INHERIT_BLACKLIST` to disable these
    classes is the typical method to disable classes that are problematic
-   or unnecessary in the SDK context. The default value blacklists the
+   or unnecessary in the SDK context. The default value disables the
    :ref:`buildhistory <ref-classes-buildhistory>`
    and :ref:`icecc <ref-classes-icecc>` classes.
 
@@ -63,8 +63,7 @@ adjustments:
 -  If your SDK configuration inherits additional classes using the
    :term:`INHERIT` variable and you
    do not need or want those classes enabled in the SDK, you can
-   blacklist them by adding them to the
-   :term:`SDK_INHERIT_BLACKLIST`
+   disable them by adding them to the :term:`SDK_INHERIT_BLACKLIST`
    variable as described in the fourth bullet of the previous section.
 
    .. note::
@@ -275,8 +274,8 @@ source, you need to do a number of things:
       places or it will fail quickly on the OpenEmbedded build system
       side, and its contents will not interfere with the build), then
       you can set the variable in your ``local.conf`` or custom distro
-      configuration file. You can then "whitelist" the variable through
-      to the SDK by adding the following::
+      configuration file. You can then pass the variable to the SDK by
+      adding the following::
 
          SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 
-- 
2.33.1


