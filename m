Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1330ECE9D5F
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:34:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92474.1767713682755709992
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 07:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=W7SvbQPO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9CEF2C1E4B5
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:34:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A936B60739
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:34:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 804B5103C86DE;
	Tue,  6 Jan 2026 16:34:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767713680; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8AN7ri12/tUUfZE4Z5UxpXfjkmr9u78c4szDJY3eBKQ=;
	b=W7SvbQPO47i/oY03WvjncGsxSy7a4fDA2Q/f0KlXeixiIPyxADtoVEZGL4ALcznpGmlB34
	HjfVDO43cO4u65jX4RZJDBbxG7G8pIWa+ua4m42oTDcUWUi/SZ9bgveKEZe5N7cSHK63f9
	tgo6EIUIu+hb9iAWLGUIV2hxDXp0guQsy/kxc7DxCsjayv/+mN9WbxprE5urESly34eG8i
	0dSHoysGR4l+pYi9qrm6wzRuoxCwQACjUcos/1+M9OD000dTnxy1v81K6De/gFw73WSdWM
	TzmzrmndnEiwawczzMNGmh/WXvGNM+c7cPcLTSYkN4TiR12+9U9QNSSv/qr69A==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Add a security manual
Date: Tue, 06 Jan 2026 16:34:30 +0100
Message-Id: <20260106-security-manual-v1-0-500fe611a4d0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYrXWkC/yXMQQ7CIBBA0auQWUsCpGmDV2lcIAztNJUaphgN6
 d1Fu3yL/yswZkKGq6iQ8UVMW2rQFwF+dmlCSaEZjDK90qqXjL5k2j/y4VJxqzTBuyFaa7tOQ6u
 eGSO9/8fxdprLfUG//zZwHF9TQMDucwAAAA==
X-Change-ID: 20260106-security-manual-2dca7f999441
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PhQn0s/lD0Cr2AKcbMMmLsceHp5UAK4v2zn6bOh2T8o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpXSuOD/1yIKqG+AEH3xTsaeDvtBtKfO1BL1txT
 /d9fZl/rOeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaV0rjgAKCRDRgEFAKaOo
 Nj4PD/sEngxVPPqFLKaxTgYi1EJ1B57Xk0RlU4eXBfV6uHrLthOeItptiL0wI3PdZ3zIYTavxvh
 M3ZAnn8/camnz0fepUvLd9qCOTtW4+NU1vThffc9uLfjmK1KizcS4Q/1e1aTFgJmdAFu3i/aRJp
 C1u/wih9g5/TftuGr8qYisBCjnb1UHjN8tcBLxLo8hTEfFnirG7Pwf14f2jdBZS6cHjOSyDZTZd
 4HTvP6bnQwoOTcHzSBz1/pBsRmLfdNbee4aDoe7Lm8ikimO9k6fpvidIgbzUiDHGkYnnoIL1QKl
 Eh854yeaixT5Fz5PInm0QWU8YNr24f0XnOFZWZ8UoRxyhc0zxc7gy/ZhnhWj1LGIrxL3r2L6nHT
 WITCyFZceqDPh+Qf3emBEvj4tZR/EYx17EMcOtUoMpK93LvimJ2QnXYgioYlx+nzb4iAb3wlmoR
 Tbumz24lbR4UwKo05DlMMlaFJAmYBTPKk0opDoVRoWcfCwq/ijSPe5nex5BfIFgXZtHo8UFNR0N
 Dr/0DavVhj+wFB6wITf5JD21IYU3Bz+bTCugvQ3Ce4ieLLbwiQvEhY0CXLa0t+gregfhdY2Wuge
 0+MCEzBWFHcvwjSOOeYGJcw7HLkQm3cBvk/roEAl7cp1Z4TfB5MiasdVBiDOR/MXos+wIHvniZv
 7zTtb/34cKpTDJA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8397

As stated in the first patch, this section of the documentation can be
used to collect best practices with regards to security and the Yocto
Project.

Having a dedicated section also helps putting security to the front page
of the documentation.

For now, this series only moves three documents that I could find in the
documentation that could be considered as security hardening or
vulnerability management.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      Add a security manual
      Move security related manuals to the security manual
      security-manual/securing-images.rst: remove old links

 documentation/contributor-guide/submit-changes.rst |  2 +-
 documentation/dev-manual/index.rst                 |  3 ---
 documentation/dev-manual/sbom.rst                  |  2 +-
 documentation/index.rst                            |  1 +
 .../migration-guides/release-notes-4.2.rst         |  2 +-
 documentation/overview-manual/concepts.rst         |  2 +-
 documentation/ref-manual/classes.rst               |  2 +-
 documentation/ref-manual/faq.rst                   |  2 +-
 documentation/ref-manual/features.rst              |  2 +-
 documentation/ref-manual/variables.rst             |  4 ++--
 documentation/security-manual/index.rst            | 19 +++++++++++++++
 documentation/security-manual/intro.rst            | 28 ++++++++++++++++++++++
 .../read-only-rootfs.rst                           |  0
 .../securing-images.rst                            | 20 ++--------------
 .../vulnerabilities.rst                            |  0
 15 files changed, 59 insertions(+), 30 deletions(-)
---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20260106-security-manual-2dca7f999441


