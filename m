Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963CECEDDAA
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19646.1728487495555399413
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BQ0UDM4F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D7A424000C;
	Wed,  9 Oct 2024 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHfCwG4MF2yEgHd3J6J4Gf3WqSuVlPIU5czreOTUPqY=;
	b=BQ0UDM4FI1wedesuHgoPo24Twr+F2/K8dH0T3xdKdrAAIFzWLtwrIMg3d7M5TECH793i4h
	3tMhlRSZZ/WFk6sZ3EaElMsHujAgph2mHfF94OoEUSv4K2i6xJ0/QemX/IQjbOVbENB1Ks
	9GNDagvMTVvbkYDGckGNSBH6ZmlMXGp/lEXXhpTuI/Fd0Zcq9MLUvVlX2F4kGVCdPWv3tG
	1eVSOHNchjTwoi1xtMd2Uu53e9SyHbVSaJ28XDt+lPT0VnpNmIuTKouD+IylG0vDTLItnN
	aUX2xLLOU/CpoFKZ2Yi6qW+EjyjZBBqtGn3SAhQOvxzkE2DdZVP6nxqmHaFZOA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:09 +0200
Subject: [PATCH v2 01/16] ref-manual: add missing CVE_CHECK manifest
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-1-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Zmr2uUiUVl08IdkbeWNJEGNnwwGi8h0fQj2lv7FGDjc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBDQS7NlXV2B9A25YRBDtSp/y8jGJ9hyiLXw
 uyQer6duXWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagQwAKCRDRgEFAKaOo
 NoKID/9mio/tCs/YL6otodasy3Luu0iTWRz4NHKD/HmPVBl0XdvZo1tSbBsaCOEwtqNeYvsSDv4
 oelKeodHBhraiTBvmEYAITDARcAfVpP/QwmlDflYDnsdxSBhpyCnZ4tfqH3bHCB8FXX0gWHae19
 cdUStTtRxjU79V2w8Z/PzyPKiWA7kARYr/ZboCnCKYdPSJH0KY/L73vwbCx//69VI7SNBvanFLM
 rhs/XU2viotHxr5AAucFoZxVkeUb4D/1gzOHTsGfDVbtWmslZmXVZThl2s4ytd4hJav7VVxNgme
 P+TYvUa+AOQpMWApDf8QUoIdvuRXkEXBBKhyt+qyBSU4RYlurixfrcY0sFV+P0e40Thk5tkAjDI
 anpTqVv4S2fsUMtvJtzyBCcBoE1wPt2aARBtafK4oPIz9lgbwirx6cDYMn2c21sr5DaSXrk8LU1
 +zENLsoGJXYqi/qzanEYHepgv0PXhR3U2mO6iIJwKOitYSHcjvRR1tfEahS5LuoqgX2B+fJ54KD
 ECNZNmk6+ncTjmpcZfbD9Q1B+0HQBoUQTCwW3eJ+4lc1pegr/xtGl1hiwHqvkIKdxUYtSGkrqbs
 bqieJytTH6jlfNhxkwHch8YAHLaWv4G3i7Yv+HNSwUzGxDOPgoGKWYQ3coRxOQCXPyWpNFLoyPr
 JmCfbufFpzZmrmQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5431

Variables that can be used for toggling creation of manifest and
specifying the path to the output in the deploy directory.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 32c9e7407..0236c8c9c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1678,9 +1678,21 @@ system and gives an overview of their function and contents.
          variable only in certain contexts (e.g. when building for kernel
          and kernel module recipes).
 
+   :term:`CVE_CHECK_CREATE_MANIFEST`
+      Specifies whether to create a CVE manifest to place in the deploy
+      directory. The default is "1".
+
    :term:`CVE_CHECK_IGNORE`
       This variable is deprecated and should be replaced by :term:`CVE_STATUS`.
 
+   :term:`CVE_CHECK_MANIFEST_JSON`
+      Specifies the path to the CVE manifest in json format. See
+      :term:`CVE_CHECK_CREATE_MANIFEST`.
+
+   :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`
+      Allows to modify the json manifest suffix. See
+      :term:`CVE_CHECK_MANIFEST_JSON`.
+
    :term:`CVE_CHECK_REPORT_PATCHED`
       Specifies whether or not the :ref:`ref-classes-cve-check`
       class should report patched or ignored CVEs. The default is "1", but you

-- 
2.46.0


