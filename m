Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AC1CCF9F1
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.31560.1761569068068781729
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WUSZ16+P;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B7D8D4E4136C
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EAFC6062C
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 757F4102F2502;
	Mon, 27 Oct 2025 13:44:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kdooZINAemRgyLy2FS/+ZjktdTReTy6wKjuXTxRWSJY=;
	b=WUSZ16+PRVEe1mYvS8cSB/s2V+uKCm/kFJVa1zg1+00R2i2mgjVNj/G7MKYGdPb7g4l1iS
	2plZUPc2qCt0B9EMmJmRDhMcUK53RTbdWd8Fgsjh3gF6doMvMo0/UEFlT5Je863GcdKt7S
	T7FsrFbDWGFaUymMa+oIhkiGgp2dP7u+5qhGMohUJu0jCH4EzzqHNgc0+M25+Sk4MB0k5f
	1UFAfRg0o49g+gRJkmBagY5GNIL82NIovwx0Ia5KeRxGED3abCM1FgnCYytiy3gluNtKfy
	WAOx31ZyXALaXInNM44MxBDYx4ArnOsHABhT6ZoDR6upzUhm1niD8Mgzau7u+Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:36 +0100
Subject: [PATCH v3 04/16] ref-manual/classes.rst: ccache: mention that the
 host's ccache can be used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-4-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3srRqoBeUZHWeN6C6CeE1iBiSD7Oct7gtm+0Ko9Js6M=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kF46tBLHGb3RWmRzlTCWRPvEFhmJXu/oR/u
 YDIwjE8hn+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBQAKCRDRgEFAKaOo
 Nt9NEACj+ZNAs92BwSlfaraAP00WHtxTYXq7wTPlUf6Ee+2dGB7RrDgk1a2/PllwpRjonijWyi3
 pY5dLOM/wP6WRO7L0JVPIAjtzdYgZ/jqDbxh/gcJGa5/2IC2+pU6LwZYCREA97Z4DOryKVLlMVg
 1gzIa5kz5z36e/VD9GzIPPqVTOj+0Fx5U3czq8EqBm3NZgdO+Thg5XdeBn5r/4kOkzU+5/kqJOK
 25+S2KG7q6O4jC9v8eG/Nasl4aZ2YzFRsvoKeMhseNGxUhs1p7NFWL6hT1f3dg9Nwt38rK37hp+
 Zhwq+lmpzzHYY0+SvgVh0bwRn3KGiIHLduPUSl0XBX37GiGeC6sxjxoSJtSnUP/WqDtcomMjhG+
 swxS/xGQCuYJK2nfYk4Sq25r0Bp6jxVA2n9ELqYPrVzT/O0gmrLDqYRaqhYpsCzUg8qE2EIffeU
 ROMYrzqJmIwOVbF8KJ0Cb8pnP82zOn/afinZJgs9hRvUrXP8cbJxZ988z0/85obzWcVefk1Ndbe
 U3G0LC2JJCVEDg0XIGn8brscvi/PmW8BUZBJSaCQh0GPTFlTgUaF9uL1m/tfwFME9Lwp1jM3BqQ
 qwNQqBgKNcI2V1viZJ9es+S9vjUUI2Fl4wM5LP5Fs1GS/7Jr80zFwKBpaZjEh2XEp68wVxqtcOX
 fPpE2l8Y/iCOrfw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7853

This feature was added by commit cc91a0f6500e ("ccache: enable ccache
for all recipes if it is in HOSTTOOLS") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 638906353..4d0882401 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -392,8 +392,15 @@ file for details about how to enable this mechanism in your configuration
 file, how to disable it for specific recipes, and how to share ``ccache``
 files between builds.
 
-However, using the class can lead to unexpected side-effects. Thus, using
-this class is not recommended.
+Recipes (including :ref:`ref-classes-native` ones) can make use of the host's
+``ccache`` binary (via :term:`HOSTTOOLS`) if the following configuration
+statements are provided in a :term:`configuration file`::
+
+   ASSUME_PROVIDED += "ccache-native"
+   HOSTTOOLS += "ccache"
+
+Using the :ref:`ref-classes-ccache` class can lead to unexpected side-effects.
+Using this class is not recommended.
 
 .. _ref-classes-chrpath:
 

-- 
2.51.0


