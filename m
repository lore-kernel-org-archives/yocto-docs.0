Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B11ECED627
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10720.1728459695976915462
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C1CMrx0B;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FBD21BF20D;
	Wed,  9 Oct 2024 07:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wESA0+wWuTuEgan5QcZsFan2F+sBZCRMetGbB+M6APA=;
	b=C1CMrx0BomBKVzGAVLPuk34990cKj3EgiRNshHPX2cqdEEaVYQLCTrvw/HLFwT/Ln/k7PQ
	iRc5gfv/QK5eReBIAmBWhSQA3zmafJHXUkxVu+EnJrPBokuNW/HPG1kaWdm0XZBETPdU91
	YAyhaAxbnxZ9luDNj67rVBHDa6q0NE+wlREuLMpjuDkgBIgE7gTmALen2Zo4/Zy287A8Aj
	NIU0Qtz5AaR8hjVEuqVd+kFmliH18Kdi3Y4rmju0sXLxdqGun4fvsZFBxNde947nwEwVh3
	KjcaUG8P7bVJtoUKeBKEasDSilaP43c1vuUCnczeu2cPw0RaxfwD5D3kMS1+sA==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 11/16] ref-manual: add missing OPKGBUILDCMD variable
Date: Wed,  9 Oct 2024 09:41:09 +0200
Message-ID: <20241009074120.866786-12-antonin.godard@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5418

From: Antonin Godard <antonin.godard@bootlin.com>

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8907572e6..72781d93b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5761,6 +5761,13 @@ system and gives an overview of their function and contents.
    :term:`OPKG_MAKE_INDEX_EXTRA_PARAMS`
       Specifies extra parameters for the ``opkg-make-index`` command.
 
+   :term:`OPKGBUILDCMD`
+      The variable :term:`OPKGBUILDCMD` specifies the command used to build opkg
+      package when using the :ref:`ref-classes-package_ipk` class. It is defined
+      in :ref:`ref-classes-package_ipk` as::
+
+          OPKGBUILDCMD ??= 'opkg-build -Z zstd -a "${ZSTD_DEFAULTS}"'
+
    :term:`OVERLAYFS_ETC_DEVICE`
       When the :ref:`ref-classes-overlayfs-etc` class is
       inherited, specifies the device to be mounted for the read/write
-- 
2.46.0


