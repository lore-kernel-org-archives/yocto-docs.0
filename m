Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87F0EBFD0E
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 07:35:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.266966.1776065757690302260
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 00:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V4VtWJkM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D00BCC5B1A1
	for <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:36:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EE8D5FFB9
	for <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:35:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E056A1045009E;
	Mon, 13 Apr 2026 09:35:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776065754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ND8f2Ll4ml6A3RjyWZdn2QWtd+akbMpnOte39JuUw+Y=;
	b=V4VtWJkMp7yQPiqbNdFpjsCG+AIHq7f0A0q9oPfE4NlVv8d+CSvl8+9hCCJOngqzu4vn4Y
	5HcFGnB27BOX3fHmNzx3MUnYX3hzKE7dQzAwoOuhsDp51ZOOy9vPbgxXBhYSL/RwoifXiA
	Ah/y355MqUjExzHYXMb/X2WIKRZWI8D9eBQT9YTkAhlZsINoSTu94b0LPDnl2FTyzpjF22
	mEQSjePB9i4qS//e7OIQodepJNKh03pbu7gsvdJA6cgI/29r+VIZsi2iTSgckmLgxCuELk
	WNNxmjtDDW8vfyGVQkSMyfJ+PwqNvjskNQLpxyA96MPvRARPosYMQX6LNTBhIA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] set_versions.py fixes (continued)
Date: Mon, 13 Apr 2026 09:35:45 +0200
Message-Id: <20260413-set-versions-no-current-release-v1-0-9c40207c8604@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QqCQBCF4VeRuW5gXDSlV4kutvVUG7HGzCqC+
 O6tdvnB4T8rGTTC6FKtpJijxTEV1KeKwsunJzgOxeTEnaWphQ2ZZ+i+M04jh0kVKbPiA2/gwYs
 0bd+HrnNUKl/FIy7Hw/X2t033N0Les7RtP/b+Zz2DAAAA
X-Change-ID: 20260410-set-versions-no-current-release-da004588c772
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=433;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uLmusm6lJ1zwlnp/fwqmzH5wn7Br0e1K4DfTOs2868g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp3JzZmtgn8B3l4sUgMwYQi/PtIkX9ze7K0C6gT
 JBlmc/UnGuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadyc2QAKCRDRgEFAKaOo
 Nov2D/0XfVvSfqZJj2LcYifC36XuDko/MYqkcuSVSM2beHUM4b76ibf+AXyaEvGhcGaQa/GpBE4
 PcWFkkhwQMf7+KmH31O1oD/vETNRdXdZBt9nqnlNAI+wRNi76LM6kEfTEJB+7wntrO9ZNAhuf2F
 XuY+6x1k26IuT0/UQKVFz+X2bytNDicPqoH6OojNi2Ed+Q31FpzKXTMVTjPlIPEzcenPenz9ewV
 kaX1z6vktkY1fAZPwVZgyPGAOZ3/t7KVB6WNAOuApmue/4FlrrsrJ5dkXca7ygc7dkuBlc23HVS
 Kald8rDO8rfMqW07hGhZcIvkwQdRMMQ+Wqk1gVzkIvYM/WwedseiiIAh1CePY0pUvJseJ30RG4u
 bN4V4puPOaxtfrAhxyndejA5Yk07maBcccjchXfv5WD8kjTv60UzwMla9uWadgt0J3ZfeD/zzsQ
 bH2vucbE/uxeeFF7O4nXPWbybjZTy5FBdEVDdtl1wChnguTQ8KnPKiEhMfXjAE1t5Z3ojpNPrdF
 Wz9Vjs1agMRztW9xuPCHhhlvZ11gvlBWaujqFtcPaUtmPvdxgjS7gP/WEz4bnnNIArPs8jxeX1o
 0qFGGgnU34kLwZj01e8vcB1TbgS/Bj7Xl/SONehZP17LyLadxGwJS9QEchYEOhZz+Ch7JVgRAol
 MWRlBoiyjJUbIaQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9251

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      set_versions.py: change strategy for the default page
      set_versions.py: make active releases unique

 documentation/set_versions.py | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)
---
base-commit: 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90
change-id: 20260410-set-versions-no-current-release-da004588c772


