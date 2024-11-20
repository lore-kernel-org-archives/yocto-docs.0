Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D44DD711B4
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:11:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15735.1732115456473839681
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 07:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mucYGFpK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB6CC240004;
	Wed, 20 Nov 2024 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732115454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wUqy8PdwW2MYCHdcVqQSSTCGnZJMSYTRKALt10B5nYA=;
	b=mucYGFpKW19mEo78A6sW2ScvFibaw7DbF11vTgQssTCBZ5qIAtb9Hzig1193xUf3M+ZbFX
	Evg6INTwRH+O4SoFhl4y0rLz2KBzPBdd+XCLFQKEnKxhFX6d9eFNrYnCbOEMY8Ns86G9vy
	/1aN0qCyg0tyhx2gmZeIBM92rW1uHA4okKHwrQkypMpmVNMQlG+ECYXosPI8MAvYpm8oyq
	NtRyrvwANpGzQCLDbC0qSZXzKwAZGHkKYqoR7OG51yyIfHlTZ6ewSKAx+ABE7V3q4SsxDn
	1DznTVmhw816CoDAABaM8OxtlOKmKsTrxTN8Wy2BKOsRBPShki/lAnPhhOJZiA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [yocto-docs PATCH 0/5] Update the dependencies in poky.yaml.in
Date: Wed, 20 Nov 2024 16:10:33 +0100
Message-Id: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOn7PWcC/x3MMQqAMAxA0atIZgNN0aFeRRyqiZqlllZFkN7d4
 viG/1/IklQyDM0LSW7NeoQKahtYdh82QeVqsMZ2RNbgFdmfgnwsyBIzEvfOzzxbIge1iklWff7
 jOJXyAeeAI5VhAAAA
X-Change-ID: 20241120-update-doc-deps-1d59abdb2119
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FFZxfjXzNzEKOi7cb4sDEra47syjuX45C1r+lPuU3SU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnPfv94AiLK2uJOPi7mSsvvLTwMvSk5YW7ojF6r
 n7BPUnJOIyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZz37/QAKCRDRgEFAKaOo
 Njs4D/0Qhjbn6vD3rBso1UEaVTD5OJsbbUHpERwD9bcye+89g/qP9OylxDiTp9JK1pcbVvzH4hw
 ig6d/4F96mnKEaREBAU6MKeX5eh6eV4ergJUzCF6e134jYgcrXDh8Z63O9o+JEhGzSgBUVzIuKo
 XU7Nzwix2Ja9TQ4jnmKFrhnDZwO4gCg/dMdeHpwgp3wVaEHGfjpS8wgRHVZWesHnofpLKIuRjLq
 O7ujFOHLkJOHw3bCx4FWH7yfqJ3VepT3BdtUjyIzlRPiWgiuvhAA5fW4WgccE6fNiXwF9uyC6AF
 52CUGum5BR1C9B7wAX31SxejXve/BE4RTybGnSSUV7LkHOtmErzUqPNfrzhBJuwz66OljkwWQs0
 ThGGtaJ8rqofe0SY6Ij0IhW+UI0QhuAacYwHEAKKUmeNinqPLWkQn3JwphZuv+ua6oGuWwPFDR8
 xry2NJFd1AN0A9/nOV3x0TFRGyrgVnQUrl+zSo60tzm+jF56GSAW1Bj5lZ83nyE/fjxQIBWkVpu
 ydyEcQ+jNVzFDjHgbh+Jk2EjP3rg4ZrkD/nNURMO4T22v426rkZGrh36dykMIgayLCbloYyk1Yd
 2BvQM7mQXY9JK6anGOIsb26Ik/kt+7O8re3uBxBe7rAZbsbdd4FdK9p4WGwqDWD8WsXDubYjANW
 6xfK9kcbgk5X0hQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Nov 2024 15:11:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5776

This patch series aims at gathering the dependencies required to build
(both the image and the documentation) in poky.yaml.in, and updating
them with regards to recent changes (PDF, Epub addition / switch to
rsvg-convert).

Having all the dependencies listed in poky.yaml.in makes it easier to
track and compare them across the different distros. Also, these can be
reused by scripts (note: I am working on an RFC patch that uses these
variables to build a container image ready for building the doc).

Also, add the dependencies required to build PDFs/Epub files. These were
initially listed for an Ubuntu 22.04 docker image I was working with,
and "translated" for other distros using https://pkgs.org.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (5):
      Gather dependencies in poky.yaml.in
      poky.yaml.in: replace inkscape dependency by librsvg2-bin
      system-requirements: update list of supported distros
      system-requirements.rst: add dependencies for pdf builds
      poky.yaml.in: add missing locales dependency

 documentation/brief-yoctoprojectqs/index.rst     |   2 +-
 documentation/poky.yaml.in                       | 309 +++++++++++++++++++++--
 documentation/ref-manual/system-requirements.rst |  57 ++++-
 3 files changed, 332 insertions(+), 36 deletions(-)
---
base-commit: 4d833d0a5f3ee741bc7e603c6316786903df335e
change-id: 20241120-update-doc-deps-1d59abdb2119

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


