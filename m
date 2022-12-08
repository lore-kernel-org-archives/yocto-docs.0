Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99950C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 18:13:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.22400.1670523235243311663
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Dec 2022 10:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XESNsFtO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2F06E40004;
	Thu,  8 Dec 2022 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670523233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AjatFIbH3/ZfK9IXBfWwtkyhjiNNTPCIclMxX4o6+Oc=;
	b=XESNsFtOUFSN1zVW5qu5VAqvYkgNNVPY24RiEqVUMBfgVD8BfVnfXr+GhBk4RBIxKJPQrk
	zxT7RND4lZCdtMBc4DBvRqVrmRtmiUSV+htczMxGD2+VHQnJwZ9Ry+JVOrCmlOGWbUSMsj
	noc1hxKpd/fy6Vvk32oOTLtvANxyvU4UqbpnKTfRXZtPVgQbTErfAH8iZbN2dtRoZh8jrJ
	aF0mLEI0e9jCsA9iUlkYAIRIjYI8wBzh685SlARFxazWQkPR/lKUMYp/dpHIqdJaT7BpUS
	krBbJ00AT1Ok5tupOl+Rzj5cBaVGESnr8Y4857YSB9cjelYRLcsaLONauJOd+Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manual: improve documentation about using external toolchains
Date: Thu,  8 Dec 2022 19:13:50 +0100
Message-Id: <20221208181350.39601-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Dec 2022 18:13:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3528

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Remove the redundant FAQ entry about this topic,
  already covered in a specific section of the Development Tasks manual

- Document the TOOLCHAIN_LOCATION variable

- Expand both the Development Tasks manual and
  the TCMODE variable description using details from the FAQ entry.

- Mention the "meta-arm-toolchain" layer too.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../dev-manual/external-toolchain.rst         | 28 +++++++++++++------
 documentation/ref-manual/faq.rst              | 21 --------------
 documentation/ref-manual/variables.rst        | 20 +++++++++----
 3 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/documentation/dev-manual/external-toolchain.rst b/documentation/dev-manual/external-toolchain.rst
index e1fabbed22..238f8cf467 100644
--- a/documentation/dev-manual/external-toolchain.rst
+++ b/documentation/dev-manual/external-toolchain.rst
@@ -15,14 +15,26 @@ follows:
    ``bblayers.conf`` file through the
    :term:`BBLAYERS` variable.
 
--  Set the ``EXTERNAL_TOOLCHAIN`` variable in your ``local.conf`` file
+-  Set the :term:`EXTERNAL_TOOLCHAIN` variable in your ``local.conf`` file
    to the location in which you installed the toolchain.
 
-A good example of an external toolchain used with the Yocto Project is
-Mentor Graphics Sourcery G++ Toolchain. You can see information on how
-to use that particular layer in the ``README`` file at
-https://github.com/MentorEmbedded/meta-sourcery/. You can find
-further information by reading about the
-:term:`TCMODE` variable in the Yocto
-Project Reference Manual's variable glossary.
+The toolchain configuration is very flexible and customizable. It
+is primarily controlled with the :term:`TCMODE` variable. This variable
+controls which ``tcmode-*.inc`` file to include from the
+``meta/conf/distro/include`` directory within the :term:`Source Directory`.
 
+The default value of :term:`TCMODE` is "default", which tells the
+OpenEmbedded build system to use its internally built toolchain (i.e.
+``tcmode-default.inc``). However, other patterns are accepted. In
+particular, "external-\*" refers to external toolchains. One example is
+the Mentor Graphics Sourcery G++ Toolchain. Support for this toolchain resides
+in the separate ``meta-sourcery`` layer at
+https://github.com/MentorEmbedded/meta-sourcery/.
+See its ``README`` file for details about how to use this layer.
+
+Another example of external toolchain layer is
+:yocto_git:`meta-arm-toolchain </meta-arm/tree/meta-arm-toolchain/>`
+supporting GNU toolchains released by ARM.
+
+You can find further information by reading about the :term:`TCMODE` variable
+in the Yocto Project Reference Manual's variable glossary.
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 8f38808a78..525d9ab0ff 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -165,27 +165,6 @@ how to configure CVS and Git proxy servers if needed.
 Using the OpenEmbedded Build system
 ===================================
 
-How do I use an external toolchain?
------------------------------------
-
-The toolchain configuration is very flexible and customizable. It
-is primarily controlled with the :term:`TCMODE` variable. This variable
-controls which ``tcmode-*.inc`` file to include from the
-``meta/conf/distro/include`` directory within the :term:`Source Directory`.
-
-The default value of :term:`TCMODE` is "default", which tells the
-OpenEmbedded build system to use its internally built toolchain (i.e.
-``tcmode-default.inc``). However, other patterns are accepted. In
-particular, "external-\*" refers to external toolchains. One example is
-the Sourcery G++ Toolchain. The support for this toolchain resides in
-the separate ``meta-sourcery`` layer at
-https://github.com/MentorEmbedded/meta-sourcery/.
-
-In addition to the toolchain configuration, you also need a
-corresponding toolchain recipe file. This recipe file needs to package
-up any pre-built objects in the toolchain such as ``libgcc``,
-``libstdcc++``, any locales, and ``libc``.
-
 Why do I get chmod permission issues?
 -------------------------------------
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 776c8a2792..0586760a48 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2420,6 +2420,12 @@ system and gives an overview of their function and contents.
       :ref:`kernel-yocto <ref-classes-kernel-yocto>` class in
       ``meta/classes-recipe`` to see how the variable is used.
 
+   :term:`EXTERNAL_TOOLCHAIN`
+      When you intend to use an
+      :ref:`external toolchain <dev-manual/external-toolchain:optionally using an external toolchain>`,
+      this variable allows to specify the directory in which this toolchain was
+      installed.
+
    :term:`EXTERNALSRC`
       When inheriting the :ref:`externalsrc <ref-classes-externalsrc>`
       class, this variable points to the source tree, which is outside of
@@ -8481,16 +8487,20 @@ system and gives an overview of their function and contents.
       https://github.com/MentorEmbedded/meta-sourcery/.
 
       The layer's ``README`` file contains information on how to use the
-      Sourcery G++ Toolchain as an external toolchain. In summary, you must
-      be sure to add the layer to your ``bblayers.conf`` file in front of
-      the ``meta`` layer and then set the ``EXTERNAL_TOOLCHAIN`` variable
-      in your ``local.conf`` file to the location in which you installed
-      the toolchain.
+      Sourcery G++ Toolchain as an external toolchain. You will have to
+      add the layer to your ``bblayers.conf`` file and then set the
+      :term:`EXTERNAL_TOOLCHAIN` variable in your ``local.conf`` file to
+      the location in which you installed the toolchain.
 
       The fundamentals used for this example apply to any external
       toolchain. You can use ``meta-sourcery`` as a template for adding
       support for other external toolchains.
 
+      In addition to toolchain configuration, you will also need a
+      corresponding toolchain recipe file. This recipe file needs to package
+      up any pre-built objects in the toolchain such as ``libgcc``,
+      ``libstdcc++``, any locales, and ``libc``.
+
    :term:`TC_CXX_RUNTIME`
       Specifies the C/C++ STL and runtime variant to use during
       the build process. Default value is 'gnu'
-- 
2.37.2


