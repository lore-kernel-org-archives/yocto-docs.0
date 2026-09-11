Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71140C88E58
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:36 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41374.1789138586597053686
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IE5YWiRE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5D315C653FF
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D4AA601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0E0B11C7AFA5;
	Fri, 11 Sep 2026 16:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=TNs35nGAVGa2Ylr8ZTznpQOl392vFtZjy7ammTibcew=;
	b=IE5YWiREt65YhtjWj/M/ps7mvCPoqmc6vm0e1wtaDRNG5Gq9+mWPbVbzAhjgS5B93N0wAL
	goMlRyKBvOQT+6+IffBhkMo9cafixZ1hJbIMtkYj4YKZwMlRUjMYSgnvFlRwUvy9xry/if
	HV8tsh4pqDdiLmuc80W0yeQX61SUz6vGdVpj9xNNm5qVflAT8sUY+nBfSUzX1eBUee2ha+
	AQ7Qkg6TZs0eFCPmN9j07F9O9h1RK50jPT92V2gRcvCfCbUFjxN1933AZ17EvVa/U/UzyI
	J006wFZTJPT5E8BzQ6wYZXadpoapnbrP8EG5I4CiQaH0HK16c54txPsZxjubBA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/10] Assorted fixes and additions
Date: Fri, 11 Sep 2026 16:56:00 +0200
Message-Id: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDUxDaWuIhbUYCyQDiIRd1csv
 7z87wIhzyRQRhd4Olh4mQMwjsCNzTyQ4i4YdKJNYhFVI7L4jTrV80miUo2YWZPnurAQotXTN4S
 mqn/L3k7ktvcF7vsBArb5ZHIAAAA=
X-Change-ID: 20260911-assorted-fixes-421159677289
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fy0duNRAtrzkfByIcGQgQbz/TUlcRKQV2Q39OAUw4k4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaULGFXTKsKpGOAymqMEwpXar8tjr+EQulhe
 +Lg1LVt+xSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlAAKCRDRgEFAKaOo
 NoNdEACtR8mHR9vW9KiEsUdb/aEsW8Hl7+xlvpDfpFAb40cp10Id49V77ZCT9XjRXSLzSOZa27M
 QK1R10Mm7V0NWwx4hrNw3SZTVCfy0vV1+2+8Fj1tMBGsy4ouwi+uI4WU2FxT1aWklgPTv9VwRSG
 /CUAEpxWiObc9wMdhL4O1v5Ob8Y07VSqz4qA4SUablZrwWfwV+wu9YPvEwWSq/+a0GvT6vRjw8h
 nCLRlIBIYyPCS3/R9VYGr6GnulJMctZGW+5gBs7Rd3sIOoZWHQ3z2cJI/QJ0sIeG+KgBUtkQf0F
 qmEeLDE4R3IWIVpC4gp3LzIwrb0QDLPM8nBYWWjoXdm3ctJJkvOVw7zYWqXiSPA3Up6GXlppCaJ
 7IE0wfqequ8AW0TWkMqQ1eItmlAfYgKsZ0qDN7UuyoVnwJpQ1fMhcEv28J7M7d3g6haotNxH+lY
 5LtpvX75oj2cQcFNzYqNBdcCoXdBTZQfIU5Aswirb5JTXkwjkd89vseLVzVs8GdtaqD1z45vNCx
 kGQM+s/9JghQs3wYWVEN+C9W7wlGLIN20WWtccjXo/q7jEaqKsme1Lo1UB2dC0HekZc+6cu5QG/
 BgftU485wkgY0y3sT0Lb9soyTMYV5+yoEUOQDhX+2Ra9CYjWFanPWOQwX0gGH8RMW1y3ugKt+Nh
 ghPhT8TYWFD4H/Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10454

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (10):
      security-manual/securing-images.rst: remove "your" in "your OE-Core"
      bsp-manual/bsp.rst: fix a "local.conf" -> "layer.conf" typo
      ref-manual/structure.rst: fix a "local.conf" -> "layer.conf" typo
      ref-manual/varlocality.rst: mention built-in fragments for distro/machine
      ref-manual/varlocality.rst: remove BBFILES from local configuration assignments
      ref-manual/features.rst: add tools-profile
      ref-manual/variables.rst: BBMULTICONFIG: fix a typo
      dev-manual/poky-manual-setup.rst: suggest use of fragment instead of assignments
      ref-manual/variables.rst: fix local.conf.extended obsolete path
      ref-manual/variables.rst: mention built-in fragments for MACHINE/DISTRO

 documentation/bsp-manual/bsp.rst                  |  2 +-
 documentation/dev-manual/poky-manual-setup.rst    | 10 +++---
 documentation/ref-manual/features.rst             |  4 +++
 documentation/ref-manual/structure.rst            |  2 +-
 documentation/ref-manual/variables.rst            | 39 +++++++++++++++++------
 documentation/ref-manual/varlocality.rst          |  8 ++---
 documentation/security-manual/securing-images.rst |  2 +-
 7 files changed, 45 insertions(+), 22 deletions(-)
---
base-commit: 091c7f30110c019cbd8bec3cdb14b328e333d49d
change-id: 20260911-assorted-fixes-421159677289


