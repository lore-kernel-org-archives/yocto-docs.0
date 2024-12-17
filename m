Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB38EE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77896.1734427635287421568
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ac6gXtZj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACAEC1C0008;
	Tue, 17 Dec 2024 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E5Q5bwMJPt+vr6vbtrNQRedyRo/U57oUhFLAiBGPxS4=;
	b=Ac6gXtZj7m8Z33/sm8x8KQPJAOPVEX3WZ1age1M002tA6FMBxP1rBJGRprlRIwiYnfu2+2
	vC/OcWrOj4YALlu5Vfz4iZz2s1HUP49aOlWOdr5oVOIzzOPBjEn6vAGC30+Yy0S+iWNI+/
	ymcT6g/KnYWWyaHJHAg83fwNgdyv5BsTZy1J6lW9kh58tmMnuU6L65DKqU7o5SjZ0avq8u
	AvWl1H9OztMpfNQQOOjG1qItipsUbQtVXcWicprHco5x605eyCCdFFOuW79eOkhBW058So
	WgiG17g0ttcmypmUcatCd3qVj/XmXewp2r+mCabH9+laNOEXzfXIVtjK6oCUBw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:00 +0100
Subject: [yocto-docs PATCH 01/14] ref-manual/variables: document the
 KERNEL_CONSOLE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-1-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=y4L4U8qjTjou51uOcWjewU5O3eL/bH4dRRCMjEFs3Ak=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPvTAQg0gFr3JxRtgKM/TigcZwLu1QKhm2Eh
 QL/bNywjieJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD7wAKCRDRgEFAKaOo
 NhsRD/9uNIWuSHgQcVh9hjr06+n6COZC+wlLu3wYb/Dj3Ih3Z5ihBEJ+XV01sq/YOGgqzQrQt7q
 SXUXV5sRFQc/BVQ6daNhYmKJYRE94cJ5ki+7QB+swSdIE2LFCTKoK7zLO7lGMvrIP5Cw2AkKnlT
 HiYI2bz3QdjTgy6K/vR4I9SEjumSS4hObBEq4RK2Pg5AepL6kFvTvuGPEX937CnRpBeTcR5X9dZ
 AelMzcoFpfeIFRB0PiXTayghF3mb4O7vTS4cchUMpY+M6l1GnsPCg7k+rPVj6WK4+oxsCuVhWPz
 fwtsPGHnwBkbrFyPgKGCSrJxrNInWkwWqaDAsf7v86dp3DdZOUktHxHEE3bUGcCtvc/nl9jpPDT
 zCMGz2cq76ZPmvbegeycUYTUvIvSAeUt/X07dji4NqND3eZez70nUsdmfk4ygai/pahF0/BCdaq
 JmvCblIHieoFnxALPUa4dPHbXaGn501/tf7FmJxulkjhId7ICGeT3tlUCSumHR/K9tcSB6zSUyj
 vFaFXFDMEpTreYfgCDsAHZjHVNmYGN59ksy46WDQ2YLyDJhx5nx/UzuEW6Dj6jBizKcqM8PlQ17
 /WFu1/A18W5jqTNCfAkBM9lLJAexZNB7UC3d9GlsieKtcVkJFsYsbyhubtPtrlArshEzbOC2SkU
 pRVgrC8drMY3MKA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5933

This variables holds the value of the `console` kernel command line
parameter.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1eee617d59ccddc9af0ffb95ea3635a707718152..c6d3d1bba9961704fca25921b346d5282e118db4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4579,6 +4579,12 @@ system and gives an overview of their function and contents.
       You can register custom kernel image types with the
       :ref:`ref-classes-kernel` class using this variable.
 
+   :term:`KERNEL_CONSOLE`
+     The :term:`KERNEL_CONSOLE` variable holds the value of the ``console``
+     parameter of the kernel command line and can be used in places such as a
+     ``wks`` description file for :ref:`Wic images <dev-manual/wic:creating
+     partitioned images using wic>`.
+
    :term:`KERNEL_DANGLING_FEATURES_WARN_ONLY`
       When kernel configuration fragments are missing for some
       :term:`KERNEL_FEATURES` specified by layers or BSPs,

-- 
2.47.1


