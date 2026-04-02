Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E390CC6B27
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 08:13:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10990.1775117626041337913
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 01:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yrF6FmUz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 029711A30E6
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 08:13:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC7845FDEB
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 08:13:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E9031045033B;
	Thu,  2 Apr 2026 10:13:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775117621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dKG6gnRuepHegkOcEO9FsMPJFVuuvu8DZ2gaukVXa1c=;
	b=yrF6FmUz3wtnKrWtGWhaeoOPQqeMdBztixENQrBV1BSz0Inay1i+aqcZwOdrwiw5g9iRs3
	OAGobU0JXdNzWJyyJ+nv4WTyBKwy6IYNEUAGMQ+lACGbMP3HOtrSWwo2NtmagTiIH7kJYa
	mGCO8r8uYjTXB3qW2F2QPurAsfeN13vN9XZUsFb5RzJkU5zvFEflScljAcBdXD48YEEqSw
	D2pBFk10ubr6XN2uEX2gRJ7NPQEqDR1Yv+LoSEpQuOrjFtJ66I7aMuErewfa6mY9j2jAYx
	YD0JT2Mn//XZCsBmDUNSEu0Ca3qHBKaalkaHr7ZdSbbnPvYXHfoBPD0KiSmz+A==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] set_versions.py fixes
Date: Thu, 02 Apr 2026 10:13:26 +0200
Message-Id: <20260402-set-versions-fixes-v1-0-0609a8747b96@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSwqDQBAFryK9tmFsf5CrBBc6vsR2YWRaB0G8e
 8ZkWdSrd5IhKIwe2UkBUU0/S4Iiz8hP/fIG65iYxEnjKids2Dgi3Dvjlx4w7ttqkBqj1KWnFK4
 BP5G6Z/dn24cZfruf6Lq+caQC6HYAAAA=
X-Change-ID: 20260402-set-versions-fixes-a74b25ed253c
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=425;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KUUScG/AH54dx+jKuQOxnmkCaU1NlfVGxbGYzePgo1I=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpziUzYOOsEmEJ8hdyl4LbbHd4LxCOKwaBoxRYu
 ZFZtoUSX3uJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCac4lMwAKCRDRgEFAKaOo
 Nhl8EAC7JuY5trG+gtKENp1Io3KKW/yncfobrsihV2ilH/UwLng3jSeEUMc3Jd98dOr8eqZDyk4
 ZtexY4lB3GUcqbzevO24RkfjydZ+11mW/C2PSoqWOpCYlwvz+L7I9fMq9ovtA004eUQuzJZ48AH
 Hz+n/0nGILXeKP3S22Ow0qXv/4KWBaYS4WrRKN4PEnn65+ZV9MMx3vjinez3bJY5Ms7zKQXhJFv
 HfWccJWGh/V3DwSOLZu6Dl/QfQWJaXVmadMN2LSL7hJY6kAnZuqYlGkbdiSZHL1yvPVcPGFhAVx
 tGrR9kbhDY0fCu0tCrJkYcAs/qHIxjfuYo0kiV3kaiqweSFAuZUddS8D51pyFBhTWrlEN9GK7Vc
 xiUNxDogwENdRwkRYrJg1N+S3SqWKYLnS4skjXrwCE0lHoydNOH8jqCLTndfQM5XtrT+O1Sc+hT
 q/KMXXgZ1dSPqSgA28P4vHCKR1Etmn5QJUUqPySzzsGLPF5ihZDD8Gnw2WZ6WiUJtsn1qJsEey3
 tSGlDrROIkY8YG6gB2zp+XH0X2aWAde0ptpgfwEpwIxISYZYohyXLvvU55WpHhKzA0+d26hGIH+
 2+NPZaBeuLiYLRxidY3BNVbSuihcuvxrNHL/tebKgITmbub1ACUCs023MyA4J56yZ/d9+/XseLi
 y9U6YpHMdDvB7Aw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 08:13:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9157

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      set_versions.py: skip laverne branch for closest branch
      set_versions.py: fix get_latest_tag and milestone tags

 documentation/set_versions.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
---
base-commit: dc1574b9f71532c469f355af2ff5ff5664083e48
change-id: 20260402-set-versions-fixes-a74b25ed253c


