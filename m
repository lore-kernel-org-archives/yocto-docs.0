Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905FFCED632
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10672.1728459694695600577
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aF8ujX0E;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37D681BF20B;
	Wed,  9 Oct 2024 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrIVDXW7VJTCRQN0fvl3AUEWAxC8HZ1pwW4q1Mzgxq8=;
	b=aF8ujX0EO99pDI4N7rQBYSegEwncWfTDuC20z4LA0hIon6/B54Fa6jXKt88zAEeD2G1vas
	WH8HCsmEonkn8TYVRi3pYgFlrhrSXMcf594I0uAU7KuSqojNLwOEU/RaqLdEJ3N/sOPk+z
	Aca+fNORPcmm+NTWVhj1l2rfluE0W3qRMdzYHCRYJWEGdPyoLDaa6mlw1Fk0lAhmAKCiz6
	0TLRkznR3rqgjdjTR2ToGpN5QBapW5Lxs1QXw370XoVlStaTScnYDX8zn8+hnu8v29di3H
	J6baiofJqsGMlyDMr2mkpyvAx+vTRZauo1N8edmLZofvn3k64pI/iFmKFiEzmw==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 06/16] ref-manual: drop siteconfig class
Date: Wed,  9 Oct 2024 09:41:04 +0200
Message-ID: <20241009074120.866786-7-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5413

From: Antonin Godard <antonin.godard@bootlin.com>

Removed as it was only used by ncurses and zlib and adding minimal
added-value for a considerable amount of added runtime.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 14aa0f3a3..121887d1f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2940,15 +2940,6 @@ in the :ref:`ref-classes-setuptools3` class and inherit this class instead.
 
 The :ref:`ref-classes-sign_rpm` class supports generating signed RPM packages.
 
-.. _ref-classes-siteconfig:
-
-``siteconfig``
-==============
-
-The :ref:`ref-classes-siteconfig` class provides functionality for handling site
-configuration. The class is used by the :ref:`ref-classes-autotools` class to
-accelerate the :ref:`ref-tasks-configure` task.
-
 .. _ref-classes-siteinfo:
 
 ``siteinfo``
-- 
2.46.0


