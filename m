Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6929ACAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 07:29:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.5801.1758785357333538551
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 00:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=trqHwo75;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 621004E40DC3;
	Thu, 25 Sep 2025 07:29:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 365836062C;
	Thu, 25 Sep 2025 07:29:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B831D102F187B;
	Thu, 25 Sep 2025 09:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758785354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=QdUSg2MFlhVr4ohiHPmau1xB1KlPOAS/1Ez1m6Gyqwo=;
	b=trqHwo75yseNAATPZuluBRF0qeQBFgF2OBz6h3o1KXJWu8IzNAJN0PzpMDS3GyREWK7F46
	mbsDzuiXfm0VmZa3UeRpMiIHTlMFbz2ZBIat8Gg6kAulJ4xWXFHo+FVsBp6UNCxnx8rtBd
	y6enDCuRhHtYhW4Oc6NaIU82adTfjCwVPMs7+RICg6QfJPeEdI9EnOHO7A9opO1Az3H3U8
	JUgoWf7HWPD8UEAnce4Uyk0FbNLWQiKZgYS79hgNAMYiveAJwoVVUQnym5HU4WvXYZqlCa
	3BJBatlMrK75yypY263FXmE+BvyyVrlf2ce6Of85mJj8sIpN25tH/LoRl9c61g==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Add documentation on fragments
Date: Thu, 25 Sep 2025 09:28:52 +0200
Message-Id: <20250925-fragments-v1-0-c9f747361fb2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTv1GgC/yXMQQ5AMBBA0avIrDXRYsFVxGJag5Eo6SAScXfF8
 iU//wKhwCRQJxcEOlh48RE6TcCN6AdS3EWDyUyZVaZQfcBhJr+JsjbvUGsyOSLEfg3U8/m9mva
 37HYit70DuO8HGKLfsG0AAAA=
X-Change-ID: 20250924-fragments-bb3da11e23aa
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tim Orling <tim.orling@konsulko.com>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KpxJRpmA7Qk+f2ImXaQZFO9BbXIEDM0PozuABF0wPxI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo1O9ApFWGbKR89Q+FtNnG/Cv5StTOdqCYas1GU
 DVMNywR74yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaNTvQAAKCRDRgEFAKaOo
 NtMoD/4/9nYCW60UPtbxRW+5HPb+FyBDJmIldYMmyAkDGJt7OscqBGlk6UFz5ITNNJWZPy4WRNb
 0amCJfCj46yR/mbmJX9Nb0Cm+O7U1RmwhLgKwxUWCvkc0kospAJWzPp337iK4UrF4peLEvLKKXz
 f0rToU2rRs0I0VzwjfK+PC1Qx4IF2VhwgK37BMUx01dNGKW8Jc1tKbbtU8d/TOm4yeHL0VrBFeK
 klAWss+mZC9hi7wBjVG9qjmPuyz+222caxV98/VIm/9dKqeKyIE9xiq8m3VqIh+pKvgvShMx6hK
 jKCRFKXazGp3m3U3RWxVVDmUIndqR3VYRznZE8H7/iJxpgEeeT6MmwOHng74ROZWHEv9ZaAC4No
 InEeGuRbVT/b0tXDMaXjNT1TOYyJwpfxQZ0w5Zk7KXUgCusp69upcHgcIZSheCnzcuV12rKZWp/
 skKw8GSUnMsNviMkjHiHytYg3+FSIb/Guv7HrCSeSf/XQZee9An8F4uP+wKn2qCChbNObUBwKWs
 Jigwiim4FBsg3nu5VgOewR6/YTBONL12iApd3mu7zyGc6hyjdjuZuBV6O19xz+cwwwr1Orruq7y
 7adhuRRWiih55toYAuzb/MRG9/BzYPF+pGrgrJ4ghHr0Z4x4HB9C50C1xtk7VV46BauNd8pL63A
 +Y22ALzJQsX6ebg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 07:29:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7591

First patch introduces doc for auto.conf, and the second one adds docs
on fragments.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      ref-manual/structure: document the auto.conf file
      Add documentation on fragments

 documentation/dev-manual/index.rst           |   1 +
 documentation/dev-manual/using-fragments.rst | 101 +++++++++++
 documentation/ref-manual/fragments.rst       | 249 +++++++++++++++++++++++++++
 documentation/ref-manual/index.rst           |   1 +
 documentation/ref-manual/structure.rst       |   9 +
 documentation/ref-manual/terms.rst           |  73 ++++++++
 documentation/ref-manual/variables.rst       |  32 ++++
 7 files changed, 466 insertions(+)
---
base-commit: e77139b5c616e6e5ad436eb91416fd804389425f
change-id: 20250924-fragments-bb3da11e23aa

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


