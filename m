Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63016F99C9C
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 12:15:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18173.1776687326728896984
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 05:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CeuXcyft;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 90818C5C997
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:16:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8CFE5FFA5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0FA710460867;
	Mon, 20 Apr 2026 14:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776687324; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=lih1V2HV9L0tveFIkbq8b9gbqnd55dKORQM4NBzGzz0=;
	b=CeuXcyftJWu6OV7GaajI3Vrve/B36dNA3qTSjKxqINFJ1zsDGwTO2OAfGg7G/XR0n8H3pL
	JRTT1jfIJnAEXLryMLuw0V6nGh0VtZpJH6nQvBN/HiZYp0zUuVhijFHtJZCWXLhU+YfQFv
	Fbp/1kBWmNFETMgQEI3JE/FJqAd8WzGLASiwx004vT5g9/EHD0aBQk/foQD+2f5p/DX1dt
	CahKyW5l/ViiKurPrT45zz9gEB5TU/YSuFqHT1zDDtouDnqrzDNN7G8ZIY/0xTCqVxRNie
	eBRMUz6/8lE5Icl9/QeA1CfVDgbSb5BbakQLKfh65+Bg7BDLWAvuc7iOhB5x9g==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/2] Updates to host requirements
Date: Mon, 20 Apr 2026 14:15:15 +0200
Message-Id: <20260420-python3-websockets-requirement-v3-0-22bfa3f411cc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOyw6CMBBFf8V07ZgylIeu/A/jAspU6qPVtlQJ4
 d8FXLnT5UluzrkD8+Q0ebZbDcxR1F5bM0G6XjHZVuZEoJuJGXLMuUAO9z601qTwpNpbeaHgwdG
 j045uZAKIbCtExlXZbJFNkrsjpV9L4HD8sO/qM8kwW+dFq32wrl8exGTe/RyLCSSApRRKEqoiz
 /e1teGqzUbaG5tzEf8TInCosEgrnlS5EuJbOI7jGziJMGYxAQAA
X-Change-ID: 20260420-python3-websockets-requirement-4594450f8d92
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=jir5T2kFFevZhjSEN3Q2g1XaxBrghEKTn+YqTC6LRAQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp5hjbKUSCebFHUFPm4Xwx0oaZ1VIsNtSEUykkI
 xXUnyy8o1SJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeYY2wAKCRDRgEFAKaOo
 NiPpEACmPn7rPqe6b+qgXv5sYH+5DLEUwS4P1LD/ygDQ+/fCg3YC93bgjBCj50MfzEK4QCeum6j
 kccZAI3hzDcmKQTZMHqDgEfIrlqHexOXg8ea2W3G2ykNFxe9xxQE+UNRiLv2dmsp+RflPex9Mhv
 ypaivecJm2fLEOzNOXOwyOjauukczPvxA0oQL4w9a8UPL/qWzmgZw6EYWp8uQzrc/7HJZfPZf5h
 XiP5qoH+++P6X+Yw+xj7G7PAv0LJehZ6PRuU1Tg9ydAPASMHY0C0+EoX+mhR6v2vQuwyUuawq1P
 aZa08scKyxjFZHJcALuduUy+A40SPO3TkITUY7Lvykmdokaq4hxZG2NoD8MbGAUeUIn5NzetOoc
 Mr38xsSj6WJd3Lhg8g/6swG2WJZlBp8FSyAiqf4/IIdKM7LiRlhkJtdiZWwQgL0Z/EgLtmOt3j8
 xOHIFeobaYYgnsBOWm7B5VQQcdlcxjPqYDIxlF4+u4YtKKh6q3MOJkqUd0hfgSH4+gy0NWdEULM
 22XDAOs+U65+/rfYb7L0gkkRI60amJWKozruZq/X/1fpNtS967SR8FRYdfQudU6pAeguMU51RCu
 aJAolsYxZxw9JyJI9UWeOM14ybpi94mMjCtjgyHCDoaOhz7uH9h28xRAaYpsWd23cU1Qq5NI9gZ
 KdPPtIHgRAPVhRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:15:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9292

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Apply suggestions by Quentin (thanks!).
- Link to v2: https://patch.msgid.link/20260420-python3-websockets-requirement-v2-0-a273a01a6f44@bootlin.com

Changes in v2:
- Rework this websockets addition, as it proved to be tricky to provide
  on older Ubuntu/Debian distros.
- Add a patch to document the buildtools requirement on openSUSE Leap
  15.6.
- Link to v1: https://patch.msgid.link/20260420-python3-websockets-requirement-v1-1-28c4fce2f766@bootlin.com

---
Antonin Godard (2):
      ref-manual/system-requirements.rst: make python3-websockets a default host requirement
      ref-manual/system-requirements.rst: instruct to install a buildtools tarball

 documentation/ref-manual/system-requirements.rst   | 36 ++++++++++++++++++++++
 .../host_packages_scripts/fedora_essential.sh      |  2 +-
 .../opensuse_essential_16.0.sh                     |  2 +-
 3 files changed, 38 insertions(+), 2 deletions(-)
---
base-commit: 5cc3b6690acf0c209514eae68006b1f24735302b
change-id: 20260420-python3-websockets-requirement-4594450f8d92


