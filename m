Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E59C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 15:05:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.54804.1743433497636831524
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 08:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BmK3yNG6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26906444FB;
	Mon, 31 Mar 2025 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743433496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+zacmciXQTxcxNh833LTt9/Hy3tcSZA+WEhTU5+wBIE=;
	b=BmK3yNG6187Z1GQsX5tQTYnwLusbchrm/gfAyPlyY53oPGPh4cP7gcQS0obv/PPPlJKKEw
	wZv0vKtm7/86X2ENHnXBhxYhQWZP9jf/7PgQZYkscZnciGJdtABXmdW0BJxiHQRg4tXEry
	jZxbrezsxOeeLgXDHalpxrzrTCh9qFA63xWmEBzM3EU4sFXnNQAGpb83+Av2WDH/VODArn
	UXVI34k36pvakZsQjo4mFivdZXjrpFr2X5rWrJcuioVcR9sc2z5FxFZkpnEkkUm1UW+J6z
	GjoZMBB2DQLnjzPUWNf3ED6zPivowfZxJJ5Ez4zsKFmgu0gk48SRV7yThjjGRA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 31 Mar 2025 17:04:47 +0200
Subject: [PATCH v4 3/6] ref-manual/variables.rst: add missing documentation
 for BUILD_* variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-cc-vars-v4-3-2281f4c47652@bootlin.com>
References: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
In-Reply-To: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16894;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JH3zrxKVHUBuNoa0eP5MI0286xWMwzOXubLcI9huWvQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn6q8WrH1nPLLEpaTRjaCdH/SjrSZHolbBUL99k
 9ZGHOaLJvGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+qvFgAKCRDRgEFAKaOo
 NmhcD/9fUf3GmNrCqtXgndjAVd7Qfre48/FvpoRrl4i2E10jaDWx8ydaF+xh5xny7wps08KP0px
 GQrep0+4DgZ4DqPzOdlLaZiMxGcxopVm9WJFrV3TMpJKDexZSHDJRv/fdF0EOrgMDtyJZxAkERd
 XuIOPyfOPtocyS6gox8UY7VVf6F3RGWx03q3jF1yA1oYCKQr6K1DNa8tNIvPoTATME4KwSLBkL3
 wkt1q6rFQe2VCUwwXklhuSdrZgyOCtoa0JayhhmbWhpVbzkSv0UISocTQCRp9zr58SIKP9wPY8b
 tOTuewP3SFKsNOdnyoiilCyqbrmF311Baj3FNHfk+gnMT+0JcVo1LEFgBzwZ1oD8heqgnda/vqL
 Tw+jYl4JdLyX/M1VjR6IIiyVaIGLG4ZxHNBw+FBD50XPLhoiknjC48PckF6ctddfshPeT4C/QAd
 uLfGFHD5T6jUHKdtymyPdWrZwDFb7QfmbFYrL6FCDGxlOh65tqx0jC0F5AJMWEbfNzq4Yow/IRM
 ysbuIeYPVVdii200N/YIfsXV4tnW3IBjK3b9NMjV8XD6qFUta7Ejaw20Zyi1MbnBv6b7wh7vUBC
 FoD0yW8oJcbIYIDBfrhoaK0wt8oRTZ0Wd53xFkqc8afKVyp/dXhIMjXj4eD39XcAGyuLcuJMlug
 yMYYBmA/1A4kptw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhv
 ghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Mar 2025 15:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6689

These toolchain variables are used in a native context. Some of the
BUILD_* variables missed documentation. Also, some of the base commands
were also not there so document them.

Some of existing BUILD_* variable documentation were missing the note
about their usage in a native context, so add it too so that all BUILD_*
variables are documented the same way.

[YOCTO #15719]

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 250 ++++++++++++++++++++++++++++++---
 1 file changed, 230 insertions(+), 20 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8ff051327..526297b15 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -995,55 +995,165 @@ system and gives an overview of their function and contents.
       variable is a useful pointer in case a bug in the software being
       built needs to be manually reported.
 
+   :term:`BUILD_AR`
+      Specifies the architecture-specific :manpage:`archiver <ar(1)>` for the
+      build host, and its default definition is derived in part from
+      :term:`BUILD_PREFIX`::
+
+         BUILD_AR = "${BUILD_PREFIX}ar"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`AR` is set to the
+      value of this variable by default.
+
+      The :term:`BUILD_AR` variable should not be set manually, and is rarely
+      used in recipes as :term:`AR` contains the appropriate value depending on
+      the context (native or target recipes). Exception be made for target
+      recipes that need to use the :manpage:`archiver <ar(1)>` from the build
+      host at some point during the build.
+
    :term:`BUILD_ARCH`
       Specifies the architecture of the build host (e.g. ``i686``). The
       OpenEmbedded build system sets the value of :term:`BUILD_ARCH` from the
       machine name reported by the ``uname`` command.
 
+   :term:`BUILD_AS`
+      Specifies the architecture-specific :manpage:`assembler <as(1)>` for the
+      build host, and its default definition is derived in part from
+      :term:`BUILD_PREFIX`::
+
+         BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`AS` is set to the
+      value of this variable by default.
+
+      The :term:`BUILD_AS` variable should not be set manually, and is rarely
+      used in recipes as :term:`AS` contains the appropriate value depending on
+      the context (native or target recipes). Exception be made for target
+      recipes that need to use the :manpage:`assembler <as(1)>` from the build
+      host at some point during the build.
+
    :term:`BUILD_AS_ARCH`
       Specifies the architecture-specific assembler flags for the build
       host. By default, the value of :term:`BUILD_AS_ARCH` is empty.
 
+   :term:`BUILD_CC`
+      Specifies the architecture-specific C compiler for the build host,
+      and its default definition is derived in part from :term:`BUILD_PREFIX`
+      and :term:`BUILD_CC_ARCH`::
+
+         BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`CC` is set to the
+      value of this variable by default.
+
+      The :term:`BUILD_CC` variable should not be set manually, and is rarely
+      used in recipes as :term:`CC` contains the appropriate value depending on
+      the context (native or target recipes). Exception be made for target
+      recipes that need to use the compiler from the build host at some point
+      during the build.
+
    :term:`BUILD_CC_ARCH`
       Specifies the architecture-specific C compiler flags for the build
       host. By default, the value of :term:`BUILD_CC_ARCH` is empty.
 
    :term:`BUILD_CCLD`
-      Specifies the linker command to be used for the build host when the C
-      compiler is being used as the linker. By default, :term:`BUILD_CCLD`
-      points to GCC and passes as arguments the value of
-      :term:`BUILD_CC_ARCH`, assuming
-      :term:`BUILD_CC_ARCH` is set.
+      Specifies the :manpage:`linker <ld(1)>` command to be used for the build
+      host when the C compiler is being used as the linker, and its default
+      definition is derived in part from :term:`BUILD_PREFIX` and
+      :term:`BUILD_CC_ARCH`::
+
+         BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`CCLD` is set to
+      the value of this variable by default.
+
+      The :term:`BUILD_CCLD` variable should not be set manually, and is rarely
+      used in recipes as :term:`CCLD` contains the appropriate value depending on
+      the context (native or target recipes). Exception be made for target
+      recipes that need to use the :manpage:`linker <ld(1)>` from the build host
+      at some point during the build.
 
    :term:`BUILD_CFLAGS`
       Specifies the flags to pass to the C compiler when building for the
-      build host. When building in the ``-native`` context,
+      build host. When building a :ref:`ref-classes-native` recipe,
       :term:`CFLAGS` is set to the value of this variable by
       default.
 
+   :term:`BUILD_CPP`
+      Specifies the C preprocessor command (to both the C and the C++ compilers)
+      when building for the build host, and its default definition is derived in
+      part from :term:`BUILD_PREFIX` and :term:`BUILD_CC_ARCH`::
+
+         BUILD_CPP = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`CPP` is set to
+      the value of this variable by default.
+
+      The :term:`BUILD_CPP` variable should not be set manually, and is rarely
+      used in recipes as :term:`CPP` contains the appropriate value depending on
+      the context (native or target recipes). Exception be made for target
+      recipes that need to use the preprocessor from the build host at some
+      point during the build.
+
    :term:`BUILD_CPPFLAGS`
       Specifies the flags to pass to the C preprocessor (i.e. to both the C
       and the C++ compilers) when building for the build host. When
       building in the ``-native`` context, :term:`CPPFLAGS`
       is set to the value of this variable by default.
 
+   :term:`BUILD_CXX`
+      Specifies the architecture-specific C++ compiler for the build host,
+      and its default definition is derived in part from :term:`BUILD_PREFIX`
+      and :term:`BUILD_CC_ARCH`::
+
+         BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`CXX` is set to
+      the value of this variable by default.
+
+      The :term:`BUILD_CXX` variable should not be set manually, and is rarely
+      used in recipes as :term:`CXX` contains the appropriate value depending on
+      the context (native or target recipes). Exception be made for target
+      recipes that need to use the C++ compiler from the build host at some
+      point during the build.
+
    :term:`BUILD_CXXFLAGS`
       Specifies the flags to pass to the C++ compiler when building for the
-      build host. When building in the ``-native`` context,
+      build host. When building a :ref:`ref-classes-native` recipe,
       :term:`CXXFLAGS` is set to the value of this variable
       by default.
 
    :term:`BUILD_FC`
-      Specifies the Fortran compiler command for the build host. By
-      default, :term:`BUILD_FC` points to Gfortran and passes as arguments the
-      value of :term:`BUILD_CC_ARCH`, assuming
-      :term:`BUILD_CC_ARCH` is set.
+      Specifies the Fortran compiler command for the build host, and its default
+      definition is derived in part from :term:`BUILD_PREFIX` and
+      :term:`BUILD_CC_ARCH`::
+
+         BUILD_FC = "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`FC` is set to the
+      value of this variable by default.
+
+      The :term:`BUILD_FC` variable should not be set manually, and is rarely
+      used in recipes as :term:`FC` contains the appropriate value depending on
+      the context (native or target recipes). Exception be made for target
+      recipes that need to use the Fortran compiler from the build host at some
+      point during the build.
 
    :term:`BUILD_LD`
-      Specifies the linker command for the build host. By default,
-      :term:`BUILD_LD` points to the GNU linker (ld) and passes as arguments
-      the value of :term:`BUILD_LD_ARCH`, assuming
-      :term:`BUILD_LD_ARCH` is set.
+      Specifies the linker command for the build host, and its default
+      definition is derived in part from :term:`BUILD_PREFIX` and
+      :term:`BUILD_LD_ARCH`::
+
+         BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`LD` is set to the
+      value of this variable by default.
+
+      The :term:`BUILD_LD` variable should not be set manually, and is rarely
+      used in recipes as :term:`LD` contains the appropriate value depending on
+      the context (native or target recipes). Exception be made for target
+      recipes that need to use the linker from the build host at some point
+      during the build.
 
    :term:`BUILD_LD_ARCH`
       Specifies architecture-specific linker flags for the build host. By
@@ -1051,10 +1161,58 @@ system and gives an overview of their function and contents.
 
    :term:`BUILD_LDFLAGS`
       Specifies the flags to pass to the linker when building for the build
-      host. When building in the ``-native`` context,
+      host. When building a :ref:`ref-classes-native` recipe,
       :term:`LDFLAGS` is set to the value of this variable
       by default.
 
+   :term:`BUILD_NM`
+      Specifies the architecture-specific utility to list symbols from object
+      files for the build host, and its default definition is derived in part
+      from :term:`BUILD_PREFIX`::
+
+         BUILD_NM = "${BUILD_PREFIX}nm"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`NM` is set to the
+      value of this variable by default.
+
+      The :term:`BUILD_NM` variable should not be set manually, and is rarely
+      used in recipes as :term:`NM` contains the appropriate value depending on
+      the context (native or target recipes). Exception be made for target
+      recipes that need to use the utility from the build host at some point
+      during the build.
+
+   :term:`BUILD_OBJCOPY`
+      Specifies the architecture-specific utility to copy object files for the
+      build host, and its default definition is derived in part from
+      :term:`BUILD_PREFIX`::
+
+         BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`OBJCOPY` is set
+      to the value of this variable by default.
+
+      The :term:`BUILD_OBJCOPY` variable should not be set manually, and is
+      rarely used in recipes as :term:`OBJCOPY` contains the appropriate value
+      depending on the context (native or target recipes). Exception be made for
+      target recipes that need to use the utility from the build host at some
+      point during the build.
+
+   :term:`BUILD_OBJDUMP`
+      Specifies the architecture-specific utility to display object files
+      information for the build host, and its default definition is derived in
+      part from :term:`BUILD_PREFIX`::
+
+         BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`OBJDUMP` is set
+      to the value of this variable by default.
+
+      The :term:`BUILD_OBJDUMP` variable should not be set manually, and is
+      rarely used in recipes as :term:`OBJDUMP` contains the appropriate value
+      depending on the context (native or target recipes). Exception be made for
+      target recipes that need to use the utility from the build host at some
+      point during the build.
+
    :term:`BUILD_OPTIMIZATION`
       Specifies the optimization flags passed to the C compiler when
       building for the build host or the SDK. The flags are passed through
@@ -1075,11 +1233,53 @@ system and gives an overview of their function and contents.
       build system uses the :term:`BUILD_PREFIX` value to set the
       :term:`TARGET_PREFIX` when building for :ref:`ref-classes-native` recipes.
 
+   :term:`BUILD_RANLIB`
+      Specifies the architecture-specific utility to generate indexes for
+      archives for the build host, and its default definition is derived in part
+      from :term:`BUILD_PREFIX`::
+
+         BUILD_RANLIB = "${BUILD_PREFIX}ranlib -D"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`RANLIB` is set to
+      the value of this variable by default.
+
+      The :term:`BUILD_RANLIB` variable should not be set manually, and is
+      rarely used in recipes as :term:`RANLIB` contains the appropriate value
+      depending on the context (native or target recipes). Exception be made for
+      target recipes that need to use the utility from the build host at some
+      point during the build.
+
+   :term:`BUILD_READELF`
+      Specifies the architecture-specific utility to display information about
+      ELF files for the build host, and its default definition is derived in
+      part from :term:`BUILD_PREFIX`::
+
+         BUILD_READELF = "${BUILD_PREFIX}readelf"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`READELF` is set
+      to the value of this variable by default.
+
+      The :term:`BUILD_READELF` variable should not be set manually, and is
+      rarely used in recipes as :term:`READELF` contains the appropriate value
+      depending on the context (native or target recipes). Exception be made for
+      target recipes that need to use the utility from the build host at some
+      point during the build.
+
    :term:`BUILD_STRIP`
-      Specifies the command to be used to strip debugging symbols from
-      binaries produced for the build host. By default, :term:`BUILD_STRIP`
-      points to
-      ``${``\ :term:`BUILD_PREFIX`\ ``}strip``.
+      Specifies the command to be used to strip debugging symbols from binaries
+      produced for the build host, and its default definition is derived in part
+      from :term:`BUILD_PREFIX`::
+
+         BUILD_STRIP = "${BUILD_PREFIX}strip"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`STRIP` is set to
+      the value of this variable by default.
+
+      The :term:`BUILD_STRIP` variable should not be set manually, and is
+      rarely used in recipes as :term:`STRIP` contains the appropriate value
+      depending on the context (native or target recipes). Exception be made for
+      target recipes that need to use the utility from the build host at some
+      point during the build.
 
    :term:`BUILD_SYS`
       Specifies the system, including the architecture and the operating
@@ -1284,6 +1484,10 @@ system and gives an overview of their function and contents.
    :term:`CC`
       The minimal command and arguments used to run the C compiler.
 
+   :term:`CCLD`
+      The minimal command and arguments used to run the linker when the C
+      compiler is being used as the linker.
+
    :term:`CFLAGS`
       Specifies the flags to pass to the C compiler. This variable is
       exported to an environment variable and thus made visible to the
@@ -2839,6 +3043,9 @@ system and gives an overview of their function and contents.
    :term:`FAKEROOTNOENV`
       See :term:`bitbake:FAKEROOTNOENV` in the BitBake manual.
 
+   :term:`FC`
+      The minimal command and arguments used to run the Fortran compiler.
+
    :term:`FEATURE_PACKAGES`
       Defines one or more packages to include in an image when a specific
       item is included in :term:`IMAGE_FEATURES`.
@@ -7368,6 +7575,9 @@ system and gives an overview of their function and contents.
       ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
       BitBake User Manual for additional information on tasks and dependencies.
 
+   :term:`READELF`
+      The minimal command and arguments to run :manpage:`readelf <readelf(1)>`.
+
    :term:`RECIPE_MAINTAINER`
       This variable defines the name and e-mail address of the maintainer of a
       recipe. Such information can be used by human users submitted changes,

-- 
2.47.0


