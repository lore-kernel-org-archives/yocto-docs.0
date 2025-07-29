Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2EFC87FD5
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3368.1753783013328056639
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VoYAerHY;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97B0E4318D;
	Tue, 29 Jul 2025 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4l5qwCcUWiAPeOGbxmTnlOjCJeNGKn/ENwCLThZH4ck=;
	b=VoYAerHYgZ7grelCC1PtHyEukBw5zE6be3OY+BzHoDYNwUH29W3Q+/gpF+BrUrbWvblWWq
	OyIPBZfbjLU8Ts61BHCm9BPVj/ZGDWYYtdZSBRQsrUl3Y9NEORuvYaiJ01RG2NsY0z2u5T
	9+5T7J0dWF5vv7SB72vc4vJXmkDNHCH0kTgRNaiRu7U7WjvKuFjw888kIL8QuiT5uFSH9Y
	36pqXS2YB+ol1+WXWvTBX7r+X0BV5WWdDYvRypqoLnTYc1Eqo865xPzLJ6hDqDFnPsew9J
	QfjQWt+tYKdjFKfo9FRoJ/CE0KRd9sivKhwokE2sW54uCp+N6MFjRfPt//evqw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:40 +0200
Subject: [PATCH 06/19] Drop the icecc class and related variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-6-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12165;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VIVZ7PDDXHSMDttEzxL30AwwLg8QhkOOmxEtc3KPViI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJref7GpVwka6B6yewqJSFC8P490yDl+WaQqm
 FbK2oZXDNGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3gAKCRDRgEFAKaOo
 Nr2bEACaScohKP+vG9h99kNSwdp0wLeHwVJpPsHSkYycyGED3Xn+iNty237/Q3pHKA8GW5TIrqL
 kKBo9taYNT8ELS/99oODdqmu4n9/3SY2zvC3nT++/Q2HZnVO0mKMJ6jPtR0nyepaFUXtFZakZd5
 teJh9wjiptr3CqtW2VrIO9kBXHGP5dDnLitt22rWYnXH6+p+jcpwGM/iWvWpE0tiGhSu4FdKduA
 TqyhZLjcVmAnAu3/OtKLw9bckhJiXiXHTg+rqZvsLnI1bHy04Ci1Z6EXbBrv/AC5ldCfIlyucYJ
 e+9sv+PJb0oWN7uNheyJzObRQgSeiY7hfnfDz8HLPKKr8hD+E3lK0gEFgmfcjIosTw1ZiujZuce
 Ug8GFKt4pDomMSgRX1y2H2lxzpj+k3GnjHsKFSNmBZSE4/a3efzQiV46EgUPJPkIlxzZI79Y1pO
 Xbw9p+5zaYOoy4lRzKEbDUPQHsLtEAzF1aiIf5ulT8VCPNc3FZMhPruVGRj20PFUw0RpV8VaQiy
 LscsBQSFHZHs2/oNAZhNIjYtd2hvFGdoK3Pzp4y9CRhfxL/TGQE2X0U+gTFJXlVtc7jiRmlRhrb
 VnlmCGmqsbsxaC4mkIzwZEJLfd6jMsPV0aSz7MlegGJa2Z7+On4EZjSMEpCc7FEM+5b9rt+MmAl
 nEq3fofmbNVLcuw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeuvdffkeetudegudehhfegleeiieefkeehkeeuledtvdffueefkeffheevueeknecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohept
 hhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7406

Dropped by commit ecf8c386cf83 ("classes/recipes-devtools: Drop icecc
from OE-Core") in OE-Core.

Remove documentation for the class and the related variables. Remove the
references to this class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-4.0.rst  | 10 +--
 documentation/ref-manual/classes.rst              | 74 -------------------
 documentation/ref-manual/variables.rst            | 89 +----------------------
 documentation/sdk-manual/appendix-customizing.rst |  4 +-
 4 files changed, 9 insertions(+), 168 deletions(-)

diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index 0e9e741458..c8c2b856d9 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -33,11 +33,11 @@ The following variables have changed their names:
 - ``BB_SETSCENE_ENFORCE_WHITELIST`` became ``BB_SETSCENE_ENFORCE_IGNORE_TASKS``
 - ``CVE_CHECK_PN_WHITELIST`` became :term:`CVE_CHECK_SKIP_RECIPE`
 - ``CVE_CHECK_WHITELIST`` became :term:`CVE_CHECK_IGNORE`
-- ``ICECC_USER_CLASS_BL`` became :term:`ICECC_CLASS_DISABLE`
-- ``ICECC_SYSTEM_CLASS_BL`` became :term:`ICECC_CLASS_DISABLE`
-- ``ICECC_USER_PACKAGE_WL`` became :term:`ICECC_RECIPE_ENABLE`
-- ``ICECC_USER_PACKAGE_BL`` became :term:`ICECC_RECIPE_DISABLE`
-- ``ICECC_SYSTEM_PACKAGE_BL`` became :term:`ICECC_RECIPE_DISABLE`
+- ``ICECC_USER_CLASS_BL`` became ``ICECC_CLASS_DISABLE``
+- ``ICECC_SYSTEM_CLASS_BL`` became ``ICECC_CLASS_DISABLE``
+- ``ICECC_USER_PACKAGE_WL`` became ``ICECC_RECIPE_ENABLE``
+- ``ICECC_USER_PACKAGE_BL`` became ``ICECC_RECIPE_DISABLE``
+- ``ICECC_SYSTEM_PACKAGE_BL`` became ``ICECC_RECIPE_DISABLE``
 - ``LICENSE_FLAGS_WHITELIST`` became :term:`LICENSE_FLAGS_ACCEPTED`
 - ``MULTI_PROVIDER_WHITELIST`` became :term:`BB_MULTI_PROVIDER_ALLOWED`
 - ``PNBLACKLIST`` became :term:`SKIP_RECIPE`
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 7c2b4fb278..748f0395c2 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1143,80 +1143,6 @@ The :ref:`ref-classes-gzipnative` class enables the use of different native vers
 ``gzip`` and ``pigz`` rather than the versions of these tools from the
 build host.
 
-.. _ref-classes-icecc:
-
-``icecc``
-=========
-
-The :ref:`ref-classes-icecc` class supports
-`Icecream <https://github.com/icecc/icecream>`__, which facilitates
-taking compile jobs and distributing them among remote machines.
-
-The class stages directories with symlinks from ``gcc`` and ``g++`` to
-``icecc``, for both native and cross compilers. Depending on each
-configure or compile, the OpenEmbedded build system adds the directories
-at the head of the ``PATH`` list and then sets the ``ICECC_CXX`` and
-``ICECC_CC`` variables, which are the paths to the ``g++`` and ``gcc``
-compilers, respectively.
-
-For the cross compiler, the class creates a ``tar.gz`` file that
-contains the Yocto Project toolchain and sets ``ICECC_VERSION``, which
-is the version of the cross-compiler used in the cross-development
-toolchain, accordingly.
-
-The class handles all three different compile stages (i.e native,
-cross-kernel and target) and creates the necessary environment
-``tar.gz`` file to be used by the remote machines. The class also
-supports SDK generation.
-
-If :term:`ICECC_PATH` is not set in your
-``local.conf`` file, then the class tries to locate the ``icecc`` binary
-using ``which``. If :term:`ICECC_ENV_EXEC` is set
-in your ``local.conf`` file, the variable should point to the
-``icecc-create-env`` script provided by the user. If you do not point to
-a user-provided script, the build system uses the default script
-provided by the recipe :oe_git:`icecc-create-env_0.1.bb
-</openembedded-core/tree/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb>`.
-
-.. note::
-
-   This script is a modified version and not the one that comes with
-   ``icecream``.
-
-If you do not want the Icecream distributed compile support to apply to
-specific recipes or classes, you can ask them to be ignored by Icecream
-by listing the recipes and classes using the
-:term:`ICECC_RECIPE_DISABLE` and
-:term:`ICECC_CLASS_DISABLE` variables,
-respectively, in your ``local.conf`` file. Doing so causes the
-OpenEmbedded build system to handle these compilations locally.
-
-Additionally, you can list recipes using the
-:term:`ICECC_RECIPE_ENABLE` variable in
-your ``local.conf`` file to force ``icecc`` to be enabled for recipes
-using an empty :term:`PARALLEL_MAKE` variable.
-
-Inheriting the :ref:`ref-classes-icecc` class changes all sstate signatures.
-Consequently, if a development team has a dedicated build system that
-populates :term:`SSTATE_MIRRORS` and they want to
-reuse sstate from :term:`SSTATE_MIRRORS`, then all developers and the build
-system need to either inherit the :ref:`ref-classes-icecc` class or nobody should.
-
-At the distribution level, you can inherit the :ref:`ref-classes-icecc` class to be
-sure that all builders start with the same sstate signatures. After
-inheriting the class, you can then disable the feature by setting the
-:term:`ICECC_DISABLED` variable to "1" as follows::
-
-   INHERIT_DISTRO:append = " icecc"
-   ICECC_DISABLED ??= "1"
-
-This practice
-makes sure everyone is using the same signatures but also requires
-individuals that do want to use Icecream to enable the feature
-individually as follows in your ``local.conf`` file::
-
-   ICECC_DISABLED = ""
-
 .. _ref-classes-image:
 
 ``image``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a6962bb9d4..d8e6a81ea7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9,7 +9,7 @@ system and gives an overview of their function and contents.
 
 :term:`A <ABIEXTENSION>` :term:`B` :term:`C <CACHE>`
 :term:`D` :term:`E <EFI_PROVIDER>` :term:`F <FAKEROOT>`
-:term:`G <GCCPIE>` :term:`H <HGDIR>` :term:`I <ICECC_CLASS_DISABLE>`
+:term:`G <GCCPIE>` :term:`H <HGDIR>` :term:`I <IMAGE_BASENAME>`
 :term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
 :term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
 :term:`Q <QA_EMPTY_DIRS>` :term:`R <RANLIB>` :term:`S` :term:`T`
@@ -2686,7 +2686,7 @@ system and gives an overview of their function and contents.
       :ref:`populate-sdk-ext <ref-classes-populate-sdk-*>` class sets the
       default value::
 
-         ESDK_CLASS_INHERIT_DISABLE ?= "buildhistory icecc"
+         ESDK_CLASS_INHERIT_DISABLE ?= "buildhistory"
 
       Some classes are not generally applicable within the extensible SDK
       context. You can use this variable to disable those classes.
@@ -3818,91 +3818,6 @@ system and gives an overview of their function and contents.
       :term:`HOSTTOOLS_NONFATAL` is not found on the build host. Thus, you can
       use :term:`HOSTTOOLS_NONFATAL` to filter optional host tools.
 
-   :term:`ICECC_CLASS_DISABLE`
-      Identifies user classes that you do not want the Icecream distributed
-      compile support to consider. This variable is used by the
-      :ref:`ref-classes-icecc` class. You set this variable in
-      your ``local.conf`` file.
-
-      When you list classes using this variable, the recipes inheriting
-      those classes will not benefit from distributed compilation across
-      remote hosts. Instead they will be built locally.
-
-   :term:`ICECC_DISABLED`
-      Disables or enables the ``icecc`` (Icecream) function. For more
-      information on this function and best practices for using this
-      variable, see the ":ref:`ref-classes-icecc`"
-      section.
-
-      Setting this variable to "1" in your ``local.conf`` disables the
-      function::
-
-         ICECC_DISABLED ??= "1"
-
-      To enable the function, set the variable as follows::
-
-         ICECC_DISABLED = ""
-
-   :term:`ICECC_ENV_EXEC`
-      Points to the ``icecc-create-env`` script that you provide. This
-      variable is used by the :ref:`ref-classes-icecc` class. You
-      set this variable in your ``local.conf`` file.
-
-      If you do not point to a script that you provide, the OpenEmbedded
-      build system uses the default script provided by the
-      :oe_git:`icecc-create-env_0.1.bb
-      </openembedded-core/tree/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb>`
-      recipe, which is a modified version and not the one that comes with
-      ``icecream``.
-
-   :term:`ICECC_PARALLEL_MAKE`
-      Extra options passed to the ``make`` command during the
-      :ref:`ref-tasks-compile` task that specify parallel
-      compilation. This variable usually takes the form of "-j x", where x
-      represents the maximum number of parallel threads ``make`` can run.
-
-      .. note::
-
-         The options passed affect builds on all enabled machines on the
-         network, which are machines running the ``iceccd`` daemon.
-
-      If your enabled machines support multiple cores, coming up with the
-      maximum number of parallel threads that gives you the best
-      performance could take some experimentation since machine speed,
-      network lag, available memory, and existing machine loads can all
-      affect build time. Consequently, unlike the
-      :term:`PARALLEL_MAKE` variable, there is no
-      rule-of-thumb for setting :term:`ICECC_PARALLEL_MAKE` to achieve optimal
-      performance.
-
-      If you do not set :term:`ICECC_PARALLEL_MAKE`, the build system does not
-      use it (i.e. the system does not detect and assign the number of
-      cores as is done with :term:`PARALLEL_MAKE`).
-
-   :term:`ICECC_PATH`
-      The location of the ``icecc`` binary. You can set this variable in
-      your ``local.conf`` file. If your ``local.conf`` file does not define
-      this variable, the :ref:`ref-classes-icecc` class attempts
-      to define it by locating ``icecc`` using ``which``.
-
-   :term:`ICECC_RECIPE_DISABLE`
-      Identifies user recipes that you do not want the Icecream distributed
-      compile support to consider. This variable is used by the
-      :ref:`ref-classes-icecc` class. You set this variable in
-      your ``local.conf`` file.
-
-      When you list recipes using this variable, you are excluding them
-      from distributed compilation across remote hosts. Instead they will
-      be built locally.
-
-   :term:`ICECC_RECIPE_ENABLE`
-      Identifies user recipes that use an empty
-      :term:`PARALLEL_MAKE` variable that you want to
-      force remote distributed compilation on using the Icecream
-      distributed compile support. This variable is used by the
-      :ref:`ref-classes-icecc` class. You set this variable in
-      your ``local.conf`` file.
-
    :term:`IMAGE_BASENAME`
       The base name of image output files. This variable defaults to the
       recipe name (``${``\ :term:`PN`\ ``}``).
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 61091d83ba..e08630dce0 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -48,8 +48,8 @@ build system applies them against ``local.conf`` and ``auto.conf``:
    :term:`ESDK_CLASS_INHERIT_DISABLE` are disabled. Using
    :term:`ESDK_CLASS_INHERIT_DISABLE` to disable these classes is the typical
    method to disable classes that are problematic or unnecessary in the SDK
-   context. The default value disables the
-   :ref:`ref-classes-buildhistory` and :ref:`ref-classes-icecc` classes.
+   context. The default value disables the :ref:`ref-classes-buildhistory`
+   class.
 
 Additionally, the contents of ``conf/sdk-extra.conf``, when present, are
 appended to the end of ``conf/local.conf`` within the produced SDK,

-- 
2.50.1


