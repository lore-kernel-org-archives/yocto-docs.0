Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67B4FB44D8
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16362.1777019332613649099
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=r2DpJkha;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 40A234E42AE6
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDBAF604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B8FF10720728;
	Fri, 24 Apr 2026 10:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=q4RPFjZ3kL5RbEoKoVaGjO8EP+z46xtwtgCcJSjVkcg=;
	b=r2DpJkhaLUKV+WWp373FW7nVvr78lCz+PKAtYWueBOgC2/Iiw+u3uOZsQD6JPRu00clV1y
	1f8JEJjl5p1Cf3K77W+WC6mCayM6ten5Ff7OCYAyYP7Hl/kdb5Jd8UR0842A2G74zQf86t
	6OqKlvd6GXr3qUbjhVxeVqRC0EVBJKw6vSdFXuGwjnwhXX+bGvRG/6PYsmGQCDhviSvJdw
	6QEd2t+GNdRpQ5rJw2ZOHxCK2PaEkeG+bEJNkKUbibS+7e3EcovlbiU+779jA7bYrJZ9Gc
	trbANNJzz3vDDOA44pw8Xz/6y5HACS++wHtPlVoGiR2cfx/FPu68yuXVQaB1QQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 00/18] Updates for upcoming Wrynose release (2)
Date: Fri, 24 Apr 2026 10:28:28 +0200
Message-Id: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQ6CMBCEX4Xs2TWlQvk5+R6GA4VF1mBr2ko0h
 He3YDx6meRLZuZbwJNj8lAnCzia2bM1EeQhgW5szZWQ+8gghVQikwLDyK5HRxO1ntDYQB4VCiz
 yTKuhqLSmCuL64Wjg1/58ab7sn/pGXdjutsbIPlj33tVzuvV+FvnXMqcxhFKnnEqVlX161taGi
 c2xs3do1nX9APmBQcnSAAAA
X-Change-ID: 20260420-third-release-notes-6-0-754b6f79bbe9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3250;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=k6HZEkEQlIe7cRi3rbmozErcrKaYpifaLDuPxzDVl1U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym9CIDuUsty59ugixbwYUkrfvqmJ3ZcBB1AB
 5Wge/js5quJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvQAKCRDRgEFAKaOo
 NstrD/9AGllR+VNe747+BF8trQao+5oxM0Q29LkpYuxLHORFOKQufKv/eKVlxmq0CK7Y62JFqxF
 DOz5rkbaLeRCMND6OA36gQTa0sZVbh8TNmZRc1IKtxIU2z7NWC/jMbQp6RQTcWYv5tXwuPZnK2a
 UQ1ie0bIPMjNqDXk08g2qUb9Nw9uZlfMR64ymHJeFmELaUXHo0cua/CojGueYCAR8m6CP9F1h1a
 GDltnkCH1SdVznXXZqtPZ7CM08VySLbnqRnfZfr9OTA/TDIVKn2zTP41RAugTOoGCSw+XXXcShm
 ZL8q0SY3mV190LtChU6pIIFaXuqbpKmT8FkG78CLY6ywRlCnmB8cspcFxqnX897cJEFwShgEV/v
 DJufB4E03YruDF3NYZiJ0JJnwhYlR43bLUrbyGlfL2SdGwg8icxmg8FHROcoBaNR2RBA/UIYg6x
 a4wy4IBm33rKlOs3lg1edVOYYLd3Fmib2v4O4JV1CH28w89ZjAyR6s6Y1KxTKeohpxQBzdn/pSM
 b7DCM1QuQxgSvS9U0la7NDMgB6FaNbM0yvSILaLT2KTQeYEiimhOwwb3/w+JGE/RHUQxbRBONSv
 hLqxR0Bg5MhShtGBWMYDNVVYSc9jg5L8hLrYIv4Shk/pbCif0D4YsT7fGt6N3C/22dPLhSnQ96H
 q0ZHcRwAoezyong==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9339

Another set of patches to prepare the docs for the upcoming Wrynose
release.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Add back paragraph on Unpatched CVE warnings after 5a5162406ffe
  ("sbom-cve-check-common: print warnings on unpatched CVEs") was merged
- Fix commit title CFE -> CVE
- Cover recent changes to match release candidate
- Document the SBOM_CVE_CHECK_SHOW_WARNINGS variable
- Link to v1: https://patch.msgid.link/20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com

---
Antonin Godard (18):
      conf.py: add a :yocto_bug: role
      migration-guides/release-notes-6.0.rst: add known KVM issue
      migration-guides/migration-6.0.rst: document the CVE_PRODUCT behavior change
      tools/build-docs-container: add missing leap 16.0 in help message
      tools/build-docs-container: add CentOS 10 support
      ref-manual/system-requirements.rst: add CentOS 10 as a supported distro
      docs-wide: drop documentation for cve-check and variables
      ref-manual/variables.rst: document the SBOM_CVE_CHECK_SHOW_WARNINGS variable
      security-manual/vulnerabilities.rst: require Upstream-Status, not recommend
      security-manual/vulnerabilities.rst: refresh the document after cve-check removal
      migration-guides/migration-6.0.rst: add migration notes on cve-check removal
      migration-guides/release-notes-6.0.rst: cover recent changes
      migration-guides/release-notes-6.0.rst: add license changes
      migration-guides/release-notes-6.0.rst: update CVE fixes
      migration-guides/release-notes-6.0.rst: add recipe version changes
      migration-guides/migration-6.0.rst: mention python3-roman-numerals-py rename
      migration-guides/release-notes-6.0.rst: add contributors
      ref-manual/variables: IMAGE_TYPES: add new wicenv type

 documentation/conf.py                              |    4 +-
 documentation/migration-guides/migration-3.0.rst   |    4 +-
 documentation/migration-guides/migration-5.0.rst   |    2 +-
 documentation/migration-guides/migration-6.0.rst   |   96 ++
 .../migration-guides/release-notes-4.0.23.rst      |    2 +-
 .../migration-guides/release-notes-4.1.1.rst       |    4 +-
 .../migration-guides/release-notes-4.1.rst         |    4 +-
 .../migration-guides/release-notes-5.0.5.rst       |    2 +-
 .../migration-guides/release-notes-5.0.rst         |    4 +-
 .../migration-guides/release-notes-5.1.3.rst       |    2 +-
 .../migration-guides/release-notes-5.1.rst         |    8 +-
 .../migration-guides/release-notes-5.2.rst         |   24 +-
 .../migration-guides/release-notes-5.3.rst         |    2 +-
 .../migration-guides/release-notes-6.0.rst         | 1471 +++++++++++++++++++-
 documentation/ref-manual/classes.rst               |   78 +-
 documentation/ref-manual/system-requirements.rst   |    1 +
 documentation/ref-manual/variables.rst             |   91 +-
 documentation/security-manual/vulnerabilities.rst  |  223 ++-
 documentation/tools/build-docs-container           |    5 +-
 19 files changed, 1711 insertions(+), 316 deletions(-)
---
base-commit: b50e8d36bdab53b004711ebc284d8ce8be593859
change-id: 20260420-third-release-notes-6-0-754b6f79bbe9


