Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95850C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 13:42:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8043.1740490938359172596
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 05:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TAUCRUKR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63AA8441D2;
	Tue, 25 Feb 2025 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740490936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WTjCV6kOrQbgsnmP6c1cz8nhdWxNL21R4cBy3eJfKts=;
	b=TAUCRUKRhd6Og2bVriXBX42dKP6lS0TRJPGhZxvMcVa+1vNZJAItWTQrNYe/X8wYoiK1Nr
	ILvzfwhnO3EC9rfqixcKCOr0YXm++pQ3IJBTaRjA3A0ZJWKkOg0e0NkwSuRsU9QaCW78/Y
	FWC9doFjHMOXuIHV+XVKMOYYX30+R9SQn8IasrBdxklmyNGDnq/OK6p2CSIjn4xe59eQF9
	1GNG7OZmMxuAZDlviAqBI17tam4RKPoAC6CaoLAurgyo/yBHTajPxNZ/CiJX0NFRIFABab
	d4KmvgOrnI8omEzu5hkqCc84WN712e1/ynyLyEh6CLv78rGsjqfyIGIHX8Y47A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Feb 2025 14:42:02 +0100
Subject: [PATCH] ref-manual/variables: document KMETA* and KCONF_AUDIT*
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-kmeta-audit-vars-v1-1-d39d3e253b00@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKnIvWcC/x3MSwqAMAwA0auUrA3UQFW8irgImmoQP7RVBPHuF
 pdvMfNAlKASoTUPBLk06r5llIWBYeZtEtQxG8iSs0QOl1USI5+jJrw4RGyoYj94K1Iz5OwI4vX
 +l13/vh9vzMnxYgAAAA==
X-Change-ID: 20250225-kmeta-audit-vars-826afcf0ee7a
To: docs@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4502;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MvROj6HJkiL8UlW4mOIGg112Q2taHmOLEJaduO0V7+Q=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnvci3uOs870w150BWWeXCbE3vOmJGq63Uta7Jc
 X/UxNXzgh+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ73ItwAKCRDRgEFAKaOo
 Nm23EACJoVOOfrUSvMiT98SKPTJaD6j6cUUuIcnoFL+kBlY8Atau/IZ2+CkU00+5zmhTjYpGzgC
 tnYupIhxfbfxGzTQrjXs1e8UfcLZ6b3mtzywTAoZAzZAX+KUpMr/Gvhj/M5+A/Wls3qkTQfbxso
 Jj/Fk20nWogtlptcE5QsG8fdts08Z62BKdrT4JQ/NqIgFyLlPp1KQxXTjqfKPNo12mT2Q8H5PJq
 Gw0ZlLxFY6CLb1ycQix39naXJ0GIpFD5FG8Cdzu6S5CEQNRRohTxioGydzoynBh6mpUOBKPdItZ
 CZBXSCQMSBqrvBr7o6I7bC+o+0h5qcFUGSuJAV2lcQQfmEqP493pLDwcAEL9HWayePsB2fJi4nN
 s0ZW9sFlZIOSA6pjhd8u0oVIjVnU0imXwjRfWZetfIuC0Kx8NsuGHxkGP6UYcRS8k6VDP1AeWs0
 FIfsgqyInzx41sPaYc1Gjl/6BYZ1Dg6sHuVjEBmS8Pf9Ve6m8YWC/Jzs1MAbJS/DR684zy+OjX2
 jdEbn1aGEYgEfIt4xRhul/CGt+22IJ31l6J8HkK2Dvlpc0e2DlS6QeMCbmSAEy1ztDiqdHyo07w
 y+26gFs3mobs23X52nqOklt1mcP8ke3pM4/dMlwhxjjOaSVwKPwJ4CVPMC8cnVG3erEPQxFQLZk
 Rfl3e5e3gMblTKw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdeiveekgeffffekvdekgfejhfdvudeljeeufeefjeevtddvffekiefhkeelkeffnecuffhomhgrihhnpehshihmsgholhgpfihhhidrphihnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegsrhhutggvrdgrshhhfhhivghlugesghhmrghilhdrtghomhdprhgtphhtthhopegrn
 hhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 13:42:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6448

Document the variables used to control the outcome of the kernel
configuration auditing done by the kernel-yocto bbclass.

[YOCTO #13835]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8f39d33be87c5db6688a807156540410..c842774f0d383e34077b2e558c3347f2abcdb7d2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4563,6 +4563,53 @@ system and gives an overview of their function and contents.
       ":ref:`kernel-dev/common:using an "in-tree" \`\`defconfig\`\` file`"
       section in the Yocto Project Linux Kernel Development Manual.
 
+   :term:`KCONF_AUDIT_LEVEL`
+      When inheriting the :ref:`ref-classes-kernel-yocto` class, the
+      :term:`KCONF_AUDIT_LEVEL` variable specifies whether to report Kernel
+      configuration values that are different from the user-specified value. Its
+      value is either 0 or 1 (default: 1):
+
+      -  0: no reporting is done.
+
+      -  1: report the problems as warnings and trigger and error if
+         :term:`KMETA_AUDIT_WERROR` is set.
+
+      For more details see the :ref:`ref-classes-kernel-yocto` class and the
+      :yocto_git:`symbol_why.py </yocto-kernel-tools/tree/tools/symbol_why.py>`
+      script in :yocto_git:`yocto-kernel-tools </yocto-kernel-tools>`.
+
+   :term:`KCONF_BSP_AUDIT_LEVEL`
+      When inheriting the :ref:`ref-classes-kernel-yocto` class, the
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
+      -  3: report the problems found when this variable is equals 2, and also
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
@@ -4967,6 +5014,20 @@ system and gives an overview of their function and contents.
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
+      :term:`KMETA_AUDIT` variable is set, when the :term:`KMETA_AUDIT_WERROR`
+      variable is set to a non-empty string, produce an error if Linux kernel
+      configuration problems were detected, instead of warnings only. For more
+      details on the Linux Kernel configuration auditing feature, see
+      :term:`KCONF_AUDIT_LEVEL` and :term:`KCONF_BSP_AUDIT_LEVEL`.
+
    :term:`KTYPE`
       Defines the kernel type to be used in assembling the configuration.
       The linux-yocto recipes define "standard", "tiny", and "preempt-rt"

---
base-commit: 9f1f9f1a3a2a541ed70df72d4fe391b5b7fd3733
change-id: 20250225-kmeta-audit-vars-826afcf0ee7a

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


