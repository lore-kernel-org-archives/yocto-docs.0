Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1B9C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:49:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.27105.1646664586293373616
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 06:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O4UNc2Dd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A332E0010;
	Mon,  7 Mar 2022 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646664584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gghxJ7btuLfpbu/5v1xHfBxF885flAqTmqd/FYsjm1k=;
	b=O4UNc2Ddcdmnw7mIZ/ivyNgYDUgaX83TfH/YUxIONQ+VDMHcd6AX8FZNp6Yteh9yQL5B9y
	9kNFFAelNYdUGw4ReaWqox4d6TIFwf3bYbrtsx4DWUz/EHF6q217VmAbLQZeZqwGj/LdJs
	i4B3opFoAy6ALBIiczm8JSZjFwlINb4gxAZir2lEJ+jyODG9zxtuIYnDQSU4N8xyj/UwMB
	K4YvUr1ZWVp2W3ynjxIb9SVGfcWuXgAvwsEV4w+k5nGypoBgAlQlovbwzijGnEExTayyWe
	qRyjyWGfhFiLpMY9IC5s2A73u+n5c7b99G//dVnEQgmO8fJNSFSpxmz6vLE++g==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: inclusive language updates
Date: Mon,  7 Mar 2022 15:49:37 +0100
Message-Id: <20220307144937.526475-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Mar 2022 14:49:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2537

Changes identified by OE core's
scripts/contrib/convert-variable-renames.py script

Original variable names are kept in old migration notes,
but references to the new ones are provided.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst               | 10 ++---
 documentation/dev-manual/common-tasks.rst     | 44 +++++++++----------
 .../migration-guides/migration-2.2.rst        |  4 +-
 .../migration-guides/migration-3.0.rst        |  2 +-
 .../migration-guides/migration-3.4.rst        |  3 +-
 documentation/overview-manual/concepts.rst    |  8 ++--
 documentation/ref-manual/classes.rst          | 12 ++---
 documentation/ref-manual/variables.rst        | 44 +++++++++----------
 .../sdk-manual/appendix-customizing.rst       | 20 ++++-----
 9 files changed, 74 insertions(+), 73 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index ab8ed54807..8ec7f2957e 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1113,7 +1113,7 @@ list describes them in order of preference:
 #. *Use the LICENSE_FLAGS Variable to Define the Recipes that Have Commercial or
    Other Types of Specially-Licensed Packages:* For each of those recipes, you can
    specify a matching license string in a ``local.conf`` variable named
-   :term:`LICENSE_FLAGS_WHITELIST`.
+   :term:`LICENSE_FLAGS_ACCEPTED`.
    Specifying the matching license string signifies that you agree to
    the license. Thus, the build system can build the corresponding
    recipe and include the component in the image. See the
@@ -1122,15 +1122,15 @@ list describes them in order of preference:
    how to use these variables.
 
    If you build as you normally would, without specifying any recipes in
-   the :term:`LICENSE_FLAGS_WHITELIST` variable, the build stops and provides
+   the :term:`LICENSE_FLAGS_ACCEPTED` variable, the build stops and provides
    you with the list of recipes that you have tried to include in the image
-   that need entries in the :term:`LICENSE_FLAGS_WHITELIST` variable. Once you
+   that need entries in the :term:`LICENSE_FLAGS_ACCEPTED` variable. Once you
    enter the appropriate license flags into it, restart the build to continue
    where it left off. During the build, the prompt will not appear again since
    you have satisfied the requirement.
 
    Once the appropriate license flags are on the white list in the
-   :term:`LICENSE_FLAGS_WHITELIST` variable, you can build the encumbered
+   :term:`LICENSE_FLAGS_ACCEPTED` variable, you can build the encumbered
    image with no change at all to the normal build process.
 
 #. *Get a Pre-Built Version of the BSP:* You can get this type of BSP by
@@ -1143,7 +1143,7 @@ list describes them in order of preference:
    click-through license agreements presented by the website. If you
    want to build the image yourself using the recipes contained within
    the BSP tarball, you will still need to create an appropriate
-   :term:`LICENSE_FLAGS_WHITELIST` to match the encumbered recipes in the
+   :term:`LICENSE_FLAGS_ACCEPTED` to match the encumbered recipes in the
    BSP.
 
 .. note::
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 1caf953901..e8f94ab1d4 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11044,17 +11044,17 @@ name and version (after variable expansion)::
 In order for a component restricted by a
 :term:`LICENSE_FLAGS` definition to be enabled and included in an image, it
 needs to have a matching entry in the global
-:term:`LICENSE_FLAGS_WHITELIST`
+:term:`LICENSE_FLAGS_ACCEPTED`
 variable, which is a variable typically defined in your ``local.conf``
 file. For example, to enable the
 ``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` package, you
 could add either the string "commercial_gst-plugins-ugly" or the more
-general string "commercial" to :term:`LICENSE_FLAGS_WHITELIST`. See the
+general string "commercial" to :term:`LICENSE_FLAGS_ACCEPTED`. See the
 ":ref:`dev-manual/common-tasks:license flag matching`" section for a full
 explanation of how :term:`LICENSE_FLAGS` matching works. Here is the
 example::
 
-   LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly"
+   LICENSE_FLAGS_ACCEPTED = "commercial_gst-plugins-ugly"
 
 Likewise, to additionally enable the package built from the recipe
 containing ``LICENSE_FLAGS = "license_${PN}_${PV}"``, and assuming that
@@ -11062,7 +11062,7 @@ the actual recipe name was ``emgd_1.10.bb``, the following string would
 enable that package as well as the original ``gst-plugins-ugly``
 package::
 
-   LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly license_emgd_1.10"
+   LICENSE_FLAGS_ACCEPTED = "commercial_gst-plugins-ugly license_emgd_1.10"
 
 As a convenience, you do not need to specify the
 complete license string for every package. You can use
@@ -11075,7 +11075,7 @@ previously mentioned as well as any other packages that have licenses
 starting with "commercial" or "license".
 ::
 
-   LICENSE_FLAGS_WHITELIST = "commercial license"
+   LICENSE_FLAGS_ACCEPTED = "commercial license"
 
 License Flag Matching
 ~~~~~~~~~~~~~~~~~~~~~
@@ -11083,7 +11083,7 @@ License Flag Matching
 License flag matching allows you to control what recipes the
 OpenEmbedded build system includes in the build. Fundamentally, the
 build system attempts to match :term:`LICENSE_FLAGS` strings found in
-recipes against strings found in :term:`LICENSE_FLAGS_WHITELIST`.
+recipes against strings found in :term:`LICENSE_FLAGS_ACCEPTED`.
 A match causes the build system to include a recipe in the
 build, while failure to find a match causes the build system to exclude
 a recipe.
@@ -11092,19 +11092,19 @@ In general, license flag matching is simple. However, understanding some
 concepts will help you correctly and effectively use matching.
 
 Before a flag defined by a particular recipe is tested against the
-entries of :term:`LICENSE_FLAGS_WHITELIST`, the expanded
+entries of :term:`LICENSE_FLAGS_ACCEPTED`, the expanded
 string ``_${PN}`` is appended to the flag. This expansion makes each
 :term:`LICENSE_FLAGS` value recipe-specific. After expansion, the
 string is then matched against the entries. Thus, specifying
 ``LICENSE_FLAGS = "commercial"`` in recipe "foo", for example, results
 in the string ``"commercial_foo"``. And, to create a match, that string
-must appear among the entries of :term:`LICENSE_FLAGS_WHITELIST`.
+must appear among the entries of :term:`LICENSE_FLAGS_ACCEPTED`.
 
 Judicious use of the :term:`LICENSE_FLAGS` strings and the contents of the
-:term:`LICENSE_FLAGS_WHITELIST` variable allows you a lot of flexibility for
+:term:`LICENSE_FLAGS_ACCEPTED` variable allows you a lot of flexibility for
 including or excluding recipes based on licensing. For example, you can
 broaden the matching capabilities by using license flags string subsets
-in :term:`LICENSE_FLAGS_WHITELIST`.
+in :term:`LICENSE_FLAGS_ACCEPTED`.
 
 .. note::
 
@@ -11113,7 +11113,7 @@ in :term:`LICENSE_FLAGS_WHITELIST`.
    ``usethispart_1.3``, ``usethispart_1.4``, and so forth).
 
 For example, simply specifying the string "commercial" in the
-:term:`LICENSE_FLAGS_WHITELIST` variable matches any expanded
+:term:`LICENSE_FLAGS_ACCEPTED` variable matches any expanded
 :term:`LICENSE_FLAGS` definition that starts with the string
 "commercial" such as "commercial_foo" and "commercial_bar", which
 are the strings the build system automatically generates for
@@ -11131,24 +11131,24 @@ This scheme works even if the :term:`LICENSE_FLAGS` string already has
 ``_${PN}`` appended. For example, the build system turns the license
 flag "commercial_1.2_foo" into "commercial_1.2_foo_foo" and would match
 both the general "commercial" and the specific "commercial_1.2_foo"
-strings found in the :term:`LICENSE_FLAGS_WHITELIST` variable, as expected.
+strings found in the :term:`LICENSE_FLAGS_ACCEPTED` variable, as expected.
 
 Here are some other scenarios:
 
 -  You can specify a versioned string in the recipe such as
    "commercial_foo_1.2" in a "foo" recipe. The build system expands this
    string to "commercial_foo_1.2_foo". Combine this license flag with a
-   :term:`LICENSE_FLAGS_WHITELIST` variable that has the string
+   :term:`LICENSE_FLAGS_ACCEPTED` variable that has the string
    "commercial" and you match the flag along with any other flag that
    starts with the string "commercial".
 
 -  Under the same circumstances, you can add "commercial_foo" in the
-   :term:`LICENSE_FLAGS_WHITELIST` variable and the build system not only
+   :term:`LICENSE_FLAGS_ACCEPTED` variable and the build system not only
    matches "commercial_foo_1.2" but also matches any license flag with
    the string "commercial_foo", regardless of the version.
 
 -  You can be very specific and use both the package and version parts
-   in the :term:`LICENSE_FLAGS_WHITELIST` list (e.g.
+   in the :term:`LICENSE_FLAGS_ACCEPTED` list (e.g.
    "commercial_foo_1.2") to specifically match a versioned recipe.
 
 Other Variables Related to Commercial Licenses
@@ -11170,20 +11170,20 @@ file::
        gst-plugins-ugly-mpegaudioparse"
    COMMERCIAL_VIDEO_PLUGINS = "gst-plugins-ugly-mpeg2dec \
        gst-plugins-ugly-mpegstream gst-plugins-bad-mpegvideoparse"
-   LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly commercial_gst-plugins-bad commercial_qmmp"
+   LICENSE_FLAGS_ACCEPTED = "commercial_gst-plugins-ugly commercial_gst-plugins-bad commercial_qmmp"
 
 
 Of course, you could also create a matching list for those
 components using the more general "commercial" in the
-:term:`LICENSE_FLAGS_WHITELIST` variable, but that would also enable all
+:term:`LICENSE_FLAGS_ACCEPTED` variable, but that would also enable all
 the other packages with :term:`LICENSE_FLAGS`
 containing "commercial", which you may or may not want::
 
-   LICENSE_FLAGS_WHITELIST = "commercial"
+   LICENSE_FLAGS_ACCEPTED = "commercial"
 
 Specifying audio and video plugins as part of the
 ``COMMERCIAL_AUDIO_PLUGINS`` and ``COMMERCIAL_VIDEO_PLUGINS`` statements
-(along with the enabling :term:`LICENSE_FLAGS_WHITELIST`) includes the
+(along with the enabling :term:`LICENSE_FLAGS_ACCEPTED`) includes the
 plugins or components into built images, thus adding support for media
 formats or components.
 
@@ -11547,7 +11547,7 @@ The NIST database knows which versions are vulnerable and which ones
 are not.
 
 Last but not least, you can choose to ignore vulnerabilities through
-the :term:`CVE_CHECK_PN_WHITELIST` and :term:`CVE_CHECK_WHITELIST`
+the :term:`CVE_CHECK_SKIP_RECIPE` and :term:`CVE_CHECK_IGNORE`
 variables.
 
 Implementation details
@@ -11566,9 +11566,9 @@ Then, the code looks up all the CVE IDs in the NIST database for all the
 products defined in :term:`CVE_PRODUCT`. Then, for each found CVE:
 
  - If the package name (:term:`PN`) is part of
-   :term:`CVE_CHECK_PN_WHITELIST`, it is considered as patched.
+   :term:`CVE_CHECK_SKIP_RECIPE`, it is considered as patched.
 
- - If the CVE ID is part of :term:`CVE_CHECK_WHITELIST`, it is
+ - If the CVE ID is part of :term:`CVE_CHECK_IGNORE`, it is
    considered as patched too.
 
  - If the CVE ID is part of the patched CVE for the recipe, it is
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 3e35b2b8aa..10aa2d0684 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -26,8 +26,8 @@ Staging Directories in Sysroot Has Been Simplified
 
 The way directories are staged in sysroot has been simplified and
 introduces the new :term:`SYSROOT_DIRS`,
-:term:`SYSROOT_DIRS_NATIVE`, and
-:term:`SYSROOT_DIRS_BLACKLIST`. See the
+:term:`SYSROOT_DIRS_NATIVE`, and ``SYSROOT_DIRS_BLACKLIST``
+(replaced by :term:`SYSROOT_DIRS_IGNORE` in version 3.5). See the
 :oe_lists:`v2 patch series on the OE-Core Mailing List
 </pipermail/openembedded-core/2016-May/121365.html>`
 for additional information.
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 610298bda6..50d6758e71 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -148,7 +148,7 @@ XML feeds that ``cve-check-tool`` was using, supports CVSSv3 scoring,
 and makes other improvements.
 
 Additionally, the ``CVE_CHECK_CVE_WHITELIST`` variable has been replaced
-by ``CVE_CHECK_WHITELIST``.
+by ``CVE_CHECK_WHITELIST`` (replaced by :term:`CVE_CHECK_IGNORE` in version 3.5).
 
 .. _migration-3.0-bitbake-changes:
 
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 60c057b07c..139b2bf9c0 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -255,7 +255,8 @@ Miscellaneous
 
 - The previously deprecated ``COMPRESS_CMD`` and
   ``CVE_CHECK_CVE_WHITELIST`` variables have been removed. Use
-  ``CONVERSION_CMD`` and :term:`CVE_CHECK_WHITELIST` respectively
+  ``CONVERSION_CMD`` and ``CVE_CHECK_WHITELIST`` (replaced by
+  :term:`CVE_CHECK_IGNORE` in version 3.5) respectively
   instead.
 
 - The obsolete ``oe_machinstall`` function previously provided in the
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 47493786d9..cb3a42d299 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1377,15 +1377,15 @@ associated with an extensible SDK:
    Specifies whether or not the toolchain is included when building the
    extensible SDK.
 
--  :term:`SDK_LOCAL_CONF_WHITELIST`:
+-  :term:`ESDK_LOCALCONF_ALLOW`:
    A list of variables allowed through from the build system
    configuration into the extensible SDK configuration.
 
--  :term:`SDK_LOCAL_CONF_BLACKLIST`:
+-  :term:`ESDK_LOCALCONF_REMOVE`:
    A list of variables not allowed through from the build system
    configuration into the extensible SDK configuration.
 
--  :term:`SDK_INHERIT_BLACKLIST`:
+-  :term:`ESDK_CLASS_INHERIT_DISABLE`:
    A list of classes to remove from the
    :term:`INHERIT` value globally
    within the extensible SDK configuration.
@@ -1727,7 +1727,7 @@ it construct the basehash. The following statement effectively results
 in a list of global variable dependency excludes (i.e. variables never
 included in any checksum)::
 
-   BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \\
+   BB_BASEHASH_IGNORE_VARS ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \\
        SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \\
        USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \\
        PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \\
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index cba9793332..cc9c509eda 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -215,7 +215,7 @@ the class.
 
 The ``blacklist`` class prevents the OpenEmbedded build system from
 building specific recipes. To use this class, inherit
-the class globally and set :term:`PNBLACKLIST` for
+the class globally and set :term:`SKIP_RECIPE` for
 each recipe you wish to ignore. Specify the :term:`PN`
 value as a variable flag (varflag) and provide a reason, which is
 reported, if the package is requested to be built as the value. For
@@ -223,7 +223,7 @@ example, if you want to ignore a recipe called "exoticware", you
 add the following to your ``local.conf`` or distribution configuration::
 
    INHERIT += "blacklist"
-   PNBLACKLIST[exoticware] = "Not supported by our organization."
+   SKIP_RECIPE[exoticware] = "Not supported by our organization."
 
 .. _ref-classes-buildhistory:
 
@@ -846,13 +846,13 @@ provided by the recipe ``icecc-create-env-native.bb``.
 If you do not want the Icecream distributed compile support to apply to
 specific recipes or classes, you can ask them to be ignored by Icecream
 by listing the recipes and classes using the
-:term:`ICECC_USER_PACKAGE_BL` and
-:term:`ICECC_USER_CLASS_BL` variables,
+:term:`ICECC_RECIPE_DISABLE` and
+:term:`ICECC_CLASS_DISABLE` variables,
 respectively, in your ``local.conf`` file. Doing so causes the
 OpenEmbedded build system to handle these compilations locally.
 
 Additionally, you can list recipes using the
-:term:`ICECC_USER_PACKAGE_WL` variable in
+:term:`ICECC_RECIPE_ENABLE` variable in
 your ``local.conf`` file to force ``icecc`` to be enabled for recipes
 using an empty :term:`PARALLEL_MAKE` variable.
 
@@ -2515,7 +2515,7 @@ stages:
    subset of files is controlled by the
    :term:`SYSROOT_DIRS`,
    :term:`SYSROOT_DIRS_NATIVE`, and
-   :term:`SYSROOT_DIRS_BLACKLIST`
+   :term:`SYSROOT_DIRS_IGNORE`
    variables.
 
    .. note::
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 005456f0c4..2f22f032c0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1472,16 +1472,16 @@ system and gives an overview of their function and contents.
          variable only in certain contexts (e.g. when building for kernel
          and kernel module recipes).
 
-   :term:`CVE_CHECK_PN_WHITELIST`
+   :term:`CVE_CHECK_SKIP_RECIPE`
       The list of package names (:term:`PN`) for which
       CVEs (Common Vulnerabilities and Exposures) are ignored.
 
-   :term:`CVE_CHECK_WHITELIST`
+   :term:`CVE_CHECK_IGNORE`
       The list of CVE IDs which are ignored. Here is
       an example from the :oe_layerindex:`Python3 recipe</layerindex/recipe/23823>`::
 
          # This is windows only issue.
-         CVE_CHECK_WHITELIST += "CVE-2020-15523"
+         CVE_CHECK_IGNORE += "CVE-2020-15523"
 
    :term:`CVE_PRODUCT`
       In a recipe, defines the name used to match the recipe name
@@ -2879,7 +2879,7 @@ system and gives an overview of their function and contents.
       this variable, the :ref:`icecc <ref-classes-icecc>` class attempts
       to define it by locating ``icecc`` using ``which``.
 
-   :term:`ICECC_USER_CLASS_BL`
+   :term:`ICECC_CLASS_DISABLE`
       Identifies user classes that you do not want the Icecream distributed
       compile support to consider. This variable is used by the
       :ref:`icecc <ref-classes-icecc>` class. You set this variable in
@@ -2889,7 +2889,7 @@ system and gives an overview of their function and contents.
       those classes will not benefit from distributed compilation across
       remote hosts. Instead they will be built locally.
 
-   :term:`ICECC_USER_PACKAGE_BL`
+   :term:`ICECC_RECIPE_DISABLE`
       Identifies user recipes that you do not want the Icecream distributed
       compile support to consider. This variable is used by the
       :ref:`icecc <ref-classes-icecc>` class. You set this variable in
@@ -2899,7 +2899,7 @@ system and gives an overview of their function and contents.
       from distributed compilation across remote hosts. Instead they will
       be built locally.
 
-   :term:`ICECC_USER_PACKAGE_WL`
+   :term:`ICECC_RECIPE_ENABLE`
       Identifies user recipes that use an empty
       :term:`PARALLEL_MAKE` variable that you want to
       force remote distributed compilation on using the Icecream
@@ -4375,7 +4375,7 @@ system and gives an overview of their function and contents.
 
    :term:`LICENSE_FLAGS`
       Specifies additional flags for a recipe you must allow through
-      :term:`LICENSE_FLAGS_WHITELIST` in
+      :term:`LICENSE_FLAGS_ACCEPTED` in
       order for the recipe to be built. When providing multiple flags,
       separate them with spaces.
 
@@ -4386,7 +4386,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/common-tasks:enabling commercially licensed recipes`"
       section in the Yocto Project Development Tasks Manual.
 
-   :term:`LICENSE_FLAGS_WHITELIST`
+   :term:`LICENSE_FLAGS_ACCEPTED`
       Lists license flags that when specified in
       :term:`LICENSE_FLAGS` within a recipe should not
       prevent that recipe from being built.  For more information, see the
@@ -5700,17 +5700,17 @@ system and gives an overview of their function and contents.
       packages for the target and for Multilib, :term:`PN` would be ``bash``
       and ``lib64-bash``, respectively.
 
-   :term:`PNBLACKLIST`
+   :term:`SKIP_RECIPE`
       Lists recipes you do not want the OpenEmbedded build system to build.
       This variable works in conjunction with the
       :ref:`blacklist <ref-classes-blacklist>` class, which is inherited
       globally.
 
-      To prevent a recipe from being built, use the :term:`PNBLACKLIST`
+      To prevent a recipe from being built, use the :term:`SKIP_RECIPE`
       variable in your ``local.conf`` file. Here is an example that
       prevents ``myrecipe`` from being built::
 
-         PNBLACKLIST[myrecipe] = "Not supported by our organization."
+         SKIP_RECIPE[myrecipe] = "Not supported by our organization."
 
    :term:`POPULATE_SDK_POST_HOST_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
@@ -6560,13 +6560,13 @@ system and gives an overview of their function and contents.
       :term:`SDK_EXT_TYPE` is set to "minimal", and defaults to "1" if
       :term:`SDK_EXT_TYPE` is set to "full".
 
-   :term:`SDK_INHERIT_BLACKLIST`
+   :term:`ESDK_CLASS_INHERIT_DISABLE`
       A list of classes to remove from the :term:`INHERIT`
       value globally within the extensible SDK configuration. The
       :ref:`populate-sdk-ext <ref-classes-populate-sdk-*>` class sets the
       default value::
 
-         SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
+         ESDK_CLASS_INHERIT_DISABLE ?= "buildhistory icecc"
 
       Some classes are not generally applicable within the extensible SDK
       context. You can use this variable to disable those classes.
@@ -6577,14 +6577,14 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
-   :term:`SDK_LOCAL_CONF_BLACKLIST`
+   :term:`ESDK_LOCALCONF_REMOVE`
       A list of variables not allowed through from the OpenEmbedded build
       system configuration into the extensible SDK configuration. Usually,
       these are variables that are specific to the machine on which the
       build system is running and thus would be potentially problematic
       within the extensible SDK.
 
-      By default, :term:`SDK_LOCAL_CONF_BLACKLIST` is set in the
+      By default, :term:`ESDK_LOCALCONF_REMOVE` is set in the
       :ref:`populate-sdk-ext <ref-classes-populate-sdk-*>` class and
       excludes the following variables:
 
@@ -6603,14 +6603,14 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
-   :term:`SDK_LOCAL_CONF_WHITELIST`
+   :term:`ESDK_LOCALCONF_ALLOW`
       A list of variables allowed through from the OpenEmbedded build
       system configuration into the extensible SDK configuration. By
       default, the list of variables is empty and is set in the
       :ref:`populate-sdk-ext <ref-classes-populate-sdk-*>` class.
 
       This list overrides the variables specified using the
-      :term:`SDK_LOCAL_CONF_BLACKLIST` variable as well as
+      :term:`ESDK_LOCALCONF_REMOVE` variable as well as
       other variables automatically added due to the "/" character
       being found at the start of the
       value, which is usually indicative of being a path and thus might not
@@ -7506,14 +7506,14 @@ system and gives an overview of their function and contents.
              /sysroot-only \
              "
 
-   :term:`SYSROOT_DIRS_BLACKLIST`
+   :term:`SYSROOT_DIRS_IGNORE`
       Directories that are not staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task. You
       can use this variable to exclude certain subdirectories of
       directories listed in :term:`SYSROOT_DIRS` from
       staging. By default, the following directories are not staged::
 
-         SYSROOT_DIRS_BLACKLIST = " \
+         SYSROOT_DIRS_IGNORE = " \
              ${mandir} \
              ${docdir} \
              ${infodir} \
@@ -8426,7 +8426,7 @@ system and gives an overview of their function and contents.
       passes and uses "all" for the target during the U-Boot building
       process.
 
-   :term:`UNKNOWN_CONFIGURE_WHITELIST`
+   :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
       Specifies a list of options that, if reported by the configure script
       as being invalid, should not generate a warning during the
       :ref:`ref-tasks-configure` task. Normally, invalid
@@ -8436,10 +8436,10 @@ system and gives an overview of their function and contents.
       However, there are common options that are passed to all
       configure scripts at a class level, but might not be valid for some
       configure scripts. Therefore warnings about these options are useless.
-      For these cases, the options are added to :term:`UNKNOWN_CONFIGURE_WHITELIST`.
+      For these cases, the options are added to :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`.
 
       The configure arguments check that uses
-      :term:`UNKNOWN_CONFIGURE_WHITELIST` is part of the
+      :term:`UNKNOWN_CONFIGURE_OPT_IGNORE` is part of the
       :ref:`insane <ref-classes-insane>` class and is only enabled if the
       recipe inherits the :ref:`autotools <ref-classes-autotools>` class.
 
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index f8e56477f3..9a76cc59d6 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -21,7 +21,7 @@ build system applies them against ``local.conf`` and ``auto.conf``:
    specific to the :term:`Build Host`.
 
 -  Variables listed in
-   :term:`SDK_LOCAL_CONF_BLACKLIST`
+   :term:`ESDK_LOCALCONF_REMOVE`
    are excluded. These variables are not allowed through from the
    OpenEmbedded build system configuration into the extensible SDK
    configuration. Typically, these variables are specific to the machine
@@ -29,19 +29,19 @@ build system applies them against ``local.conf`` and ``auto.conf``:
    of the extensible SDK configuration.
 
    For a list of the variables excluded by default, see the
-   :term:`SDK_LOCAL_CONF_BLACKLIST`
+   :term:`ESDK_LOCALCONF_REMOVE`
    in the glossary of the Yocto Project Reference Manual.
 
 -  Variables listed in
-   :term:`SDK_LOCAL_CONF_WHITELIST`
+   :term:`ESDK_LOCALCONF_ALLOW`
    are included. Including a variable in the value of
-   :term:`SDK_LOCAL_CONF_WHITELIST` overrides either of the previous two
+   :term:`ESDK_LOCALCONF_ALLOW` overrides either of the previous two
    filters. The default value is blank.
 
 -  Classes inherited globally with
    :term:`INHERIT` that are listed in
-   :term:`SDK_INHERIT_BLACKLIST`
-   are disabled. Using :term:`SDK_INHERIT_BLACKLIST` to disable these
+   :term:`ESDK_CLASS_INHERIT_DISABLE`
+   are disabled. Using :term:`ESDK_CLASS_INHERIT_DISABLE` to disable these
    classes is the typical method to disable classes that are problematic
    or unnecessary in the SDK context. The default value disables the
    :ref:`buildhistory <ref-classes-buildhistory>`
@@ -63,13 +63,13 @@ adjustments:
 -  If your SDK configuration inherits additional classes using the
    :term:`INHERIT` variable and you
    do not need or want those classes enabled in the SDK, you can
-   disable them by adding them to the :term:`SDK_INHERIT_BLACKLIST`
+   disable them by adding them to the :term:`ESDK_CLASS_INHERIT_DISABLE`
    variable as described in the previous section.
 
    .. note::
 
       The default value of
-      SDK_INHERIT_BLACKLIST
+      ESDK_CLASS_INHERIT_DISABLE
       is set using the "?=" operator. Consequently, you will need to
       either define the entire list by using the "=" operator, or you
       will need to append a value using either ":append" or the "+="
@@ -92,7 +92,7 @@ adjustments:
 
    -  Disable the tasks if they are added by a class and you do not need
       the functionality the class provides in the extensible SDK. To
-      disable the tasks, add the class to the :term:`SDK_INHERIT_BLACKLIST`
+      disable the tasks, add the class to the :term:`ESDK_CLASS_INHERIT_DISABLE`
       variable as described in the previous section.
 
 -  Generally, you want to have a shared state mirror set up so users of
@@ -277,7 +277,7 @@ source, you need to do a number of things:
       configuration file. You can then pass the variable to the SDK by
       adding the following::
 
-         SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
+         ESDK_LOCALCONF_ALLOW = "SSTATE_MIRRORS"
 
    -  Alternatively, if you just want to set the :term:`SSTATE_MIRRORS`
       variable's value for the SDK alone, create a
-- 
2.25.1


