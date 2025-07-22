Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C308AC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 13:33:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.12782.1753191228845314048
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Jul 2025 06:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VwG2Ek15;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C817E4388F;
	Tue, 22 Jul 2025 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753191227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oaR17CeV1d1KwxQSSe9yeBvu3jnqpT6WUqyzS5RWVJ4=;
	b=VwG2Ek15EKx1cWtlnOn82fDQG2Y6zhzKvM93u9FuheM3ZucvuaKZVfiroYiZGd3E1YCyoy
	NnnrAL3auUj3Z7W1dq3v8XeyoQp8+cn4JIQnhCWwB30WIeMOGN2r4qvYo6lSE+8ikJYffz
	e4SDAJjRGyZTyqUOI+AuSLdsgYJl3Ot1NpSjqL/m6bjlv4jACjjzHqhiOaYSShxsb8TPVb
	8ETyljHlFhUq26TFrgYb2RAmZLXaAmTlS9S4n+P/lq1EhRRPRWE5uqTjpohZZk+1/rRmyZ
	RHpJGNQwOS1r5c+XtckZ+i7E3UZJmp6odPH0gC2QFd3wcVJVwOQ69CRAHaav/g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 22 Jul 2025 15:33:37 +0200
Subject: [PATCH v2] ref-manual: document new toolchain classes and
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-new-toolchain-variables-v2-1-b02aecd666e2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIADCTf2gC/4WNQQ6CMBBFr0Jm7RhaKQVX3sOwoDjIJNgxLakaw
 t2tXMDl+z///RUiBaYI52KFQIkji8+gDwUMU+/vhHzLDLrUprSqQU8vXETm3LLH1Afu3UwRXau
 VMbqtWltDXj8Djfzezdcu88RxkfDZj5L6pf+dSaFC3Qy1s6WpRnu6OJFlZn8c5AHdtm1ff95Qq
 MAAAAA=
X-Change-ID: 20250718-new-toolchain-variables-b92155294976
To: docs@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9931;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PaHSkq2F5TC0Oul8uBx6eiCkemCeQ+7FhTjOLyKRdCw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBof5M6K45rFYFZbuEdaSwDJRbMn7zCq1adkhvRv
 TRauPwqe3qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaH+TOgAKCRDRgEFAKaOo
 NnJcD/4pNf7eSRS//vVHYaXkQKzjXNBqFZgKaAwJFOp1uZEvBvdUY9XjluMmoB2CPudE2ypTeOa
 Aoya4WCMUQIAqwiMeZM3SLNvmeA695qD82DGzAAWM4DbnVG2FRHoEDC7LSriDqyiwSAIh68bMs9
 CmF6DzHL517AxzTMWhYkHzjuOUjZenXzcavHpr30TdyEmE1NlXf5J4/VOtnaf3HISAXjnjw+q0n
 /Pn1vjjI2dICtFhZK/zGTMVrysMoxu8LAWmKnF0QJM+MTJbnJfc6bJpEIL1uurSP/k3d74P2nJK
 q7egstbftSOz54CFV8EZoQygjzPz0AEsrPyBN4vPuLc1++IZ+Tx3IAF23l3EVE3HceM1vXTbGgW
 zbGIbqF+W6IdWs286PVx7dKJks/fw2E9d3Tm1pvJHKVHa42vwLPvRwddxqq+YvpOgkt/LqsDvr2
 E1zpXI2CAvdsVpaI124KjcBYztDIKsw6fbaRDOBvrHT21L70dow7YcD61hjSSgq0LfY81xO4P0u
 6XRn20Q1BHJ9mKnKne4reutPedoIcGvLcoHbIar3kYBfdAxkxyUvkJfQ9d+islD05rrV/kL5P6N
 nlq2oeRj4mrlJFlhQlHuEubJbUiO0HMlGA2sU5AgkXhM9BujlOqnWq7Kze3GKytopGMsmgUtg+N
 KwoiZnxpJPYqXrg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejhedtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdegteehlefgheegvddufeevheehveeijedvfeduvdefvdekueduuedvjeelteehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhho
 hhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Jul 2025 13:33:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7362

Document the new classes under classes/toolchain as well as
PREFERRED_TOOLCHAIN* and TOOLCHAIN variables, which allow selecting the
toolchain. For now there's "gcc" and "clang" as available toolchain.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Apply corrections/suggestions from Quentin Schulz (thanks!)
- Link to v1: https://lore.kernel.org/r/20250718-new-toolchain-variables-v1-1-28c6b7054f73@bootlin.com
---
 documentation/ref-manual/classes.rst   | 80 ++++++++++++++++++++++++++++++++++
 documentation/ref-manual/variables.rst | 78 +++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 4705ca3f4..ff41c84a7 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3443,6 +3443,86 @@ This class is not intended to be used directly.
 The :ref:`ref-classes-toolchain-scripts` class provides the scripts used for setting up
 the environment for installed SDKs.
 
+.. _ref-classes-toolchain-clang:
+
+``toolchain/clang``
+===================
+
+The :ref:`ref-classes-toolchain-clang` class defines commands for building
+recipes with Clang/LLVM compiler and utilities.
+
+This class is not meant to be inherited directly. Instead, you should either:
+
+-  set the :term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE`
+   or :term:`PREFERRED_TOOLCHAIN_SDK` variables to "clang" from a
+   :term:`Configuration File`. This will make the :ref:`ref-classes-base` class
+   use the :ref:`ref-classes-toolchain-clang` accordingly. All recipes will
+   be built with the Clang/LLVM toolchain, exception be made for recipes that
+   override the value of :term:`TOOLCHAIN` or :term:`TOOLCHAIN_NATIVE` to
+   another value.
+
+-  set :term:`TOOLCHAIN` or :term:`TOOLCHAIN_NATIVE` to "clang" from a recipe
+   when the recipe needs to override the default toolchain set by
+   :term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE` or
+   :term:`PREFERRED_TOOLCHAIN_SDK`.
+
+.. _ref-classes-toolchain-clang-native:
+
+``toolchain/clang-native``
+==========================
+
+The :ref:`ref-classes-toolchain-clang-native` class defines commands for
+building :ref:`ref-classes-native` recipes with Clang/LLVM compiler and
+utilities independently of the build context.
+
+The :ref:`ref-classes-toolchain-gcc-native` class defines :term:`BUILD_CC`,
+:term:`BUILD_CXX` and other such variables which are rarely used in recipes.
+Exception be made for target recipes that need to use the compiler from the
+build host at some point during the build.
+
+This class should not be inherited directly. It is inherited by the
+:ref:`ref-classes-base` class if :term:`TOOLCHAIN_NATIVE` is set to "clang".
+
+.. _ref-classes-toolchain-gcc:
+
+``toolchain/gcc``
+=================
+
+The :ref:`ref-classes-toolchain-gcc` class defines commands for building
+recipes with GCC/Binutils compiler and utilities.
+
+This class is not meant to be inherited directly. Instead, you should either:
+
+-  set the :term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE`
+   or :term:`PREFERRED_TOOLCHAIN_SDK` variables to "gcc" from a
+   :term:`Configuration File`. This will make the :ref:`ref-classes-base` class
+   use the :ref:`ref-classes-toolchain-gcc` accordingly. All recipes will
+   be built with the GCC/Binutils toolchain, exception be made for recipes that
+   override the value of :term:`TOOLCHAIN` or :term:`TOOLCHAIN_NATIVE` to
+   another value.
+
+-  set :term:`TOOLCHAIN` or :term:`TOOLCHAIN_NATIVE` to "gcc" from a recipe
+   when the recipe needs to override the default toolchain set by
+   :term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE` or
+   :term:`PREFERRED_TOOLCHAIN_SDK`.
+
+.. _ref-classes-toolchain-gcc-native:
+
+``toolchain/gcc-native``
+========================
+
+The :ref:`ref-classes-toolchain-gcc-native` class defines commands for building
+:ref:`ref-classes-native` recipes with GCC/Binutils compiler and utilities
+independently of the build context.
+
+The :ref:`ref-classes-toolchain-gcc-native` class defines :term:`BUILD_CC`,
+:term:`BUILD_CXX` and other such variables which are rarely used in recipes.
+Exception be made for target recipes that need to use the compiler from the build
+host at some point during the build.
+
+This class should not be inherited directly. It is inherited by the
+:ref:`ref-classes-base` class if :term:`TOOLCHAIN_NATIVE` is set to "gcc".
+
 .. _ref-classes-typecheck:
 
 ``typecheck``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d079e4b59..4abbe3c1f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7331,6 +7331,57 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/new-recipe:using virtual providers`" section in the
       Yocto Project Development Tasks Manual.
 
+   :term:`PREFERRED_TOOLCHAIN`
+      The :term:`PREFERRED_TOOLCHAIN` variable selects the toolchain to use for
+      compiling recipes. This variable is not meant to be overridden globally.
+      Instead, the values of :term:`PREFERRED_TOOLCHAIN_TARGET`,
+      :term:`PREFERRED_TOOLCHAIN_NATIVE` and :term:`PREFERRED_TOOLCHAIN_SDK`
+      should be overridden.
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
+      A recipe that does not support the toolchain specified by
+      :term:`PREFERRED_TOOLCHAIN_NATIVE` can override it locally with
+      :term:`TOOLCHAIN_NATIVE`.
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
+      architecture of the target :term:`MACHINE`.
+
+      There are two possible values for this variable at the moment:
+
+      -  :ref:`gcc <ref-classes-toolchain-gcc>` (default): the GCC/Binutils toolchain.
+      -  :ref:`clang <ref-classes-toolchain-clang>`: the Clang/LLVM toolchain.
+
+      :term:`PREFERRED_TOOLCHAIN_TARGET` will make the :ref:`ref-classes-base`
+      class inherit one of the toolchain classes defined in
+      :oe_git:`meta/classes/toolchain
+      </openembedded-core/tree/meta/classes/toolchain>`. As a consequence, this
+      variable should be set globally from a :term:`configuration file`.
+
+      These classes define commands used for cross-compiling such as :term:`CC`,
+      :term:`CXX`, :term:`LD` and so on.
+
+      A recipe that does not support the toolchain specified by
+      :term:`PREFERRED_TOOLCHAIN_TARGET` can override it locally with
+      :term:`TOOLCHAIN`.
+
    :term:`PREFERRED_VERSION`
       If there are multiple versions of a recipe available, this variable
       determines which version should be given preference. You must always
@@ -10131,6 +10182,21 @@ system and gives an overview of their function and contents.
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
+      the :oe_git:`Pseudo </openembedded-core/tree/meta/recipes-devtools/pseudo/pseudo_git.bb>`
+      recipe overrides this variable to "gcc", because Pseudo uses GCC compiler
+      built-ins options that the Clang/LLVM compiler does not provide.
+
    :term:`TOOLCHAIN_HOST_TASK`
       This variable lists packages the OpenEmbedded build system uses when
       building an SDK, which contains a cross-development environment. The
@@ -10186,6 +10252,18 @@ system and gives an overview of their function and contents.
       :term:`SDK_VERSION` variables for additional
       information.
 
+   :term:`TOOLCHAIN_NATIVE`
+      The :term:`TOOLCHAIN_NATIVE` variable can be used to override the
+      toolchain used by a :ref:`ref-classes-native` recipe.
+
+      The default value for this variable is the value of
+      :term:`PREFERRED_TOOLCHAIN` (in :ref:`ref-classes-native` contexts). See
+      the description of :term:`PREFERRED_TOOLCHAIN` to know the list of
+      possible values for :term:`TOOLCHAIN_NATIVE`.
+
+      It is possible to override the value of this variable from a recipe if
+      this recipe is known to support only a specific toolchain.
+
    :term:`TOOLCHAIN_TARGET_TASK`
       This variable lists packages the OpenEmbedded build system uses when
       it creates the target part of an SDK (i.e. the part built for the

---
base-commit: f9f1c87424d307d2df60024bc448bd6778605cf8
change-id: 20250718-new-toolchain-variables-b92155294976

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


