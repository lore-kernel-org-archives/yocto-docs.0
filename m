Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C62DC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 17:06:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.49958.1669914390237727846
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 09:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X9uNXV+Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 100D8240005;
	Thu,  1 Dec 2022 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669914388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OmUrj7CfEH6+8/nacInM68h2rZJQpbB5htmu2+JETqY=;
	b=X9uNXV+Y7KsghWkSbrcjlJTYILwMUBmNMgmgCNFXPjSUo5vWFel7hzdLhTYUQvV8u1a8dU
	v7h6lSzzWY4b0CLhTyt5w5ZOxEy6AyN948M9M3NPnk2zpNiyHdp/YNeqYlrw8TKusEq6gP
	8ZXoG5ZuSW8oZzlVEnymesEP/YWxbvONgrWvGgmtd5OIHIc7jSodo/mT4zcYPCZ4AaGc/e
	EbYYWthT6tIRsdno99Naj4GETFp32cbp1zLBLiP3C6V87SxFsaTSk6KHt87nLbEZ3Kxi30
	E+1DiukYvhpkhqIeB+MrrOUT1H/jWbSB9nY1/VgIA3hm847/3bK4/6OaYoNRmw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: add references to variables only documented in the BitBake manual
Date: Thu,  1 Dec 2022 18:06:25 +0100
Message-Id: <20221201170625.266217-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Dec 2022 17:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3511

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This makes the Yocto Project manual variable list and index more useful,
not missing any potentially useful variable.

The price to pay is that a reference to such variables now has to go through
the intermediate reference in the Yocto Project variable list, instead
of going straight to the Bitbake manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 204 +++++++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6bfacece07..0435f88347 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -353,6 +353,18 @@ system and gives an overview of their function and contents.
       host listed in :term:`SRC_URI` after a successful fetch from the
       :term:`PREMIRRORS` occurs.
 
+   :term:`BB_BASEHASH_IGNORE_VARS`
+      See :term:`bitbake:BB_BASEHASH_IGNORE_VARS` in the BitBake manual.
+
+   :term:`BB_CHECK_SSL_CERTS`
+      See :term:`bitbake:BB_CHECK_SSL_CERTS` in the BitBake manual.
+
+   :term:`BB_CONSOLELOG`
+      See :term:`bitbake:BB_CONSOLELOG` in the BitBake manual.
+
+   :term:`BB_CURRENTTASK`
+      See :term:`bitbake:BB_CURRENTTASK` in the BitBake manual.
+
    :term:`BB_DANGLINGAPPENDS_WARNONLY`
       Defines how BitBake handles situations where an append file
       (``.bbappend``) has no corresponding recipe file (``.bb``). This
@@ -371,6 +383,12 @@ system and gives an overview of their function and contents.
 
          BB_DANGLINGAPPENDS_WARNONLY = "1"
 
+   :term:`BB_DEFAULT_TASK`
+      See :term:`bitbake:BB_DEFAULT_TASK` in the BitBake manual.
+
+   :term:`BB_DEFAULT_UMASK`
+      See :term:`bitbake:BB_DEFAULT_UMASK` in the BitBake manual.
+
    :term:`BB_DISKMON_DIRS`
       Monitors disk space and available inodes during the build and allows
       you to control the build based on these parameters.
@@ -492,6 +510,18 @@ system and gives an overview of their function and contents.
       a respective interval is reached beyond the initial warning (i.e. 1
       Gbytes and 100 Kbytes).
 
+   :term:`BB_ENV_PASSTHROUGH`
+      See :term:`bitbake:BB_ENV_PASSTHROUGH` in the BitBake manual.
+
+   :term:`BB_ENV_PASSTHROUGH_ADDITIONS`
+      See :term:`bitbake:BB_ENV_PASSTHROUGH_ADDITIONS` in the BitBake manual.
+
+   :term:`BB_FETCH_PREMIRRORONLY`
+      See :term:`bitbake:BB_FETCH_PREMIRRORONLY` in the BitBake manual.
+
+   :term:`BB_FILENAME`
+      See :term:`bitbake:BB_FILENAME` in the BitBake manual.
+
    :term:`BB_GENERATE_MIRROR_TARBALLS`
       Causes tarballs of the source control repositories (e.g. Git
       repositories), including metadata, to be placed in the
@@ -511,6 +541,48 @@ system and gives an overview of their function and contents.
       clean up your :term:`DL_DIR` directory by deleting any Git or other
       source control work directories.
 
+   :term:`BB_GENERATE_SHALLOW_TARBALLS`
+      See :term:`bitbake:BB_GENERATE_SHALLOW_TARBALLS` in the BitBake manual.
+
+   :term:`BB_GIT_SHALLOW`
+      See :term:`bitbake:BB_GIT_SHALLOW` in the BitBake manual.
+
+   :term:`BB_GIT_SHALLOW_DEPTH`
+      See :term:`bitbake:BB_GIT_SHALLOW_DEPTH` in the BitBake manual.
+
+   :term:`BB_HASHCHECK_FUNCTION`
+      See :term:`bitbake:BB_HASHCHECK_FUNCTION` in the BitBake manual.
+
+   :term:`BB_HASHCONFIG_IGNORE_VARS`
+      See :term:`bitbake:BB_HASHCONFIG_IGNORE_VARS` in the BitBake manual.
+
+   :term:`BB_HASHSERVE`
+      See :term:`bitbake:BB_HASHSERVE` in the BitBake manual.
+
+   :term:`BB_HASHSERVE_UPSTREAM`
+      See :term:`bitbake:BB_HASHSERVE_UPSTREAM` in the BitBake manual.
+
+   :term:`BB_INVALIDCONF`
+      See :term:`bitbake:BB_INVALIDCONF` in the BitBake manual.
+
+   :term:`BB_LOGCONFIG`
+      See :term:`bitbake:BB_LOGCONFIG` in the BitBake manual.
+
+   :term:`BB_LOGFMT`
+      See :term:`bitbake:BB_LOGFMT` in the BitBake manual.
+
+   :term:`BB_MULTI_PROVIDER_ALLOWED`
+      See :term:`bitbake:BB_MULTI_PROVIDER_ALLOWED` in the BitBake manual.
+
+   :term:`BB_NICE_LEVEL`
+      See :term:`bitbake:BB_NICE_LEVEL` in the BitBake manual.
+
+   :term:`BB_NO_NETWORK`
+      See :term:`bitbake:BB_NO_NETWORK` in the BitBake manual.
+
+   :term:`BB_NUMBER_PARSE_THREADS`
+      See :term:`bitbake:BB_NUMBER_PARSE_THREADS` in the BitBake manual.
+
    :term:`BB_NUMBER_THREADS`
       The maximum number of tasks BitBake should run in parallel at any one
       time. The OpenEmbedded build system automatically configures this
@@ -556,6 +628,33 @@ system and gives an overview of their function and contents.
       tasks already being run from using all CPU threads on the system
       if :term:`PARALLEL_MAKE` is not set to a low value.
 
+   :term:`BB_ORIGENV`
+      See :term:`bitbake:BB_ORIGENV` in the BitBake manual.
+
+   :term:`BB_PRESERVE_ENV`
+      See :term:`bitbake:BB_PRESERVE_ENV` in the BitBake manual.
+
+   :term:`BB_PRESSURE_MAX_CPU`
+      See :term:`bitbake:BB_PRESSURE_MAX_CPU` in the BitBake manual.
+
+   :term:`BB_PRESSURE_MAX_IO`
+      See :term:`bitbake:BB_PRESSURE_MAX_IO` in the BitBake manual.
+
+   :term:`BB_PRESSURE_MAX_MEMORY`
+      See :term:`bitbake:BB_PRESSURE_MAX_MEMORY` in the BitBake manual.
+
+   :term:`BB_RUNFMT`
+      See :term:`bitbake:BB_RUNFMT` in the BitBake manual.
+
+   :term:`BB_RUNTASK`
+      See :term:`bitbake:BB_RUNTASK` in the BitBake manual.
+
+   :term:`BB_SCHEDULER`
+      See :term:`bitbake:BB_SCHEDULER` in the BitBake manual.
+
+   :term:`BB_SCHEDULERS`
+      See :term:`bitbake:BB_SCHEDULERS` in the BitBake manual.
+
    :term:`BB_SERVER_TIMEOUT`
       Specifies the time (in seconds) after which to unload the BitBake
       server due to inactivity. Set :term:`BB_SERVER_TIMEOUT` to determine how
@@ -569,6 +668,36 @@ system and gives an overview of their function and contents.
       If you want the server to never be unloaded,
       set :term:`BB_SERVER_TIMEOUT` to "-1".
 
+   :term:`BB_SETSCENE_DEPVALID`
+      See :term:`bitbake:BB_SETSCENE_DEPVALID` in the BitBake manual.
+
+   :term:`BB_SIGNATURE_EXCLUDE_FLAGS`
+      See :term:`bitbake:BB_SIGNATURE_EXCLUDE_FLAGS` in the BitBake manual.
+
+   :term:`BB_SIGNATURE_HANDLER`
+      See :term:`bitbake:BB_SIGNATURE_HANDLER` in the BitBake manual.
+
+   :term:`BB_SRCREV_POLICY`
+      See :term:`bitbake:BB_SRCREV_POLICY` in the BitBake manual.
+
+   :term:`BB_STRICT_CHECKSUM`
+      See :term:`bitbake:BB_STRICT_CHECKSUM` in the BitBake manual.
+
+   :term:`BB_TASK_IONICE_LEVEL`
+      See :term:`bitbake:BB_TASK_IONICE_LEVEL` in the BitBake manual.
+
+   :term:`BB_TASK_NICE_LEVEL`
+      See :term:`bitbake:BB_TASK_NICE_LEVEL` in the BitBake manual.
+
+   :term:`BB_TASKHASH`
+      See :term:`bitbake:BB_TASKHASH` in the BitBake manual.
+
+   :term:`BB_VERBOSE_LOGS`
+      See :term:`bitbake:BB_VERBOSE_LOGS` in the BitBake manual.
+
+   :term:`BB_WORKERCONTEXT`
+      See :term:`bitbake:BB_WORKERCONTEXT` in the BitBake manual.
+
    :term:`BBCLASSEXTEND`
       Allows you to extend a recipe so that it builds variants of the
       software. There are common variants for recipes as "natives" like
@@ -599,6 +728,9 @@ system and gives an overview of their function and contents.
          since ``include`` statements are processed when the recipe is
          parsed.
 
+   :term:`BBDEBUG`
+      See :term:`bitbake:BBDEBUG` in the BitBake manual.
+
    :term:`BBFILE_COLLECTIONS`
       Lists the names of configured layers. These names are used to find
       the other ``BBFILE_*`` variables. Typically, each layer will append
@@ -674,6 +806,9 @@ system and gives an overview of their function and contents.
              /work/my-layer/bbappends/meta-security-isafw/*/*/*.bbappend
              /work/my-layer/bbappends/openembedded-core/meta/*/*/*.bbappend
 
+   :term:`BBINCLUDED`
+      See :term:`bitbake:BBINCLUDED` in the BitBake manual.
+
    :term:`BBINCLUDELOGS`
       Variable that controls how BitBake displays logs on build failure.
 
@@ -698,6 +833,9 @@ system and gives an overview of their function and contents.
       This example enables four layers, one of which is a custom,
       user-defined layer named ``meta-mykernel``.
 
+   :term:`BBLAYERS_FETCH_DIR`
+      See :term:`bitbake:BBLAYERS_FETCH_DIR` in the BitBake manual.
+
    :term:`BBMASK`
       Prevents BitBake from processing recipes and recipe append files.
 
@@ -754,6 +892,9 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/building:building images for multiple targets using multiple configurations`"
       section in the Yocto Project Development Tasks Manual.
 
+   :term:`BBPATH`
+      See :term:`bitbake:BBPATH` in the BitBake manual.
+
    :term:`BBSERVER`
       If defined in the BitBake environment, :term:`BBSERVER` points to the
       BitBake remote server.
@@ -767,6 +908,9 @@ system and gives an overview of their function and contents.
       Consequently, :term:`BBSERVER` is excluded from checksum and dependency
       data.
 
+   :term:`BBTARGETS`
+      See :term:`bitbake:BBTARGETS` in the BitBake manual.
+
    :term:`BINCONFIG`
       When inheriting the
       :ref:`binconfig-disabled <ref-classes-binconfig-disabled>` class,
@@ -804,6 +948,9 @@ system and gives an overview of their function and contents.
       information on the class in the
       ":ref:`ref-classes-binconfig`" section.
 
+   :term:`BITBAKE_UI`
+      See :term:`bitbake:BITBAKE_UI` in the BitBake manual.
+
    :term:`BP`
       The base recipe name and version but without any special recipe name
       suffix (i.e. ``-native``, ``lib64-``, and so forth). :term:`BP` is
@@ -1051,6 +1198,9 @@ system and gives an overview of their function and contents.
 
          BUILDHISTORY_PUSH_REPO ?= ""
 
+   :term:`BUILDNAME`
+      See :term:`bitbake:BUILDNAME` in the BitBake manual.
+
    :term:`BUILDSDK_CFLAGS`
       Specifies the flags to pass to the C compiler when building for the
       SDK. When building in the ``nativesdk-`` context,
@@ -1092,6 +1242,9 @@ system and gives an overview of their function and contents.
       splitting the output executable file. Set the variable to "0" to get
       a single output executable file.
 
+   :term:`BZRDIR`
+      See :term:`bitbake:BZRDIR` in the BitBake manual.
+
    :term:`CACHE`
       Specifies the directory BitBake uses to store a cache of the
       :term:`Metadata` so it does not need to be parsed every time
@@ -2461,6 +2614,24 @@ system and gives an overview of their function and contents.
 
          EXTRANATIVEPATH = "foo bar"
 
+   :term:`FAKEROOT`
+      See :term:`bitbake:FAKEROOT` in the BitBake manual.
+
+   :term:`FAKEROOTBASEENV`
+      See :term:`bitbake:FAKEROOTBASEENV` in the BitBake manual.
+
+   :term:`FAKEROOTCMD`
+      See :term:`bitbake:FAKEROOTCMD` in the BitBake manual.
+
+   :term:`FAKEROOTDIRS`
+      See :term:`bitbake:FAKEROOTDIRS` in the BitBake manual.
+
+   :term:`FAKEROOTENV`
+      See :term:`bitbake:FAKEROOTENV` in the BitBake manual.
+
+   :term:`FAKEROOTNOENV`
+      See :term:`bitbake:FAKEROOTNOENV` in the BitBake manual.
+
    :term:`FEATURE_PACKAGES`
       Defines one or more packages to include in an image when a specific
       item is included in :term:`IMAGE_FEATURES`.
@@ -2496,6 +2667,12 @@ system and gives an overview of their function and contents.
       a set of configuration files for you in your target that work with
       the feed.
 
+   :term:`FETCHCMD`
+      See :term:`bitbake:FETCHCMD` in the BitBake manual.
+
+   :term:`FILE`
+      See :term:`bitbake:FILE` in the BitBake manual.
+
    :term:`FILES`
       The list of files and directories that are placed in a package. The
       :term:`PACKAGES` variable lists the packages
@@ -2903,6 +3080,9 @@ system and gives an overview of their function and contents.
       method modules being installed when the modules are in packages other
       than the main package.
 
+   :term:`HGDIR`
+      See :term:`bitbake:HGDIR` in the BitBake manual.
+
    :term:`HOMEPAGE`
       Website where more information about the software the recipe is
       building can be found.
@@ -4456,6 +4636,9 @@ system and gives an overview of their function and contents.
       available outside of ``layer.conf`` and references are expanded
       immediately when parsing of the file completes.
 
+   :term:`LAYERDIR_RE`
+      See :term:`bitbake:LAYERDIR_RE` in the BitBake manual.
+
    :term:`LAYERRECOMMENDS`
       Lists the layers, separated by spaces, recommended for use with this
       layer.
@@ -5349,6 +5532,9 @@ system and gives an overview of their function and contents.
 
          ${PN}-${PV}
 
+   :term:`P4DIR`
+      See :term:`bitbake:P4DIR` in the BitBake manual.
+
    :term:`PACKAGE_ADD_METADATA`
       This variable defines additional metadata to add to packages.
 
@@ -5915,6 +6101,9 @@ system and gives an overview of their function and contents.
       denotes the path to ``dist/`` (short for distribution) where the
       binary archive ``wheel`` is built.
 
+   :term:`PERSISTENT_DIR`
+      See :term:`bitbake:PERSISTENT_DIR` in the BitBake manual.
+
    :term:`PF`
       Specifies the recipe or package name and includes all version and
       revision numbers (i.e. ``glibc-2.13-r20+svnr15508/`` and
@@ -6118,6 +6307,9 @@ system and gives an overview of their function and contents.
          desirable since this mechanism is designed to select between mutually
          exclusive alternative providers.
 
+   :term:`PREFERRED_PROVIDERS`
+      See :term:`bitbake:PREFERRED_PROVIDERS` in the BitBake manual.
+
    :term:`PREFERRED_VERSION`
       If there are multiple versions of a recipe available, this variable
       determines which version should be given preference. You must always
@@ -6539,6 +6731,9 @@ system and gives an overview of their function and contents.
       in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
       section.
 
+   :term:`REPODIR`
+      See :term:`bitbake:REPODIR` in the BitBake manual.
+
    :term:`REQUIRED_DISTRO_FEATURES`
       When inheriting the :ref:`features_check <ref-classes-features_check>`
       class, this variable identifies distribution features that must exist
@@ -7444,6 +7639,9 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Board Support Package Developer's Guide
       for additional information.
 
+   :term:`SRCREV_FORMAT`
+      See :term:`bitbake:SRCREV_FORMAT` in the BitBake manual.
+
    :term:`SRC_URI`
 
       See the BitBake manual for the initial description for this variable:
@@ -7826,6 +8024,9 @@ system and gives an overview of their function and contents.
       :term:`PV`, and :term:`PR` for related variable
       information.
 
+   :term:`STAMPCLEAN`
+      See :term:`bitbake:STAMPCLEAN` in the BitBake manual.
+
    :term:`STAMPS_DIR`
       Specifies the base directory in which the OpenEmbedded build system
       places stamps. The default directory is ``${TMPDIR}/stamps``.
@@ -8601,6 +8802,9 @@ system and gives an overview of their function and contents.
       information on setting up a cross-development environment, see the
       :doc:`/sdk-manual/index` manual.
 
+   :term:`TOPDIR`
+      See :term:`bitbake:TOPDIR` in the BitBake manual.
+
    :term:`TRANSLATED_TARGET_ARCH`
       A sanitized version of :term:`TARGET_ARCH`. This
       variable is used where the architecture is needed in a value where
-- 
2.34.1


