Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A976C61DC6
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:37:23 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3440.1787708238839713647
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kQaPouVF;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-934956bee57so40833785a.2
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708238; x=1788313038; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Klk4pocGFx93zA1NK6FT16pFh19pwBinS01U8FnAKrs=;
        b=kQaPouVFhuXQW9lHT5wEXN7GQtA7C1IYgdZbCg5nlxw+6kP1ke3yWXZ6+7G+OK/l9w
         VPn6vVSL3PEY1BE2XO/OKvSYASfxufYAN1La4ckfCTYEVH+S/ZCVWOcnYVUmu1r2xkUU
         UiOKx/h3QJEtZ43wz6OWksxAEJ1qoUs74hBzMwe3mOa8Jrfio6m2ro31LUDrb2IAckOh
         1U+4OrupkHXUI8lVk9MYXwcGaQ+URn4dwaFoyMg8Ael2yrJ302On+cFUJ/Q2wZas8IZ9
         0GGyzqROWQyaKyk8yOtP8ML56pfqs48u+zOrs2crOIuaFn7xtSgP+3G6wQFeSxxU0P3+
         mGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708238; x=1788313038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Klk4pocGFx93zA1NK6FT16pFh19pwBinS01U8FnAKrs=;
        b=NBc7qVOw6odwgQJk9x6VSDlNPTd57O0Q1DDxACksA29y1YSeSq9ns1XQEkuVyl3xrR
         yhwBSH4XYp5Thgkb8/95meYs0/6y8g9gpvYw62QeZN4r+4qlXT5fZBhCeARyHr8iy7B2
         axNc5o1Kus6nxwa7h9+odoNYcyXZxUvCXQOFy4mJijtkFLklhHBf5xQ4yEMV962lbsTP
         vTRk+itMrmwRAo7mKP7LmG6y407v+YY/YTNjLC/SJUMF2auy5GMpyFN6bEWHknFXMbb3
         WM0mCXRQhUBr8f4TFYEgKQbq5n09jXJ3XlVcXFoko3YFv61UVKuDaWMj6duYIa38zBFf
         +aMA==
X-Gm-Message-State: AFuF++nMBxbciXkFY2pLkE6BStXPX6uJ+y/3dIkEMNMeps245S+43Vl2
	Vh/L0l2n+2Q8Jtbdn1us8HmNtLqwDDhV3fU9x+oXSaE1o4uOVvmd7ARfOwI/etw8
X-Gm-Gg: AR+sD13ElzNfG5B8BVulpTInnyPjC9rPIJsDvxYTBtSyyXk+9LJOQZ6yOV8eFhRRNPv
	T6XL7Ied9VVoFxVc64GH42r98T0KEhHy2oUINGPl+RDojfXgRg6vodmFmqjS0YCsdZOnvCEdn/e
	Ez7Phh3uB/5mKh7xQrS0GqXH7/pTwrT7wmx+T8wU38UbVgFIUgyd4mG3a7eQJAm07RQ8tF39OL/
	FhNrP56NQHo2L2oAmFDzn+p0TVApdyABSbkmqropzSmuCM09vC5/8iZm0ts6esQR1TLioLT0zeH
	mYy6KpPBkZZl9Gyr/V5EBGXmiIzITe54zdjNNLGxasmjUr6YuFy1vut+fwNC+B8F/EYK0ViDhxo
	R++T0p+LofzrYo9rVYQKPdx4aCaX3dLbnmn60mO5rLknv4AsEjAhzk7ujhDI5FIgDJ2Y8warYuC
	dSVy9C3PNx6olT9Ikw7w0pxbMcvXtQ6jWwgIk8fvW7gNelk8oFsFsdwg+/n3ueYo4wg8FVJIq0E
	iSKRm951LoggZdRUSFITPmVEwwaK5M=
X-Received: by 2002:a05:620a:a902:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93780186c71mr280002485a.1.1787708232981;
        Tue, 25 Aug 2026 18:37:12 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c50esm103863685a.37.2026.08.25.18.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:37:11 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: bitbake-devel@lists.openembedded.org
Subject: [PATCH 2/4] doc: bitbake-user-manual-ref-variables: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:37:01 -0400
Message-ID: <20260826013703.2674786-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013703.2674786-1-twoerner@gmail.com>
References: <20260826013703.2674786-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:37:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10360

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 47 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../bitbake-user-manual-ref-variables.rst     | 188 +++++++++++++-----
 1 file changed, 141 insertions(+), 47 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index 5395ce5e395d..3fec02e5f533 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -40,7 +40,9 @@ overview of their function and contents.
       This is a special variable used during fetching. When :term:`SRCREV` is
       set to the value of this variable, the latest revision from the version
       controlled source code repository is used.
-      It should be set as follows::
+      It should be set as follows:
+
+      .. code-block:: bitbake
 
          SRCREV = "${AUTOREV}"
 
@@ -48,7 +50,9 @@ overview of their function and contents.
       Azure Storage Shared Access Signature, when using the
       :ref:`Azure Storage fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
       This variable can be defined to be used by the fetcher to authenticate
-      and gain access to non-public artifacts::
+      and gain access to non-public artifacts:
+
+      .. code-block:: bitbake
 
          AZ_SAS = ""se=2021-01-01&sp=r&sv=2018-11-09&sr=c&skoid=<skoid>&sig=<signature>""
 
@@ -72,7 +76,9 @@ overview of their function and contents.
       -  Limited support for the "``*``" wildcard character for matching
          against the beginning of host names exists. For example, the
          following setting matches ``git.gnu.org``, ``ftp.gnu.org``, and
-         ``foo.git.gnu.org``. ::
+         ``foo.git.gnu.org``.
+
+         .. code-block:: bitbake
 
             BB_ALLOWED_NETWORKS = "\*.gnu.org"
 
@@ -127,7 +133,9 @@ overview of their function and contents.
       be included are those where the value is not significant for where the
       codeparser cache is used (i.e. when calculating variable dependencies for
       code fragments.) The value is space-separated without quoting values, for
-      example::
+      example:
+
+      .. code-block:: bitbake
 
          BB_HASH_CODEPARSER_VALS = "T=/ WORKDIR=/ DATE=1234 TIME=1234"
 
@@ -170,15 +178,21 @@ overview of their function and contents.
       <ref-bitbake-user-manual-metadata-inherit-defer>` for more information on
       deferred inherits.
 
-      This means that if :term:`BB_DEFER_BBCLASSES` is set as follows::
+      This means that if :term:`BB_DEFER_BBCLASSES` is set as follows:
+
+      .. code-block:: bitbake
 
          BB_DEFER_BBCLASSES = "foo"
 
-      The following statement::
+      The following statement:
+
+      .. code-block:: bitbake
 
          inherit foo
 
-      Will automatically be equal to calling::
+      Will automatically be equal to calling:
+
+      .. code-block:: bitbake
 
          inherit_defer foo
 
@@ -187,7 +201,9 @@ overview of their function and contents.
       you to control the build based on these parameters.
 
       Disk space monitoring is disabled by default. When setting this
-      variable, use the following form::
+      variable, use the following form:
+
+      .. code-block:: bitbake
 
          BB_DISKMON_DIRS = "<action>,<dir>,<threshold> [...]"
 
@@ -223,7 +239,9 @@ overview of their function and contents.
                not specify G, M, or K, Kbytes is assumed by
                default.  Do not use GB, MB, or KB.
 
-      Here are some examples::
+      Here are some examples:
+
+      .. code-block:: bitbake
 
          BB_DISKMON_DIRS = "HALT,${TMPDIR},1G,100K WARN,${SSTATE_DIR},1G,100K"
          BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},1G"
@@ -264,7 +282,9 @@ overview of their function and contents.
       BB_DISKMON_WARNINTERVAL = "50M,5K"
 
       When specifying the variable in your configuration file, use the
-      following form::
+      following form:
+
+      .. code-block:: bitbake
 
          BB_DISKMON_WARNINTERVAL = "<disk_space_interval>,<disk_inode_interval>"
 
@@ -280,7 +300,9 @@ overview of their function and contents.
                G, M, or K for Gbytes, Mbytes, or Kbytes,
                respectively. You cannot use GB, MB, or KB.
 
-      Here is an example::
+      Here is an example:
+
+      .. code-block:: bitbake
 
          BB_DISKMON_DIRS = "WARN,${SSTATE_DIR},1G,100K"
          BB_DISKMON_WARNINTERVAL = "50M,5K"
@@ -333,7 +355,9 @@ overview of their function and contents.
       wishing to create a source mirror would want to enable this variable.
 
       For performance reasons, creating and placing tarballs of the Git
-      repositories is not the default action by BitBake. ::
+      repositories is not the default action by BitBake.
+
+      .. code-block:: bitbake
 
          BB_GENERATE_MIRROR_TARBALLS = "1"
 
@@ -426,7 +450,9 @@ overview of their function and contents.
       variable is a space-separated list of refs, fully specified, and supports
       wildcards.
 
-      Example usage::
+      Example usage:
+
+      .. code-block:: bitbake
 
          BB_GIT_SHALLOW_EXTRA_REFS = "refs/tags/v1.0"
          BB_GIT_SHALLOW_EXTRA_REFS += "refs/heads/*"
@@ -517,7 +543,9 @@ overview of their function and contents.
       and you wish the local server to query an upstream server for
       Hash Equivalence data.
 
-      Example usage::
+      Example usage:
+
+      .. code-block:: bitbake
 
          BB_HASHSERVE_UPSTREAM = "hashserv.yoctoproject.org:8686"
 
@@ -624,7 +652,9 @@ overview of their function and contents.
       https://docs.kernel.org/accounting/psi.html for more information.
 
       A default value to limit the CPU pressure to be set in ``conf/local.conf``
-      could be::
+      could be:
+
+      .. code-block:: bitbake
 
          BB_PRESSURE_MAX_CPU = "15000"
 
@@ -665,7 +695,9 @@ overview of their function and contents.
       :term:`BB_PRESSURE_MAX_CPU` can help to reduce it.
 
       A default value to limit the IO pressure to be set in ``conf/local.conf``
-      could be::
+      could be:
+
+      .. code-block:: bitbake
 
          BB_PRESSURE_MAX_IO = "15000"
 
@@ -708,7 +740,9 @@ overview of their function and contents.
       occurring during builds.
 
       A default value to limit the memory pressure to be set in
-      ``conf/local.conf`` could be::
+      ``conf/local.conf`` could be:
+
+      .. code-block:: bitbake
 
          BB_PRESSURE_MAX_MEMORY = "15000"
 
@@ -829,7 +863,9 @@ overview of their function and contents.
          This variable works similarly to the :term:`BB_TASK_NICE_LEVEL`
          variable except with a task's I/O priorities.
 
-      Set the variable as follows::
+      Set the variable as follows:
+
+      .. code-block:: bitbake
 
          BB_TASK_IONICE_LEVEL = "class.prio"
 
@@ -894,7 +930,9 @@ overview of their function and contents.
       To build a different variant of the recipe with a minimal amount of
       code, it usually is as simple as adding the variable to your recipe.
       Here are two examples. The "native" variants are from the
-      OpenEmbedded-Core metadata::
+      OpenEmbedded-Core metadata:
+
+      .. code-block:: bitbake
 
          BBCLASSEXTEND =+ "native nativesdk"
          BBCLASSEXTEND =+ "multilib:multilib_name"
@@ -991,7 +1029,9 @@ overview of their function and contents.
          collection_name:filename_pattern
 
       The following example identifies two collection names and two filename
-      patterns::
+      patterns:
+
+      .. code-block:: bitbake
 
          BBFILES_DYNAMIC += "\
              clang-layer:${LAYERDIR}/bbappends/meta-clang/*/*/*.bbappend \
@@ -999,7 +1039,9 @@ overview of their function and contents.
          "
 
       When the collection name is prefixed with "!" it will add the file pattern in case
-      the layer is absent::
+      the layer is absent:
+
+      .. code-block:: bitbake
 
          BBFILES_DYNAMIC += "\
              !clang-layer:${LAYERDIR}/backfill/meta-clang/*/*/*.bb \
@@ -1029,7 +1071,9 @@ overview of their function and contents.
    :term:`BBLAYERS`
       Lists the layers to enable during the build. This variable is defined
       in the ``bblayers.conf`` configuration file in the build directory.
-      Here is an example::
+      Here is an example:
+
+      .. code-block:: bitbake
 
          BBLAYERS = " \
              /home/scottrif/poky/meta \
@@ -1063,13 +1107,17 @@ overview of their function and contents.
 
       The following example uses a complete regular expression to tell
       BitBake to ignore all recipe and recipe append files in
-      ``recipes-bsp`` directory (recursively) of ``meta-ti-bsp``::
+      ``recipes-bsp`` directory (recursively) of ``meta-ti-bsp``:
+
+      .. code-block:: bitbake
 
          BBMASK = "${BBFILE_PATTERN_meta-ti-bsp}/recipes-bsp/"
 
       If you want to mask out multiple directories or recipes, you can
       specify multiple regular expression fragments. This next example
-      masks out multiple directories and individual recipes::
+      masks out multiple directories and individual recipes:
+
+      .. code-block:: bitbake
 
          BBMASK += "${BBFILE_PATTERN_meta-ti-bsp}/recipes-graphics/libgal/"
          BBMASK += "${BBFILE_PATTERN_openembedded-layer}/recipes-support/"
@@ -1093,12 +1141,16 @@ overview of their function and contents.
 
          Because these are complete regular expressions, if you want to match a
          directory and not a file, you must end the expression with a trailing
-         slash. That is::
+         slash. That is:
+
+         .. code-block:: bitbake
 
             BBMASK += "${BBFILE_PATTERN_meta-ti-bsp}/recipes-graphics/libgal/"
 
          Will match anything under ``recipes-graphics/ligbal/`` directory of
-         ``meta-ti-bsp``. And::
+         ``meta-ti-bsp``. And:
+
+         .. code-block:: bitbake
 
             BBMASK += "${BBFILE_PATTERN_meta-ti-bsp}/recipes-graphics/libgal"
 
@@ -1119,7 +1171,9 @@ overview of their function and contents.
          Because these are complete regular expressions, failing to start the
          pattern with a ``^`` sign (which is usually the first character in
          :term:`BBFILE_PATTERN`) means it can match *any* portion of a path.
-         Take the following as an example::
+         Take the following as an example:
+
+         .. code-block:: bitbake
 
             BBMASK = "recipes-graphics/libgal/"
 
@@ -1138,14 +1192,18 @@ overview of their function and contents.
 
          Because these are complete regular expressions, a leading slash does
          not mean the path is absolute. It simply forces the directory to be
-         named exactly that. Take::
+         named exactly that. Take:
+
+         .. code-block:: bitbake
 
             BBMASK = "recipes-graphics/libgal/"
 
          If you happen to have a directory ``foo-recipes-graphics/libgal/``, it
          will be matched.
 
-         Leading with a slash::
+         Leading with a slash:
+
+         .. code-block:: bitbake
 
             BBMASK = "/recipes-graphics/libgal/"
 
@@ -1163,7 +1221,9 @@ overview of their function and contents.
       ``conf/local.conf`` configuration file.
 
       As an example, the following line specifies three multiconfigs, each
-      having a separate configuration file::
+      having a separate configuration file:
+
+      .. code-block:: bitbake
 
          BBMULTIFONFIG = "configA configB configC"
 
@@ -1235,7 +1295,9 @@ overview of their function and contents.
 
       Consider this simple example for two recipes named "a" and "b" that
       produce similarly named packages. In this example, the :term:`DEPENDS`
-      statement appears in the "a" recipe::
+      statement appears in the "a" recipe:
+
+      .. code-block:: bitbake
 
          DEPENDS = "b"
 
@@ -1394,7 +1456,9 @@ overview of their function and contents.
       this variable in your layer's ``conf/layer.conf`` configuration file.
       For the list, use the Yocto Project release name (e.g. "kirkstone",
       "mickledore"). To specify multiple OE-Core versions for the layer, use
-      a space-separated list::
+      a space-separated list:
+
+      .. code-block:: bitbake
 
          LAYERSERIES_COMPAT_layer_root_name = "kirkstone mickledore"
 
@@ -1428,7 +1492,9 @@ overview of their function and contents.
 
       This variable has a specific syntax. Each line must contain a regular
       expression matching the original source URL and a replacement URL for it.
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          MIRRORS:prepend = " \
              git://git.openembedded.org/.* git:///mirrors/openembedded/BASENAME \
@@ -1462,7 +1528,9 @@ overview of their function and contents.
          ``git.openembedded.org.project.repo.git``.
 
       The rightmost part of the line can also be a bare URL that uses no special
-      keywords (usually ``https://`` or ``file://``). For example::
+      keywords (usually ``https://`` or ``file://``). For example:
+
+      .. code-block:: bitbake
 
          MIRRORS:prepend = " \
              git://git.openembedded.org/.* file:///mirrors/openembedded/ \
@@ -1549,11 +1617,15 @@ overview of their function and contents.
       :term:`PREFERRED_PROVIDERS` is identical to
       :term:`PREFERRED_PROVIDER`. However, the :term:`PREFERRED_PROVIDERS` variable
       lets you define preferences for multiple situations using the following
-      form::
+      form:
+
+      .. code-block:: bitbake
 
          PREFERRED_PROVIDERS = "xxx:yyy aaa:bbb ..."
 
-      This form is a convenient replacement for the following::
+      This form is a convenient replacement for the following:
+
+      .. code-block:: bitbake
 
          PREFERRED_PROVIDER_xxx = "yyy"
          PREFERRED_PROVIDER_aaa = "bbb"
@@ -1569,7 +1641,9 @@ overview of their function and contents.
       through the "``%``" character. You can use the character to match any
       number of characters, which can be useful when specifying versions
       that contain long revision numbers that potentially change. Here are
-      two examples::
+      two examples:
+
+      .. code-block:: bitbake
 
          PREFERRED_VERSION_python = "2.7.3"
          PREFERRED_VERSION_linux-yocto = "4.12%"
@@ -1593,7 +1667,9 @@ overview of their function and contents.
 
       Typically, you would add a specific server for the build system to
       attempt before any others by adding something like the following to
-      your configuration::
+      your configuration:
+
+      .. code-block:: bitbake
 
          PREMIRRORS:prepend = "\
          git://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \
@@ -1619,7 +1695,9 @@ overview of their function and contents.
       :term:`DEPENDS`.
 
       Consider the following example :term:`PROVIDES` statement from a recipe
-      file ``libav_0.8.11.bb``::
+      file ``libav_0.8.11.bb``:
+
+      .. code-block:: bitbake
 
          PROVIDES += "libpostproc"
 
@@ -1642,7 +1720,9 @@ overview of their function and contents.
    :term:`PRSERV_HOST`
       The network based :term:`PR` service host and port.
 
-      Following is an example of how the :term:`PRSERV_HOST` variable is set::
+      Following is an example of how the :term:`PRSERV_HOST` variable is set:
+
+      .. code-block:: bitbake
 
          PRSERV_HOST = "localhost:0"
 
@@ -1663,7 +1743,9 @@ overview of their function and contents.
       you should always use the variable in a form with an attached package
       name. For example, suppose you are building a development package
       that depends on the ``perl`` package. In this case, you would use the
-      following :term:`RDEPENDS` statement::
+      following :term:`RDEPENDS` statement:
+
+      .. code-block:: bitbake
 
          RDEPENDS:${PN}-dev += "perl"
 
@@ -1674,7 +1756,9 @@ overview of their function and contents.
       BitBake supports specifying versioned dependencies. Although the
       syntax varies depending on the packaging format, BitBake hides these
       differences from you. Here is the general syntax to specify versions
-      with the :term:`RDEPENDS` variable::
+      with the :term:`RDEPENDS` variable:
+
+      .. code-block:: bitbake
 
          RDEPENDS:${PN} = "package (operator version)"
 
@@ -1687,7 +1771,9 @@ overview of their function and contents.
          >=
 
       For example, the following sets up a dependency on version 1.2 or
-      greater of the package ``foo``::
+      greater of the package ``foo``:
+
+      .. code-block:: bitbake
 
          RDEPENDS:${PN} = "foo (>= 1.2)"
 
@@ -1716,7 +1802,9 @@ overview of their function and contents.
 
       As with all package-controlling variables, you must always use the
       variable in conjunction with a package name override. Here is an
-      example::
+      example:
+
+      .. code-block:: bitbake
 
          RPROVIDES:${PN} = "widget-abi-2"
 
@@ -1730,7 +1818,9 @@ overview of their function and contents.
       BitBake supports specifying versioned recommends. Although the syntax
       varies depending on the packaging format, BitBake hides these
       differences from you. Here is the general syntax to specify versions
-      with the :term:`RRECOMMENDS` variable::
+      with the :term:`RRECOMMENDS` variable:
+
+      .. code-block:: bitbake
 
          RRECOMMENDS:${PN} = "package (operator version)"
 
@@ -1743,7 +1833,9 @@ overview of their function and contents.
          >=
 
       For example, the following sets up a recommend on version
-      1.2 or greater of the package ``foo``::
+      1.2 or greater of the package ``foo``:
+
+      .. code-block:: bitbake
 
          RRECOMMENDS:${PN} = "foo (>= 1.2)"
 
@@ -1829,7 +1921,9 @@ overview of their function and contents.
       -  ``name``: Specifies a name to be used for association with
          :term:`SRC_URI` checksums or :term:`SRCREV` when you have more than one
          file or source control repository specified in :term:`SRC_URI`.
-         For example::
+         For example:
+
+         .. code-block:: bitbake
 
             SRC_URI = "git://example.com/foo.git;branch=main;name=first \
                        git://example.com/bar.git;branch=main;name=second \

