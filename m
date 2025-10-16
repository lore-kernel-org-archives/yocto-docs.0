Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E289CCD1A4
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3665.1760604886938530510
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=24idEpv2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9E7841A1418
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 765526062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5804102F22FB;
	Thu, 16 Oct 2025 10:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604885; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8zyXur8SLHJU36Eoo2wUQI64rtsORAvreZmjHx6fISE=;
	b=24idEpv2tZc9ds4d+pyeeIW+2Ayso5vrWTzm6VtJjs+u0n7st8Hp6Yjf/gaDlxK+PBHuJQ
	UDXFW/NrwCUy6YVRuUmK2ecGNodKvc3M0DcXcRbXPiOvugwF36ARwpjXPOWmiTUm/AIoaW
	BgEMYWaLmQ4u6idgfd2eGZ6IINbGYXLOnD7kf7KqZLCVjmPDg6MmSKQs1Rxjqb2L4iImyE
	ZhT6o7nqavv4c9PEvPAad40pacMxQUn875O3n8wfbdJV0OfPUdrMaYFSa7j1WeVUJyFklj
	m2hyzrG00AiT3q5S3vRpA/+jFvrUY4uyjy6d7YVn47XbKNIfhc2qPZbWl6K8gQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:53:54 +0200
Subject: [PATCH 04/17] ref-manual/classes.rst: ccache: mention that the
 host's ccache can be used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-4-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+NuOvvvybI+NosvurX8d/DO2IbX+ivUvmMxksK8K5sg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLP1/wP1z///kcETmO6bg1iqn83U7m+KCflS
 hzZqme9zUmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCyzwAKCRDRgEFAKaOo
 NtBGD/9TA2auo7ih7X9PVLSPV1kNd/4kIc/zPmHQ7/TPs1WCaLlpsNsgeOB9IyQXPpx+5/iX7UZ
 xCqquioBxlvb/4WuXQdvnd3rVm4+/lqCZzSDJmOyHWquElckTRgsHwTN5RP/2uPeDW9i0+/83+w
 zGchN3/aaWoGoGOh5kUehHESN2cr9tNunhMaYtWr4J1cmVrJWYQV8X15QdVOVC1Em2RpOG5hlDR
 Xo91Gj6T7Aq9Y4114yhvDuiOTXg5FdM/ZONjT1Ww+54wwH66aRVwd/Migr02fjlktLMfoGSrLFG
 0j5UXqaDVOd/5k/JPvgtQKx9/ZN2vc6PaU6SetLQah795FpVp2EhPNgSwDOILiTVkVKwXXbI+OD
 aZ3TZF1dNxOKqZ7OewXYNTmKaqVJ8ToFqPsW+t1gpICNUocx/0ikptg9gx9Viu9aVNP4n+zZmwM
 0Z2SnKIp36UysmBPzA2kr80SCJlfEyW99wGv2FgvrjEXwqY/UMjp14WluvGvAIcMFXRqcrxJ0vR
 DJ/NXf6TANMQSppHcb+Uh1c1tYI1tdqcHgMLB2B87832U3L6Fy8lyYJPV+XTwVNbp+0GNoG6Q6Y
 MIpOOhQYtWsIK1oiQLgO1VU8K9KH8DxWPt466L+8DxiMRxQklSnx5hs+e9HYdcj+fsHA/gXNFbB
 zUGW0hh/ZMUS9vA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7714

This feature was added by commit cc91a0f6500e ("ccache: enable ccache
for all recipes if it is in HOSTTOOLS") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index e89b27eec..f10903e74 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -392,8 +392,17 @@ file for details about how to enable this mechanism in your configuration
 file, how to disable it for specific recipes, and how to share ``ccache``
 files between builds.
 
-However, using the class can lead to unexpected side-effects. Thus, using
-this class is not recommended.
+By default, :ref:`ref-classes-native` recipes are not supported by the
+:ref:`ref-classes-ccache` class. It is possible to add Ccache support for these
+recipes if the following configuration statements are provided from a
+:term:`configuration file`, which makes the class use the host's Ccache
+instead::
+
+   ASSUME_PROVIDED += "ccache-native"
+   HOSTTOOLS += "ccache"
+
+Using the :ref:`ref-classes-ccache` class can lead to unexpected side-effects.
+Using this class is not recommended.
 
 .. _ref-classes-chrpath:
 

-- 
2.51.0


