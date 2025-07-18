Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E25FC83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 08:22:41 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.16100.1752826954271171195
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jul 2025 01:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YpyUJfkV;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E33EC43885;
	Fri, 18 Jul 2025 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752826952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MOrkoEmjm5Vo+V6/RnsS+z2/8OIcEkVVJfu9oisS6uU=;
	b=YpyUJfkVGWPwmnjI7HJgCbmkE4lyLxzM07t6BmpK+ENAYm7OCjocxO5T/o1/vquzGZc9PQ
	/WGE9yHTkvPT417YcgFg8fc/e5qcEMMaRCHQymKOt6cahh30OqA/oxM51Moh+IgeCdapzV
	wCwzyI6h4OH8J0FfyKAphaaTuSnbn7Akpq2iQ5b3akir7FXpBmruz/ZUaWfEbgW4Eq8Huo
	HYMrZfDYk52zyc49Dg8rNXVwEz/s6rSo+vYq67TbJPP5AySZ9ewD2XWWvC4w+Ic6PZ4v5m
	HfNPRh9UwZNUdhHvIj4MLchOsZFA2ZIfapijR2g2Zosa9NB4RrIPC2QBWNdIKQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Jul 2025 10:22:09 +0200
Subject: [PATCH] ref-manual: document new toolchain classes and variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-new-toolchain-variables-v1-1-28c6b7054f73@bootlin.com>
X-B4-Tracking: v=1; b=H4sIADAEemgC/x2MQQqAIBAAvxJ7bkElK/tKdLDaaiE0NCoI/550H
 IaZFyIFpghd8UKgiyN7l0GWBUybdSshz5lBCaVFI1t0dOPp/Z4tO7xsYDvuFHE0SmqtTGWaGnJ
 9BFr4+c/9kNIHsiqAmGkAAAA=
X-Change-ID: 20250718-new-toolchain-variables-b92155294976
To: docs@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6684;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=voVBasfG3lFyaec3TN8pAHPmiyyhYrnMilcRl99m9wQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoegRH4M4kdvqa/rGK3+kFFqpjUlHJx8uzz/rCG
 afILP8MYB+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaHoERwAKCRDRgEFAKaOo
 NvbMEACQKuJDdwSiPFkHLzk7iB1uH2/sIc4km6WbuXT9cGo/HWOrT0TzJ+ltBtXIzhGQ/1j106W
 igQA/FxOmF82ztNQpqlCG7/68EF8uHu0zS5lypQ2MKWbWlhtevTVv/hiWu0OGprUavjGu4BXlIk
 L8X76jM/s/zob3FdxNOQ3NGLzoW65oCzSAHslXFVBJDbCA78bIQ59TcHF2XuHpK0TKFEgGeyKLU
 tulUeOdHhM1uFGv/8BuDL3NHfUuI4fuQlzDfF8TkkhszeVTUgOl9wovmQRAZ7NKW0sIJdDATSfc
 Xd92ZYrU9L3tOW+VPjiJXYakWs8t7nSoTgkZV8unPnoenP98tTPnH6Dyx5z61BjjtfsCNWpjRh7
 0KoQXycIN+Qxrsf7KuAaA28kSABW7AQps/CF9CkHzQzkIQfP7EKo/+1TE8V5o8FdaDRDkCTxKPK
 WxXuR/uAjW2ZXLNXk3qlIhW+EBwNZVEFgtAQ8Ieg8qbNYId+YXKKDx7RM3gipPf/1m66Hy779cz
 ltAYP0gSTHxJn7Yyg8qzHn+uvN4V2vfU5eHxjRs0/OinGaPIBbvcn3QiUJ0bZEAOLATiY1Jmu4w
 7giZSN7kvH4VVFLwxatV3CKWLNxmnXz3r4KYNFLrcaGNc28cm9Q1nlPbVlgOHWx1dp7Jbl5mhfA
 48bPoNqqxkpKzGA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeivdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeijeeltdeiueetffevteelueffiedvffejgfethefgheelieetheeiueeikeeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Jul 2025 08:22:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7346

Document the new classes under classes/toolchain as well as
PREFERRED_TOOLCHAIN* and TOOLCHAIN variables, which allow selecting the
toolchain. For now there's "gcc" and "clang" as available toolchain.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 43 ++++++++++++++++++++++++
 documentation/ref-manual/variables.rst | 60 ++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 4705ca3f4..14f14b742 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3443,6 +3443,49 @@ This class is not intended to be used directly.
 The :ref:`ref-classes-toolchain-scripts` class provides the scripts used for setting up
 the environment for installed SDKs.
 
+.. _ref-classes-toolchain-clang:
+
+``toolchain/clang``
+===================
+
+The :ref:`ref-classes-toolchain-clang` class defines commands for building
+recipes with Clang and LLVM compiler and utilities. This class is not meant to
+be used directly in recipes. Instead, you should specific the
+:term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE` or
+:term:`PREFERRED_TOOLCHAIN_SDK` variables to "clang". This will make the
+:ref:`ref-classes-base` class use the :ref:`ref-classes-toolchain-clang`
+accordingly.
+
+.. _ref-classes-toolchain-gcc:
+
+``toolchain/gcc``
+=================
+
+The :ref:`ref-classes-toolchain-gcc` class defines commands for building
+recipes with Gcc/binutils compiler and utilities. This class is not meant to
+be used directly in recipes. Instead, you should specific the
+:term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE` or
+:term:`PREFERRED_TOOLCHAIN_SDK` variables to "gcc". This will make the
+:ref:`ref-classes-base` class use the :ref:`ref-classes-toolchain-gcc`
+accordingly.
+
+.. _ref-classes-toolchain-gcc-native:
+
+``toolchain/gcc-native``
+========================
+
+The :ref:`ref-classes-toolchain-gcc-native` class defines commands for building
+:ref:`ref-classes-native` recipes with Gcc/binutils compiler and utilities
+independently of the build context.
+
+The :ref:`ref-classes-toolchain-gcc-native` class defines :term:`BUILD_CC`,
+:term:`BUILD_CXX` and other such variables, which are rarely used in recipes.
+Exception be made in target recipes that need to use the compiler from the build
+host at some point during the build.
+
+This class should not be inherited directly. It is inherited by the
+:ref:`ref-classes-base` class by default.
+
 .. _ref-classes-typecheck:
 
 ``typecheck``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d079e4b59..2bad5cda0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7331,6 +7331,51 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/new-recipe:using virtual providers`" section in the
       Yocto Project Development Tasks Manual.
 
+   :term:`PREFERRED_TOOLCHAIN`
+      The :term:`PREFERRED_TOOLCHAIN` variable selects the toolchain to use for
+      cross-compiling recipes. This variable is not meant to be overidden
+      globally. Instead, the values of :term:`PREFERRED_TOOLCHAIN_TARGET`,
+      :term:`PREFERRED_TOOLCHAIN_NATIVE` and :term:`PREFERRED_TOOLCHAIN_SDK`
+      should be overridden independently.
+
+      The value of this variable is the value :term:`PREFERRED_TOOLCHAIN_TARGET`.
+
+   :term:`PREFERRED_TOOLCHAIN_NATIVE`
+      This variable controls the toolchain used for compiling
+      :ref:`ref-classes-native` recipes.
+
+      This variable should be set globally from a :term:`configuration file`.
+
+      See :term:`PREFERRED_TOOLCHAIN_TARGET` for more details on the possible
+      values for this variable.
+
+   :term:`PREFERRED_TOOLCHAIN_SDK`
+      This variable controls the toolchain used for compiling
+      :ref:`ref-classes-nativesdk` recipes.
+
+      This variable should be set globally from a :term:`configuration file`.
+
+      See :term:`PREFERRED_TOOLCHAIN_TARGET` for more details on the possible
+      values for this variable.
+
+   :term:`PREFERRED_TOOLCHAIN_TARGET`
+      This variable controls the toolchain used for compiling recipes in the
+      architecture of the target.
+
+      There are two possible values for this variable at the moment:
+
+      -  :ref:`gcc <ref-classes-toolchain-gcc>` (default): the Gcc/Binutils toolchain.
+      -  :ref:`clang <ref-classes-toolchain-clang>`: the Clang/LLVM toolchain.
+
+      Selecting a value for this class will make the :ref:`ref-classes-base`
+      class inherit one of the toolchain class defined in
+      :oe_git:`meta/classes/toolchain
+      </openembedded-core/tree/meta/classes/toolchain>`. As a consequence, this
+      variable should be set globally from a :term:`configuration file`.
+
+      These classes define commands used for cross-compiling such as :term:`CC`,
+      :term:`CXX`, :term:`LD` and so on.
+
    :term:`PREFERRED_VERSION`
       If there are multiple versions of a recipe available, this variable
       determines which version should be given preference. You must always
@@ -10131,6 +10176,21 @@ system and gives an overview of their function and contents.
       implementations, NFS does not meet this minimum requirement.
       Consequently, :term:`TMPDIR` cannot be on NFS.
 
+   :term:`TOOLCHAIN`
+      The :term:`TOOLCHAIN` variable can be used to override the toolchain used
+      by a recipe.
+
+      The default value for this variable is the value of
+      :term:`PREFERRED_TOOLCHAIN`. See the description of
+      :term:`PREFERRED_TOOLCHAIN` to know the list of possible values for
+      :term:`TOOLCHAIN`.
+
+      It is possible to override the value of this variable from a recipe if
+      this recipe is known to support only a specific toolchain. For example,
+      the :ref:`ref-classes-kernel-arch` class overrides this variable to "gcc",
+      because the Linux Kernel does not support toolchains other than
+      Gcc/Binutils for compiling.
+
    :term:`TOOLCHAIN_HOST_TASK`
       This variable lists packages the OpenEmbedded build system uses when
       building an SDK, which contains a cross-development environment. The

---
base-commit: f9f1c87424d307d2df60024bc448bd6778605cf8
change-id: 20250718-new-toolchain-variables-b92155294976

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


