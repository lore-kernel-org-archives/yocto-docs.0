Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5D9C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 08:40:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.9169.1741164044447213063
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 00:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MhcbQ+xu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AF45443F0;
	Wed,  5 Mar 2025 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741164042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rLjHQ7kNT8383LxmC19ryM9ppSSvfQETfeNak1aUzSU=;
	b=MhcbQ+xuW2KF7659ItQIEvbMfaURlWQT3Orxqw9MqFlO2kzS3gx6gaxrgAuZXWrKJgLRtR
	VX8P1rlhzM6/JIPHPwo85FcQoGMYj7kuafmQDAQ8h+2xGcJnWC5c2llRo+w1b3o7fqyUoL
	z366KUO1hSBIf6EgavZBkcFhL917CstMI4C6vNIJrAVKJaBxZah/ACP8Sj+IjqIvWD1eV2
	5Cj/Nhg++0kGmHhe4NWUMjYM2AGRnIos20qkPCGg+i0pWxGAZXEnsbDVEzR8Xhn4cqvQDC
	O0IQOnhvyBiwcTkDGMqkmiDQ21UVXe3HqPTzri+WQhtFT62+6YpwEEyu5tDF+g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 05 Mar 2025 09:40:18 +0100
Subject: [PATCH v2] ref-manual/variables: document KMETA* and KCONF_AUDIT*
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-kmeta-audit-vars-v2-1-aa6bb0d514e4@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPENyGcC/32NTQ6CMBBGr0Jm7ZgyBP9W3sOwKO0gE4WStjYa0
 rtbOYDL95LvfSsE9sIBLtUKnpMEcXMB2lVgRj3fGcUWBlLUKqIWHxNHjfplJWLSPuCJDnowg2I
 +aiizxfMg7y156wqPEqLzn+0h1T/7J5ZqrNE2Z9swtU2v1LV3Lj5l3hs3QZdz/gJigBMysgAAA
 A==
X-Change-ID: 20250225-kmeta-audit-vars-826afcf0ee7a
To: docs@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5135;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Qu6jUCx5I9pTQCzIg1d4ZncLVL5a3LN8mHLOeUQWTeM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnyA4K3OYSd5fVR0OIIPf+CC0rH1qdkmKlpdIgB
 F5kVMSZWw2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ8gOCgAKCRDRgEFAKaOo
 Nkm1D/9eHH5W8qcStKnqX7f/FX+Jk6hFe8Vyoic3CivP9D2msqzPU9gHEsXb7mzjAME7r0h3ugb
 V0Brh0mBSER8RbtLWxO5JE9ppjGOYPc1eX7yklnut0Bbw7qzr1Vz9XKue+GLLtshLZMngPgt5N0
 FvJ5B2LfmtXYfVNYa+UvpgoNp2Cv7fNU7sWUmL9c0DVkOpzm3bc3cjBlYh9mTWPg+iWjgb5NPL0
 Dd5UYQW8L71BTnIgsofcX3fLcC534SKrnA0Q/28YUtL3nhxNkOprq5PNgHG7YzPoNpsDeEaFdON
 W74xxq+CCEM60DJZrejWvF/Wa/Dw0StqjdaMyQxOncVt+0jC7zWzRxmOxthvAOpJoLWobJQVbGt
 qeWF0SXFG8j0yje5JsAELqxDK3je+KQtKIcxoq7Xu4YlVP61umkRqZx+aSlYCz3pWAJWC9zvVAi
 qUhKk2Q/APmSmRtgnE9YJIF7B01rTBbhSD3rqCRjeszXzuK5NBdyhp2NdXzd0rEwyftFwbsEMyG
 y/upfl97kqh4PfnZHojd4M8g6xILT90sRsP64oP3oBKT+7mzmzChcF3SvS+H6Xvuaf3i9yYJXZH
 N7Sa4iL4NOZQ8IHi0Eg/frslMnUxEjKZ4WSREXloIGWPuXCOnN/Dn34Ri5OSrx+/Hl3NVUbnpp/
 VedkQcOME096kIQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: phishing
X-GND-Score: 300
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdegfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecundfrhhhishhhihhnghdqvghnqdhmihhstgculdeftddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfetueelgfefvddthffftdfhudeufeelteefteffueegleefleffgeekieegteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhshihmsgholhgpfihhhidrphihnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghruhgtvgdrrghshhhfihgvlhgusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhli
 hhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Mar 2025 08:40:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6499

Document the variables used to control the outcome of the kernel
configuration auditing done by the kernel-yocto bbclass.

[YOCTO #13835]

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Typos and suggestions from Quentin Schulz (thank you!)
- Link to v1: https://lore.kernel.org/r/20250225-kmeta-audit-vars-v1-1-d39d3e253b00@bootlin.com
---
 documentation/ref-manual/variables.rst | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 60984cc8f34cb7529968f7ba45cc918bcccd0710..0e5c8fefaf3b145555dd0d236be32fe6d4ff7179 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4572,6 +4572,60 @@ system and gives an overview of their function and contents.
       ":ref:`kernel-dev/common:using an "in-tree" \`\`defconfig\`\` file`"
       section in the Yocto Project Linux Kernel Development Manual.
 
+   :term:`KCONF_AUDIT_LEVEL`
+      When inheriting the :ref:`ref-classes-kernel-yocto` class and when the
+      :term:`KMETA_AUDIT` variable is set to a non-empty string, the
+      :term:`KCONF_AUDIT_LEVEL` variable specifies whether to report Kernel
+      configuration values that are different from the user-specified value. Its
+      value is a positive integer (default: 1):
+
+      -  0: no reporting is done.
+
+      -  1: report the problems as warnings and trigger an error if
+         :term:`KMETA_AUDIT_WERROR` is set.
+
+      -  2: if the :ref:`ref-tasks-kernel_configme` has failed to generate a
+         ``.config`` file, print the content of the ``merge_config_build.log``
+         file containing the errors, instead of just providing the path to
+         that file.
+
+      For more details see the :ref:`ref-classes-kernel-yocto` class and the
+      :yocto_git:`symbol_why.py </yocto-kernel-tools/tree/tools/symbol_why.py>`
+      script in :yocto_git:`yocto-kernel-tools </yocto-kernel-tools>`.
+
+   :term:`KCONF_BSP_AUDIT_LEVEL`
+      When inheriting the :ref:`ref-classes-kernel-yocto` class and when the
+      :term:`KMETA_AUDIT` variable is set to a non-empty string, the
+      :term:`KCONF_BSP_AUDIT_LEVEL` variable can be set to report:
+
+      #.  User-specified Kernel configurations that did not make it into the final
+          Kernel configuration.
+
+      #.  Configurations defined in multiple input files with differing values.
+
+      Its value is a positive integer (default: 0):
+
+      -  0: no reporting is done.
+
+      -  1: reporting of configuration options that did not make it in the
+         final configuration is done and is not limited to the current
+         architecture (``ARCH``) in use.
+
+      -  2: reporting of configuration options that did not make it in the
+         final configuration is done and is strictly limited to the current
+         architecture (``ARCH``) in use.
+
+      -  3: report the problems found when this variable equals 2, and also
+         report configurations options defined in multiple input files with
+         differing values.
+
+      For value 1, 2 and 3 an error is produced if :term:`KMETA_AUDIT_WERROR`
+      is set.
+
+      For more details see the :ref:`ref-classes-kernel-yocto` class and the
+      :yocto_git:`symbol_why.py </yocto-kernel-tools/tree/tools/symbol_why.py>`
+      script in :yocto_git:`yocto-kernel-tools </yocto-kernel-tools>`.
+
    :term:`KCONFIG_MODE`
       When used with the :ref:`ref-classes-kernel-yocto`
       class, specifies the kernel configuration values to use for options
@@ -4976,6 +5030,20 @@ system and gives an overview of their function and contents.
       However, the OpenEmbedded build system understands the machine as
       "core2-32-intel-common".
 
+   :term:`KMETA_AUDIT`
+      When inheriting the :ref:`ref-classes-kernel-yocto` class, the
+      :term:`KMETA_AUDIT` variable enables or disables auditing of Linux Kernel
+      configuration. The default value for this variable is "yes", and auditing
+      is enabled. Set this variable to an empty string to disable auditing.
+
+   :term:`KMETA_AUDIT_WERROR`
+      When inheriting the :ref:`ref-classes-kernel-yocto` class and when the
+      :term:`KMETA_AUDIT` and the :term:`KMETA_AUDIT_WERROR` variables are set
+      to non-empty strings, produce an error if Linux kernel configuration
+      problems were detected, instead of warnings only. For more details on the
+      Linux Kernel configuration auditing feature, see :term:`KCONF_AUDIT_LEVEL`
+      and :term:`KCONF_BSP_AUDIT_LEVEL`.
+
    :term:`KTYPE`
       Defines the kernel type to be used in assembling the configuration.
       The linux-yocto recipes define "standard", "tiny", and "preempt-rt"

---
base-commit: 36fb1e9e5099aa0d858d5478530143e9bac39588
change-id: 20250225-kmeta-audit-vars-826afcf0ee7a

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


