Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33712F55805
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:52:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15789.1776678750075665234
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 02:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=im4KW1C4;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DD6BAC5C990
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 09:53:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BCFC5FFA5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 09:52:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAAF610460BFA;
	Mon, 20 Apr 2026 11:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776678747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=2+0ZpPNxGnzqHAa8vWJueEb4TXHmp+D1M09EwGbqO0Y=;
	b=im4KW1C4Nh1PBrPgaaBNgoKYZ4n07dWl9t5CCngvI5W0Wgsejvu5eNNhardru6zfOxKzQI
	PRxQ6Zr5bOjKsU/n3+b9MK2/ppM/GJrInFhtzdXsqnb9xT7+/joNVIF/BlvG41zFerPF3D
	MQyWUXDif6IorVcPlBxygv5sXeiuV9iSYjHF4582PnyQCcOq/lc4Xu2Gc0ex2MXiPpgdye
	iLM0ywzgEOEL90dccNVjKoppujpmxDctE5vreaawSP5hFVKra0dV+FVyUYs/2rxYVku1B6
	RT6+UaAfqbZhn4iSUGSMHk374Y+GpeptQuOvCZen6WFDVEbxKcdw1wISvS0u4w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] Updates to host requirements
Date: Mon, 20 Apr 2026 11:52:17 +0200
Message-Id: <20260420-python3-websockets-requirement-v2-0-a273a01a6f44@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6tqbUguDKexgWUqYyKh1sC0oId
 7fgBVy+5OW/PzMPDsGzUzIzByN6JBtB7hKm26u9AccmMpNC5kJJwfsptGQP/A21J/2A4LmD14A
 OOrCBq6xUKhOmaErJ4kjvwOBnC1yqH/uhvoMO6+pqtOgDuWl7MKar93dsTHnKZaGV0SDNMc/PN
 VF4ot1r6li1LMsX62zGVuAAAAA=
X-Change-ID: 20260420-python3-websockets-requirement-4594450f8d92
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=967;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=nDcmSafTcz+aSAMcV6z9ao7LAC9EVtBfdbCsH6kPBTI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp5fdZ/Q8Yh+t0INqo8z52HzZhOh6BIAtD1urnb
 WONl4eehCWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeX3WQAKCRDRgEFAKaOo
 NvPFEACswCJegU7JsumVIQigVdBJTys+7WN73oSMK64tU3gDDlTfjW+1vULFxuOzJsrKtY7Qmju
 Nh7/jSCzGqSS5TyU5qe152R8iM4rEYCque6W4X4ms9+7aEBTyKXUrfSloXN8tvtky8z6ZTKHMhn
 OA5iDjOH7hnfixjUdRgDkpUAKGY//4tUcFYxJoOos+Z/q/SEvQ5kCP8XYwSVdhUsTRKALdbNVRr
 ImFAxbFYRM+MO036GIQBa+U5fYvQJieladWFZDpHJDHYrwUIw2CX5V1eBiIxvc8DqjSaQiUcMHg
 7mGePDh/uYwW+7S8Pt5yxN9erGBHcemPBxqjuUqe7I/hXLOhQKDn81LsQq/FZHfB10xULWVIJGZ
 khFhpvFCGiugjPFw0VMub/sEHwS540BqBjIEq+jCDVp6BlsaHllAcGZObB8GPNwD5Eg+s4Gz9sz
 X+1vGmyXJpvF5w/OqTLh9Kww3P8a8/rhDhEnlnWrlopoya9tGYaMVeDSqR5JtJbZwpCbLXBj4NY
 mSggXXcMnvRxogomFM0twMRdeiOHy5ddL5B3PPzdNHswT6O7t4WHWL6keAquniUSfDNEc4Obmhs
 tYytCUV/DqtyNiVsYjzCeCH45TIhE1z5rYEykpGcERrTY8NPvp733MFpQH/dqJ6IQTdYCSkKr0F
 phAeGhJQaa/3Zbw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 09:52:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9283

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
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

 documentation/ref-manual/system-requirements.rst   | 33 ++++++++++++++++++++++
 .../host_packages_scripts/fedora_essential.sh      |  2 +-
 .../opensuse_essential_16.0.sh                     |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: 2c12ec7bf29aedeacf82970a9d2eb262fde4670e
change-id: 20260420-python3-websockets-requirement-4594450f8d92


