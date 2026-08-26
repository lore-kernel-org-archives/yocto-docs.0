Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA09CC61DB9
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:21 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3462.1787708111832077245
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bLFVHN/v;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92ed19f4d60so29711885a.0
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708111; x=1788312911; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eR5JHgIOaC6B/Ek7HgVciHB1oRMXtDg90Dw3zDiV754=;
        b=bLFVHN/vtTs3tolUsQoKn2s4PdK+KK6p/4uXqME8Louo9tGesyC6+00BpD2nGN73XT
         fiIvRm2YUIh3m84BOxKlMDny7R1PhEhf3ff8LXr+zxqvY+ppja+vmC//3rBIWMoTmNm0
         Kadztl2veXh/RwEKceW0TWR5kRoMcoxRNVpKKOi11xura1+ghRt7SBbsRvc58Kr3Uh0W
         6KbSTf/dmElOR+g0nBa3bCWxLnc50rG/r1L2+048g1zgQDnD8n1M59MZITQdJLq4HO3L
         j54lP60zEIgMZXflVB4oam3ZXpXKg6rFZYiUTcNxMQSIzUf9chU9Sk8DdDcGnz3GLw2R
         tzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708111; x=1788312911;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eR5JHgIOaC6B/Ek7HgVciHB1oRMXtDg90Dw3zDiV754=;
        b=Ew12Kmoe9d/BvjS1zn+B3mdgAj1pfCSdpG8fbVFI4huYNfVmBDsf8K57y0d0f0NlUT
         ql+Px4RF5rwGNvagcSbVtU9OW/k0ksz031NqihNTwQeRw+/BxaWev3rViHD9czSLdlki
         XNr+rlw52WkDImeYzS5VlYq/jyCqCqwvrjUfgqbbAOoQfUiIeOSzSzYXejcD93QmTCKu
         JUHsNV495Ft0l5h9dwuwuKW53MgkKftzSD6KMw31cvE8fBQDjZidRZiNHumSmgp0xT2X
         p/BAY/fyoh/cx+ITjp52/0DSFrqpnTgr+PQY2NE3mMa3GdXdXSxS5J0pPsxJuGa2kSAN
         eHag==
X-Gm-Message-State: AFuF++nO5J0K+/tqjvFER/h4cRZCIEtS2qpcmDCrxv8SVsastoI1jvCn
	R6FLSqiXFbNmAfkEdT+pv1F28+Q8if8sDZKWbfl9gqhD0O+vwa3Cm8oyyJlLXjX9
X-Gm-Gg: AR+sD12gNADwjZGzGS9dl938SaZpjikRXL/PQX8WuQBtXBQwU2SU8Kke1SQ1g8d8Vh7
	zdCeLt2v1oDX4K3TOIdrxX9wzuNoFV3BlAM+bYvfkzXo8SsXjf/rIefjQTJZG4fL0Eh6ElsGCKG
	qHzmXbpqN7h4cgwsNCVtbIogx8BaUzEmosW+o62iBvWVquzeSoR7piFpvhHy0CgPPRrFXAM7rp0
	SNrXZ3U5noM5oavwZ+0dLmfMH2DhP5AHwd62xVKJDOf2GY9uJkszNJ5nUyu5mmjVgM20drVDzjE
	2rVy8iqNXatqJFgtMy8G+HEI3g/LFnTeq8AJcs6sS24HAwLDhyZMzQ9jniR2atSVq5DUmO2KOf+
	kidm6lIxfeJ7Oanmi5qPdaxQGsjU6jsf16bADjEBe46TgdHVaWppFVtbMe0x1c+W9NpvIa5tKl7
	cjkwLnzBWXpx7blijV1DmQ66qrOBniu8L/m2UH8PanfahE2m1hSYp64iesgZAIsVcWg+hIAFo/2
	JNznPsLMyoRfFp5f+MU9AAxZqqdan0=
X-Received: by 2002:ae9:f703:0:b0:92e:57ea:8c8b with SMTP id af79cd13be357-9376f0ddbacmr916030685a.0.1787708108216;
        Tue, 25 Aug 2026 18:35:08 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.06
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:06 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 01/10] ref-manual/variables.rst: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:34:46 -0400
Message-ID: <20260826013502.2674000-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10346

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 418 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

Blocks that only look like BitBake are left alone, as are blocks
already tagged "none" where the content is deliberately unhighlighted.

The variables glossary is the densest concentration of BitBake syntax in
the documentation, and nearly every entry showing how to set a variable
was affected.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/ref-manual/variables.rst | 1635 ++++++++++++++++++------
 1 file changed, 1226 insertions(+), 409 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 646a77982646..61a4c6faca20 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -31,7 +31,9 @@ system and gives an overview of their function and contents.
 
       ABI extensions are set in the machine include files. For example, the
       ``meta/conf/machine/include/arm/arch-arm.inc`` file sets the
-      following extension::
+      following extension:
+
+      .. code-block:: bitbake
 
          ABIEXTENSION = "eabi"
 
@@ -43,7 +45,9 @@ system and gives an overview of their function and contents.
       requirement on the existence of the package.
 
       Like all package-controlling variables, you must always use them in
-      conjunction with a package name override, as in::
+      conjunction with a package name override, as in:
+
+      .. code-block:: bitbake
 
          ALLOW_EMPTY:${PN} = "1"
          ALLOW_EMPTY:${PN}-dev = "1"
@@ -58,7 +62,9 @@ system and gives an overview of their function and contents.
 
       To use the variable, list out the package's commands that are also
       provided by another package. For example, if the ``busybox`` package
-      has four such commands, you identify them as follows::
+      has four such commands, you identify them as follows:
+
+      .. code-block:: bitbake
 
          ALTERNATIVE:busybox = "sh sed test bracket"
 
@@ -71,7 +77,9 @@ system and gives an overview of their function and contents.
       locations. For example, if the ``bracket`` command provided by the
       ``busybox`` package is duplicated through another package, you must
       use the :term:`ALTERNATIVE_LINK_NAME` variable to specify the actual
-      location::
+      location:
+
+      .. code-block:: bitbake
 
          ALTERNATIVE_LINK_NAME[bracket] = "/usr/bin/["
 
@@ -92,7 +100,9 @@ system and gives an overview of their function and contents.
       default regardless of the command name or package, a default for
       specific duplicated commands regardless of the package, or a default
       for specific commands tied to particular packages. Here are the
-      available syntax forms::
+      available syntax forms:
+
+      .. code-block:: bitbake
 
          ALTERNATIVE_PRIORITY = "priority"
          ALTERNATIVE_PRIORITY[name] = "priority"
@@ -108,7 +118,9 @@ system and gives an overview of their function and contents.
       default location for all duplicated commands regardless of the
       command name or package, a default for specific duplicated commands
       regardless of the package, or a default for specific commands tied to
-      particular packages. Here are the available syntax forms::
+      particular packages. Here are the available syntax forms:
+
+      .. code-block:: bitbake
 
          ALTERNATIVE_TARGET = "target"
          ALTERNATIVE_TARGET[name] = "target"
@@ -156,7 +168,9 @@ system and gives an overview of their function and contents.
       determines the type of information used to create a released archive.
       You can use this variable to create archives of patched source,
       original source, configured source, and so forth by employing the
-      following variable flags (varflags)::
+      following variable flags (varflags):
+
+      .. code-block:: bitbake
 
          ARCHIVER_MODE[src] = "original"                   # Uses original (unpacked) source files.
          ARCHIVER_MODE[src] = "patched"                    # Uses patched source files. This is the default.
@@ -196,7 +210,9 @@ system and gives an overview of their function and contents.
          shlibname:packagename[_version]
 
       Here is an example that adds a shared library named ``libEGL.so.1``
-      as being provided by the ``libegl-implementation`` package::
+      as being provided by the ``libegl-implementation`` package:
+
+      .. code-block:: bitbake
 
          ASSUME_SHLIBS = "libEGL.so.1:libegl-implementation"
 
@@ -217,14 +233,18 @@ system and gives an overview of their function and contents.
 
    :term:`AUTOREV`
       When :term:`SRCREV` is set to the value of this variable, it specifies to
-      use the latest source revision in the repository. Here is an example::
+      use the latest source revision in the repository. Here is an example:
+
+      .. code-block:: bitbake
 
          SRCREV = "${AUTOREV}"
 
       If you use the previous statement to retrieve the latest version of
       software, you need to make sure :term:`PV` contains the ``+`` sign so
       :term:`bitbake` includes source control information to :term:`PKGV` when
-      packaging the recipe. For example::
+      packaging the recipe. For example:
+
+      .. code-block:: bitbake
 
          PV = "6.10.y+git"
 
@@ -259,7 +279,9 @@ system and gives an overview of their function and contents.
       Azure Storage Shared Access Signature, when using the
       :ref:`Azure Storage fetcher (az://) <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
       This variable can be defined to be used by the fetcher to authenticate
-      and gain access to non-public artifacts::
+      and gain access to non-public artifacts:
+
+      .. code-block:: bitbake
 
          AZ_SAS = ""se=2021-01-01&sp=r&sv=2018-11-09&sr=c&skoid=<skoid>&sig=<signature>""
 
@@ -270,7 +292,9 @@ system and gives an overview of their function and contents.
       The directory within the :term:`Build Directory` in which the
       OpenEmbedded build system places generated objects during a recipe's
       build process. By default, this directory is the same as the
-      :term:`S` directory, which is defined as::
+      :term:`S` directory, which is defined as:
+
+      .. code-block:: bitbake
 
          S = "${UNPACKDIR}/${BP}"
 
@@ -284,13 +308,17 @@ system and gives an overview of their function and contents.
       packages are packages installed only through the
       :term:`RRECOMMENDS` variable. You can prevent any
       of these "recommended" packages from being installed by listing them
-      with the :term:`BAD_RECOMMENDATIONS` variable::
+      with the :term:`BAD_RECOMMENDATIONS` variable:
+
+      .. code-block:: bitbake
 
          BAD_RECOMMENDATIONS = "package_name package_name package_name ..."
 
       You can set this variable globally in your ``local.conf`` file or you
       can attach it to a specific image recipe by using the recipe name
-      override::
+      override:
+
+      .. code-block:: bitbake
 
          BAD_RECOMMENDATIONS:pn-target_image = "package_name"
 
@@ -315,7 +343,9 @@ system and gives an overview of their function and contents.
       By default, all built binaries will be deployed and installed under their
       original name.
 
-      Here is an example usage of this variable::
+      Here is an example usage of this variable:
+
+      .. code-block:: bitbake
 
          BAREBOX_BINARY = "barebox-boundarydevices-imx6dl-nitrogen6x-1g.img"
 
@@ -326,7 +356,9 @@ system and gives an overview of their function and contents.
       This variable is mainly useful for generic use cases where a dedicated
       configuration is not required.
       The :ref:`ref-classes-barebox` class itself already sets it for some QEMU
-      machines::
+      machines:
+
+      .. code-block:: bitbake
 
          BAREBOX_CONFIG:qemuarm = "multi_v7_defconfig"
          BAREBOX_CONFIG:qemuarm64 = "multi_v8_defconfig"
@@ -361,7 +393,9 @@ system and gives an overview of their function and contents.
 
       -  There is limited support for wildcard matching against the beginning of
          host names. For example, the following setting matches
-         ``git.gnu.org``, ``ftp.gnu.org``, and ``foo.git.gnu.org``::
+         ``git.gnu.org``, ``ftp.gnu.org``, and ``foo.git.gnu.org``:
+
+         .. code-block:: bitbake
 
             BB_ALLOWED_NETWORKS = "*.gnu.org"
 
@@ -473,7 +507,9 @@ system and gives an overview of their function and contents.
                not specify G, M, or K, Kbytes is assumed by
                default.  Do not use GB, MB, or KB.
 
-      Here are some examples::
+      Here are some examples:
+
+      .. code-block:: bitbake
 
          BB_DISKMON_DIRS = "ABORT,${TMPDIR},1G,100K WARN,${SSTATE_DIR},1G,100K"
          BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},1G"
@@ -513,7 +549,9 @@ system and gives an overview of their function and contents.
 
       If you do not provide a :term:`BB_DISKMON_WARNINTERVAL` variable and you
       do use :term:`BB_DISKMON_DIRS` with the "WARN" action, the disk
-      monitoring interval defaults to the following::
+      monitoring interval defaults to the following:
+
+      .. code-block:: bitbake
 
          BB_DISKMON_WARNINTERVAL = "50M,5K"
 
@@ -536,7 +574,9 @@ system and gives an overview of their function and contents.
                G, M, or K for Gbytes, Mbytes, or Kbytes,
                respectively. You cannot use GB, MB, or KB.
 
-      Here is an example::
+      Here is an example:
+
+      .. code-block:: bitbake
 
          BB_DISKMON_DIRS = "WARN,${SSTATE_DIR},1G,100K"
          BB_DISKMON_WARNINTERVAL = "50M,5K"
@@ -568,7 +608,9 @@ system and gives an overview of their function and contents.
 
       For performance reasons, creating and placing tarballs of these
       repositories is not the default action by the OpenEmbedded build
-      system::
+      system:
+
+      .. code-block:: bitbake
 
          BB_GENERATE_MIRROR_TARBALLS = "1"
 
@@ -724,7 +766,9 @@ system and gives an overview of their function and contents.
       long the BitBake server stays resident between invocations.
 
       For example, the following statement in your ``local.conf`` file
-      instructs the server to be unloaded after 20 seconds of inactivity::
+      instructs the server to be unloaded after 20 seconds of inactivity:
+
+      .. code-block:: bitbake
 
          BB_SERVER_TIMEOUT = "20"
 
@@ -775,7 +819,9 @@ system and gives an overview of their function and contents.
       the form "``multilib:``\ multilib_name".
 
       To build a different variant of the recipe with a minimal amount of
-      code, it usually is as simple as adding the following to your recipe::
+      code, it usually is as simple as adding the following to your recipe:
+
+      .. code-block:: bitbake
 
          BBCLASSEXTEND =+ "native nativesdk"
          BBCLASSEXTEND =+ "multilib:multilib_name"
@@ -857,7 +903,9 @@ system and gives an overview of their function and contents.
       ``collection_name:filename_pattern``.
 
       The following example identifies two collection names and two
-      filename patterns::
+      filename patterns:
+
+      .. code-block:: bitbake
 
          BBFILES_DYNAMIC += " \
             clang-layer:${LAYERDIR}/dynamic-layers/meta-clang/*/*/*.bbappend \
@@ -888,7 +936,9 @@ system and gives an overview of their function and contents.
    :term:`BBLAYERS`
       Lists the layers to enable during the build. This variable is defined
       in the ``bblayers.conf`` configuration file in the :term:`Build Directory`.
-      Here is an example::
+      Here is an example:
+
+      .. code-block:: bitbake
 
          BBLAYERS = " \
              /home/scottrif/bitbake-builds/layers/meta \
@@ -920,13 +970,17 @@ system and gives an overview of their function and contents.
 
       The following example uses a complete regular expression to tell
       BitBake to ignore all recipe and recipe append files in the
-      ``meta-ti/recipes-misc/`` directory::
+      ``meta-ti/recipes-misc/`` directory:
+
+      .. code-block:: bitbake
 
          BBMASK = "meta-ti/recipes-misc/"
 
       If you want to mask out multiple directories or recipes, you can
       specify multiple regular expression fragments. This next example
-      masks out multiple directories and individual recipes::
+      masks out multiple directories and individual recipes:
+
+      .. code-block:: bitbake
 
          BBMASK += "/meta-ti/recipes-misc/ meta-ti/recipes-ti/packagegroup/"
          BBMASK += "/meta-oe/recipes-support/"
@@ -944,7 +998,9 @@ system and gives an overview of their function and contents.
       building targets with multiple configurations. Use this variable in
       your ``conf/local.conf`` configuration file. Specify a
       multiconfigname for each configuration file you are using. For
-      example, the following line specifies three configuration files::
+      example, the following line specifies three configuration files:
+
+      .. code-block:: bitbake
 
          BBMULTICONFIG = "configA configB configC"
 
@@ -987,7 +1043,9 @@ system and gives an overview of their function and contents.
       and replaced.
 
       To add multiple scripts, separate them by spaces. Here is an example
-      from the ``libpng`` recipe::
+      from the ``libpng`` recipe:
+
+      .. code-block:: bitbake
 
          BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
@@ -1042,7 +1100,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_AR`
       Specifies the architecture-specific :manpage:`archiver <ar(1)>` for the
       build host, and its default definition is derived in part from
-      :term:`BUILD_PREFIX`::
+      :term:`BUILD_PREFIX`:
+
+      .. code-block:: bitbake
 
          BUILD_AR = "${BUILD_PREFIX}ar"
 
@@ -1063,7 +1123,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_AS`
       Specifies the architecture-specific :manpage:`assembler <as(1)>` for the
       build host, and its default definition is derived in part from
-      :term:`BUILD_PREFIX`::
+      :term:`BUILD_PREFIX`:
+
+      .. code-block:: bitbake
 
          BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
 
@@ -1083,7 +1145,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_CC`
       Specifies the architecture-specific C compiler for the build host,
       and its default definition is derived in part from :term:`BUILD_PREFIX`
-      and :term:`BUILD_CC_ARCH`::
+      and :term:`BUILD_CC_ARCH`:
+
+      .. code-block:: bitbake
 
          BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 
@@ -1104,7 +1168,9 @@ system and gives an overview of their function and contents.
       Specifies the :manpage:`linker <ld(1)>` command to be used for the build
       host when the C compiler is being used as the linker, and its default
       definition is derived in part from :term:`BUILD_PREFIX` and
-      :term:`BUILD_CC_ARCH`::
+      :term:`BUILD_CC_ARCH`:
+
+      .. code-block:: bitbake
 
          BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
 
@@ -1126,7 +1192,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_CPP`
       Specifies the C preprocessor command (to both the C and the C++ compilers)
       when building for the build host, and its default definition is derived in
-      part from :term:`BUILD_PREFIX` and :term:`BUILD_CC_ARCH`::
+      part from :term:`BUILD_PREFIX` and :term:`BUILD_CC_ARCH`:
+
+      .. code-block:: bitbake
 
          BUILD_CPP = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E"
 
@@ -1148,7 +1216,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_CXX`
       Specifies the architecture-specific C++ compiler for the build host,
       and its default definition is derived in part from :term:`BUILD_PREFIX`
-      and :term:`BUILD_CC_ARCH`::
+      and :term:`BUILD_CC_ARCH`:
+
+      .. code-block:: bitbake
 
          BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
 
@@ -1170,7 +1240,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_FC`
       Specifies the Fortran compiler command for the build host, and its default
       definition is derived in part from :term:`BUILD_PREFIX` and
-      :term:`BUILD_CC_ARCH`::
+      :term:`BUILD_CC_ARCH`:
+
+      .. code-block:: bitbake
 
          BUILD_FC = "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
 
@@ -1186,7 +1258,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_LD`
       Specifies the linker command for the build host, and its default
       definition is derived in part from :term:`BUILD_PREFIX` and
-      :term:`BUILD_LD_ARCH`::
+      :term:`BUILD_LD_ARCH`:
+
+      .. code-block:: bitbake
 
          BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
 
@@ -1212,7 +1286,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_NM`
       Specifies the architecture-specific utility to list symbols from object
       files for the build host, and its default definition is derived in part
-      from :term:`BUILD_PREFIX`::
+      from :term:`BUILD_PREFIX`:
+
+      .. code-block:: bitbake
 
          BUILD_NM = "${BUILD_PREFIX}nm"
 
@@ -1228,7 +1304,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_OBJCOPY`
       Specifies the architecture-specific utility to copy object files for the
       build host, and its default definition is derived in part from
-      :term:`BUILD_PREFIX`::
+      :term:`BUILD_PREFIX`:
+
+      .. code-block:: bitbake
 
          BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
 
@@ -1244,7 +1322,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_OBJDUMP`
       Specifies the architecture-specific utility to display object files
       information for the build host, and its default definition is derived in
-      part from :term:`BUILD_PREFIX`::
+      part from :term:`BUILD_PREFIX`:
+
+      .. code-block:: bitbake
 
          BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
 
@@ -1280,7 +1360,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_RANLIB`
       Specifies the architecture-specific utility to generate indexes for
       archives for the build host, and its default definition is derived in part
-      from :term:`BUILD_PREFIX`::
+      from :term:`BUILD_PREFIX`:
+
+      .. code-block:: bitbake
 
          BUILD_RANLIB = "${BUILD_PREFIX}ranlib -D"
 
@@ -1296,7 +1378,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_READELF`
       Specifies the architecture-specific utility to display information about
       ELF files for the build host, and its default definition is derived in
-      part from :term:`BUILD_PREFIX`::
+      part from :term:`BUILD_PREFIX`:
+
+      .. code-block:: bitbake
 
          BUILD_READELF = "${BUILD_PREFIX}readelf"
 
@@ -1312,7 +1396,9 @@ system and gives an overview of their function and contents.
    :term:`BUILD_STRIP`
       Specifies the command to be used to strip debugging symbols from binaries
       produced for the build host, and its default definition is derived in part
-      from :term:`BUILD_PREFIX`::
+      from :term:`BUILD_PREFIX`:
+
+      .. code-block:: bitbake
 
          BUILD_STRIP = "${BUILD_PREFIX}strip"
 
@@ -1358,7 +1444,9 @@ system and gives an overview of their function and contents.
       "1".
 
       By default, the :ref:`ref-classes-buildhistory` class
-      enables committing the buildhistory output in a local Git repository::
+      enables committing the buildhistory output in a local Git repository:
+
+      .. code-block:: bitbake
 
          BUILDHISTORY_COMMIT ?= "1"
 
@@ -1375,7 +1463,9 @@ system and gives an overview of their function and contents.
       does not produce an error.
 
       By default, the :ref:`ref-classes-buildhistory` class sets the variable
-      as follows::
+      as follows:
+
+      .. code-block:: bitbake
 
          BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 
@@ -1386,7 +1476,9 @@ system and gives an overview of their function and contents.
       see the :ref:`ref-classes-buildhistory` class.
 
       By default, the :ref:`ref-classes-buildhistory` class sets the directory
-      as follows::
+      as follows:
+
+      .. code-block:: bitbake
 
          BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 
@@ -1414,7 +1506,9 @@ system and gives an overview of their function and contents.
          each file staged (i.e. the output of the task).
 
       By default, the :ref:`ref-classes-buildhistory` class enables the
-      following features::
+      following features:
+
+      .. code-block:: bitbake
 
          BUILDHISTORY_FEATURES ?= "image package sdk"
 
@@ -1430,7 +1524,9 @@ system and gives an overview of their function and contents.
       Consequently, you can include files that might not always be present.
 
       By default, the :ref:`ref-classes-buildhistory` class provides paths to
-      the following files::
+      the following files:
+
+      .. code-block:: bitbake
 
          BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 
@@ -1443,7 +1539,9 @@ system and gives an overview of their function and contents.
       all use the same top level directory.
 
       By default, the :ref:`ref-classes-buildhistory` class sets the variable
-      as follows::
+      as follows:
+
+      .. code-block:: bitbake
 
          BUILDHISTORY_PATH_PREFIX_STRIP ?= ""
 
@@ -1461,7 +1559,9 @@ system and gives an overview of their function and contents.
       repository.
 
       By default, the :ref:`ref-classes-buildhistory` class sets the variable
-      as follows::
+      as follows:
+
+      .. code-block:: bitbake
 
          BUILDHISTORY_PUSH_REPO ?= ""
 
@@ -1586,7 +1686,9 @@ system and gives an overview of their function and contents.
          ``bitbake.conf`` file.
 
       As an example, the following override allows you to install extra
-      files, but only when building for the target::
+      files, but only when building for the target:
+
+      .. code-block:: bitbake
 
          do_install:append:class-target() {
              install my-extra-file ${D}${sysconfdir}
@@ -1594,7 +1696,9 @@ system and gives an overview of their function and contents.
 
       Here is an example where ``FOO`` is set to
       "native" when building for the build host, and to "other" when not
-      building for the build host::
+      building for the build host:
+
+      .. code-block:: bitbake
 
          FOO:class-native = "native"
          FOO = "other"
@@ -1711,7 +1815,9 @@ system and gives an overview of their function and contents.
 
       To add a new feature item pointing to a wildcard, use a variable flag
       to specify the feature item name and use the value to specify the
-      wildcard. Here is an example::
+      wildcard. Here is an example:
+
+      .. code-block:: bitbake
 
          COMPLEMENTARY_GLOB[dev-pkgs] = '*-dev'
 
@@ -1748,7 +1854,9 @@ system and gives an overview of their function and contents.
 
       To use the :term:`CONFFILES` variable, provide a package name override
       that identifies the resulting package. Then, provide a
-      space-separated list of files. Here is an example::
+      space-separated list of files. Here is an example:
+
+      .. code-block:: bitbake
 
          CONFFILES:${PN} += "${sysconfdir}/file1 \
              ${sysconfdir}/file2 ${sysconfdir}/file3"
@@ -1803,7 +1911,9 @@ system and gives an overview of their function and contents.
       When using the :ref:`ref-classes-autotools` class, the
       :term:`CONFIGURE_SCRIPT` variable stores the location of the ``configure``
       script for the Autotools build system. The default definition for this
-      variable is::
+      variable is:
+
+      .. code-block:: bitbake
 
          CONFIGURE_SCRIPT ?= "${AUTOTOOLS_SCRIPT_PATH}/configure"
 
@@ -1865,7 +1975,9 @@ system and gives an overview of their function and contents.
       -   Checksums for the image
 
       An example of :term:`CONVERSION_CMD` from :ref:`ref-classes-image_types`
-      class is::
+      class is:
+
+      .. code-block:: bitbake
 
          CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 
@@ -2038,14 +2150,18 @@ system and gives an overview of their function and contents.
    :term:`CVE_CHECK_STATUSMAP`
       Mapping variable for all possible reasons of :term:`CVE_STATUS`:
       ``Patched``, ``Unpatched`` and ``Ignored``.
-      See :oecore_path:`meta/conf/cve-check-map.conf` for more details::
+      See :oecore_path:`meta/conf/cve-check-map.conf` for more details:
+
+      .. code-block:: bitbake
 
          CVE_CHECK_STATUSMAP[cpe-incorrect] = "Ignored"
 
    :term:`CVE_CHECK_VEX_JUSTIFICATION`
       Mapping variable for :term:`CVE_STATUS` reasons
       (for example ``not-applicable-platform``) to :ref:`ref-classes-vex`
-      justifications. Should be set as follows::
+      justifications. Should be set as follows:
+
+      .. code-block:: bitbake
 
          CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] = "vulnerableCodeNotPresent"
 
@@ -2059,14 +2175,18 @@ system and gives an overview of their function and contents.
       database or matches with multiple entries in the database, the default
       value needs to be changed.
 
-      Here is an example from the :oe_layerindex:`Berkeley DB recipe </layerindex/recipe/544>`::
+      Here is an example from the :oe_layerindex:`Berkeley DB recipe </layerindex/recipe/544>`:
+
+      .. code-block:: bitbake
 
          CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
 
       Sometimes the product name is not specific enough, for example
       "tar" has been matching CVEs for the GNU ``tar`` package and also
       the ``node-tar`` node.js extension. To avoid this problem, use the
-      vendor name as a prefix. The syntax for this is::
+      vendor name as a prefix. The syntax for this is:
+
+      .. code-block:: bitbake
 
          CVE_PRODUCT = "vendor:package"
 
@@ -2076,7 +2196,9 @@ system and gives an overview of their function and contents.
 
    :term:`CVE_STATUS`
       The CVE ID which is patched or should be ignored. Here is
-      an example from the :oe_layerindex:`Python3 recipe</layerindex/recipe/23823>`::
+      an example from the :oe_layerindex:`Python3 recipe</layerindex/recipe/23823>`:
+
+      .. code-block:: bitbake
 
          CVE_STATUS[CVE-2020-15523] = "not-applicable-platform: Issue only applies on Windows"
 
@@ -2087,7 +2209,9 @@ system and gives an overview of their function and contents.
 
    :term:`CVE_STATUS_GROUPS`
       If there are many CVEs with the same status and reason, they can by simplified by using this
-      variable instead of many similar lines with :term:`CVE_STATUS`::
+      variable instead of many similar lines with :term:`CVE_STATUS`:
+
+      .. code-block:: bitbake
 
          CVE_STATUS_GROUPS = "CVE_STATUS_WIN CVE_STATUS_PATCHED"
 
@@ -2106,7 +2230,9 @@ system and gives an overview of their function and contents.
       which do not map to upstream software component release versions and the versions
       used in the CVE database, then this variable can be used to set the
       version number for :ref:`ref-classes-vex` or
-      :ref:`ref-classes-create-spdx`. Example::
+      :ref:`ref-classes-create-spdx`. Example:
+
+      .. code-block:: bitbake
 
           CVE_VERSION = "2.39"
 
@@ -2160,7 +2286,9 @@ system and gives an overview of their function and contents.
       which is the default behavior, :term:`DEBIAN_NOAUTONAME` specifies a
       particular package should not be renamed according to Debian library
       package naming. You must use the package name as an override when you
-      set this variable. Here is an example from the ``fontconfig`` recipe::
+      set this variable. Here is an example from the ``fontconfig`` recipe:
+
+      .. code-block:: bitbake
 
          DEBIAN_NOAUTONAME:fontconfig-utils = "1"
 
@@ -2170,7 +2298,9 @@ system and gives an overview of their function and contents.
       the library name for an individual package. Overriding the library
       name in these cases is rare. You must use the package name as an
       override when you set this variable. Here is an example from the
-      ``dbus`` recipe::
+      ``dbus`` recipe:
+
+      .. code-block:: bitbake
 
          DEBIANNAME:${PN} = "dbus-1"
 
@@ -2239,7 +2369,9 @@ system and gives an overview of their function and contents.
       needed by the recipe at build time.
 
       As an example, consider a recipe ``foo`` that contains the following
-      assignment::
+      assignment:
+
+      .. code-block:: bitbake
 
           DEPENDS = "bar"
 
@@ -2262,7 +2394,9 @@ system and gives an overview of their function and contents.
       As another example, :term:`DEPENDS` can also be used to add utilities
       that run on the build machine during the build. For example, a recipe
       that makes use of a code generator built by the recipe ``codegen``
-      might have the following::
+      might have the following:
+
+      .. code-block:: bitbake
 
          DEPENDS = "codegen-native"
 
@@ -2331,7 +2465,9 @@ system and gives an overview of their function and contents.
 
       The BitBake configuration file initially defines the
       :term:`DEPLOY_DIR_DEB` variable as a sub-folder of
-      :term:`DEPLOY_DIR`::
+      :term:`DEPLOY_DIR`:
+
+      .. code-block:: bitbake
 
          DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 
@@ -2371,7 +2507,9 @@ system and gives an overview of their function and contents.
       ":ref:`ref-classes-package_ipk`".
 
       The BitBake configuration file initially defines this variable as a
-      sub-folder of :term:`DEPLOY_DIR`::
+      sub-folder of :term:`DEPLOY_DIR`:
+
+      .. code-block:: bitbake
 
          DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 
@@ -2389,7 +2527,9 @@ system and gives an overview of their function and contents.
       ":ref:`ref-classes-package_rpm`".
 
       The BitBake configuration file initially defines this variable as a
-      sub-folder of :term:`DEPLOY_DIR`::
+      sub-folder of :term:`DEPLOY_DIR`:
+
+      .. code-block:: bitbake
 
          DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 
@@ -2404,7 +2544,9 @@ system and gives an overview of their function and contents.
    :term:`DEPLOYDIR`
       When inheriting the :ref:`ref-classes-deploy` class, the
       :term:`DEPLOYDIR` points to a temporary work area for deployed files that
-      is set in the :ref:`ref-classes-deploy` class as follows::
+      is set in the :ref:`ref-classes-deploy` class as follows:
+
+      .. code-block:: bitbake
 
          DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 
@@ -2453,7 +2595,9 @@ system and gives an overview of their function and contents.
       :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`.
 
       Within that ``poky.conf`` file, the :term:`DISTRO` variable is set as
-      follows::
+      follows:
+
+      .. code-block:: bitbake
 
          DISTRO = "poky"
 
@@ -2554,7 +2698,9 @@ system and gives an overview of their function and contents.
       when they are provided by the :term:`DISTRO_FEATURES_DEFAULTS` variable.
 
       You can also opt out of all default features by setting
-      :term:`DISTRO_FEATURES_OPTED_OUT` to ``*``::
+      :term:`DISTRO_FEATURES_OPTED_OUT` to ``*``:
+
+      .. code-block:: bitbake
 
          DISTRO_FEATURES_OPTED_OUT = "*"
 
@@ -2572,7 +2718,9 @@ system and gives an overview of their function and contents.
       of :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>`.
 
       Within that ``poky.conf`` file, the :term:`DISTRO_NAME` variable is set
-      as follows::
+      as follows:
+
+      .. code-block:: bitbake
 
          DISTRO_NAME = "Poky (Yocto Project Reference Distro)"
 
@@ -2603,7 +2751,9 @@ system and gives an overview of their function and contents.
       :term:`OVERRIDES`.
 
       Here is an example from :yocto_git:`meta-poky/conf/distro/poky-tiny.conf
-      </meta-yocto/tree/meta-poky/conf/distro/poky-tiny.conf>`::
+      </meta-yocto/tree/meta-poky/conf/distro/poky-tiny.conf>`:
+
+      .. code-block:: bitbake
 
          DISTROOVERRIDES = "poky:poky-tiny"
 
@@ -2711,7 +2861,9 @@ system and gives an overview of their function and contents.
 
       You can set :term:`ERR_REPORT_DIR` to the path you want the error
       reporting tool to store the debug files as follows in your
-      ``local.conf`` file::
+      ``local.conf`` file:
+
+      .. code-block:: bitbake
 
          ERR_REPORT_DIR = "path"
 
@@ -2726,7 +2878,9 @@ system and gives an overview of their function and contents.
       A list of classes to remove from the :term:`INHERIT`
       value globally within the extensible SDK configuration. The
       :ref:`populate-sdk-ext <ref-classes-populate-sdk-*>` class sets the
-      default value::
+      default value:
+
+      .. code-block:: bitbake
 
          ESDK_CLASS_INHERIT_DISABLE ?= "buildhistory"
 
@@ -2801,7 +2955,9 @@ system and gives an overview of their function and contents.
       package's particular libraries only and not the whole package.
 
       Use the :term:`EXCLUDE_FROM_SHLIBS` variable by setting it to "1" for a
-      particular package::
+      particular package:
+
+      .. code-block:: bitbake
 
          EXCLUDE_FROM_SHLIBS = "1"
 
@@ -2835,7 +2991,9 @@ system and gives an overview of their function and contents.
       The full package version specification as it appears on the final
       packages produced by a recipe. The variable's value is normally used
       to fix a runtime dependency to the exact same version of another
-      package in the same recipe::
+      package in the same recipe:
+
+      .. code-block:: bitbake
 
          RDEPENDS:${PN}-additional-module = "${PN} (= ${EXTENDPKGV})"
 
@@ -2948,7 +3106,9 @@ system and gives an overview of their function and contents.
       Specifies additional options for the image creation command that has
       been specified in :term:`IMAGE_CMD`. When setting
       this variable, use an override for the associated image type. Here is
-      an example::
+      an example:
+
+      .. code-block:: bitbake
 
          EXTRA_IMAGECMD:ext3 ?= "-i 4096"
 
@@ -2992,7 +3152,9 @@ system and gives an overview of their function and contents.
       In addition to standard Meson options, such options correspond to
       `Meson build options <https://mesonbuild.com/Build-options.html>`__
       defined in the ``meson_options.txt`` file in the sources to build.
-      Here is an example::
+      Here is an example:
+
+      .. code-block:: bitbake
 
          EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled"
 
@@ -3034,7 +3196,9 @@ system and gives an overview of their function and contents.
 
          printf "%q" $(mkpasswd -m sha256crypt tester01)
 
-      The resulting hash is set to a variable and used in ``useradd`` command parameters::
+      The resulting hash is set to a variable and used in ``useradd`` command parameters:
+
+      .. code-block:: bitbake
 
          inherit extrausers
          PASSWD = "\$X\$ABC123\$A-Long-Hash"
@@ -3043,7 +3207,9 @@ system and gives an overview of their function and contents.
              useradd -p '${PASSWD}' tester-sue; \
              "
 
-      Finally, here is an example that sets the root password::
+      Finally, here is an example that sets the root password:
+
+      .. code-block:: bitbake
 
          inherit extrausers
          EXTRA_USERS_PARAMS = "\
@@ -3059,7 +3225,9 @@ system and gives an overview of their function and contents.
 
       Additionally there is a special ``passwd-expire`` command that will
       cause the password for a user to be expired and thus force changing it
-      on first login, for example::
+      on first login, for example:
+
+      .. code-block:: bitbake
 
          EXTRA_USERS_PARAMS += " useradd myuser; passwd-expire myuser;"
 
@@ -3074,7 +3242,9 @@ system and gives an overview of their function and contents.
       added to the beginning of the environment variable ``PATH``. As an
       example, the following prepends
       "${STAGING_BINDIR_NATIVE}/foo:${STAGING_BINDIR_NATIVE}/bar:" to
-      ``PATH``::
+      ``PATH``:
+
+      .. code-block:: bitbake
 
          EXTRANATIVEPATH = "foo bar"
 
@@ -3103,7 +3273,9 @@ system and gives an overview of their function and contents.
       Defines one or more packages to include in an image when a specific
       item is included in :term:`IMAGE_FEATURES`.
       When setting the value, :term:`FEATURE_PACKAGES` should have the name of
-      the feature item as an override. Here is an example::
+      the feature item as an override. Here is an example:
+
+      .. code-block:: bitbake
 
          FEATURE_PACKAGES_widget = "package1 package2"
 
@@ -3123,7 +3295,9 @@ system and gives an overview of their function and contents.
       OPKG to support runtime package management of IPK packages. You set
       this variable in your ``local.conf`` file.
 
-      Consider the following example::
+      Consider the following example:
+
+      .. code-block:: bitbake
 
          FEED_DEPLOYDIR_BASE_URI = "http://192.168.7.1/BOARD-dir"
 
@@ -3148,7 +3322,9 @@ system and gives an overview of their function and contents.
       To use the :term:`FILES` variable, provide a package name override that
       identifies the resulting package. Then, provide a space-separated
       list of files or paths that identify the files you want included as
-      part of the resulting package. Here is an example::
+      part of the resulting package. Here is an example:
+
+      .. code-block:: bitbake
 
          FILES:${PN} += "${bindir}/mydir1 ${bindir}/mydir2/myfile"
 
@@ -3183,7 +3359,9 @@ system and gives an overview of their function and contents.
       symbolic link (symlink) for shared libraries on the target platform.
 
       The following statement from the ``bitbake.conf`` shows how it is
-      set::
+      set:
+
+      .. code-block:: bitbake
 
          FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
 
@@ -3196,7 +3374,9 @@ system and gives an overview of their function and contents.
 
       Best practices dictate that you accomplish this by using
       :term:`FILESEXTRAPATHS` from within a ``.bbappend`` file and that you
-      prepend paths as follows::
+      prepend paths as follows:
+
+      .. code-block:: bitbake
 
          FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
@@ -3218,7 +3398,9 @@ system and gives an overview of their function and contents.
          are directing BitBake to extend the path by prepending directories
          to the search path.
 
-      Here is another common use::
+      Here is another common use:
+
+      .. code-block:: bitbake
 
          FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
@@ -3226,13 +3408,17 @@ system and gives an overview of their function and contents.
       :term:`FILESPATH` variable to include a directory named ``files`` that is
       in the same directory as the corresponding append file.
 
-      This next example specifically adds three paths::
+      This next example specifically adds three paths:
+
+      .. code-block:: bitbake
 
          FILESEXTRAPATHS:prepend := "path_1:path_2:path_3:"
 
       A final example shows how you can extend the search path and include
       a :term:`MACHINE`-specific override, which is useful
-      in a BSP layer::
+      in a BSP layer:
+
+      .. code-block:: bitbake
 
           FILESEXTRAPATHS:prepend:intel-x86-common := "${THISDIR}/${PN}:"
 
@@ -3262,7 +3448,9 @@ system and gives an overview of their function and contents.
       ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:conditional syntax (overrides)`"
       section of the BitBake User Manual.
 
-      By default, the :term:`FILESOVERRIDES` variable is defined as::
+      By default, the :term:`FILESOVERRIDES` variable is defined as:
+
+      .. code-block:: bitbake
 
          FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
 
@@ -3283,7 +3471,9 @@ system and gives an overview of their function and contents.
 
       The default value for the :term:`FILESPATH` variable is defined in the
       :ref:`ref-classes-base` class found in ``meta/classes-global`` in
-      :term:`OpenEmbedded-Core (OE-Core)`::
+      :term:`OpenEmbedded-Core (OE-Core)`:
+
+      .. code-block:: bitbake
 
          FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", \
              "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
@@ -3379,7 +3569,9 @@ system and gives an overview of their function and contents.
       set this value to "2", as two 32 bit values (cells) will be needed
       to represent such addresses.
 
-      Here is an example setting "0x400000000" as a load address::
+      Here is an example setting "0x400000000" as a load address:
+
+      .. code-block:: bitbake
 
          FIT_ADDRESS_CELLS = "2"
          UBOOT_LOADADDRESS = "0x04 0x00000000"
@@ -3416,7 +3608,9 @@ system and gives an overview of their function and contents.
          bootloader configurations or just need an alias configuration name for
          some other reason.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          FIT_CONF_MAPPINGS = "\
              dtb-extra-conf:am335x-bonegreen:bonegreen \
@@ -3440,7 +3634,9 @@ system and gives an overview of their function and contents.
    :term:`FIT_DESC`
       Specifies the description string encoded into a FIT image. The
       default value is set by the :ref:`ref-classes-kernel-fit-image` class as
-      follows::
+      follows:
+
+      .. code-block:: bitbake
 
          FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 
@@ -3531,7 +3727,9 @@ system and gives an overview of their function and contents.
 
       This variable cannot be used directly, but only defining flags on it.
 
-      Example::
+      Example:
+
+      .. code-block:: bitbake
 
          FIT_LOADABLES = "foo"
          FIT_LOADABLE_ARCH[foo] = "arm"
@@ -3544,7 +3742,9 @@ system and gives an overview of their function and contents.
 
       This variable cannot be used directly, but only defining flags on it.
 
-      Example::
+      Example:
+
+      .. code-block:: bitbake
 
          FIT_LOADABLES = "foo"
          FIT_LOADABLE_COMPRESSION[foo] = "gzip"
@@ -3562,7 +3762,9 @@ system and gives an overview of their function and contents.
 
       This variable cannot be used directly, but only defining flags on it.
 
-      Example::
+      Example:
+
+      .. code-block:: bitbake
 
          FIT_LOADABLES = "foo"
          FIT_LOADABLE_DESCRIPTION[foo] = "Foo firmware binary"
@@ -3575,7 +3777,9 @@ system and gives an overview of their function and contents.
 
       This variable cannot be used directly, but only defining flags on it.
 
-      Example::
+      Example:
+
+      .. code-block:: bitbake
 
          FIT_LOADABLES = "foo"
          FIT_LOADABLE_ENTRYPOINT[foo] = "0x80234000"
@@ -3588,7 +3792,9 @@ system and gives an overview of their function and contents.
 
       This variable cannot be used directly, but only defining flags on it.
 
-      Example::
+      Example:
+
+      .. code-block:: bitbake
 
          FIT_LOADABLES = "foo"
          FIT_LOADABLE_FILENAME[foo] = "foo-firmware.bin"
@@ -3600,7 +3806,9 @@ system and gives an overview of their function and contents.
 
       This variable cannot be used directly, but only defining flags on it.
 
-      Example::
+      Example:
+
+      .. code-block:: bitbake
 
          FIT_LOADABLES = "foo"
          FIT_LOADABLE_LOADADDRESS[foo] = "0x80230000"
@@ -3613,7 +3821,9 @@ system and gives an overview of their function and contents.
 
       This variable cannot be used directly, but only defining flags on it.
 
-      Example::
+      Example:
+
+      .. code-block:: bitbake
 
          FIT_LOADABLES = "foo"
          FIT_LOADABLE_OS[foo] = "linux"
@@ -3626,7 +3836,9 @@ system and gives an overview of their function and contents.
 
       This variable cannot be used directly, but only defining flags on it.
 
-      Example::
+      Example:
+
+      .. code-block:: bitbake
 
          FIT_LOADABLES = "foo"
          FIT_LOADABLE_TYPE[foo] = "firmware"
@@ -3649,7 +3861,9 @@ system and gives an overview of their function and contents.
 
       For example, the following configuration adds as loadables a TF-A BL31
       firmware and a (compressed) TEE firmware, to be loaded respectively at
-      0x204E0000 and 0x96000000::
+      0x204E0000 and 0x96000000:
+
+      .. code-block:: bitbake
 
          FIT_LOADABLES = "atf tee"
 
@@ -3709,7 +3923,9 @@ system and gives an overview of their function and contents.
       ``mkimage`` during FIT image generation, providing flexibility for platforms
       that require additional ``mkimage`` arguments beyond the defaults.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          FIT_MKIMAGE_EXTRA_OPTS = "-B 8 -E"
 
@@ -3775,7 +3991,9 @@ system and gives an overview of their function and contents.
 
       Example:
 
-      -  Add a script ``boot.cmd`` to the Linux kernel recipe::
+      -  Add a script ``boot.cmd`` to the Linux kernel recipe:
+
+         .. code-block:: bitbake
 
             FIT_UBOOT_ENV = "boot.cmd"
             SRC_URI += "file://${FIT_UBOOT_ENV}"
@@ -3820,14 +4038,18 @@ system and gives an overview of their function and contents.
       Programming (ROP) attacks much more difficult to execute.
 
       By default the ``security_flags.inc`` file enables PIE by setting the
-      variable as follows::
+      variable as follows:
+
+      .. code-block:: bitbake
 
          GCCPIE ?= "--enable-default-pie"
 
    :term:`GCCVERSION`
       Specifies the default version of the GNU C Compiler (GCC) used for
       compilation. By default, :term:`GCCVERSION` is set to "8.x" in the
-      ``meta/conf/distro/include/tcmode-default.inc`` include file::
+      ``meta/conf/distro/include/tcmode-default.inc`` include file:
+
+      .. code-block:: bitbake
 
          GCCVERSION ?= "8.%"
 
@@ -3851,7 +4073,9 @@ system and gives an overview of their function and contents.
    :term:`GITHUB_BASE_URI`
       When inheriting the :ref:`ref-classes-github-releases`
       class, specifies the base URL for fetching releases for the github
-      project you wish to fetch sources from. The default value is as follows::
+      project you wish to fetch sources from. The default value is as follows:
+
+      .. code-block:: bitbake
 
          GITHUB_BASE_URI ?= "https://github.com/${BPN}/${BPN}/releases/"
 
@@ -3865,7 +4089,9 @@ system and gives an overview of their function and contents.
          :term:`IMAGE_LINGUAS` appropriately.
 
       You can set :term:`GLIBC_GENERATE_LOCALES` in your ``local.conf`` file.
-      By default, all locales are generated::
+      By default, all locales are generated:
+
+      .. code-block:: bitbake
 
          GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
 
@@ -3879,7 +4105,9 @@ system and gives an overview of their function and contents.
 
       Here is an example setting from the
       :oe_git:`go-helloworld_0.1.bb </openembedded-core/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
-      recipe::
+      recipe:
+
+      .. code-block:: bitbake
 
           GO_IMPORT = "golang.org/x/example"
 
@@ -3891,14 +4119,18 @@ system and gives an overview of their function and contents.
 
       Here is an example setting from the
       :oe_git:`crucible </meta-openembedded/tree/meta-oe/recipes-support/crucible/>`
-      recipe::
+      recipe:
+
+      .. code-block:: bitbake
 
          GO_INSTALL = "\
              ${GO_IMPORT}/cmd/crucible \
              ${GO_IMPORT}/cmd/habtool \
          "
 
-      By default, :term:`GO_INSTALL` is defined as::
+      By default, :term:`GO_INSTALL` is defined as:
+
+      .. code-block:: bitbake
 
          GO_INSTALL ?= "${GO_IMPORT}/..."
 
@@ -3942,7 +4174,9 @@ system and gives an overview of their function and contents.
       passed to the ``groupadd`` command if you wish to add a group to the
       system when the package is installed.
 
-      Here is an example from the ``dbus`` recipe::
+      Here is an example from the ``dbus`` recipe:
+
+      .. code-block:: bitbake
 
          GROUPADD_PARAM:${PN} = "-r netdev"
 
@@ -3950,7 +4184,9 @@ system and gives an overview of their function and contents.
       groups' parameters with a semicolon.
 
       Here is an example adding multiple groups from the ``useradd-example.bb``
-      file in the ``meta-skeleton`` layer::
+      file in the ``meta-skeleton`` layer:
+
+      .. code-block:: bitbake
 
          GROUPADD_PARAM:${PN} = "-g 880 group1; -g 890 group2"
 
@@ -4137,7 +4373,9 @@ system and gives an overview of their function and contents.
       installed name, separate it from the original name with a semi-colon
       (;). Source files need to be located in
       :term:`DEPLOY_DIR_IMAGE`. Here are two
-      examples::
+      examples:
+
+      .. code-block:: bitbake
 
          IMAGE_BOOT_FILES = "u-boot.img uImage;kernel"
          IMAGE_BOOT_FILES = "u-boot.${UBOOT_SUFFIX} ${KERNEL_IMAGETYPE}"
@@ -4146,7 +4384,9 @@ system and gives an overview of their function and contents.
       this case, the destination file must have the same name as the base
       name of the source file path. To install files into a directory
       within the target location, pass its name after a semi-colon (;).
-      Here are two examples::
+      Here are two examples:
+
+      .. code-block:: bitbake
 
          IMAGE_BOOT_FILES = "bcm2835-bootfiles/*"
          IMAGE_BOOT_FILES = "bcm2835-bootfiles/*;boot/"
@@ -4185,7 +4425,9 @@ system and gives an overview of their function and contents.
       type, which corresponds to the value set in
       :term:`IMAGE_FSTYPES`, (e.g. ``ext3``,
       ``btrfs``, and so forth). When setting this variable, you should use
-      an override for the associated type. Here is an example::
+      an override for the associated type. Here is an example:
+
+      .. code-block:: bitbake
 
          IMAGE_CMD:jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime \
              --output=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 \
@@ -4233,7 +4475,9 @@ system and gives an overview of their function and contents.
       installed name, separate it from the original name with a semi-colon
       (;). Source files need to be located in
       :term:`DEPLOY_DIR_IMAGE`. Here are two
-      examples::
+      examples:
+
+      .. code-block:: bitbake
 
          IMAGE_EFI_BOOT_FILES = "${KERNEL_IMAGETYPE};bz2"
          IMAGE_EFI_BOOT_FILES = "${KERNEL_IMAGETYPE} microcode.cpio"
@@ -4242,7 +4486,9 @@ system and gives an overview of their function and contents.
       this case, the destination file must have the same name as the base
       name of the source file path. To install files into a directory
       within the target location, pass its name after a semi-colon (;).
-      Here are two examples::
+      Here are two examples:
+
+      .. code-block:: bitbake
 
          IMAGE_EFI_BOOT_FILES = "boot/loader/*"
          IMAGE_EFI_BOOT_FILES = "boot/loader/*;boot/"
@@ -4267,7 +4513,9 @@ system and gives an overview of their function and contents.
       installed name, separate it from the original name with a semi-colon
       (;). Source files need to be located in
       :term:`DEPLOY_DIR_IMAGE`. Here is an
-      example::
+      example:
+
+      .. code-block:: bitbake
 
          IMAGE_EXTRA_PARTITION_FILES = "foobar file.conf;config"
 
@@ -4280,7 +4528,9 @@ system and gives an overview of their function and contents.
       The destination file will have the same name as the base
       name of the source file path. To install files into a renamed directory
       within the target location, pass its name after a semi-colon (;).
-      Here are two examples::
+      Here are two examples:
+
+      .. code-block:: bitbake
 
          IMAGE_EXTRA_PARTITION_FILES = "foo/*"
          IMAGE_EXTRA_PARTITION_FILES = "foo/*;bar/"
@@ -4299,7 +4549,9 @@ system and gives an overview of their function and contents.
          part --source extra_partition --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d
          part --source extra_partition --fstype=ext4 --part-name config
 
-      And the following configuration::
+      And the following configuration:
+
+      .. code-block:: bitbake
 
          IMAGE_EXTRA_PARTITION_FILES_label-foo = "foo/*"
          IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d = "foo/*;bar/"
@@ -4345,7 +4597,9 @@ system and gives an overview of their function and contents.
       Specifies the formats the OpenEmbedded build system uses during the
       build when creating the root filesystem. For example, setting
       :term:`IMAGE_FSTYPES` as follows causes the build system to create root
-      filesystems using two formats: ``.ext3`` and ``.tar.bz2``::
+      filesystems using two formats: ``.ext3`` and ``.tar.bz2``:
+
+      .. code-block:: bitbake
 
          IMAGE_FSTYPES = "ext3 tar.bz2"
 
@@ -4390,7 +4644,9 @@ system and gives an overview of their function and contents.
       them into auto-generated entries in :term:`IMAGE_INSTALL` in addition
       to its default contents.
 
-      When you use this variable, it is best to use it as follows::
+      When you use this variable, it is best to use it as follows:
+
+      .. code-block:: bitbake
 
          IMAGE_INSTALL:append = " package-name"
 
@@ -4433,7 +4689,9 @@ system and gives an overview of their function and contents.
       into separate packages. Setting the :term:`IMAGE_LINGUAS` variable
       ensures that any locale packages that correspond to packages already
       selected for installation into the image are also installed. Here is
-      an example::
+      an example:
+
+      .. code-block:: bitbake
 
          IMAGE_LINGUAS = "pt-br de-de"
 
@@ -4452,7 +4710,9 @@ system and gives an overview of their function and contents.
       The name of the output image symlink (which does not include
       the version part as :term:`IMAGE_NAME` does). The default value
       is derived using the :term:`IMAGE_BASENAME` and
-      :term:`IMAGE_MACHINE_SUFFIX` variables::
+      :term:`IMAGE_MACHINE_SUFFIX` variables:
+
+      .. code-block:: bitbake
 
          IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"
 
@@ -4460,21 +4720,27 @@ system and gives an overview of their function and contents.
 
          It is possible to set this to "" to disable symlink creation,
          however, you also need to set :term:`IMAGE_NAME` to still have
-         a reasonable value e.g.::
+         a reasonable value e.g.:
+
+         .. code-block:: bitbake
 
             IMAGE_LINK_NAME = ""
             IMAGE_NAME = "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SUFFIX}"
 
    :term:`IMAGE_MACHINE_SUFFIX`
       Specifies the by default machine-specific suffix for image file names
-      (before the extension). The default value is set as follows::
+      (before the extension). The default value is set as follows:
+
+      .. code-block:: bitbake
 
          IMAGE_MACHINE_SUFFIX ??= "-${MACHINE}"
 
       The default :term:`DEPLOY_DIR_IMAGE` already has a :term:`MACHINE`
       subdirectory, so you may find it unnecessary to also include this suffix
       in the name of every image file. If you prefer to remove the suffix you
-      can set this variable to an empty string::
+      can set this variable to an empty string:
+
+      .. code-block:: bitbake
 
          IMAGE_MACHINE_SUFFIX = ""
 
@@ -4488,7 +4754,9 @@ system and gives an overview of their function and contents.
           packagename packagearch version
 
       The :ref:`rootfs-postcommands <ref-classes-rootfs*>` class defines the manifest
-      file as follows::
+      file as follows:
+
+      .. code-block:: bitbake
 
          IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
 
@@ -4501,7 +4769,9 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_NAME`
       The name of the output image files minus the extension. By default
       this variable is set using the :term:`IMAGE_LINK_NAME`, and
-      :term:`IMAGE_VERSION_SUFFIX` variables::
+      :term:`IMAGE_VERSION_SUFFIX` variables:
+
+      .. code-block:: bitbake
 
          IMAGE_NAME ?= "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
 
@@ -4517,7 +4787,9 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-core-image` class, the :term:`IMAGE_OUTPUT_MANIFEST`
       points to a manifest ``json`` file that lists what images were created by
       various image creation tasks (as defined by the :term:`IMAGE_FSTYPES`
-      variable). It is set in the :ref:`ref-classes-image` class as follows::
+      variable). It is set in the :ref:`ref-classes-image` class as follows:
+
+      .. code-block:: bitbake
 
           IMAGE_OUTPUT_MANIFEST = "${IMAGE_OUTPUT_MANIFEST_DIR}/manifest.json"
 
@@ -4527,7 +4799,9 @@ system and gives an overview of their function and contents.
       a directory that stores a manifest ``json`` file that lists what
       images were created by various image creation tasks (as defined by the
       :term:`IMAGE_FSTYPES` variable). It is set in the :ref:`ref-classes-image`
-      class as follows::
+      class as follows:
+
+      .. code-block:: bitbake
 
           IMAGE_OUTPUT_MANIFEST_DIR = "${WORKDIR}/deploy-image-output-manifest"
 
@@ -4551,7 +4825,9 @@ system and gives an overview of their function and contents.
       to boot and allows for basic post installs while still leaving a
       small amount of free disk space. If 30% free space is inadequate, you
       can increase the default value. For example, the following setting
-      gives you 50% free space added to the image::
+      gives you 50% free space added to the image:
+
+      .. code-block:: bitbake
 
          IMAGE_OVERHEAD_FACTOR = "1.5"
 
@@ -4584,7 +4860,9 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system creates the final image output files. You can specify
-      functions separated by spaces::
+      functions separated by spaces:
+
+      .. code-block:: bitbake
 
          IMAGE_POSTPROCESS_COMMAND += "function"
 
@@ -4597,7 +4875,9 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_PREPROCESS_COMMAND`
       Specifies a list of functions to call before the OpenEmbedded build
       system creates the final image output files. You can specify
-      functions separated by spaces::
+      functions separated by spaces:
+
+      .. code-block:: bitbake
 
          IMAGE_PREPROCESS_COMMAND += "function"
 
@@ -4628,12 +4908,16 @@ system and gives an overview of their function and contents.
       This variable is particularly useful when you want to ensure that a
       specific amount of free disk space is available on a device after an
       image is installed and running. For example, to be sure 5 Gbytes of
-      free disk space is available, set the variable as follows::
+      free disk space is available, set the variable as follows:
+
+      .. code-block:: bitbake
 
          IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
 
       For example, the Yocto Project Build Appliance specifically requests
-      40 Gbytes of extra space with the line::
+      40 Gbytes of extra space with the line:
+
+      .. code-block:: bitbake
 
          IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
@@ -4693,7 +4977,9 @@ system and gives an overview of their function and contents.
 
    :term:`IMAGE_TYPEDEP`
       Specifies a dependency from one image type on another. Here is an
-      example from the :ref:`ref-classes-image-live` class::
+      example from the :ref:`ref-classes-image-live` class:
+
+      .. code-block:: bitbake
 
          IMAGE_TYPEDEP:live = "ext3"
 
@@ -4766,7 +5052,9 @@ system and gives an overview of their function and contents.
       When inheriting the :ref:`ref-classes-image` class directly or
       through the :ref:`ref-classes-core-image` class, the
       :term:`IMGDEPLOYDIR` points to a temporary work area for deployed files
-      that is set in the ``image`` class as follows::
+      that is set in the ``image`` class as follows:
+
+      .. code-block:: bitbake
 
          IMGDEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"
 
@@ -4780,7 +5068,9 @@ system and gives an overview of their function and contents.
       points to a temporary area that stores manifest ``json`` files, that list
       what images were created by various images creation tasks (as defined by
       the :term:`IMAGE_FSTYPES` variable). It is set in the
-      :ref:`ref-classes-image` class as follows::
+      :ref:`ref-classes-image` class as follows:
+
+      .. code-block:: bitbake
 
           IMGMANIFESTDIR = "${WORKDIR}/image-task-manifest"
 
@@ -4811,7 +5101,9 @@ system and gives an overview of their function and contents.
       .. note::
 
          This functionality is only regularly tested using the following
-         setting::
+         setting:
+
+         .. code-block:: bitbake
 
                  INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0* AGPL-3.0*"
 
@@ -4824,7 +5116,9 @@ system and gives an overview of their function and contents.
       Specifies a space-separated list of package and license pairs that
       are allowed to be used even if the license is specified in
       :term:`INCOMPATIBLE_LICENSE`. The package and license pairs are
-      separated using a colon. Example::
+      separated using a colon. Example:
+
+      .. code-block:: bitbake
 
          INCOMPATIBLE_LICENSE_EXCEPTIONS = "gdbserver:GPL-3.0-only gdbserver:LGPL-3.0-only"
 
@@ -4848,7 +5142,9 @@ system and gives an overview of their function and contents.
       ``classes-global/`` or ``classes/`` subdirectories.
 
       The default value of the variable is set as follows in the
-      ``meta/conf/distro/defaultsetup.conf`` file::
+      ``meta/conf/distro/defaultsetup.conf`` file:
+
+      .. code-block:: bitbake
 
          INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx"
 
@@ -4862,7 +5158,9 @@ system and gives an overview of their function and contents.
       support the ``autotools`` build process.
 
       To prevent the build system from adding these dependencies automatically,
-      set the :term:`INHIBIT_AUTOTOOLS_DEPS` variable as follows::
+      set the :term:`INHIBIT_AUTOTOOLS_DEPS` variable as follows:
+
+      .. code-block:: bitbake
 
          INHIBIT_AUTOTOOLS_DEPS = "1"
 
@@ -4888,7 +5186,9 @@ system and gives an overview of their function and contents.
       to :term:`DEPENDS` to support the ``rust`` build process.
 
       To prevent the build system from adding these dependencies automatically,
-      set the :term:`INHIBIT_DEFAULT_RUST_DEPS` variable as follows::
+      set the :term:`INHIBIT_DEFAULT_RUST_DEPS` variable as follows:
+
+      .. code-block:: bitbake
 
          INHIBIT_DEFAULT_RUST_DEPS = "1"
 
@@ -4907,7 +5207,9 @@ system and gives an overview of their function and contents.
 
       To prevent the build system from splitting out debug information
       during packaging, set the :term:`INHIBIT_PACKAGE_DEBUG_SPLIT` variable as
-      follows::
+      follows:
+
+      .. code-block:: bitbake
 
          INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
@@ -4953,7 +5255,9 @@ system and gives an overview of their function and contents.
       traditional SysV init system.
 
       To prevent the build system from adding these scripts and configurations
-      automatically, set the :term:`INHIBIT_UPDATERCD_BBCLASS` variable as follows::
+      automatically, set the :term:`INHIBIT_UPDATERCD_BBCLASS` variable as follows:
+
+      .. code-block:: bitbake
 
          INHIBIT_UPDATERCD_BBCLASS = "1"
 
@@ -5078,12 +5382,16 @@ system and gives an overview of their function and contents.
 
       Setting the variable to "1" in a configuration file causes the
       OpenEmbedded build system to generate a kernel image with the
-      :term:`Initramfs` specified in :term:`INITRAMFS_IMAGE` bundled within::
+      :term:`Initramfs` specified in :term:`INITRAMFS_IMAGE` bundled within:
+
+      .. code-block:: bitbake
 
          INITRAMFS_IMAGE_BUNDLE = "1"
 
       By default, the :ref:`ref-classes-kernel` class sets this variable to a
-      null string as follows::
+      null string as follows:
+
+      .. code-block:: bitbake
 
          INITRAMFS_IMAGE_BUNDLE ?= ""
 
@@ -5114,13 +5422,17 @@ system and gives an overview of their function and contents.
    :term:`INITRAMFS_LINK_NAME`
       The link name of the initial RAM filesystem image. This variable is
       set in the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as
-      follows::
+      follows:
+
+      .. code-block:: bitbake
 
          INITRAMFS_LINK_NAME ?= "initramfs-${KERNEL_ARTIFACT_LINK_NAME}"
 
       The value of the
       ``KERNEL_ARTIFACT_LINK_NAME`` variable, which is set in the same
-      file, has the following value::
+      file, has the following value:
+
+      .. code-block:: bitbake
 
          KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
@@ -5155,7 +5467,9 @@ system and gives an overview of their function and contents.
    :term:`INITRAMFS_NAME`
       The base name of the initial RAM filesystem image. This variable is
       set in the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as
-      follows::
+      follows:
+
+      .. code-block:: bitbake
 
          INITRAMFS_NAME ?= "initramfs-${KERNEL_ARTIFACT_NAME}"
 
@@ -5194,7 +5508,9 @@ system and gives an overview of their function and contents.
       variable.
 
    :term:`INITSCRIPT_PARAMS`
-      Specifies the options to pass to ``update-rc.d``. Here is an example::
+      Specifies the options to pass to ``update-rc.d``. Here is an example:
+
+      .. code-block:: bitbake
 
          INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
 
@@ -5213,7 +5529,9 @@ system and gives an overview of their function and contents.
       recipe. For example, to skip the check for symbolic link ``.so``
       files in the main package of a recipe, add the following to the
       recipe. The package name override must be used, which in this example
-      is ``${PN}``::
+      is ``${PN}``:
+
+      .. code-block:: bitbake
 
          INSANE_SKIP:${PN} += "dev-so"
 
@@ -5255,7 +5573,9 @@ system and gives an overview of their function and contents.
       kernel's append file. For example, if you are using the
       ``linux-yocto_4.12`` kernel, the kernel recipe file is the
       ``meta/recipes-kernel/linux/linux-yocto_4.12.bb`` file. :term:`KBRANCH`
-      is set as follows in that kernel recipe file::
+      is set as follows in that kernel recipe file:
+
+      .. code-block:: bitbake
 
          KBRANCH ?= "standard/base"
 
@@ -5267,7 +5587,9 @@ system and gives an overview of their function and contents.
       Beaglebone and generic versions of both 32 and 64-bit IA
       machines (``meta-yocto-bsp``) is named
       ``meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.1.bbappend``.
-      Here are the related statements from that append file::
+      Here are the related statements from that append file:
+
+      .. code-block:: bitbake
 
          KBRANCH:genericx86  = "v6.1/standard/base"
          KBRANCH:genericx86-64  = "v6.1/standard/base"
@@ -5296,11 +5618,15 @@ system and gives an overview of their function and contents.
          KBUILD_DEFCONFIG:<machine> ?= "defconfig_file"
 
       Here is an example from a "raspberrypi2" :term:`MACHINE` build that uses
-      a ``defconfig`` file named "bcm2709_defconfig"::
+      a ``defconfig`` file named "bcm2709_defconfig":
+
+      .. code-block:: bitbake
 
          KBUILD_DEFCONFIG:raspberrypi2 = "bcm2709_defconfig"
 
-      As an alternative, you can use the following within your append file::
+      As an alternative, you can use the following within your append file:
+
+      .. code-block:: bitbake
 
          KBUILD_DEFCONFIG:pn-linux-yocto ?= "defconfig_file"
 
@@ -5371,7 +5697,9 @@ system and gives an overview of their function and contents.
    :term:`KCONFIG_MODE`
       When used with the :ref:`ref-classes-kernel-yocto`
       class, specifies the kernel configuration values to use for options
-      not specified in the provided ``defconfig`` file. Valid options are::
+      not specified in the provided ``defconfig`` file. Valid options are:
+
+      .. code-block:: bitbake
 
          KCONFIG_MODE = "alldefconfig"
          KCONFIG_MODE = "allnoconfig"
@@ -5394,7 +5722,9 @@ system and gives an overview of their function and contents.
       generated using the
       :ref:`ref-tasks-savedefconfig`
       task and placed into the Linux kernel ``${WORKDIR}`` through your
-      meta-layer. Explicitely set :term:`KCONFIG_MODE`::
+      meta-layer. Explicitely set :term:`KCONFIG_MODE`:
+
+      .. code-block:: bitbake
 
          KCONFIG_MODE = "alldefconfig"
 
@@ -5410,7 +5740,9 @@ system and gives an overview of their function and contents.
 
       The value of :term:`KERNEL_ARTIFACT_NAME`, which is set in the
       ``meta/classes-recipe/kernel-artifact-names.bbclass`` file, has the
-      following default value::
+      following default value:
+
+      .. code-block:: bitbake
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SUFFIX}"
 
@@ -5443,7 +5775,9 @@ system and gives an overview of their function and contents.
       building and configuring the kernel stops with an error.
 
       You can turn these errors into warnings by setting the
-      following in ``conf/local.conf``::
+      following in ``conf/local.conf``:
+
+      .. code-block:: bitbake
 
          KERNEL_DANGLING_FEATURES_WARN_ONLY = "1"
 
@@ -5487,13 +5821,17 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_DTB_LINK_NAME`
       The link name of the kernel device tree binary (DTB). This variable
       is set in the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as
-      follows::
+      follows:
+
+      .. code-block:: bitbake
 
          KERNEL_DTB_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
       The
       value of the ``KERNEL_ARTIFACT_LINK_NAME`` variable, which is set in
-      the same file, has the following value::
+      the same file, has the following value:
+
+      .. code-block:: bitbake
 
          KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
@@ -5503,7 +5841,9 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_DTB_NAME`
       The base name of the kernel device tree binary (DTB). This variable
       is set in the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as
-      follows::
+      follows:
+
+      .. code-block:: bitbake
 
          KERNEL_DTB_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
@@ -5556,7 +5896,9 @@ system and gives an overview of their function and contents.
       For example, the following example from the ``linux-yocto-rt_4.12``
       kernel recipe adds "netfilter" and "taskstats" features to all BSPs
       as well as "virtio" configurations to all QEMU machines. The last two
-      statements add specific configurations to targeted machine types::
+      statements add specific configurations to targeted machine types:
+
+      .. code-block:: bitbake
 
          KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
          KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
@@ -5567,13 +5909,17 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_FIT_LINK_NAME`
       The link name of the kernel flattened image tree (FIT) image. This
       variable is set in the ``meta/classes-recipe/kernel-artifact-names.bbclass``
-      file as follows::
+      file as follows:
+
+      .. code-block:: bitbake
 
          KERNEL_FIT_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
       The value of the
       ``KERNEL_ARTIFACT_LINK_NAME`` variable, which is set in the same
-      file, has the following value::
+      file, has the following value:
+
+      .. code-block:: bitbake
 
          KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
@@ -5583,7 +5929,9 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_FIT_NAME`
       The base name of the kernel flattened image tree (FIT) image. This
       variable is set in the ``meta/classes-recipe/kernel-artifact-names.bbclass``
-      file as follows::
+      file as follows:
+
+      .. code-block:: bitbake
 
          KERNEL_FIT_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
@@ -5591,13 +5939,17 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_IMAGE_LINK_NAME`
       The link name for the kernel image. This variable is set in the
-      ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows::
+      ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows:
+
+      .. code-block:: bitbake
 
          KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
       The value of
       the ``KERNEL_ARTIFACT_LINK_NAME`` variable, which is set in the same
-      file, has the following value::
+      file, has the following value:
+
+      .. code-block:: bitbake
 
          KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
@@ -5620,7 +5972,9 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_IMAGE_NAME`
       The base name of the kernel image. This variable is set in the
-      ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows::
+      ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows:
+
+      .. code-block:: bitbake
 
          KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
@@ -5629,7 +5983,9 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_IMAGE_STRIP_EXTRA_SECTIONS`
       If this variable is set, it should contain the sections to be
       stripped from the ``vmlinux`` image by the kernel-related
-      :ref:`ref-tasks-strip` task. As a simple example::
+      :ref:`ref-tasks-strip` task. As a simple example:
+
+      .. code-block:: bitbake
 
          KERNEL_IMAGE_STRIP_EXTRA_SECTIONS = ".comment .note.* .debug"
 
@@ -5670,7 +6026,9 @@ system and gives an overview of their function and contents.
       configuration file, an append file for the recipe, or the recipe
       itself).
 
-      Specify it as follows::
+      Specify it as follows:
+
+      .. code-block:: bitbake
 
          KERNEL_MODULE_AUTOLOAD += "module_name1 module_name2 module_name3"
 
@@ -5678,7 +6036,9 @@ system and gives an overview of their function and contents.
       system to populate the ``/etc/modules-load.d/modname.conf`` file with
       the list of modules to be auto-loaded on boot. The modules appear
       one-per-line in the file. Here is an example of the most common use
-      case::
+      case:
+
+      .. code-block:: bitbake
 
          KERNEL_MODULE_AUTOLOAD += "module_name"
 
@@ -5787,7 +6147,9 @@ system and gives an overview of their function and contents.
 
       These mappings between different names occur in the Yocto Linux
       Kernel's ``meta`` branch. As an example take a look in the
-      ``common/recipes-kernel/linux/linux-yocto_3.19.bbappend`` file::
+      ``common/recipes-kernel/linux/linux-yocto_3.19.bbappend`` file:
+
+      .. code-block:: bitbake
 
          LINUX_VERSION:core2-32-intel-common = "3.19.0"
          COMPATIBLE_MACHINE:core2-32-intel-common = "${MACHINE}"
@@ -5852,7 +6214,9 @@ system and gives an overview of their function and contents.
    :term:`LAYERDEPENDS`
       Lists the layers, separated by spaces, on which this layer depends.
       Optionally, you can specify a specific layer version for a dependency
-      by adding it to the end of the layer name. Here is an example::
+      by adding it to the end of the layer name. Here is an example:
+
+      .. code-block:: bitbake
 
          LAYERDEPENDS_mylayer = "anotherlayer (=3)"
 
@@ -5880,7 +6244,9 @@ system and gives an overview of their function and contents.
 
       Optionally, you can specify a specific layer version for a
       recommendation by adding the version to the end of the layer name.
-      Here is an example::
+      Here is an example:
+
+      .. code-block:: bitbake
 
          LAYERRECOMMENDS_mylayer = "anotherlayer (=3)"
 
@@ -5964,7 +6330,9 @@ system and gives an overview of their function and contents.
          :term:`SPDXLICENSEMAP` flag names defined in
          ``meta/conf/licenses.conf``.
 
-      Here are some examples::
+      Here are some examples:
+
+      .. code-block:: bitbake
 
          LICENSE = "LGPL-2.1-only | GPL-3.0-only"
          LICENSE = "MPL-1.0 & LGPL-2.1-only"
@@ -5981,7 +6349,9 @@ system and gives an overview of their function and contents.
       situations where components of the output have different licenses.
       For example, a piece of software whose code is licensed under GPLv2
       but has accompanying documentation licensed under the GNU Free
-      Documentation License 1.2 could be specified as follows::
+      Documentation License 1.2 could be specified as follows:
+
+      .. code-block:: bitbake
 
          LICENSE = "GFDL-1.2 & GPL-2.0-only"
          LICENSE:${PN} = "GPL-2.0.only"
@@ -6042,7 +6412,9 @@ system and gives an overview of their function and contents.
       the error message will be more informative, containing the specified
       extra details.
 
-      For example, a recipe with an EULA may set::
+      For example, a recipe with an EULA may set:
+
+      .. code-block:: bitbake
 
          LICENSE_FLAGS = "FooBar-EULA"
          LICENSE_FLAGS_DETAILS[FooBar-EULA] = "For further details, see https://example.com/eula."
@@ -6058,7 +6430,9 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system uses :term:`COMMON_LICENSE_DIR` to define the
       directory that holds common license text used during the build. The
       :term:`LICENSE_PATH` variable allows you to extend that location to other
-      areas that have additional licenses::
+      areas that have additional licenses:
+
+      .. code-block:: bitbake
 
          LICENSE_PATH += "path-to-additional-common-licenses"
 
@@ -6082,12 +6456,16 @@ system and gives an overview of their function and contents.
       being built using the OpenEmbedded build system is based. You define
       this variable in the kernel recipe. For example, the
       ``linux-yocto-3.4.bb`` kernel recipe found in
-      ``meta/recipes-kernel/linux`` defines the variables as follows::
+      ``meta/recipes-kernel/linux`` defines the variables as follows:
+
+      .. code-block:: bitbake
 
          LINUX_VERSION ?= "3.4.24"
 
       The :term:`LINUX_VERSION` variable is used to define :term:`PV`
-      for the recipe::
+      for the recipe:
+
+      .. code-block:: bitbake
 
          PV = "${LINUX_VERSION}+git"
 
@@ -6095,7 +6473,9 @@ system and gives an overview of their function and contents.
       A string extension compiled into the version string of the Linux
       kernel built with the OpenEmbedded build system. You define this
       variable in the kernel recipe. For example, the linux-yocto kernel
-      recipes all define the variable as follows::
+      recipes all define the variable as follows:
+
+      .. code-block:: bitbake
 
          LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
@@ -6139,7 +6519,9 @@ system and gives an overview of their function and contents.
       :term:`MACHINE` in the ``local.conf`` file found in the
       :term:`Build Directory`. By default, :term:`MACHINE` is set to
       "qemux86", which is an x86-based architecture machine to be emulated
-      using QEMU::
+      using QEMU:
+
+      .. code-block:: bitbake
 
          MACHINE ?= "qemux86"
 
@@ -6151,7 +6533,9 @@ system and gives an overview of their function and contents.
       ``meta/conf/machine``.
 
       The list of machines supported by the Yocto Project as shipped
-      include the following::
+      include the following:
+
+      .. code-block:: bitbake
 
          MACHINE ?= "qemuarm"
          MACHINE ?= "qemuarm64"
@@ -6196,7 +6580,9 @@ system and gives an overview of their function and contents.
       As an example, suppose the machine for which you are building
       requires ``example-init`` to be run during boot to initialize the
       hardware. In this case, you would use the following in the machine's
-      ``.conf`` configuration file::
+      ``.conf`` configuration file:
+
+      .. code-block:: bitbake
 
          MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "example-init"
 
@@ -6227,7 +6613,9 @@ system and gives an overview of their function and contents.
       "recommends" relationship so that in the latter case, the build will
       not fail due to the missing package. To accomplish this, assuming the
       package for the module was called ``kernel-module-ab123``, you would
-      use the following in the machine's ``.conf`` configuration file::
+      use the following in the machine's ``.conf`` configuration file:
+
+      .. code-block:: bitbake
 
          MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-ab123"
 
@@ -6263,7 +6651,9 @@ system and gives an overview of their function and contents.
       exist, so it is acceptable for the build process to depend upon
       finding the package. In this case, assuming the package for the
       firmware was called ``wifidriver-firmware``, you would use the
-      following in the ``.conf`` file for the machine::
+      following in the ``.conf`` file for the machine:
+
+      .. code-block:: bitbake
 
          MACHINE_EXTRA_RDEPENDS += "wifidriver-firmware"
 
@@ -6289,7 +6679,9 @@ system and gives an overview of their function and contents.
       the build to succeed instead of failing as a result of the package
       not being found. To accomplish this, assuming the package for the
       module was called ``kernel-module-examplewifi``, you would use the
-      following in the ``.conf`` file for the machine::
+      following in the ``.conf`` file for the machine:
+
+      .. code-block:: bitbake
 
          MACHINE_EXTRA_RRECOMMENDS += "kernel-module-examplewifi"
 
@@ -6317,7 +6709,9 @@ system and gives an overview of their function and contents.
       when they are provided by the :term:`MACHINE_FEATURES_DEFAULTS` variable.
 
       You can also opt out of all default features by setting
-      :term:`MACHINE_FEATURES_OPTED_OUT` to ``*``::
+      :term:`MACHINE_FEATURES_OPTED_OUT` to ``*``:
+
+      .. code-block:: bitbake
 
          MACHINE_FEATURES_OPTED_OUT = "*"
 
@@ -6332,14 +6726,18 @@ system and gives an overview of their function and contents.
       should apply to a machine. For example, all machines emulated in QEMU
       (e.g. ``qemuarm``, ``qemux86``, and so forth) include a file named
       ``meta/conf/machine/include/qemu.inc`` that prepends the following
-      override to :term:`MACHINEOVERRIDES`::
+      override to :term:`MACHINEOVERRIDES`:
+
+      .. code-block:: bitbake
 
          MACHINEOVERRIDES =. "qemuall:"
 
       This
       override allows variables to be overridden for all machines emulated
       in QEMU, like in the following example from the ``connman-conf``
-      recipe::
+      recipe:
+
+      .. code-block:: bitbake
 
          SRC_URI:append:qemuall = " file://wired.config \
              file://wired-setup \
@@ -6422,23 +6820,31 @@ system and gives an overview of their function and contents.
       declares build-time dependencies on tasks in other recipes by using
       :term:`DEPENDS`, then a dependency on "foo" will automatically get
       rewritten to a dependency on "nativesdk-foo". However, dependencies like
-      the following will not get rewritten automatically::
+      the following will not get rewritten automatically:
+
+      .. code-block:: bitbake
 
          do_foo[depends] += "recipe:do_foo"
 
       If you want such a dependency to also get transformed, you can do the
-      following::
+      following:
+
+      .. code-block:: bitbake
 
          do_foo[depends] += "${MLPREFIX}recipe:do_foo"
 
    :term:`module_autoload`
       This variable has been replaced by the :term:`KERNEL_MODULE_AUTOLOAD`
       variable. You should replace all occurrences of :term:`module_autoload`
-      with additions to :term:`KERNEL_MODULE_AUTOLOAD`, for example::
+      with additions to :term:`KERNEL_MODULE_AUTOLOAD`, for example:
+
+      .. code-block:: bitbake
 
          module_autoload_rfcomm = "rfcomm"
 
-      should now be replaced with::
+      should now be replaced with:
+
+      .. code-block:: bitbake
 
          KERNEL_MODULE_AUTOLOAD += "rfcomm"
 
@@ -6457,7 +6863,9 @@ system and gives an overview of their function and contents.
       :term:`KERNEL_MODULE_PROBECONF`
       variable.
 
-      Here is the general syntax::
+      Here is the general syntax:
+
+      .. code-block:: bitbake
 
          module_conf_module_name = "modprobe.d-syntax"
 
@@ -6469,7 +6877,9 @@ system and gives an overview of their function and contents.
       Including :term:`module_conf` causes the OpenEmbedded build system to
       populate the ``/etc/modprobe.d/modname.conf`` file with
       ``modprobe.d`` syntax lines. Here is an example that adds the options
-      ``arg1`` and ``arg2`` to a module named ``mymodule``::
+      ``arg1`` and ``arg2`` to a module named ``mymodule``:
+
+      .. code-block:: bitbake
 
          module_conf_mymodule = "options mymodule arg1=val1 arg2=val2"
 
@@ -6483,13 +6893,17 @@ system and gives an overview of their function and contents.
 
    :term:`MODULE_TARBALL_LINK_NAME`
       The link name of the kernel module tarball. This variable is set in
-      the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows::
+      the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows:
+
+      .. code-block:: bitbake
 
          MODULE_TARBALL_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
       The value
       of the ``KERNEL_ARTIFACT_LINK_NAME`` variable, which is set in the
-      same file, has the following value::
+      same file, has the following value:
+
+      .. code-block:: bitbake
 
          KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
@@ -6497,7 +6911,9 @@ system and gives an overview of their function and contents.
 
    :term:`MODULE_TARBALL_NAME`
       The base name of the kernel module tarball. This variable is set in
-      the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows::
+      the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows:
+
+      .. code-block:: bitbake
 
          MODULE_TARBALL_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
@@ -6557,13 +6973,17 @@ system and gives an overview of their function and contents.
       not exist in common licenses.
 
       The following example shows how to add :term:`NO_GENERIC_LICENSE` to a
-      recipe::
+      recipe:
+
+      .. code-block:: bitbake
 
          NO_GENERIC_LICENSE[license_name] = "license_file_in_fetched_source"
 
       Here is an example that
       uses the ``LICENSE.Abilis.txt`` file as the license from the fetched
-      source::
+      source:
+
+      .. code-block:: bitbake
 
          NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"
 
@@ -6571,13 +6991,17 @@ system and gives an overview of their function and contents.
       Prevents installation of all "recommended-only" packages.
       Recommended-only packages are packages installed only through the
       :term:`RRECOMMENDS` variable). Setting the
-      :term:`NO_RECOMMENDATIONS` variable to "1" turns this feature on::
+      :term:`NO_RECOMMENDATIONS` variable to "1" turns this feature on:
+
+      .. code-block:: bitbake
 
          NO_RECOMMENDATIONS = "1"
 
       You can set this variable globally in your ``local.conf`` file or you
       can attach it to a specific image recipe by using the recipe name
-      override::
+      override:
+
+      .. code-block:: bitbake
 
          NO_RECOMMENDATIONS:pn-target_image = "1"
 
@@ -6603,7 +7027,9 @@ system and gives an overview of their function and contents.
       Disables auto package from splitting ``.debug`` files. If a recipe
       requires ``FILES:${PN}-dbg`` to be set manually, the
       :term:`NOAUTOPACKAGEDEBUG` can be defined allowing you to define the
-      content of the debug package. For example::
+      content of the debug package. For example:
+
+      .. code-block:: bitbake
 
          NOAUTOPACKAGEDEBUG = "1"
          FILES:${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
@@ -6613,7 +7039,9 @@ system and gives an overview of their function and contents.
    :term:`NON_MULTILIB_RECIPES`
       A list of recipes that should not be built for multilib. OE-Core's
       ``multilib.conf`` file defines a reasonable starting point for this
-      list with::
+      list with:
+
+      .. code-block:: bitbake
 
          NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
 
@@ -6699,7 +7127,9 @@ system and gives an overview of their function and contents.
 
       By default, this variable is set to ``Ninja``, which is faster than GNU
       make, but if building is broken with Ninja, a recipe can use this
-      variable to use GNU make instead::
+      variable to use GNU make instead:
+
+      .. code-block:: bitbake
 
          OECMAKE_GENERATOR = "Unix Makefiles"
 
@@ -6758,7 +7188,9 @@ system and gives an overview of their function and contents.
    :term:`OPKGBUILDCMD`
       The variable :term:`OPKGBUILDCMD` specifies the command used to build opkg
       packages when using the :ref:`ref-classes-package_ipk` class. It is
-      defined in :ref:`ref-classes-package_ipk` as::
+      defined in :ref:`ref-classes-package_ipk` as:
+
+      .. code-block:: bitbake
 
           OPKGBUILDCMD ??= 'opkg-build -Z zstd -a "${ZSTD_DEFAULTS}"'
 
@@ -6767,7 +7199,9 @@ system and gives an overview of their function and contents.
       inherited, specifies the device to be mounted for the read/write
       layer of ``/etc``. There is no default, so you must set this if you
       wish to enable :ref:`ref-classes-overlayfs-etc`, for
-      example, assuming ``/dev/mmcblk0p2`` was the desired device::
+      example, assuming ``/dev/mmcblk0p2`` was the desired device:
+
+      .. code-block:: bitbake
 
          OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p2"
 
@@ -6782,7 +7216,9 @@ system and gives an overview of their function and contents.
       inherited, specifies the file system type for the read/write
       layer of ``/etc``. There is no default, so you must set this if you
       wish to enable :ref:`ref-classes-overlayfs-etc`,
-      for example, assuming the file system is ext4::
+      for example, assuming the file system is ext4:
+
+      .. code-block:: bitbake
 
          OVERLAYFS_ETC_FSTYPE = "ext4"
 
@@ -6796,7 +7232,9 @@ system and gives an overview of their function and contents.
       inherited, specifies the parent mount path for the filesystem layers.
       There is no default, so you must set this if you wish to enable
       :ref:`ref-classes-overlayfs-etc`, for example if the desired path is
-      "/data"::
+      "/data":
+
+      .. code-block:: bitbake
 
          OVERLAYFS_ETC_MOUNT_POINT = "/data"
 
@@ -6808,7 +7246,9 @@ system and gives an overview of their function and contents.
 
    :term:`OVERLAYFS_MOUNT_POINT`
       When inheriting the :ref:`ref-classes-overlayfs` class,
-      specifies mount point(s) to be used. For example::
+      specifies mount point(s) to be used. For example:
+
+      .. code-block:: bitbake
 
          OVERLAYFS_MOUNT_POINT[data] = "/data"
 
@@ -6825,7 +7265,9 @@ system and gives an overview of their function and contents.
    :term:`OVERLAYFS_QA_SKIP`
       When inheriting the :ref:`ref-classes-overlayfs` class,
       provides the ability to disable QA checks for particular overlayfs
-      mounts. For example::
+      mounts. For example:
+
+      .. code-block:: bitbake
 
          OVERLAYFS_QA_SKIP[data] = "mount-configured"
 
@@ -6838,7 +7280,9 @@ system and gives an overview of their function and contents.
    :term:`OVERLAYFS_WRITABLE_PATHS`
       When inheriting the :ref:`ref-classes-overlayfs` class,
       specifies writable paths used at runtime for the recipe. For
-      example::
+      example:
+
+      .. code-block:: bitbake
 
          OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
 
@@ -6853,7 +7297,9 @@ system and gives an overview of their function and contents.
       As an example, if the string "an-override" appears as an element in
       the colon-separated list in :term:`OVERRIDES`, then the following
       assignment will override ``FOO`` with the value "overridden" at the
-      end of parsing::
+      end of parsing:
+
+      .. code-block:: bitbake
 
          FOO:an-override = "overridden"
 
@@ -6868,7 +7314,9 @@ system and gives an overview of their function and contents.
       :term:`DISTROOVERRIDES` variables. Another
       important override included by default is ``pn-${PN}``. This override
       allows variables to be set for a single recipe within configuration
-      (``.conf``) files. Here is an example::
+      (``.conf``) files. Here is an example:
+
+      .. code-block:: bitbake
 
          FOO:pn-myrecipe = "myrecipe-specific value"
 
@@ -6919,7 +7367,9 @@ system and gives an overview of their function and contents.
       However, if your recipe's output packages are built specific to the
       target machine rather than generally for the architecture of the
       machine, you should set :term:`PACKAGE_ARCH` to the value of
-      :term:`MACHINE_ARCH` in the recipe as follows::
+      :term:`MACHINE_ARCH` in the recipe as follows:
+
+      .. code-block:: bitbake
 
          PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -6942,14 +7392,18 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system uses when packaging data.
 
       You can provide one or more of the following arguments for the
-      variable::
+      variable:
+
+      .. code-block:: bitbake
 
          PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
 
       The build system uses only the first argument in the list as the
       package manager when creating your image or SDK. However, packages
       will be created using any additional packaging classes you specify.
-      For example, if you use the following in your ``local.conf`` file::
+      For example, if you use the following in your ``local.conf`` file:
+
+      .. code-block:: bitbake
 
          PACKAGE_CLASSES ?= "package_ipk"
 
@@ -7006,13 +7460,17 @@ system and gives an overview of their function and contents.
 
    :term:`PACKAGE_EXCLUDE`
       Lists packages that should not be installed into an image. For
-      example::
+      example:
+
+      .. code-block:: bitbake
 
          PACKAGE_EXCLUDE = "package_name package_name package_name ..."
 
       You can set this variable globally in your ``local.conf`` file or you
       can attach it to a specific image recipe by using the recipe name
-      override::
+      override:
+
+      .. code-block:: bitbake
 
          PACKAGE_EXCLUDE:pn-target_image = "package_name"
 
@@ -7067,7 +7525,9 @@ system and gives an overview of their function and contents.
 
       Consider the following example where the :term:`PACKAGE_FEED_URIS`,
       :term:`PACKAGE_FEED_BASE_PATHS`, and :term:`PACKAGE_FEED_ARCHS` variables are
-      defined in your ``local.conf`` file::
+      defined in your ``local.conf`` file:
+
+      .. code-block:: bitbake
 
          PACKAGE_FEED_URIS = "https://example.com/packagerepos/release \
                               https://example.com/packagerepos/updates"
@@ -7096,7 +7556,9 @@ system and gives an overview of their function and contents.
 
       Consider the following example where the :term:`PACKAGE_FEED_URIS`,
       :term:`PACKAGE_FEED_BASE_PATHS`, and :term:`PACKAGE_FEED_ARCHS` variables are
-      defined in your ``local.conf`` file::
+      defined in your ``local.conf`` file:
+
+      .. code-block:: bitbake
 
          PACKAGE_FEED_URIS = "https://example.com/packagerepos/release \
                               https://example.com/packagerepos/updates"
@@ -7125,7 +7587,9 @@ system and gives an overview of their function and contents.
 
       Consider the following example where the :term:`PACKAGE_FEED_URIS`,
       :term:`PACKAGE_FEED_BASE_PATHS`, and :term:`PACKAGE_FEED_ARCHS` variables are
-      defined in your ``local.conf`` file::
+      defined in your ``local.conf`` file:
+
+      .. code-block:: bitbake
 
          PACKAGE_FEED_URIS = "https://example.com/packagerepos/release \
                               https://example.com/packagerepos/updates"
@@ -7190,7 +7654,9 @@ system and gives an overview of their function and contents.
       recipe on a per-recipe basis. :term:`PACKAGECONFIG` blocks are defined in
       recipes when you specify features and then arguments that define
       feature behaviors. Here is the basic block structure (broken over
-      multiple lines for readability)::
+      multiple lines for readability):
+
+      .. code-block:: bitbake
 
          PACKAGECONFIG ??= "f1 f2 f3 ..."
          PACKAGECONFIG[f1] = "\
@@ -7231,7 +7697,9 @@ system and gives an overview of their function and contents.
 
       Consider the following :term:`PACKAGECONFIG` block taken from the
       ``librsvg`` recipe. In this example the feature is ``gtk``, which has
-      three arguments that determine the feature's behavior::
+      three arguments that determine the feature's behavior:
+
+      .. code-block:: bitbake
 
          PACKAGECONFIG[gtk] = "--with-gtk3,--without-gtk3,gtk+3"
 
@@ -7253,22 +7721,30 @@ system and gives an overview of their function and contents.
       -  *Append file:* Create an append file named
          ``recipename.bbappend`` in your layer and override the value of
          :term:`PACKAGECONFIG`. You can either completely override the
-         variable::
+         variable:
+
+         .. code-block:: bitbake
 
             PACKAGECONFIG = "f4 f5"
 
-         Or, you can just append the variable::
+         Or, you can just append the variable:
+
+         .. code-block:: bitbake
 
             PACKAGECONFIG:append = " f4"
 
       -  *Configuration file:* This method is identical to changing the
          block through an append file except you edit your ``local.conf``
          or ``mydistro.conf`` file. As with append files previously
-         described, you can either completely override the variable::
+         described, you can either completely override the variable:
+
+         .. code-block:: bitbake
 
             PACKAGECONFIG:pn-recipename = "f4 f5"
 
-         Or, you can just amend the variable::
+         Or, you can just amend the variable:
+
+         .. code-block:: bitbake
 
             PACKAGECONFIG:append:pn-recipename = " f4"
 
@@ -7293,14 +7769,18 @@ system and gives an overview of their function and contents.
       :term:`EXTRA_OECMAKE`, which :term:`PACKAGECONFIG_CONFARGS` will be
       appended to.  Now, knowing that :term:`PACKAGECONFIG_CONFARGS` is
       automatically filled with either the first or second element of
-      :term:`PACKAGECONFIG` flag value, the recipe would be like::
+      :term:`PACKAGECONFIG` flag value, the recipe would be like:
+
+      .. code-block:: bitbake
 
          inherit cmake
          PACKAGECONFIG = "systemd"
          PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF"
 
       A side note to this recipe is to check if ``systemd`` is in fact the used :term:`INIT_MANAGER`
-      or not::
+      or not:
+
+      .. code-block:: bitbake
 
          PACKAGECONFIG = "${@'systemd' if d.getVar('INIT_MANAGER') == 'systemd' else ''}"
 
@@ -7458,7 +7938,9 @@ system and gives an overview of their function and contents.
       patched, it uses "patch".
 
       If you wish to use an alternative patching tool, set the variable in
-      the recipe using one of the following::
+      the recipe using one of the following:
+
+      .. code-block:: bitbake
 
          PATCHTOOL = "patch"
          PATCHTOOL = "quilt"
@@ -7609,7 +8091,9 @@ system and gives an overview of their function and contents.
    :term:`POPULATE_SDK_POST_HOST_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the host part of the SDK. You can specify
-      functions separated by spaces::
+      functions separated by spaces:
+
+      .. code-block:: bitbake
 
           POPULATE_SDK_POST_HOST_COMMAND += "function"
 
@@ -7621,7 +8105,9 @@ system and gives an overview of their function and contents.
    :term:`POPULATE_SDK_POST_TARGET_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the target part of the SDK. You can specify
-      functions separated by spaces::
+      functions separated by spaces:
+
+      .. code-block:: bitbake
 
          POPULATE_SDK_POST_TARGET_COMMAND += "function"
 
@@ -7705,7 +8191,9 @@ system and gives an overview of their function and contents.
       *runtime* component. Runtime providers are declared in recipes that set
       the :term:`RPROVIDES` variable for a specific package.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          PREFERRED_RPROVIDER_virtual-x-terminal-emulator = "rxvt-unicode"
 
@@ -7713,7 +8201,9 @@ system and gives an overview of their function and contents.
       ``rxvt-unicode``. The ``rxvt-unicode`` package is a runtime provider of
       this component because the ``rxvt-unicode`` recipe set the following
       :term:`RPROVIDES` definition for the ``rxvt-unicode`` (``${PN}``)
-      package::
+      package:
+
+      .. code-block:: bitbake
 
          RPROVIDES:${PN} = "virtual-x-terminal-emulator"
 
@@ -7783,7 +8273,9 @@ system and gives an overview of their function and contents.
       through the "``%``" character. You can use the character to match any
       number of characters, which can be useful when specifying versions
       that contain long revision numbers that potentially change. Here are
-      two examples::
+      two examples:
+
+      .. code-block:: bitbake
 
          PREFERRED_VERSION_python = "3.4.0"
          PREFERRED_VERSION_linux-yocto = "5.0%"
@@ -7806,13 +8298,17 @@ system and gives an overview of their function and contents.
       Sometimes the :term:`PREFERRED_VERSION` variable can be set by
       configuration files in a way that is hard to change. You can use
       :term:`OVERRIDES` to set a machine-specific
-      override. Here is an example::
+      override. Here is an example:
+
+      .. code-block:: bitbake
 
          PREFERRED_VERSION_linux-yocto:qemux86 = "5.0%"
 
       Although not recommended, worst case, you can also use the
       "forcevariable" override, which is the strongest override possible.
-      Here is an example::
+      Here is an example:
+
+      .. code-block:: bitbake
 
          PREFERRED_VERSION_linux-yocto:forcevariable = "5.0%"
 
@@ -7839,7 +8335,9 @@ system and gives an overview of their function and contents.
       Typically, you could add a specific server for the build system to
       attempt before any others by adding something like the following to
       the ``local.conf`` configuration file in the
-      :term:`Build Directory`::
+      :term:`Build Directory`:
+
+      .. code-block:: bitbake
 
          PREMIRRORS:prepend = "\
              git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
@@ -7879,7 +8377,9 @@ system and gives an overview of their function and contents.
       standard version of the library.
 
       Libraries specified in this variable should be specified by their
-      file name. For example, from the Firefox recipe in meta-browser::
+      file name. For example, from the Firefox recipe in meta-browser:
+
+      .. code-block:: bitbake
 
          PRIVATE_LIBS = "libmozjs.so \
                          libxpcom.so \
@@ -7903,7 +8403,9 @@ system and gives an overview of their function and contents.
       :term:`DEPENDS`.
 
       Consider the following example :term:`PROVIDES` statement from the recipe
-      file ``eudev_3.2.9.bb``::
+      file ``eudev_3.2.9.bb``:
+
+      .. code-block:: bitbake
 
          PROVIDES += "udev"
 
@@ -7940,7 +8442,9 @@ system and gives an overview of their function and contents.
          package of the component that manages the ``/dev`` directory.
 
          Setting the "preferred provider" for runtime dependencies is as
-         simple as using the following assignment in a configuration file::
+         simple as using the following assignment in a configuration file:
+
+         .. code-block:: bitbake
 
                  VIRTUAL-RUNTIME_dev_manager = "udev"
 
@@ -7950,7 +8454,9 @@ system and gives an overview of their function and contents.
 
       The ``conf/templates/default/local.conf.sample.extended`` configuration
       file in :yocto_git:`meta-poky </meta-yocto/tree/meta-poky>` shows how the
-      :term:`PRSERV_HOST` variable is set::
+      :term:`PRSERV_HOST` variable is set:
+
+      .. code-block:: bitbake
 
          PRSERV_HOST = "localhost:0"
 
@@ -8078,7 +8584,9 @@ system and gives an overview of their function and contents.
 
       This variable is similar to the :term:`QB_CMDLINE_IP_SLIRP` variable.
 
-      Use as follows::
+      Use as follows:
+
+      .. code-block:: bitbake
 
          QB_CMDLINE_IP_TAP = "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0"
 
@@ -8092,7 +8600,9 @@ system and gives an overview of their function and contents.
       used by ``runqemu`` to specify the `-bios <https://www.qemu.org/docs/master/system/invocation.html#hxtool-8>`__
       option of QEMU. For example, this variable can be set as follows to
       emulate U-Boot for the :oecore_path:`qemuarm64 <meta/conf/machine/qemuarm64.conf>`
-      machine::
+      machine:
+
+      .. code-block:: bitbake
 
          QB_DEFAULT_BIOS = "u-boot.bin"
 
@@ -8143,14 +8653,18 @@ system and gives an overview of their function and contents.
       to the Linux kernel's ``-append`` QEMU options, which controls the Linux kernel
       command-line.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          QB_KERNEL_CMDLINE_APPEND = "console=ttyS0"
 
    :term:`QB_MEM`
 
       The :term:`QB_MEM` variable controls the amount of memory allocated to the
-      emulated machine. Specify as follows::
+      emulated machine. Specify as follows:
+
+      .. code-block:: bitbake
 
          QB_MEM = "-m 512"
 
@@ -8160,7 +8674,9 @@ system and gives an overview of their function and contents.
       the network device instantiated by QEMU. This value needs to be compatible
       with the :term:`QB_TAP_OPT` variable.
 
-      Example::
+      Example:
+
+      .. code-block:: bitbake
 
          QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 
@@ -8172,7 +8688,9 @@ system and gives an overview of their function and contents.
       controls extra options to be appended to the NFS rootfs options in the
       Linux kernel command-line.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          QB_NFSROOTFS_EXTRA_OPT = "wsize=4096,rsize=4096"
 
@@ -8187,7 +8705,9 @@ system and gives an overview of their function and contents.
       pass-through for host random number generator, it can speedup boot
       in system mode, where system is experiencing entropy starvation.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          QB_RNG = "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 
@@ -8201,7 +8721,9 @@ system and gives an overview of their function and contents.
       When using ``runqemu``, the :term:`QB_SERIAL_OPT` variable controls the
       serial port option.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          QB_SERIAL_OPT = "-serial mon:stdio"
 
@@ -8211,7 +8733,9 @@ system and gives an overview of their function and contents.
       amount of CPU cores made availalble inside the QEMU guest, each mapped to
       a thread on the host.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          QB_SMP = "-smp 8".
 
@@ -8225,7 +8749,9 @@ system and gives an overview of their function and contents.
       When using ``runqemu``, the :term:`QB_TAP_OPT` variable controls
       the network option for "tap" mode.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 
@@ -8240,7 +8766,9 @@ system and gives an overview of their function and contents.
       will not be installed if conflicting packages are not first removed.
 
       Like all package-controlling variables, you must always use them in
-      conjunction with a package name override. Here is an example::
+      conjunction with a package name override. Here is an example:
+
+      .. code-block:: bitbake
 
          RCONFLICTS:${PN} = "another_conflicting_package_name"
 
@@ -8248,7 +8776,9 @@ system and gives an overview of their function and contents.
       specifying versioned dependencies. Although the syntax varies
       depending on the packaging format, BitBake hides these differences
       from you. Here is the general syntax to specify versions with the
-      :term:`RCONFLICTS` variable::
+      :term:`RCONFLICTS` variable:
+
+      .. code-block:: bitbake
 
          RCONFLICTS:${PN} = "package (operator version)"
 
@@ -8261,7 +8791,9 @@ system and gives an overview of their function and contents.
       - >=
 
       For example, the following sets up a dependency on version 1.2 or
-      greater of the package ``foo``::
+      greater of the package ``foo``:
+
+      .. code-block:: bitbake
 
          RCONFLICTS:${PN} = "foo (>= 1.2)"
 
@@ -8270,7 +8802,9 @@ system and gives an overview of their function and contents.
       packages that must be installed in order for the package to function
       correctly. As an example, the following assignment declares that the
       package ``foo`` needs the packages ``bar`` and ``baz`` to be
-      installed::
+      installed:
+
+      .. code-block:: bitbake
 
          RDEPENDS:foo = "bar baz"
 
@@ -8311,7 +8845,9 @@ system and gives an overview of their function and contents.
       name (remember that a single recipe can build multiple packages). For
       example, suppose you are building a development package that depends
       on the ``perl`` package. In this case, you would use the following
-      :term:`RDEPENDS` statement::
+      :term:`RDEPENDS` statement:
+
+      .. code-block:: bitbake
 
          RDEPENDS:${PN}-dev += "perl"
 
@@ -8340,7 +8876,9 @@ system and gives an overview of their function and contents.
       specifying versioned dependencies. Although the syntax varies
       depending on the packaging format, BitBake hides these differences
       from you. Here is the general syntax to specify versions with the
-      :term:`RDEPENDS` variable::
+      :term:`RDEPENDS` variable:
+
+      .. code-block:: bitbake
 
          RDEPENDS:${PN} = "package (operator version)"
 
@@ -8360,7 +8898,9 @@ system and gives an overview of their function and contents.
          specification.
 
       For example, the following sets up a dependency on version 1.2 or
-      greater of the package ``foo``::
+      greater of the package ``foo``:
+
+      .. code-block:: bitbake
 
          RDEPENDS:${PN} = "foo (>= 1.2)"
 
@@ -8385,7 +8925,9 @@ system and gives an overview of their function and contents.
           meta/conf/distro/include/maintainers.inc:RECIPE_MAINTAINER:pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
 
       It can also be directly defined in a recipe,
-      for example in the ``libgpiod`` one::
+      for example in the ``libgpiod`` one:
+
+      .. code-block:: bitbake
 
           RECIPE_MAINTAINER = "Bartosz Golaszewski <brgl@bgdev.pl>"
 
@@ -8554,7 +9096,9 @@ system and gives an overview of their function and contents.
 
    :term:`ROOT_HOME`
       Defines the root home directory. By default, this directory is set as
-      follows in the BitBake configuration file::
+      follows in the BitBake configuration file:
+
+      .. code-block:: bitbake
 
          ROOT_HOME ??= "/home/root"
 
@@ -8564,7 +9108,9 @@ system and gives an overview of their function and contents.
          prefer to have a read-only root filesystem and prefer to keep
          writeable data in one place.
 
-      When setting ``INIT_MANAGER = systemd``, the default will be set to::
+      When setting ``INIT_MANAGER = systemd``, the default will be set to:
+
+      .. code-block:: bitbake
 
          ROOT_HOME ?= "/root"
 
@@ -8580,7 +9126,9 @@ system and gives an overview of their function and contents.
    :term:`ROOTFS_POSTINSTALL_COMMAND`
       Specifies a list of functions to call after the OpenEmbedded build
       system has installed packages. You can specify functions separated by
-      spaces::
+      spaces:
+
+      .. code-block:: bitbake
 
          ROOTFS_POSTINSTALL_COMMAND += "function"
 
@@ -8593,7 +9141,9 @@ system and gives an overview of their function and contents.
    :term:`ROOTFS_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the root filesystem. You can specify functions
-      separated by spaces::
+      separated by spaces:
+
+      .. code-block:: bitbake
 
          ROOTFS_POSTPROCESS_COMMAND += "function"
 
@@ -8608,7 +9158,9 @@ system and gives an overview of their function and contents.
       system has removed unnecessary packages. When runtime package
       management is disabled in the image, several packages are removed
       including ``base-passwd``, ``shadow``, and ``update-alternatives``.
-      You can specify functions separated by spaces::
+      You can specify functions separated by spaces:
+
+      .. code-block:: bitbake
 
          ROOTFS_POSTUNINSTALL_COMMAND += "function"
 
@@ -8621,7 +9173,9 @@ system and gives an overview of their function and contents.
    :term:`ROOTFS_PREPROCESS_COMMAND`
       Specifies a list of functions to call before the OpenEmbedded build
       system has created the root filesystem. You can specify functions
-      separated by spaces::
+      separated by spaces:
+
+      .. code-block:: bitbake
 
          ROOTFS_PREPROCESS_COMMAND += "function"
 
@@ -8646,7 +9200,9 @@ system and gives an overview of their function and contents.
 
       As with all package-controlling variables, you must always use the
       variable in conjunction with a package name override. Here is an
-      example::
+      example:
+
+      .. code-block:: bitbake
 
          RPROVIDES:${PN} = "widget-abi-2"
 
@@ -8677,7 +9233,9 @@ system and gives an overview of their function and contents.
       particular package whose usability is being extended. For example,
       suppose you are building a development package that is extended to
       support wireless functionality. In this case, you would use the
-      following::
+      following:
+
+      .. code-block:: bitbake
 
          RRECOMMENDS:${PN}-dev += "wireless_package_name"
 
@@ -8690,7 +9248,9 @@ system and gives an overview of their function and contents.
       specifying versioned recommends. Although the syntax varies depending
       on the packaging format, BitBake hides these differences from you.
       Here is the general syntax to specify versions with the
-      :term:`RRECOMMENDS` variable::
+      :term:`RRECOMMENDS` variable:
+
+      .. code-block:: bitbake
 
          RRECOMMENDS:${PN} = "package (operator version)"
 
@@ -8703,7 +9263,9 @@ system and gives an overview of their function and contents.
       - >=
 
       For example, the following sets up a recommend on version 1.2 or
-      greater of the package ``foo``::
+      greater of the package ``foo``:
+
+      .. code-block:: bitbake
 
          RRECOMMENDS:${PN} = "foo (>= 1.2)"
 
@@ -8715,7 +9277,9 @@ system and gives an overview of their function and contents.
       the other package to the :term:`RCONFLICTS` variable.
 
       As with all package-controlling variables, you must use this variable
-      in conjunction with a package name override. Here is an example::
+      in conjunction with a package name override. Here is an example:
+
+      .. code-block:: bitbake
 
          RREPLACES:${PN} = "other_package_being_replaced"
 
@@ -8723,7 +9287,9 @@ system and gives an overview of their function and contents.
       specifying versioned replacements. Although the syntax varies
       depending on the packaging format, BitBake hides these differences
       from you. Here is the general syntax to specify versions with the
-      :term:`RREPLACES` variable::
+      :term:`RREPLACES` variable:
+
+      .. code-block:: bitbake
 
          RREPLACES:${PN} = "package (operator version)"
 
@@ -8736,7 +9302,9 @@ system and gives an overview of their function and contents.
       - >=
 
       For example, the following sets up a replacement using version 1.2
-      or greater of the package ``foo``::
+      or greater of the package ``foo``:
+
+      .. code-block:: bitbake
 
           RREPLACES:${PN} = "foo (>= 1.2)"
 
@@ -8749,7 +9317,9 @@ system and gives an overview of their function and contents.
 
       As with all package-controlling variables, you must always use this
       variable in conjunction with a package name override. Here is an
-      example::
+      example:
+
+      .. code-block:: bitbake
 
          RSUGGESTS:${PN} = "useful_package another_package"
 
@@ -8811,7 +9381,9 @@ system and gives an overview of their function and contents.
       -  The ``ext`` flag contains the filename extension (suffix). The output
          filename is going will be ``${IMAGE_NAME}${ext}``.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
          SBOM_CVE_CHECK_EXPORT_VARS = "SBOM_CVE_CHECK_EXPORT_SPDX3"
          SBOM_CVE_CHECK_EXPORT_SPDX3[type] = "spdx3"
@@ -8888,7 +9460,9 @@ system and gives an overview of their function and contents.
       The directory set up and used by the
       :ref:`populate_sdk_base <ref-classes-populate-sdk>` class to which the
       SDK is deployed. The :ref:`populate_sdk_base <ref-classes-populate-sdk>`
-      class defines :term:`SDK_DEPLOY` as follows::
+      class defines :term:`SDK_DEPLOY` as follows:
+
+      .. code-block:: bitbake
 
          SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
@@ -8896,7 +9470,9 @@ system and gives an overview of their function and contents.
       The parent directory used by the OpenEmbedded build system when
       creating SDK output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class defines
-      the variable as follows::
+      the variable as follows:
+
+      .. code-block:: bitbake
 
          SDK_DIR = "${WORKDIR}/sdk"
 
@@ -8926,7 +9502,9 @@ system and gives an overview of their function and contents.
          packagename packagearch version
 
       The :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class
-      defines the manifest file as follows::
+      defines the manifest file as follows:
+
+      .. code-block:: bitbake
 
          SDK_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 
@@ -8973,7 +9551,9 @@ system and gives an overview of their function and contents.
       :term:`SDKMACHINE`,
       :term:`IMAGE_BASENAME`,
       :term:`TUNE_PKGARCH`, and
-      :term:`MACHINE` variables::
+      :term:`MACHINE` variables:
+
+      .. code-block:: bitbake
 
          SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
 
@@ -8984,7 +9564,9 @@ system and gives an overview of their function and contents.
    :term:`SDK_OUTPUT`
       The location used by the OpenEmbedded build system when creating SDK
       output. The :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
-      class defines the variable as follows::
+      class defines the variable as follows:
+
+      .. code-block:: bitbake
 
          SDK_DIR = "${WORKDIR}/sdk"
          SDK_OUTPUT = "${SDK_DIR}/image"
@@ -9057,7 +9639,9 @@ system and gives an overview of their function and contents.
          packagename packagearch version
 
       The :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class
-      defines the manifest file as follows::
+      defines the manifest file as follows:
+
+      .. code-block:: bitbake
 
          SDK_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
 
@@ -9077,7 +9661,9 @@ system and gives an overview of their function and contents.
       this title is based on the :term:`DISTRO_NAME` or
       :term:`DISTRO` variable and is set in the
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class as
-      follows::
+      follows:
+
+      .. code-block:: bitbake
 
          SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
@@ -9104,7 +9690,9 @@ system and gives an overview of their function and contents.
    :term:`SDK_VERSION`
       Specifies the version of the SDK. The Poky distribution configuration file
       (``/meta-poky/conf/distro/poky.conf``) sets the default
-      :term:`SDK_VERSION` as follows::
+      :term:`SDK_VERSION` as follows:
+
+      .. code-block:: bitbake
 
          SDK_VERSION = "${@d.getVar('DISTRO_VERSION').replace('snapshot-${METADATA_REVISION}', 'snapshot')}"
 
@@ -9122,7 +9710,9 @@ system and gives an overview of their function and contents.
       default, this directory is based on the :term:`DISTRO`
       variable and is set in the
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class as
-      follows::
+      follows:
+
+      .. code-block:: bitbake
 
          SDKEXTPATH ??= "~/${@d.getVar('DISTRO')}_sdk"
 
@@ -9190,7 +9780,9 @@ system and gives an overview of their function and contents.
       Defines a serial console (TTY) to enable using
       :wikipedia:`getty <Getty_(Unix)>`. Provide a value that specifies the
       baud rate followed by the TTY device name separated by a semicolon.
-      Use spaces to separate multiple devices::
+      Use spaces to separate multiple devices:
+
+      .. code-block:: bitbake
 
          SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
@@ -9205,14 +9797,18 @@ system and gives an overview of their function and contents.
       the ``setup.py`` file is located if it is not at the root of the source
       tree (as specified by :term:`S`). For example, in a recipe where the
       sources are fetched from a Git repository and ``setup.py`` is in a
-      ``python/pythonmodule`` subdirectory, you would have this::
+      ``python/pythonmodule`` subdirectory, you would have this:
+
+      .. code-block:: bitbake
 
          SETUPTOOLS_SETUP_PATH = "${S}/python/pythonmodule"
 
    :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
       A list of recipe dependencies that should not be used to determine
       signatures of tasks from one recipe when they depend on tasks from
-      another recipe. For example::
+      another recipe. For example:
+
+      .. code-block:: bitbake
 
          SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "intone->mplayer2"
 
@@ -9220,7 +9816,9 @@ system and gives an overview of their function and contents.
 
       You can use the special token ``"*"`` on the left-hand side of the
       dependency to match all recipes except the one on the right-hand
-      side. Here is an example::
+      side. Here is an example:
+
+      .. code-block:: bitbake
 
          SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "*->quilt-native"
 
@@ -9251,7 +9849,9 @@ system and gives an overview of their function and contents.
          after the other had been built.
 
    :term:`SIGGEN_LOCKEDSIGS`
-     The list of locked tasks, with the form::
+     The list of locked tasks, with the form:
+
+     .. code-block:: bitbake
 
        SIGGEN_LOCKEDSIGS += "<package>:<task>:<signature>"
 
@@ -9260,7 +9860,9 @@ system and gives an overview of their function and contents.
      rebuilding the ``<task>``. If it does not exist, BitBake will build the
      ``<task>`` and the sstate cache will be used next time.
 
-     Example::
+     Example:
+
+     .. code-block:: bitbake
 
        SIGGEN_LOCKEDSIGS += "bc:do_compile:09772aa4532512baf96d433484f27234d4b7c11dd9cda0d6f56fa1b7ce6f25f0"
 
@@ -9286,7 +9888,9 @@ system and gives an overview of their function and contents.
    :term:`SIGGEN_LOCKEDSIGS_TYPES`
      Allowed overrides for :term:`SIGGEN_LOCKEDSIGS`. This is mainly used
      for architecture specific locks. A common value for
-     :term:`SIGGEN_LOCKEDSIGS_TYPES` is ``${PACKAGE_ARCHS}``::
+     :term:`SIGGEN_LOCKEDSIGS_TYPES` is ``${PACKAGE_ARCHS}``:
+
+     .. code-block:: bitbake
 
        SIGGEN_LOCKEDSIGS_TYPES += "${PACKAGE_ARCHS}"
 
@@ -9312,7 +9916,9 @@ system and gives an overview of their function and contents.
 
       To enable file removal, set the variable to "1" in your
       ``conf/local.conf`` configuration file in your:
-      :term:`Build Directory`::
+      :term:`Build Directory`:
+
+      .. code-block:: bitbake
 
          SKIP_FILEDEPS = "1"
 
@@ -9324,7 +9930,9 @@ system and gives an overview of their function and contents.
 
       To prevent a recipe from being built, use the :term:`SKIP_RECIPE`
       variable in your ``local.conf`` file or distribution configuration.
-      Here is an example which prevents ``myrecipe`` from being built::
+      Here is an example which prevents ``myrecipe`` from being built:
+
+      .. code-block:: bitbake
 
          SKIP_RECIPE[myrecipe] = "Not supported by our organization."
 
@@ -9369,7 +9977,9 @@ system and gives an overview of their function and contents.
       :oe_git:`meta/lib/oe/reproducible.py </openembedded-core/tree/meta/lib/oe/reproducible.py>`.
 
       If a recipe wishes to override the default behavior, it should set its
-      own :term:`SOURCE_DATE_EPOCH` value::
+      own :term:`SOURCE_DATE_EPOCH` value:
+
+      .. code-block:: bitbake
 
           SOURCE_DATE_EPOCH = "1613559011"
 
@@ -9398,7 +10008,9 @@ system and gives an overview of their function and contents.
 
       To use this variable, you must globally inherit the
       :ref:`ref-classes-own-mirrors` class and then provide
-      the URL to your mirrors. Here is the general syntax::
+      the URL to your mirrors. Here is the general syntax:
+
+      .. code-block:: bitbake
 
          INHERIT += "own-mirrors"
          SOURCE_MIRROR_URL = "http://example.com/my_source_mirror"
@@ -9428,7 +10040,9 @@ system and gives an overview of their function and contents.
 
          Another method to configure the username and password is from the URL
          in :term:`SOURCE_MIRROR_URL` directly, with the ``user`` and ``pswd``
-         parameters::
+         parameters:
+
+         .. code-block:: bitbake
 
             SOURCE_MIRROR_URL = "http://example.com/my_source_mirror;user=<user>;pswd=<password>"
 
@@ -9456,18 +10070,24 @@ system and gives an overview of their function and contents.
 
       This variable can be set in two ways:
 
-      -  For the entire recipe::
+      -  For the entire recipe:
+
+         .. code-block:: bitbake
 
             SPDX_CONCLUDED_LICENSE = "MIT & Apache-2.0"
 
-      -  For an individual package produced by the recipe::
+      -  For an individual package produced by the recipe:
+
+         .. code-block:: bitbake
 
             SPDX_CONCLUDED_LICENSE:${PN} = "MIT & Apache-2.0"
 
    :term:`SPDX_CUSTOM_ANNOTATION_VARS`
       This option allows to associate `SPDX annotations
       <https://spdx.github.io/spdx-spec/v2.3/annotations/>`__ to a recipe,
-      using the values of variables in the recipe::
+      using the values of variables in the recipe:
+
+      .. code-block:: bitbake
 
          ANNOTATION1 = "First annotation for recipe"
          ANNOTATION2 = "Second annotation for recipe"
@@ -9533,14 +10153,18 @@ system and gives an overview of their function and contents.
       so the sub-variable names follow directly from
       ``SPDX_IMAGE_SUPPLIER``.
 
-      Example (set in the image recipe or in a :term:`configuration file`)::
+      Example (set in the image recipe or in a :term:`configuration file`):
+
+      .. code-block:: bitbake
 
          SPDX_IMAGE_SUPPLIER = "SPDX_IMAGE_SUPPLIER"
          SPDX_IMAGE_SUPPLIER_name = "Acme Corp"
          SPDX_IMAGE_SUPPLIER_type = "organization"
 
       Alternatively, you can use any other prefix name, which is useful for
-      sharing an agent definition across multiple supplier variables::
+      sharing an agent definition across multiple supplier variables:
+
+      .. code-block:: bitbake
 
          MY_COMPANY_name = "Acme Corp"
          MY_COMPANY_type = "organization"
@@ -9566,7 +10190,9 @@ system and gives an overview of their function and contents.
          Enabling this variable will result in non-reproducible SPDX output,
          because the build invocation identity changes with every run.
 
-      Enable as follows::
+      Enable as follows:
+
+      .. code-block:: bitbake
 
          SPDX_INCLUDE_BITBAKE_PARENT_BUILD = "1"
 
@@ -9586,7 +10212,9 @@ system and gives an overview of their function and contents.
       This enables an external tool to use the SPDX information to disregard
       vulnerabilities that are not compiled in the packages.
 
-      Enable this option as follows::
+      Enable this option as follows:
+
+      .. code-block:: bitbake
 
          SPDX_INCLUDE_COMPILED_SOURCES = "1"
 
@@ -9615,7 +10243,9 @@ system and gives an overview of their function and contents.
          This variable only has effect when using the SPDX 3.0 output
          format (see :ref:`ref-classes-create-spdx`).
 
-      Enable this option as follows::
+      Enable this option as follows:
+
+      .. code-block:: bitbake
 
          SPDX_INCLUDE_KERNEL_CONFIG = "1"
 
@@ -9636,7 +10266,9 @@ system and gives an overview of their function and contents.
          This variable only has effect when using the SPDX 3.0 output
          format (see :ref:`ref-classes-create-spdx`).
 
-      Enable this option as follows::
+      Enable this option as follows:
+
+      .. code-block:: bitbake
 
          SPDX_INCLUDE_PACKAGECONFIG = "1"
 
@@ -9654,7 +10286,9 @@ system and gives an overview of their function and contents.
       ``packages`` subdirectories in ``tmp/deploy/spdx/MACHINE`` are also
       modified to include references to such source file descriptions.
 
-      Enable this option as follows::
+      Enable this option as follows:
+
+      .. code-block:: bitbake
 
          SPDX_INCLUDE_SOURCES = "1"
 
@@ -9697,7 +10331,9 @@ system and gives an overview of their function and contents.
       -  ``SPDX_INVOKED_BY_name``: display name of the invoking agent
       -  ``SPDX_INVOKED_BY_type``: agent type, such as ``software`` for a CI system
 
-      Example (CI pipeline invoking the build)::
+      Example (CI pipeline invoking the build):
+
+      .. code-block:: bitbake
 
          SPDX_INCLUDE_BITBAKE_PARENT_BUILD = "1"
          SPDX_INVOKED_BY = "SPDX_INVOKED_BY"
@@ -9752,7 +10388,9 @@ system and gives an overview of their function and contents.
       -  ``SPDX_ON_BEHALF_OF_name``: display name of the commissioning agent
       -  ``SPDX_ON_BEHALF_OF_type``: agent type, such as ``organization``
 
-      Example (CI system building on behalf of a customer organization)::
+      Example (CI system building on behalf of a customer organization):
+
+      .. code-block:: bitbake
 
          SPDX_INCLUDE_BITBAKE_PARENT_BUILD = "1"
          SPDX_INVOKED_BY = "SPDX_INVOKED_BY"
@@ -9778,7 +10416,9 @@ system and gives an overview of their function and contents.
       Typically set in a distro :term:`configuration file` to apply globally
       to all packages, or in a specific software recipe (or a ``.bbappend``)
       to apply only to packages of that recipe. Recipe-level overrides
-      (``SPDX_PACKAGE_SUPPLIER:pn-<recipe>``) are also supported::
+      (``SPDX_PACKAGE_SUPPLIER:pn-<recipe>``) are also supported:
+
+      .. code-block:: bitbake
 
          SPDX_PACKAGE_SUPPLIER = "SPDX_PACKAGE_SUPPLIER"
          SPDX_PACKAGE_SUPPLIER_name = "Acme Corp"
@@ -9809,7 +10449,9 @@ system and gives an overview of their function and contents.
    :term:`SPDX_PRETTY`
       This option makes the SPDX output more human-readable, using
       identation and newlines, instead of the default output in a
-      single line::
+      single line:
+
+      .. code-block:: bitbake
 
          SPDX_PRETTY = "1"
 
@@ -9938,13 +10580,17 @@ system and gives an overview of their function and contents.
           └── psplash_%.bbappend
 
       And here are the contents of the ``psplash_%.bbappend`` file in
-      this example::
+      this example:
+
+      .. code-block:: bitbake
 
           SPLASH_IMAGES = "file://logo-acme.png;outsuffix=default"
           FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
       You could even add specific configuration options for ``psplash``,
-      for example::
+      for example:
+
+      .. code-block:: bitbake
 
           EXTRA_OECONF += "--disable-startup-msg --enable-img-fullscreen"
 
@@ -10022,7 +10668,9 @@ system and gives an overview of their function and contents.
 
          The :term:`SRCPV` variable used to be defined in the
          ``meta/conf/bitbake.conf`` configuration file in
-         :term:`OpenEmbedded-Core (OE-Core)` as follows::
+         :term:`OpenEmbedded-Core (OE-Core)` as follows:
+
+         .. code-block:: bitbake
 
             SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 
@@ -10052,13 +10700,17 @@ system and gives an overview of their function and contents.
       A list of tasks that are typically not relevant (and therefore skipped)
       when building using the :ref:`ref-classes-externalsrc`
       class. The default value as set in that class file is the set of tasks
-      that are rarely needed when using external source::
+      that are rarely needed when using external source:
+
+      .. code-block:: bitbake
 
          SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
 
       The notable exception is when processing external kernel source as
       defined in the :ref:`ref-classes-kernel-yocto` class file (formatted for
-      aesthetics)::
+      aesthetics):
+
+      .. code-block:: bitbake
 
          SRCTREECOVEREDTASKS += "\
            do_validate_branches \
@@ -10123,7 +10775,9 @@ system and gives an overview of their function and contents.
       you point to can also be from builds on other machines.
 
       The Yocto Project actually shares the cache data objects built by its
-      autobuilder::
+      autobuilder:
+
+      .. code-block:: bitbake
 
          SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
@@ -10183,11 +10837,15 @@ system and gives an overview of their function and contents.
       size and time costs of the artefact are similar to just running the
       tasks. This generally only applies to end artefact output like images.
 
-      The syntax to disable it for one task is::
+      The syntax to disable it for one task is:
+
+      .. code-block:: bitbake
 
          SSTATE_SKIP_CREATION:task-image-complete = "1"
 
-      The syntax to disable it for the whole recipe is::
+      The syntax to disable it for the whole recipe is:
+
+      .. code-block:: bitbake
 
          SSTATE_SKIP_CREATION = "1"
 
@@ -10402,7 +11060,9 @@ system and gives an overview of their function and contents.
       to an actual stamp file is constructed by evaluating this string and
       then appending additional information. Currently, the default
       assignment for :term:`STAMP` as set in the ``meta/conf/bitbake.conf``
-      file is::
+      file is:
+
+      .. code-block:: bitbake
 
          STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
 
@@ -10446,7 +11106,9 @@ system and gives an overview of their function and contents.
    :term:`SYSLINUX_DEFAULT_CONSOLE`
       Specifies the kernel boot default console. If you want to use a
       console other than the default, set this variable in your recipe as
-      follows where "X" is the console number you want to use::
+      follows where "X" is the console number you want to use:
+
+      .. code-block:: bitbake
 
          SYSLINUX_DEFAULT_CONSOLE = "console=ttyX"
 
@@ -10465,7 +11127,9 @@ system and gives an overview of their function and contents.
       Specifies the alternate serial port or turns it off. To turn off
       serial, set this variable to an empty string in your recipe. The
       variable's default value is set in the
-      :ref:`ref-classes-syslinux` class as follows::
+      :ref:`ref-classes-syslinux` class as follows:
+
+      .. code-block:: bitbake
 
          SYSLINUX_SERIAL ?= "0 115200"
 
@@ -10474,7 +11138,9 @@ system and gives an overview of their function and contents.
    :term:`SYSLINUX_SERIAL_TTY`
       Specifies the alternate console=tty... kernel boot argument. The
       variable's default value is set in the :ref:`ref-classes-syslinux`
-      class as follows::
+      class as follows:
+
+      .. code-block:: bitbake
 
          SYSLINUX_SERIAL_TTY ?= "console=ttyS0,115200"
 
@@ -10497,7 +11163,9 @@ system and gives an overview of their function and contents.
    :term:`SYSROOT_DIRS`
       Directories that are staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task. By
-      default, the following directories are staged::
+      default, the following directories are staged:
+
+      .. code-block:: bitbake
 
          SYSROOT_DIRS = " \
              ${includedir} \
@@ -10526,14 +11194,18 @@ system and gives an overview of their function and contents.
       ``A``'s :term:`RECIPE_SYSROOT`, which is "``${WORKDIR}/recipe-sysroot``". So,
       the linking process will fail.
 
-      To fix this, you need to add ``/opt/lib`` to :term:`SYSROOT_DIRS`::
+      To fix this, you need to add ``/opt/lib`` to :term:`SYSROOT_DIRS`:
+
+      .. code-block:: bitbake
 
          SYSROOT_DIRS:append = " /opt/lib"
 
       .. note::
          Even after setting ``/opt/lib`` to :term:`SYSROOT_DIRS`, the linking process will still fail
          because the linker does not know that location, since :term:`TARGET_LDFLAGS`
-         doesn't contain it (if your recipe is for the target). Therefore, so you should add::
+         doesn't contain it (if your recipe is for the target). Therefore, so you should add:
+
+         .. code-block:: bitbake
 
             TARGET_LDFLAGS:append = " -L${RECIPE_SYSROOT}/opt/lib"
 
@@ -10542,7 +11214,9 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-populate_sysroot` task. You
       can use this variable to exclude certain subdirectories of
       directories listed in :term:`SYSROOT_DIRS` from
-      staging. By default, the following directories are not staged::
+      staging. By default, the following directories are not staged:
+
+      .. code-block:: bitbake
 
          SYSROOT_DIRS_IGNORE = " \
              ${mandir} \
@@ -10565,7 +11239,9 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-populate_sysroot` task for
       ``-native`` recipes, in addition to those specified in
       :term:`SYSROOT_DIRS`. By default, the following
-      extra directories are staged::
+      extra directories are staged:
+
+      .. code-block:: bitbake
 
          SYSROOT_DIRS_NATIVE = " \
              ${bindir} \
@@ -10594,7 +11270,9 @@ system and gives an overview of their function and contents.
       :term:`SYSTEMD_SERVICE` should start
       automatically or not. By default, the service is enabled to
       automatically start at boot time. The default setting is in the
-      :ref:`ref-classes-systemd` class as follows::
+      :ref:`ref-classes-systemd` class as follows:
+
+      .. code-block:: bitbake
 
          SYSTEMD_AUTO_ENABLE ??= "enable"
 
@@ -10605,7 +11283,9 @@ system and gives an overview of their function and contents.
       "systemd-boot", the :term:`SYSTEMD_BOOT_CFG` variable specifies the
       configuration file that should be used. By default, the
       :ref:`ref-classes-systemd-boot` class sets the
-      :term:`SYSTEMD_BOOT_CFG` as follows::
+      :term:`SYSTEMD_BOOT_CFG` as follows:
+
+      .. code-block:: bitbake
 
          SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
 
@@ -10617,7 +11297,9 @@ system and gives an overview of their function and contents.
       "systemd-boot", the :term:`SYSTEMD_BOOT_ENTRIES` variable specifies a
       list of entry files (``*.conf``) to install that contain one boot
       entry per file. By default, the :ref:`ref-classes-systemd-boot` class
-      sets the :term:`SYSTEMD_BOOT_ENTRIES` as follows::
+      sets the :term:`SYSTEMD_BOOT_ENTRIES` as follows:
+
+      .. code-block:: bitbake
 
           SYSTEMD_BOOT_ENTRIES ?= ""
 
@@ -10629,7 +11311,9 @@ system and gives an overview of their function and contents.
       "systemd-boot", the :term:`SYSTEMD_BOOT_TIMEOUT` variable specifies the
       boot menu timeout in seconds. By default, the
       :ref:`ref-classes-systemd-boot` class sets the
-      :term:`SYSTEMD_BOOT_TIMEOUT` as follows::
+      :term:`SYSTEMD_BOOT_TIMEOUT` as follows:
+
+      .. code-block:: bitbake
 
          SYSTEMD_BOOT_TIMEOUT ?= "10"
 
@@ -10649,7 +11333,9 @@ system and gives an overview of their function and contents.
 
       For example, this variable is used in the :oe_git:`core-image-minimal-xfce.bb
       </meta-openembedded/tree/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb>`
-      recipe::
+      recipe:
+
+      .. code-block:: bitbake
 
           SYSTEMD_DEFAULT_TARGET = "graphical.target"
 
@@ -10658,7 +11344,9 @@ system and gives an overview of their function and contents.
       this variable locates the systemd unit files when they are not found
       in the main recipe's package. By default, the :term:`SYSTEMD_PACKAGES`
       variable is set such that the systemd unit files are assumed to
-      reside in the recipes main package::
+      reside in the recipes main package:
+
+      .. code-block:: bitbake
 
          SYSTEMD_PACKAGES ?= "${PN}"
 
@@ -10674,7 +11362,9 @@ system and gives an overview of their function and contents.
 
       When you specify this file in your recipe, use a package name
       override to indicate the package to which the value applies. Here is
-      an example from the connman recipe::
+      an example from the connman recipe:
+
+      .. code-block:: bitbake
 
          SYSTEMD_SERVICE:${PN} = "connman.service"
 
@@ -10694,7 +11384,9 @@ system and gives an overview of their function and contents.
    :term:`T`
       This variable points to a directory were BitBake places temporary
       files, which consist mostly of task logs and scripts, when building a
-      particular recipe. The variable is typically set as follows::
+      particular recipe. The variable is typically set as follows:
+
+      .. code-block:: bitbake
 
          T = "${WORKDIR}/temp"
 
@@ -10728,7 +11420,9 @@ system and gives an overview of their function and contents.
       Specifies architecture-specific assembler flags for the target
       system. :term:`TARGET_AS_ARCH` is initialized from
       :term:`TUNE_ASARGS` by default in the BitBake
-      configuration file (``meta/conf/bitbake.conf``)::
+      configuration file (``meta/conf/bitbake.conf``):
+
+      .. code-block:: bitbake
 
          TARGET_AS_ARCH = "${TUNE_ASARGS}"
 
@@ -10799,7 +11493,9 @@ system and gives an overview of their function and contents.
       Specifies architecture-specific linker flags for the target system.
       :term:`TARGET_LD_ARCH` is initialized from
       :term:`TUNE_LDARGS` by default in the BitBake
-      configuration file (``meta/conf/bitbake.conf``)::
+      configuration file (``meta/conf/bitbake.conf``):
+
+      .. code-block:: bitbake
 
          TARGET_LD_ARCH = "${TUNE_LDARGS}"
 
@@ -10988,7 +11684,9 @@ system and gives an overview of their function and contents.
       program does.
 
       For example, to use the Picocom terminal program on serial device
-      ``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows::
+      ``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows:
+
+      .. code-block:: bitbake
 
          TEST_SERIALCONTROL_CMD = "picocom /dev/ttyUSB0 -b 115200"
 
@@ -11037,13 +11735,17 @@ system and gives an overview of their function and contents.
 
       Tests include ``ping``, ``ssh``, ``df`` among others. You can add
       your own tests to the list of tests by appending :term:`TEST_SUITES` as
-      follows::
+      follows:
+
+      .. code-block:: bitbake
 
          TEST_SUITES:append = " mytest"
 
       Alternatively, you can
       provide the "auto" option to have all applicable tests run against
-      the image::
+      the image:
+
+      .. code-block:: bitbake
 
          TEST_SUITES:append = " auto"
 
@@ -11055,7 +11757,9 @@ system and gives an overview of their function and contents.
       another test must appear later in the list than the test on which
       they depend. For example, if you append the list of tests with two
       tests (``test_A`` and ``test_B``) where ``test_B`` is dependent on
-      ``test_A``, then you must order the tests as follows::
+      ``test_A``, then you must order the tests as follows:
+
+      .. code-block:: bitbake
 
          TEST_SUITES = "test_A test_B"
 
@@ -11065,7 +11769,9 @@ system and gives an overview of their function and contents.
 
    :term:`TEST_TARGET`
       Specifies the target controller to use when running tests against a
-      test image. The default controller to use is "qemu"::
+      test image. The default controller to use is "qemu":
+
+      .. code-block:: bitbake
 
          TEST_TARGET = "qemu"
 
@@ -11104,7 +11810,9 @@ system and gives an overview of their function and contents.
       set to "qemu".
 
       When you specify the IP address, you can also include a port. Here is
-      an example::
+      an example:
+
+      .. code-block:: bitbake
 
          TEST_TARGET_IP = "192.168.1.4:2201"
 
@@ -11164,7 +11872,9 @@ system and gives an overview of their function and contents.
 
       If you want to establish this directory in a location other than the
       default, you can set it to another value in your
-      :ref:`structure-build-conf-site.conf` configuration file::
+      :ref:`structure-build-conf-site.conf` configuration file:
+
+      .. code-block:: bitbake
 
          TMPDIR = "/another/location"
 
@@ -11240,7 +11950,9 @@ system and gives an overview of their function and contents.
    :term:`TOOLCHAIN_OPTIONS`
       This variable holds extra options passed to the compiler and the linker
       for non ``-native`` recipes as they have to point to their custom
-      ``sysroot`` folder pointed to by :term:`RECIPE_SYSROOT`::
+      ``sysroot`` folder pointed to by :term:`RECIPE_SYSROOT`:
+
+      .. code-block:: bitbake
 
          TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
 
@@ -11250,7 +11962,9 @@ system and gives an overview of their function and contents.
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets
-      the :term:`TOOLCHAIN_OUTPUTNAME` variable as follows::
+      the :term:`TOOLCHAIN_OUTPUTNAME` variable as follows:
+
+      .. code-block:: bitbake
 
          TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
@@ -11304,7 +12018,9 @@ system and gives an overview of their function and contents.
       :term:`TUNE_ARCH` is tied closely to
       :term:`TARGET_ARCH`, which defines the target
       machine's architecture. The BitBake configuration file
-      (``meta/conf/bitbake.conf``) sets :term:`TARGET_ARCH` as follows::
+      (``meta/conf/bitbake.conf``) sets :term:`TARGET_ARCH` as follows:
+
+      .. code-block:: bitbake
 
          TARGET_ARCH = "${TUNE_ARCH}"
 
@@ -11326,7 +12042,9 @@ system and gives an overview of their function and contents.
       typically under ``meta/conf/machine/include/`` and are influenced
       through :term:`TUNE_FEATURES`. For example, the
       ``meta/conf/machine/include/x86/arch-x86.inc`` file defines the flags
-      for the x86 architecture as follows::
+      for the x86 architecture as follows:
+
+      .. code-block:: bitbake
 
          TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
 
@@ -11372,7 +12090,9 @@ system and gives an overview of their function and contents.
       typically under ``meta/conf/machine/include/`` and are influenced
       through :term:`TUNE_FEATURES`. For example, the
       ``meta/conf/machine/include/x86/arch-x86.inc`` file defines the flags
-      for the x86 architecture as follows::
+      for the x86 architecture as follows:
+
+      .. code-block:: bitbake
 
          TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
 
@@ -11385,13 +12105,17 @@ system and gives an overview of their function and contents.
    :term:`TUNE_PKGARCH`
       The package architecture understood by the packaging system to define
       the architecture, ABI, and tuning of output packages. The specific
-      tune is defined using the "_tune" override as follows::
+      tune is defined using the "_tune" override as follows:
+
+      .. code-block:: bitbake
 
          TUNE_PKGARCH:tune-tune = "tune"
 
       These tune-specific package architectures are defined in the machine
       include files. Here is an example of the "core2-32" tuning as used in
-      the ``meta/conf/machine/include/x86/tune-core2.inc`` file::
+      the ``meta/conf/machine/include/x86/tune-core2.inc`` file:
+
+      .. code-block:: bitbake
 
          TUNE_PKGARCH:tune-core2-32 = "core2-32"
 
@@ -11403,7 +12127,9 @@ system and gives an overview of their function and contents.
       :term:`OpenEmbedded-Core (OE-Core)`. Here is an example from
       the ``meta/conf/machine/include/mips/arch-mips.inc`` include file
       that lists the "o32" and "n64" features as conflicting with the "n32"
-      feature::
+      feature:
+
+      .. code-block:: bitbake
 
          TUNECONFLICTS[n32] = "o32 n64"
 
@@ -11412,7 +12138,9 @@ system and gives an overview of their function and contents.
       feature. The specified feature is stored as a flag. Valid features
       are specified in the machine include files (e.g.
       ``meta/conf/machine/include/arm/arch-arm.inc``). Here is an example
-      from that file::
+      from that file:
+
+      .. code-block:: bitbake
 
          TUNEVALID[bigendian] = "Enable big-endian mode."
 
@@ -11429,7 +12157,9 @@ system and gives an overview of their function and contents.
       :term:`UBOOT_CONFIG_FRAGMENTS`, :term:`UBOOT_CONFIG_IMAGE_FSTYPES`, and
       :term:`UBOOT_CONFIG_MAKE_OPTS`. 
 
-      Here is an updated example from the ``meta-freescale`` layer. ::
+      Here is an updated example from the ``meta-freescale`` layer.
+
+      .. code-block:: bitbake
 
          UBOOT_CONFIG ??= "sdcard-ifc-secure-boot sdcard-ifc sdcard-qspi lpuart qspi secure-boot nor"
 
@@ -11455,7 +12185,9 @@ system and gives an overview of their function and contents.
 
    :term:`UBOOT_CONFIG_BINARY`
       This variable cannot be set to a value in a config, it is a placeholder
-      for configuring the :term:`UBOOT_CONFIG` flow via flags::
+      for configuring the :term:`UBOOT_CONFIG` flow via flags:
+
+      .. code-block:: bitbake
 
          UBOOT_CONFIG_BINARY[foo] = "binary1"
          UBOOT_CONFIG_BINARY[bar] = "binary2"
@@ -11478,7 +12210,9 @@ system and gives an overview of their function and contents.
 
    :term:`UBOOT_CONFIG_FRAGMENTS`
       This variable cannot be set to a value in a config, it is a placeholder
-      for configuring the :term:`UBOOT_CONFIG` flow via flags::
+      for configuring the :term:`UBOOT_CONFIG` flow via flags:
+
+      .. code-block:: bitbake
 
          UBOOT_CONFIG_FRAGMENTS[foo] = "frag1 frag2"
          UBOOT_CONFIG_FRAGMENTS[bar] = "frag3"
@@ -11496,7 +12230,9 @@ system and gives an overview of their function and contents.
 
    :term:`UBOOT_CONFIG_IMAGE_FSTYPES`
       This variable cannot be set to a value in a config, it is a placeholder
-      for configuring the :term:`UBOOT_CONFIG` flow via flags::
+      for configuring the :term:`UBOOT_CONFIG` flow via flags:
+
+      .. code-block:: bitbake
 
          UBOOT_CONFIG_IMAGE_FSTYPES[foo] = "fstype1"
          UBOOT_CONFIG_IMAGE_FSTYPES[bar] = "fstype2"
@@ -11513,7 +12249,9 @@ system and gives an overview of their function and contents.
 
    :term:`UBOOT_CONFIG_MAKE_OPTS`
       This variable cannot be set to a value in a config, it is a placeholder
-      for configuring the :term:`UBOOT_CONFIG` flow via flags::
+      for configuring the :term:`UBOOT_CONFIG` flow via flags:
+
+      .. code-block:: bitbake
 
          UBOOT_CONFIG_MAKE_OPTS[foo] = "OPT1=foo OPT2=2"
          UBOOT_CONFIG_MAKE_OPTS[bar] = "OPT1=bar"
@@ -11568,13 +12306,17 @@ system and gives an overview of their function and contents.
 
       Some examples:
 
-      -  Adding a script ``boot.cmd`` as a uImage to ``/boot``::
+      -  Adding a script ``boot.cmd`` as a uImage to ``/boot``:
+
+         .. code-block:: bitbake
 
             UBOOT_ENV = "boot"
             UBOOT_ENV_SUFFIX = "scr"
             SRC_URI += "file://${UBOOT_ENV_SRC}"
 
-      -  Adding a script ``uEnv.txt`` as a plain text file to ``/boot``::
+      -  Adding a script ``uEnv.txt`` as a plain text file to ``/boot``:
+
+         .. code-block:: bitbake
 
             UBOOT_ENV = "uEnv"
             UBOOT_ENV_SUFFIX = "txt"
@@ -11603,7 +12345,9 @@ system and gives an overview of their function and contents.
       set this value to "2", as two 32 bit values (cells) will be needed
       to represent such addresses.
 
-      Here is an example setting "0x400000000" as a load address::
+      Here is an example setting "0x400000000" as a load address:
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_ADDRESS_CELLS = "2"
          UBOOT_LOADADDRESS = "0x04 0x00000000"
@@ -11617,19 +12361,25 @@ system and gives an overview of their function and contents.
       Secure Monitor. This variable enables the generation of a U-Boot FIT
       image with a Trusted Firmware-A (TF-A) binary.
 
-      Its default value is "0", so set it to "1" to enable this functionality::
+      Its default value is "0", so set it to "1" to enable this functionality:
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_ARM_TRUSTED_FIRMWARE = "1"
 
    :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE`
       Specifies the path to the Trusted Firmware-A (TF-A) binary. Its default
-      value is "bl31.bin"::
+      value is "bl31.bin":
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?= "bl31.bin"
 
       If a relative path is provided, the file is expected to be relative to
       U-Boot's :term:`B` directory. An absolute path can be provided too,
-      e.g.::
+      e.g.:
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?= "${DEPLOY_DIR_IMAGE}/bl31.bin"
 
@@ -11637,7 +12387,9 @@ system and gives an overview of their function and contents.
       you must add the necessary dependency in a U-Boot ``.bbappend`` file. The
       recipe name for Trusted Firmware-A (TF-A) binary is
       ``trusted-firmware-a``, which comes from the
-      :yocto_git:`meta-arm </meta-arm>` layer::
+      :yocto_git:`meta-arm </meta-arm>` layer:
+
+      .. code-block:: bitbake
 
          do_compile[depends] += "trusted-firmware-a:do_deploy"
 
@@ -11648,7 +12400,9 @@ system and gives an overview of their function and contents.
    :term:`UBOOT_FIT_CONF_FIRMWARE`
       Adds one image to the ``firmware`` property of the configuration node of
       the U-Boot Image Tree Source (ITS). Sets the ``firmware`` property to
-      select the image to boot first::
+      select the image to boot first:
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_CONF_FIRMWARE = "fwa"
 
@@ -11658,13 +12412,17 @@ system and gives an overview of their function and contents.
       Adds one or more user-defined images to the ``loadables`` property of the
       configuration node of the U-Boot Image Tree Source (ITS). This variable
       is handled by the local shell in the recipe so appropriate escaping
-      should be done, e.g. escaping quotes.::
+      should be done, e.g. escaping quotes.:
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_CONF_USER_LOADABLES = '\"fwa\", \"fwb\"'
 
    :term:`UBOOT_FIT_DESC`
       Specifies the description string encoded into a U-Boot fitImage. The default
-      value is set by the :ref:`ref-classes-uboot-sign` class as follows::
+      value is set by the :ref:`ref-classes-uboot-sign` class as follows:
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 
@@ -11673,7 +12431,9 @@ system and gives an overview of their function and contents.
       they don't already exist. The keys are created in :term:`SPL_SIGN_KEYDIR`.
       The default value is "0".
 
-      Enable this as follows::
+      Enable this as follows:
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_GENERATE_KEYS = "1"
 
@@ -11716,19 +12476,25 @@ system and gives an overview of their function and contents.
       the surrounding system. This variable enables the generation of a U-Boot
       FIT image with a Trusted Execution Environment (TEE) binary.
 
-      Its default value is "0", so set it to "1" to enable this functionality::
+      Its default value is "0", so set it to "1" to enable this functionality:
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_TEE = "1"
 
    :term:`UBOOT_FIT_TEE_IMAGE`
       Specifies the path to the Trusted Execution Environment (TEE) binary. Its
-      default value is "tee-raw.bin"::
+      default value is "tee-raw.bin":
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_TEE_IMAGE ?= "tee-raw.bin"
 
       If a relative path is provided, the file is expected to be relative to
       U-Boot's :term:`B` directory. An absolute path can be provided too,
-      e.g.::
+      e.g.:
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_TEE_IMAGE ?= "${DEPLOY_DIR_IMAGE}/tee-raw.bin"
 
@@ -11736,7 +12502,9 @@ system and gives an overview of their function and contents.
       recipe, you must add the necessary dependency in a U-Boot ``.bbappend``
       file. The recipe name for Trusted Execution Environment (TEE) binary is
       ``optee-os``, which comes from the :yocto_git:`meta-arm </meta-arm>`
-      layer::
+      layer:
+
+      .. code-block:: bitbake
 
          do_compile[depends] += "optee-os:do_deploy"
 
@@ -11764,7 +12532,9 @@ system and gives an overview of their function and contents.
              };
          };
 
-      Users can include their custom ITS snippet in this variable, e.g.::
+      Users can include their custom ITS snippet in this variable, e.g.:
+
+      .. code-block:: bitbake
 
          UBOOT_FIT_FWA_ITS = '\
              fwa {\n\
@@ -11817,7 +12587,9 @@ system and gives an overview of their function and contents.
       This variable allows to generate a FIT image for U-Boot, which is one
       of the ways to implement a verified boot process.
 
-      Its default value is "0", so set it to "1" to enable this functionality::
+      Its default value is "0", so set it to "1" to enable this functionality:
+
+      .. code-block:: bitbake
 
          UBOOT_FITIMAGE_ENABLE = "1"
 
@@ -11829,7 +12601,9 @@ system and gives an overview of their function and contents.
       These fragments are located in same ``${S}/configs/`` directory as the
       defconfig.
 
-      For example::
+      For example:
+
+      .. code-block:: bitbake
 
           UBOOT_MACHINE = "am62x_evm_r5_defconfig"
           UBOOT_FRAGMENTS = "am62x_r5_usbdfu.config"
@@ -11840,7 +12614,9 @@ system and gives an overview of their function and contents.
       This variable enables the generation of the U-Boot initial environment in
       binary format.
 
-      Its default value is "0", set it to "1" to enable this functionality::
+      Its default value is "0", set it to "1" to enable this functionality:
+
+      .. code-block:: bitbake
 
          UBOOT_INITIAL_ENV_BINARY = "1"
 
@@ -11864,7 +12640,9 @@ system and gives an overview of their function and contents.
       this variable should be set to properly generate the redundant environment
       in the output U-boot environment binary file.
 
-      Its default value is "0", set it to "1" to enable this functionality::
+      Its default value is "0", set it to "1" to enable this functionality:
+
+      .. code-block:: bitbake
 
          UBOOT_INITIAL_ENV_BINARY_REDUND = "1"
 
@@ -11876,7 +12654,9 @@ system and gives an overview of their function and contents.
    :term:`UBOOT_INITIAL_ENV_BINARY_SIZE`
       This variable sets the binary size (in bytes) of the U-Boot initial
       environment. Both hexadecimal and decimal values are supported and can be
-      set as follows::
+      set as follows:
+
+      .. code-block:: bitbake
 
          UBOOT_INITIAL_ENV_BINARY_SIZE = "0x4000"
 
@@ -11901,7 +12681,9 @@ system and gives an overview of their function and contents.
       Appends a string to the name of the local version of the U-Boot
       image. For example, assuming the version of the U-Boot image built
       was "2013.10", the full version string reported by U-Boot would be
-      "2013.10-yocto" given the following statement::
+      "2013.10-yocto" given the following statement:
+
+      .. code-block:: bitbake
 
          UBOOT_LOCALVERSION = "-yocto"
 
@@ -12068,7 +12850,9 @@ system and gives an overview of their function and contents.
       :term:`UNINATIVE_CHECKSUM` variable flags contain the checksums of the
       uninative tarball as specified by the :term:`UNINATIVE_URL` variable.
       There should be one checksum per tarballs published at
-      :term:`UNINATIVE_URL`, which match architectures. For example::
+      :term:`UNINATIVE_URL`, which match architectures. For example:
+
+      .. code-block:: bitbake
 
          UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
          UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
@@ -12117,7 +12901,9 @@ system and gives an overview of their function and contents.
       releases are not identified by Git tags, set :term:`UPSTREAM_CHECK_COMMITS`
       to ``1`` in the recipe, and the OpenEmbedded build system
       will compare the latest commit with the one currently specified
-      by the recipe (:term:`SRCREV`)::
+      by the recipe (:term:`SRCREV`):
+
+      .. code-block:: bitbake
 
          UPSTREAM_CHECK_COMMITS = "1"
 
@@ -12130,7 +12916,9 @@ system and gives an overview of their function and contents.
 
       You can use the :term:`UPSTREAM_CHECK_GITTAGREGEX` variable to provide a
       regular expression to filter only the relevant tags should the
-      default filter not work correctly::
+      default filter not work correctly:
+
+      .. code-block:: bitbake
 
          UPSTREAM_CHECK_GITTAGREGEX = "git_tag_regex"
 
@@ -12138,7 +12926,9 @@ system and gives an overview of their function and contents.
       Use the :term:`UPSTREAM_CHECK_REGEX` variable to specify a different
       regular expression instead of the default one when the package
       checking system is parsing the page found using
-      :term:`UPSTREAM_CHECK_URI`::
+      :term:`UPSTREAM_CHECK_URI`:
+
+      .. code-block:: bitbake
 
          UPSTREAM_CHECK_REGEX = "package_regex"
 
@@ -12149,7 +12939,9 @@ system and gives an overview of their function and contents.
       determined by fetching the directory listing where the tarball is and
       attempting to find a later tarball. When this approach does not work,
       you can use :term:`UPSTREAM_CHECK_URI` to provide a different URI that
-      contains the link to the latest tarball::
+      contains the link to the latest tarball:
+
+      .. code-block:: bitbake
 
          UPSTREAM_CHECK_URI = "recipe_url"
 
@@ -12179,7 +12971,9 @@ system and gives an overview of their function and contents.
       :term:`UPSTREAM_CHECK_GITTAGREGEX` and :term:`UPSTREAM_CHECK_COMMITS` variables in
       the recipe allows to determine what the latest upstream version is,
       you can set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1`` in the recipe
-      to acknowledge that the check cannot be performed::
+      to acknowledge that the check cannot be performed:
+
+      .. code-block:: bitbake
 
          UPSTREAM_VERSION_UNKNOWN = "1"
 
@@ -12225,7 +13019,9 @@ system and gives an overview of their function and contents.
       Classes inherited using :term:`USER_CLASSES` must be located in the
       ``classes-global/`` or ``classes/`` subdirectories.
 
-      The default list is set in your ``local.conf`` file::
+      The default list is set in your ``local.conf`` file:
+
+      .. code-block:: bitbake
 
          USER_CLASSES ?= "buildstats"
 
@@ -12252,7 +13048,9 @@ system and gives an overview of their function and contents.
       :term:`USERADD_ERROR_DYNAMIC` variable is by default not set. If you plan
       on using statically assigned ``gid`` and ``uid`` values, you should
       set the :term:`USERADD_ERROR_DYNAMIC` variable in your ``local.conf``
-      file as follows::
+      file as follows:
+
+      .. code-block:: bitbake
 
          USERADD_ERROR_DYNAMIC = "error"
 
@@ -12282,8 +13080,9 @@ system and gives an overview of their function and contents.
       When applying static group identification (``gid``) values, the
       OpenEmbedded build system looks in :term:`BBPATH` for a
       ``files/group`` file and then applies those ``uid`` values. Set the
-      variable as follows in your ``local.conf`` file::
+      variable as follows in your ``local.conf`` file:
 
+      .. code-block:: bitbake
 
          USERADD_GID_TABLES = "files/group"
 
@@ -12299,7 +13098,9 @@ system and gives an overview of their function and contents.
 
       You must set this variable if the recipe inherits the class. For
       example, the following enables adding a user for the main package in
-      a recipe::
+      a recipe:
+
+      .. code-block:: bitbake
 
          USERADD_PACKAGES = "${PN}"
 
@@ -12315,7 +13116,9 @@ system and gives an overview of their function and contents.
       the ``useradd`` command if you add a user to the system when the
       package is installed.
 
-      Here is an example from the ``dbus`` recipe::
+      Here is an example from the ``dbus`` recipe:
+
+      .. code-block:: bitbake
 
          USERADD_PARAM:${PN} = "--system --home ${localstatedir}/lib/dbus \
                                 --no-create-home --shell /bin/false \
@@ -12333,7 +13136,9 @@ system and gives an overview of their function and contents.
       When applying static user identification (``uid``) values, the
       OpenEmbedded build system looks in :term:`BBPATH` for a
       ``files/passwd`` file and then applies those ``uid`` values. Set the
-      variable as follows in your ``local.conf`` file::
+      variable as follows in your ``local.conf`` file:
+
+      .. code-block:: bitbake
 
          USERADD_UID_TABLES = "files/passwd"
 
@@ -12368,7 +13173,9 @@ system and gives an overview of their function and contents.
       When a recipe inherits the :ref:`ref-classes-useradd` class, this variable
       specifies for a package what parameters should be passed to the ``usermod``
       command if you wish to modify a user when the package is installed.
-      Is is typically used to add the user to one or more groups. For example::
+      Is is typically used to add the user to one or more groups. For example:
+
+      .. code-block:: bitbake
 
          USERMOD_PARAM:${PN} = "--append --groups group1,group2 user"
 
@@ -12378,24 +13185,32 @@ system and gives an overview of their function and contents.
       or in image definitions.
 
       An example is ``VIRTUAL-RUNTIME_base-utils`` that makes it possible
-      to either use BusyBox based utilities::
+      to either use BusyBox based utilities:
+
+      .. code-block:: bitbake
 
          VIRTUAL-RUNTIME_base-utils = "busybox"
 
       or their full featured implementations from GNU Coreutils
-      and other projects::
+      and other projects:
+
+      .. code-block:: bitbake
 
          VIRTUAL-RUNTIME_base-utils = "packagegroup-core-base-utils"
 
       Here are two examples using this virtual runtime package. The
       first one is in :oe_git:`initramfs-framework_1.0.bb
-      </openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb>`::
+      </openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb>`:
+
+      .. code-block:: bitbake
 
          RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
       The second example is in the :oe_git:`core-image-initramfs-boot
       </openembedded-core/tree/meta/recipes-core/images/core-image-initramfs-boot.bb>`
-      image definition::
+      image definition:
+
+      .. code-block:: bitbake
 
          PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} base-passwd"
 
@@ -12485,7 +13300,9 @@ system and gives an overview of their function and contents.
       With the :term:`WKS_FILE_DEPENDS` variable, you have the possibility to
       specify a list of additional dependencies (e.g. native tools,
       bootloaders, and so forth), that are required to build Wic images.
-      Here is an example::
+      Here is an example:
+
+      .. code-block:: bitbake
 
          WKS_FILE_DEPENDS = "some-native-tool"
 

