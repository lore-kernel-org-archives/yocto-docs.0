Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA457CA6C90
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5800.1769501965682097119
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=w05Lzdmd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 296794E422CA
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 021B8606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E9AD119A867A;
	Tue, 27 Jan 2026 09:19:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501963; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=89EgbKd537rdLjyeze5aK2ndM2vtlB3f7KYjh2i+uOM=;
	b=w05LzdmdbWnNaMUaGEKNCgb2b5xcD016yaez9dxzDxohH+l1btbWNZfis3LSPP5bqH6uo/
	mqeKAPyT4qNwVTcbOsmQFgqY3QE1zifZsCo5ArnsZ7AvzmFgSWr0BIhQZZN04GphJ4P25k
	MAlVPioNe7tH3wbzY+dHOXZ0w6JeM598x1earRzppqob8lKOkVZuRB9AjEQLFSPSTE1o4N
	B96gvs/dSy8SmCo6VyifX7/eLjKzDo/IngA+R0/XjEfwBGig+DIxVVIa4PmFkIFxOUfB2z
	BxAiSVLpJazZfgTmD2XwLARC7J2jZ6+iPPNb/ZZD/bWVt6wnOZfQN/LphF+S3w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:00 +0100
Subject: [PATCH v2 05/56] kernel-dev/advanced.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-5-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=20p+DU12kQUdyrlwBhgaMyNZCTPAP2A8bLP2wmg9Snk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHT/MdYrt4ZpmwB9tHMESAmU1r5HA9Zn/F4tT
 rrnVGOVT+yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh0/wAKCRDRgEFAKaOo
 NnUtEADOP2p6Pz7/5nvvWkC0+WgBtKsfa2BHFkBfiY7HmzEITH50j88DjHf95k4Hf1oZ6xgPcEU
 xSu/uxGJY2DKi9X5dEQ6cY+OKZEHxOS4h413xVp7FS5+KYJ1Wk5SnxsCf51meyPfWxzzKDlfqOg
 n6AIlGgfKp1yvcJd+X6yvR72ZkTkPJIxoLMkDefbeWDWfpkFCER71n+Pu8ITlc1/P1vs/Wd6lAN
 aOLP4wS2ADB8Iyl7BWc8dXGFYhAfNdUDuomLYnhQgWwQAKeed7Iurji7k2D/9xt35+ggXs+U3ru
 fUGq4aPKJg1mavMJYTATHtKuQFFRFYRf6ogaadLTuW7o28Ah/CyUvQIJ091ge33CqKVN1ty167x
 bCc2nogUtEZluaVGDrzNAuoy+Tysgi4YqYlW6HYyzhGze3jU+cC+GnSYYjhaUO94v9MkU1PQRGy
 n/FzajE7hdIf9rmp46KCMDR3GZgFIQP5+ZxNkz04n+elDHX0tds89h3cvlKMRdJavJHys/JI8yO
 Fbnu6LOhFTaNk/K1+UaaSuyjRakTOtFKPi9aGPcIHJcVSC6a/4bczPokUZMWJZiRGG2zksQsZnH
 SKifPYVxTtXnxHZx/KCuECHz4ztGIa/Urrmtr7UFjbd5m2kapyK3w2iRUkocEClKgHiWM42+Aa8
 urHDwjtIiVS1v8g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8666

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases, and refer to bitbake-setup or the manual setup in the
intro.

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


