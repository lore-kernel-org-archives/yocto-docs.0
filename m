Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2427AD42BAD
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 16:48:59 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.91634.1731430136836317121
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 08:48:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MSJHOsx3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FC5C20002;
	Tue, 12 Nov 2024 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731430135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tuy4alcM5EuUZ1GTqavEXUCpGTEh+cuukk8+KkTyV40=;
	b=MSJHOsx3lcMLbwxUIMYtflp1dLRajkbRFNQUoqah9OJTEZHdxQMhMQ+MtHkSUFZpw/dfPn
	dHdXEIAepCclEAaTvveJMklyNxldmK+KPdCgLAwf+pIFOIaRm9rR8CfuU4D7zc9sgG61YG
	4m2ah+GbvRjPw8CijwHSdGpGBdLTwCXQ/CBOr/4Bx9KHhhbai4bOH0V7mu1ingd++3OgRp
	5V8akNcbholB+o7m6f/6RuC+F6tJ3yWXwCoQNH8VFGcSvkIowr4rtgtLoHwMPCvJUM7PaC
	B9+EnPXSjc27x2z8fnKI0pyCK3hRGZkIOws/98kwiVUJvyHzj2lnZ5DTy4JI8A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 12 Nov 2024 17:48:44 +0100
Subject: [yocto-docs PATCH] migration-guides: 5.1: fix titles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-release-note-5-1-fixes-v1-1-6f4eac19810c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOuGM2cC/x3L2wpAUBBG4VfRXJsy2yF5Fblw+DGlTXskJe9u5
 /JrtR4yBIVRkzwUcKnp7iMkTWhce7+AdYoml7lCRBwHbOgN7PcTXLLwrDeMc0zDKEPl8rmmOB8
 Bf4hv273vBxqdIahoAAAA
X-Change-ID: 20241112-release-note-5-1-fixes-3edbc1b623f8
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lyER2dWI0LG7dn/w3c4kWrzHt/6luN8vCcj+XCwtnj8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnM4b21bpxtjTSaefnhCO4AloQfEBzLf8rk4DQD
 a5BmUgS5UeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzOG9gAKCRDRgEFAKaOo
 NkPUD/9THGPlNzE8asgGEveEImiubhVkMbz8nZFSWDGTmVOZdmE3/CjXx6F9jlaD6/dbsH2alCq
 5nzyhAufqzLUftHapJyaKuplQB6NhXIHkLqwM2ZnxrJaoJaJJwbA/e+/OyRAr7y/jb5aaHI+2RD
 QJGzkx6yoDtzbNSoeB8Cqd7gUm/E/B+h3Jar8CJpXtmFKiJOH2MRLNc+pLXHSi7SPky+JfF3SPI
 PIgwhs1BQMybN7lf8KT89hfxcTs3RGaWOijBJMDwwgLbixqL66YN2RUgsS0Az1d68He7w6DrD/T
 4w13F0jmIiYD/GqhgSXoMax9e+D9mSm+FENfaGd3vPvUKLFW/Gftj8mZBS7j2yJmu4rrFcQ7g0Q
 rVdB6ygylAk/Fv/V0IWNmbahuIxeCEqulKFOeF/EQ1zTToh0IZxtlMzJ1Q9PwKkOS3DCgFz2g4G
 tlWx1yG/frpBypoHSegccGFEMX4MyJfeIGYKBWuWzlYLE6J8MFZfcGLKrrxibYHvP6Qu6RYf5RH
 CdcWLnStugs1H5WOTvN4LShjyd0ku4x/2zN38FY/RAbmDdOw2i5a1ApdVYQPpvYk3PKE4VYcDvV
 WlFhcaLafOf25M+zykhynpqnUPSYq2DUNgX5TYPnYLbi1AErytQ7lhr1Y0YiRNrWS6iDAdVR2Ay
 wbky2sOYgMmr2pw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Nov 2024 16:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5717

- fix title underline
- add anchor for workdir changes
- supported-kernel-versions was misplaced, move it
- "Miscellaneous changes" anchor was wrong

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.1.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index d3c28f8b34216f32b0805da7412f3e8dc109d01c..c9bb38699b4b26d76ba9a05607b4e0b969ddab28 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -4,12 +4,12 @@ Release 5.1 (styhead)
 =====================
 
 Migration notes for 5.1 (styhead)
-------------------------------------
+---------------------------------
 
 This section provides migration information for moving to the Yocto
 Project 5.1 Release (codename "styhead") from the prior release.
 
-.. _migration-5.1-supported-kernel-versions:
+.. _migration-5.1-workdir-changes:
 
 :term:`WORKDIR` changes
 ~~~~~~~~~~~~~~~~~~~~~~~
@@ -71,6 +71,8 @@ it does not work as the debug prefix mapping doesn't handle that.
 ``devtool``  and ``recipetool`` have been updated to handle this and their
 support for ``S = WORKDIR`` and ``oe-local-files`` has been removed.
 
+.. _migration-5.1-supported-kernel-versions:
+
 Supported kernel versions
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -189,7 +191,7 @@ The following classes have been removed in this release:
    adding minimal added-value for a considerable amount of added runtime.
 
 
-.. _migration-5.1-qemu-changes:
+.. _migration-5.1-misc-changes:
 
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~

---
base-commit: 2849690abf94872e259e712128e90413f3b9a2f2
change-id: 20241112-release-note-5-1-fixes-3edbc1b623f8

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


