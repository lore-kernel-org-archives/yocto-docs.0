Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54EAC35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 16:03:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.56549.1742227418549567162
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 09:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pez2BIZa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B54C3442AD;
	Mon, 17 Mar 2025 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742227416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h6RNiThSTiIV0sX0hX6PpRkVPSN70AaJr9ej8azbO10=;
	b=pez2BIZaEtNhXIeszW2ayYIutDj+5cI+y4RctlMtWVZ8fDQ9592pZS+0afFocYgKGdyeOW
	esQfbD30vpISOfUvheary4BhMFCH7j4gJ9sSP0hLHz+ViUkFmSLEK53tEAr+rOv0m09ZSv
	YGjvCy4fc2gFUjsL/a+lqjWmDEqxqRobaTnjCLkRFETCL01EnvPYH/DbV3+2uD6VYdaPBa
	yPlwvVegrsgvE+E7S56LtbeybJK87Af3xYBS4VK/aS84DEL0LAPsF0EuPKqa5G2Xf3hhPG
	rP7SdsZUsB+MM2q18cFpKWU21N9GsjXNJNSZp8I0lSXfrC2XISUibFF0oHO+Bw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 17:03:28 +0100
Subject: [PATCH 1/4] ref-manual/variables.rst: add missing documentation
 for BUILD_* variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-cc-vars-v1-1-25edbadfd054@bootlin.com>
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
In-Reply-To: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8822;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EtDIrZupRLjqz4EnVTFCAPQ8L3J7yiPiATUBD/Wo7pE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn2EfXfr59VbypKLOltqi9vAhaFgP3KZYqM0KC6
 e+E9beJx02JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9hH1wAKCRDRgEFAKaOo
 NleKEACIlucIhEPd49gBLdvK0v4uGsKRsCsFYRkN8QWn8zZVdLQKHvXIAARuhRx9N2tp8V2h6vn
 QJjLhC6ZPPfXQBhuHa04irnfWWj4H1e/AAmOsoz2ynFeoscV7r4ood4HfvxOcyTe8KEgJYantBo
 ZBTTpOgQos7o+NrTxEOuYUyNcL+xeSPcWfpgHeHGfAkd6BBN0Wcj+Eaq9dfgakDvmp2ZC6FDmfF
 02jV8YcSIx1iZj657HwGOPSJbDwrs4tOajXeR2V0PtSAIYiBu1MRDZY7bw3wHIdZVz0SIc2/49S
 cMz3BsP27DvHJ63aO/H4PeacPEYPUEg3yZKb5JzRZ+3nuXM7frlHFYM9t/NePkDuMfs/Dfqhb55
 KEOQvz13/ddyxz2HY5MjOahyJYYcJKNh1Gi3I2gvqHIDsqiepd5+p4+T02YuKauyjeI1viC488l
 SoX62uLcNojW0T5GkyEM/8FO+BREIrJbbfAbxSbH8sMhUxRHZS6Y+/uTFW9KB22THRqa+p82Ue7
 ECKUg3O4vucpeGbBT6FM9yd3fdQYocEIpI7u+SMGLiy7zaCYX5owTQLF0e8kL6bRzW1FxSucpb8
 OQNBy/+UZpZBULANYp1Y1Q3OK8kuErfL0TV7OHkAYi1qNaTPALEYN47HCvapen/oFAmC2/dU4iK
 muligD8g9k7yWEA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 16:03:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6578

These toolchain variables are used in a native context. Some of the
BUILD_* variables missed documentation. Also, some of the base commands
were also not there so document them (FC and READELF).

Some of existing BUILD_* variable documentation were missing the note
about their usage in a native context, so add it too so that all BUILD_*
variables are documented the same way.

[YOCTO #15719]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 107 +++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 861b04eaa..24b3f7db9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -985,6 +985,24 @@ system and gives an overview of their function and contents.
       variable is a useful pointer in case a bug in the software being
       built needs to be manually reported.
 
+   :term:`BUILD_AR`
+      Specifies the architecture-specific archiver for the build host,
+      derived in part from :term:`BUILD_PREFIX`::
+
+         BUILD_AR = "${BUILD_PREFIX}ar"
+
+      When building in the ``-native`` context, :term:`AR` is set to the value
+      of this variable by default.
+
+   :term:`BUILD_AS`
+      Specifies the architecture-specific assembler for the build host,
+      derived in part from from :term:`BUILD_PREFIX`::
+
+         BUILD_AS = "${BUILD_PREFIX}ar"
+
+      When building in the ``-native`` context, :term:`AS` is set to the value
+      of this variable by default.
+
    :term:`BUILD_ARCH`
       Specifies the architecture of the build host (e.g. ``i686``). The
       OpenEmbedded build system sets the value of :term:`BUILD_ARCH` from the
@@ -994,6 +1012,15 @@ system and gives an overview of their function and contents.
       Specifies the architecture-specific assembler flags for the build
       host. By default, the value of :term:`BUILD_AS_ARCH` is empty.
 
+   :term:`BUILD_CC`
+      Specifies the architecture-specific C compiler for the build host,
+      derived in part from :term:`BUILD_PREFIX` and :term:`BUILD_CC_ARCH`::
+
+         BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
+
+      When building in the ``-native`` context, :term:`CC` is set to the value
+      of this variable by default.
+
    :term:`BUILD_CC_ARCH`
       Specifies the architecture-specific C compiler flags for the build
       host. By default, the value of :term:`BUILD_CC_ARCH` is empty.
@@ -1011,12 +1038,31 @@ system and gives an overview of their function and contents.
       :term:`CFLAGS` is set to the value of this variable by
       default.
 
+   :term:`BUILD_CPP`
+      Specifies the C preprocessor command (to both the C and the C++ compilers)
+      when building for the build host, derived in part from
+      :term:`BUILD_PREFIX` and :term:`BUILD_CC_ARCH`::
+
+         BUILD_CPP = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E"
+
+      When building in the ``-native`` context, :term:`CPP` is set to the value
+      of this variable by default.
+
    :term:`BUILD_CPPFLAGS`
       Specifies the flags to pass to the C preprocessor (i.e. to both the C
       and the C++ compilers) when building for the build host. When
       building in the ``-native`` context, :term:`CPPFLAGS`
       is set to the value of this variable by default.
 
+   :term:`BUILD_CXX`
+      Specifies the architecture-specific C++ compiler for the build host,
+      derived in part from :term:`BUILD_PREFIX` and :term:`BUILD_CC_ARCH`::
+
+         BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
+
+      When building in the ``-native`` context, :term:`CXX` is set to the value
+      of this variable by default.
+
    :term:`BUILD_CXXFLAGS`
       Specifies the flags to pass to the C++ compiler when building for the
       build host. When building in the ``-native`` context,
@@ -1029,12 +1075,18 @@ system and gives an overview of their function and contents.
       value of :term:`BUILD_CC_ARCH`, assuming
       :term:`BUILD_CC_ARCH` is set.
 
+      When building in the ``-native`` context, :term:`FC` is set to the value
+      of this variable by default.
+
    :term:`BUILD_LD`
       Specifies the linker command for the build host. By default,
       :term:`BUILD_LD` points to the GNU linker (ld) and passes as arguments
       the value of :term:`BUILD_LD_ARCH`, assuming
       :term:`BUILD_LD_ARCH` is set.
 
+      When building in the ``-native`` context, :term:`LD` is set to the value
+      of this variable by default.
+
    :term:`BUILD_LD_ARCH`
       Specifies architecture-specific linker flags for the build host. By
       default, the value of :term:`BUILD_LD_ARCH` is empty.
@@ -1045,6 +1097,34 @@ system and gives an overview of their function and contents.
       :term:`LDFLAGS` is set to the value of this variable
       by default.
 
+   :term:`BUILD_NM`
+      Specifies the architecture-specific utility to list symbols from object
+      files for the build host, derived in part from :term:`BUILD_PREFIX`::
+
+         BUILD_NM = "${BUILD_PREFIX}nm"
+
+      When building in the ``-native`` context, :term:`NM` is set to the
+      value of this variable by default.
+
+   :term:`BUILD_OBJCOPY`
+      Specifies the architecture-specific utility to copy object files for the
+      build host, derived in part from :term:`BUILD_PREFIX`::
+
+         BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
+
+      When building in the ``-native`` context, :term:`OBJCOPY` is set to the
+      value of this variable by default.
+
+   :term:`BUILD_OBJDUMP`
+      Specifies the architecture-specific utility to display object files
+      information for the build host, derived in part from
+      :term:`BUILD_PREFIX`::
+
+         BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
+
+      When building in the ``-native`` context, :term:`OBJDUMP` is set to the
+      value of this variable by default.
+
    :term:`BUILD_OPTIMIZATION`
       Specifies the optimization flags passed to the C compiler when
       building for the build host or the SDK. The flags are passed through
@@ -1065,12 +1145,33 @@ system and gives an overview of their function and contents.
       build system uses the :term:`BUILD_PREFIX` value to set the
       :term:`TARGET_PREFIX` when building for :ref:`ref-classes-native` recipes.
 
+   :term:`BUILD_RANLIB`
+      Specifies the architecture-specific utility to generate indexes for
+      archives for the build host, derived in part from :term:`BUILD_PREFIX`::
+
+         BUILD_RANLIB = "${BUILD_PREFIX}ranlib -D"
+
+      When building in the ``-native`` context, :term:`RANLIB` is set to the
+      value of this variable by default.
+
+   :term:`BUILD_READELF`
+      Specifies the architecture-specific utility to display information about
+      ELF files for the build host, derived in part from :term:`BUILD_PREFIX`::
+
+         BUILD_READELF = "${BUILD_PREFIX}readelf"
+
+      When building in the ``-native`` context, :term:`READELF` is set to the
+      value of this variable by default.
+
    :term:`BUILD_STRIP`
       Specifies the command to be used to strip debugging symbols from
       binaries produced for the build host. By default, :term:`BUILD_STRIP`
       points to
       ``${``\ :term:`BUILD_PREFIX`\ ``}strip``.
 
+      When building in the ``-native`` context, :term:`STRIP` is set to the
+      value of this variable by default.
+
    :term:`BUILD_SYS`
       Specifies the system, including the architecture and the operating
       system, to use when building for the build host (i.e. when building
@@ -2818,6 +2919,9 @@ system and gives an overview of their function and contents.
    :term:`FAKEROOTNOENV`
       See :term:`bitbake:FAKEROOTNOENV` in the BitBake manual.
 
+   :term:`FC`
+      The minimal command and arguments used to run the Fortran compiler.
+
    :term:`FEATURE_PACKAGES`
       Defines one or more packages to include in an image when a specific
       item is included in :term:`IMAGE_FEATURES`.
@@ -7289,6 +7393,9 @@ system and gives an overview of their function and contents.
       ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
       BitBake User Manual for additional information on tasks and dependencies.
 
+   :term:`READELF`
+      The minimal command and arguments to run ``readelf``.
+
    :term:`RECIPE_MAINTAINER`
       This variable defines the name and e-mail address of the maintainer of a
       recipe. Such information can be used by human users submitted changes,

-- 
2.47.0


