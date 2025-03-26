Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801EAC3600B
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 13:21:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.22293.1742995308328763008
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 06:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OHIqYekL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7C81443A3;
	Wed, 26 Mar 2025 13:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742995307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ENmcXhIli8klya6xCEOdRxNaYpMmBzPunolZwxhZv+g=;
	b=OHIqYekLlVmW05sP4z+7ktNe8sinPd+O1v+sw1xop0v4606cqsUbMRzAzCJohEXqPOR10w
	7rGAxF/J59tV87dFqp0kmCYAcBMXAbKTb33Fp41YLod4bS6fnRbs2thzuHPG8CfsLwOGnI
	+gZCc8ATwlID/EeMHPwhxdsvFUXxE635fg++u/0XBjmQabuNmt6MuI/9+gbVEFOQ+OUFe2
	wBTtK7x22EkZzBG20+F9p4qtcmaTb9omTNVB3aGRbR0YP7UwSxXLQrwU2IwSrX07OLC+hr
	tj9pgpwDUA5xTX1IaZ926ZBvm/h1N5t3Z3JXMfCs9nicf/amJOee1Q577YcxMw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 26 Mar 2025 14:21:39 +0100
Subject: [PATCH v2 3/6] ref-manual/variables.rst: add missing documentation
 for BUILD_* variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-cc-vars-v2-3-36b80c64c4a9@bootlin.com>
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
In-Reply-To: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=14649;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/Lg5fkuPowsYcQrOSjGWBM/MPA9KDqc5I3e3c+8TdXY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4/9pHl8Y18rNs0CJwBGzxXTzUBobZFUYrEkt3
 09UVk69C1CJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+P/aQAKCRDRgEFAKaOo
 NhNREADLX74of0CmAMtas9piaU+soK421E6VGDnXDUNw8RPBVlO7zvClcsAGLIF4gEqthE0WEBf
 jky0unahIwM9dRDCoP2JAe/LTFSEd0gVGCtVQ6EsT/XshDgjBgheTqe7bNiXFiQcPfoLxr6uq5s
 3A7mLhGxjMHtDrUjefK5v6I+/Mlyem0BxPoywbDv3JQfc6tJ3NkA+rJ9R5U8XAiVIKP98yMIWHg
 nBAq9I+a3gbNyHVlgWSxalXhSBBdDIXNKl30dxJfftn6LZkYnXVTt2S1QEXCZuqRkZ5L7jU4hhT
 uOwjkirr318awiaTARAp1jqIbA4F5MKldOR2mbh6GdnOuHljGJahgknYf5LEhodTuMDuNnpKwPt
 qVnIsm6eSEjkiP2MI46msx9BrE6A5lh8qg9xYf35KQZHT+2TDq8X3CIfXK9849omE+SMaln9Txi
 W73YG4H5hsCtyM5HVKIGEJpLn0xBo0igUiLejLARUEQXyzSAR1FD7ND6Bs9ZY7aQd9CbnYqz/th
 4/NlooJe4WN/rHelz51ImxK1fFnGTi4LwknFhcdVw57qrIk255sh50KfQLeNT4biHNj0+f6iL4s
 0mKjG7wjI0eIiX0RD6Qu+IDFC2aj9/YTuSPvgz7kR7LMk6ji6gXzSSfnGIN3E8/DLppTz9E9Vxe
 panKDWWLh8gBAmA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhpr
 hhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 13:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6637

These toolchain variables are used in a native context. Some of the
BUILD_* variables missed documentation. Also, some of the base commands
were also not there so document them.

Some of existing BUILD_* variable documentation were missing the note
about their usage in a native context, so add it too so that all BUILD_*
variables are documented the same way.

[YOCTO #15719]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 222 ++++++++++++++++++++++++++++++---
 1 file changed, 202 insertions(+), 20 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ccb4e0de2..9ee63622f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -985,55 +985,149 @@ system and gives an overview of their function and contents.
       variable is a useful pointer in case a bug in the software being
       built needs to be manually reported.
 
+   :term:`BUILD_AR`
+      Specifies the architecture-specific :manpage:`archiver <ar>` for the build
+      host, and its default definition is derived in part from
+      :term:`BUILD_PREFIX`::
+
+         BUILD_AR = "${BUILD_PREFIX}ar"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`AR` is set to the
+      value of this variable by default.
+
+      The :term:`BUILD_AR` variable should not be set manually, and should not
+      be used in recipes directly since :term:`AR` will hold the correct value
+      depending on the context.
+
    :term:`BUILD_ARCH`
       Specifies the architecture of the build host (e.g. ``i686``). The
       OpenEmbedded build system sets the value of :term:`BUILD_ARCH` from the
       machine name reported by the ``uname`` command.
 
+   :term:`BUILD_AS`
+      Specifies the architecture-specific :manpage:`assembler <as>` for the
+      build host, and its default definition is derived in part from
+      :term:`BUILD_PREFIX`::
+
+         BUILD_AS = "${BUILD_PREFIX}as"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`AS` is set to the
+      value of this variable by default.
+
+      The :term:`BUILD_AS` variable should not be set manually, and should not
+      be used in recipes directly since :term:`AS` will hold the correct value
+      depending on the context.
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
+      The :term:`BUILD_CC` variable should not be set manually, and should not
+      be used in recipes directly since :term:`CC` will hold the correct value
+      depending on the context.
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
+      Specifies the :manpage:`linker <ld>` command to be used for the build host
+      when the C compiler is being used as the linker, and its default
+      definition is derived in part from :term:`BUILD_PREFIX` and
+      :term:`BUILD_CC_ARCH`::
+
+         BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
+
+      When building a :ref:`ref-classes-native` recipe, :term:`CCLD` is set to
+      the value of this variable by default.
+
+      The :term:`BUILD_CCLD` variable should not be set manually, and should not
+      be used in recipes directly since :term:`CCLD` will hold the correct value
+      depending on the context.
 
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
+      The :term:`BUILD_CPP` variable should not be set manually, and should not
+      be used in recipes directly since :term:`CPP` will hold the correct value
+      depending on the context.
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
+      The :term:`BUILD_CXX` variable should not be set manually, and should not
+      be used in recipes directly since :term:`CXX` will hold the correct value
+      depending on the context.
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
+      The :term:`BUILD_FC` variable should not be set manually, and should not
+      be used in recipes directly since :term:`FC` will hold the correct value
+      depending on the context.
 
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
+      The :term:`BUILD_LD` variable should not be set manually, and should not
+      be used in recipes directly since :term:`LD` will hold the correct value
+      depending on the context.
 
    :term:`BUILD_LD_ARCH`
       Specifies architecture-specific linker flags for the build host. By
@@ -1041,10 +1135,52 @@ system and gives an overview of their function and contents.
 
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
+      The :term:`BUILD_NM` variable should not be set manually, and should not
+      be used in recipes directly since :term:`NM` will hold the correct value
+      depending on the context.
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
+      The :term:`BUILD_OBJCOPY` variable should not be set manually, and should
+      not be used in recipes directly since :term:`OBJCOPY` will hold the
+      correct value depending on the context.
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
+      The :term:`BUILD_OBJDUMP` variable should not be set manually, and should
+      not be used in recipes directly since :term:`OBJDUMP` will hold the
+      correct value depending on the context.
+
    :term:`BUILD_OPTIMIZATION`
       Specifies the optimization flags passed to the C compiler when
       building for the build host or the SDK. The flags are passed through
@@ -1065,11 +1201,47 @@ system and gives an overview of their function and contents.
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
+      The :term:`BUILD_RANLIB` variable should not be set manually, and should
+      not be used in recipes directly since :term:`RANLIB` will hold the correct
+      value depending on the context.
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
+      The :term:`BUILD_READELF` variable should not be set manually, and should
+      not be used in recipes directly since :term:`READELF` will hold the
+      correct value depending on the context.
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
+      The :term:`BUILD_STRIP` variable should not be set manually, and should
+      not be used in recipes directly since :term:`STRIP` will hold the correct
+      value depending on the context.
 
    :term:`BUILD_SYS`
       Specifies the system, including the architecture and the operating
@@ -1274,6 +1446,10 @@ system and gives an overview of their function and contents.
    :term:`CC`
       The minimal command and arguments used to run the C compiler.
 
+   :term:`CCLD`
+      The minimal command and arguments used to run the linker when the C
+      compiler is being used as the linker.
+
    :term:`CFLAGS`
       Specifies the flags to pass to the C compiler. This variable is
       exported to an environment variable and thus made visible to the
@@ -2818,6 +2994,9 @@ system and gives an overview of their function and contents.
    :term:`FAKEROOTNOENV`
       See :term:`bitbake:FAKEROOTNOENV` in the BitBake manual.
 
+   :term:`FC`
+      The minimal command and arguments used to run the Fortran compiler.
+
    :term:`FEATURE_PACKAGES`
       Defines one or more packages to include in an image when a specific
       item is included in :term:`IMAGE_FEATURES`.
@@ -7310,6 +7489,9 @@ system and gives an overview of their function and contents.
       ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
       BitBake User Manual for additional information on tasks and dependencies.
 
+   :term:`READELF`
+      The minimal command and arguments to run :manpage:`readelf`.
+
    :term:`RECIPE_MAINTAINER`
       This variable defines the name and e-mail address of the maintainer of a
       recipe. Such information can be used by human users submitted changes,

-- 
2.47.0


