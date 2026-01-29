Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56443D61028
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17087.1769700248671086678
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zCrx5502;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24DD0C22F4B
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 235D3606FD;
	Thu, 29 Jan 2026 15:24:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C8E1119A868D;
	Thu, 29 Jan 2026 16:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=abAe3RVDM4u1zBAhm+yCiLQo8DnpUmlIiY2+RJuU0Kw=;
	b=zCrx5502Z4I7P/QolPWYzFRGo6Xx1U4+G23lbfvZ7kKLLPdtk5IMhvRMzvoO+sdEJS9Cat
	ibkTTjgpOuXwheMpgU73PNwYq/BqVnmueWFiscC5gRMMWX5AnbbO2xqcU2BRaWLl2FKwL1
	Q3E1OCGxd68FsHY/MiyRfuTRgOFLdE7Ehpd0qBRSfBhI/aGGOJIBBaqPUrbk9+ObcVL30I
	3/3glsvgBGasZOBDG88IPQ9ERvFZWfMR5cCD9GzcTBjh+KCMLYxemUAbYLUlWaH1d1b/js
	SaHRIhOc7mZs1XHLzjzr6uVIywPAl61el22oneHF084lWILZOYWpmm/jNiWM5g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:22:56 +0100
Subject: [PATCH v3 05/57] kernel-dev/advanced.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-5-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2577;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9IN9YDb7FgzPwAYsZUikwKnVDh18xUzKCbZcA155HBI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uJZetvAEILHdaqnvUvXRniYVAr2orLtnoWv
 yeSdXGkxmGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iQAKCRDRgEFAKaOo
 NoNiD/4mLU0zMo/9lSu7jMYHTB6U/wer4s4wzrlLZ5mXowN6Bb/aTbiBZn2H8WlWqn8qY262KW4
 WXPQU0pHiU8MMpZyQUy2YMtV2GXfErPrZs3O2Gokuy93b3g1iDzcgeiN0GlKUVjD+x7201EhGNj
 X2mSFsBb9f4fSplqOK3TjJ2S2EXsM0ExdzTQKc+OpWUpFXIWnTO2iBbBCIR+XiCKf1C0FKG4xg0
 W7y85RimADHRNgPeYKjp7lqv2dZkB9/zC45bd3DK+c478ePhBv1PvL40RWxXBQIaWP8j2vp4yuE
 undmeDX8eQw9kvNrFUUtIvxNjM1TpDJLG4ewpSxThRasH5CSLEhiWk348Y9VBOOh90DmsLU3hfy
 Xi2HZYeFeZxiUypDYhmgkm4Zxjdn72HRBrSbLyU9RRcAPzSofNWacLb1ZrxYJXEyA73XwWUz2GO
 Kqf0i4V6U0BQbucWniaj/rzTxlm5PLn6PwbptWq+gVnyXQUT6HNJpJ3Kq3gKUezkBF64376ySQe
 aFPdH6GyECJkeG2Vrj94B+09uwcbj23nUQJ+a1svtE03lbjVnHFmKgxeWwNdZgvyu9N3txxQm4X
 yeXxqV3ihLp53WFdKWRNM3XkFRFPW1nThHVQf5PtqQQ7LaKezVOp1CyHmn6XcDwLwNGQ5RYVLPs
 tLwSPpAZM6oYRNQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8791

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases, and refer to bitbake-setup or the manual setup in the
intro.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/kernel-dev/advanced.rst | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 4c463503f6..97cb663222 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -24,9 +24,8 @@ grouped under the "Yocto Linux Kernel" heading in the
 Kernel development tools ("kern-tools") are also available in the Yocto Project
 Source Repositories under the "Yocto Linux Kernel" heading in the
 ``yocto-kernel-tools`` Git repository. The recipe that builds these
-tools is ``meta/recipes-kernel/kern-tools/kern-tools-native_git.bb`` in
-the :term:`Source Directory` (e.g.
-``poky``).
+tools is ``recipes-kernel/kern-tools/kern-tools-native_git.bb`` in
+:term:`OpenEmbedded-Core (OE-Core)`.
 
 Using Kernel Metadata in a Recipe
 =================================
@@ -357,9 +356,9 @@ kernel of a specific type (e.g. a real-time kernel). Syntactically, kernel
 types are no different than features as described in the
 ":ref:`kernel-dev/advanced:features`" section. The :term:`LINUX_KERNEL_TYPE`
 variable in the kernel recipe selects the kernel type. For example, in the
-``linux-yocto_4.12.bb`` kernel recipe found in ``poky/meta/recipes-kernel/linux``, a
+``linux-yocto_4.12.bb`` kernel recipe found in ``meta/recipes-kernel/linux``, a
 :ref:`require <bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>`
-directive includes the ``poky/meta/recipes-kernel/linux/linux-yocto.inc`` file,
+directive includes the ``meta/recipes-kernel/linux/linux-yocto.inc`` file,
 which has the following statement that defines the default kernel type::
 
    LINUX_KERNEL_TYPE ??= "standard"
@@ -373,8 +372,7 @@ type as follows::
 .. note::
 
    You can find kernel recipes in the ``meta/recipes-kernel/linux`` directory
-   of the :ref:`overview-manual/development-environment:yocto project source repositories`
-   (e.g. ``poky/meta/recipes-kernel/linux/linux-yocto_4.12.bb``). See the
+   of the :ref:`overview-manual/development-environment:yocto project source repositories`. See the
    ":ref:`kernel-dev/advanced:using kernel metadata in a recipe`"
    section for more information.
 

-- 
2.52.0


