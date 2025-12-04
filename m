Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76599D20695
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:36:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43527.1764855408074003606
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 05:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Z4KuD6c3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 233941A1F3F
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 13:36:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8DDF6068C;
	Thu,  4 Dec 2025 13:36:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13ACD1192255C;
	Thu,  4 Dec 2025 14:36:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764855405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=igo2Quw7Nmwgvr8TI7Pfry3N7KrINE9Xl2jt1jSKQxo=;
	b=Z4KuD6c3iaApvKiR+X4JXbGcJGOL5jFN+RyFQ92s53L40Oj7/J2TfYxy6iF9RzVQZ4TcRX
	JowHRhKNbEeCbheRrMEa33eNvSau3iE6M3nTKiM8mXIXotQ8lg0NrqXOiHOYa/N6itFoOY
	3O5iy3lrVVrU7muGtGU/CRTMXeN28X065c8FfKkb5r7KhtppxfbLtx9eQ8L+Vj8XpXpGCc
	7IrO7AegY/Ofscq8NxBGufYlvHnLl9DSgGqP3P5r4JoGJNwXsJInieCAg/TbB8syhTpClX
	ToMdnwKL/H+DhNjFRRx77L4ducQKe6/eH5E9zfYmUgvsEZaOpaRNJ57ogcSiMw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/4] Whinlatter release updates
Date: Thu, 04 Dec 2025 14:36:37 +0100
Message-Id: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGWOMWkC/3WNwQqDMBBEf0X23BQTK8Se+h/Fg27WusUayUZpE
 f+90Z57GXgw82YFocAkcM1WCLSwsB8TmFMG2DfjgxS7xGByU+oUKtBAjZCaJ9dEEtVVxllytmw
 NQlpNgTp+H8Z7/WOZ2ydh3DV7o2eJPnyOy0Xvvf/2RatcWVuVukDEwl5urfdx4PGM/gX1tm1fm
 N5aeMIAAAA=
X-Change-ID: 20251202-release-updates-f92d8ed85b2c
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tKwjIBtDxxQ4X/EeqPRICzjuKLTnU/+/eQpt7bQ+sSc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMY5rcabW21IyeWheAd3CliTbFtAIwbubYnVd9
 4iTVwmfmzSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTGOawAKCRDRgEFAKaOo
 Nj1VEACiOLpKqSszHN7tTp7V6qBqXQCfqef4erEOHXhwrWtSJmp0GpJBsoCORNkeo2FlP1in6GS
 a3NToIEKEqwt53YhYSV5XXklJ8pOhi4GAB9+kQ26205uZnaQc6isuDnbAKDh8Kf1gea6VUZLmkm
 G5o+9TnrjFxF2uYjfpDHNFdwfXKHFD5mGAj/Fyv4VftL3v9KDtOT0DCre23JqrdE46iEh9Uks3B
 I1LaMjbEvuj9pXRgv+RKcmWKiv0TY78ssOWGmj36xKZODX6DK59FKeRR2HhtWZSy33vuCfVawWA
 bIh4RZkeDJTn2UMVB3Gvq9KTk+bBsmpKwFAbWagtbdY1wfIra+iXTZLWYXdWzYoQlvbk39hOL2K
 zoPd8hITtmDa8ESv5jGZLQ83DtzbaCnw3AKsyIPsjhl3Ks4hn6G1+6ay/x5985KAYlr5AiDJDkv
 npmIqzN/KfU6DWAkOJtoU8wjk87ArscDkMFH2WNWgb3T81yB65yZoOQq7PXDCLRKaKQii9VV4nf
 1PDsqZWxubz8+L2tNGpoksg+Mby+DAQ5BsxTrKmTSM3Mug/wuFuy8PVrXxwcpc77o9Wz2CGK4YT
 E9fnEOMe5sfeRy/kZ+U2vdjM9sCm/093XD3qLtunUIzrGWRPKEuLMF6UboWJY1725re49I6g4k7
 FI7NjXDeopdUCSg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 13:36:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8216

Regarding which patch to merge/backport:

- The first patch can be merged and backported to active branches.

- The second patch will be backported to the whinlatter branch once the
  release is out.

- The third patch should be applied to master only when the release is
  out, as it depends on the tags being created.

- The fourth patch can be merged.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Few fixes after comments from Quentin (thanks!)
- Link to v1: https://patch.msgid.link/20251202-release-updates-v1-0-889513ccc384@bootlin.com

---
Antonin Godard (4):
      ref-manual/svg/releases.svg: mark styhead and walnascar EOL
      ref-manual/svg/releases.svg: mark whinlatter as current release
      set_versions.py: add wrynose as devbranch
      poky.yaml.in: split automatic and manually replaced macros

 documentation/poky.yaml.in                | 15 +++++++++++++--
 documentation/ref-manual/svg/releases.svg | 16 ++++++++--------
 documentation/set_versions.py             |  8 +++++---
 3 files changed, 26 insertions(+), 13 deletions(-)
---
base-commit: 9d394db4f88b66500e4d5a2a518d25f08a0c9472
change-id: 20251202-release-updates-f92d8ed85b2c


