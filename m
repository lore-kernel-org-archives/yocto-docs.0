Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA486CA6C91
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6045.1769501968344162106
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IE86zHI3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5D16C211CE
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB334606F5;
	Tue, 27 Jan 2026 08:19:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8C27119A8684;
	Tue, 27 Jan 2026 09:19:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RcoZAVkC2xd1vdNzm9mBNhC9lv+3H3WZEMwCWoDNULs=;
	b=IE86zHI3rjq5byMRVA3WItjFP1ubpPDMrSghnDURbr7bty+kMSlp4vp5uBx6uQptTyBMfZ
	vaHDasdIbnihbN8X2NzjJJRAC5Hz/cBx9zlW/9HpCgGcgg5g5+0Dm68FlLsTCHe1BSZvVV
	aO6IgMaGnb45OouwdKzUYBoJsyYB6nF2B1FR6LiqwwyjU47IPhzGg3MMKbk/WDs+3oyvJE
	waz3OCrhvt/PXgJuhlvUnq7r0nIFzCv5H32d/5B3bZ7AcfY5kLgou9ZAXpWQvFATHJSy51
	5e3YpyWijEAkfCCW+r7pcf8y4jSvKbL4lWQ+D5Yv67QcVoDtDuuGNlm6KloAcA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:04 +0100
Subject: [PATCH v2 09/56] dev-manual/error-reporting-tool.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-9-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0eU4EKBkNs9mm4UTEc+aHxZz+sIAnPFWJKRuUrBg6N8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHT/NYCQW/HGwEg7EYApi9xNj1NtlqYPWjgBD
 g+hWQ2mhhuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh0/wAKCRDRgEFAKaOo
 Now0D/4qAbpPEETa6fTV8V6YltruhtfK4smNWjN9hTfsZihAX6xx9SFgtFb9DbP9DUcyzorqFZM
 gDGcRMeM3LqmeOc8/SAnKuNlyw5CMGnrhbWVsr9rUSVZcIlRk7gfgduT3iQmP2Vs8QPGCfE8/Du
 L4vtGvQXGwDS7/PcLUhGKSnNHBZMvuUZD1eSzCjntMJHz0gHt7KKjt/LZv2RI/pTJHAl3oyP2Dx
 LStMS/LijeNENLLrgvTM7WvvWA0NRl57EmSz8HGPlPS2lx6RTDugp+D4pQvXo7chfzdEcltkr+D
 oXK/e6TTQupG+Oie5NTzj0tzQuiN4TVM2mPLB5pzhuXP7WPci4SXBm09iydt7oi3ZdwlJDdUboE
 jbIPkMkUuh0z2Yq8IYc55Q8oMXpkH6FcypfxudqxwRqfk0vH+Q2cOB6v/BaauNlxl34G4SPvVAv
 DAU1F+VCplrSTW7VquI1v4pjpz+IO2SRGRi+9DOAGd/v6nuJE7qATgjSBzEx2TDAZBuZOYhwb8/
 jflj/itJkbhYDA/Y1zNXICuW8CC/eEd8fmptF409C7mGxU1KycUgTDletkMhnUE+TQES6cVAubc
 USW6HVwlrdOg/+Y+9epUwcI/47gxHqbmkJIwAgkKiUj43eOxYhHE9DjplmxmxHGpHpuXh5D4j+k
 o3uc4g4HWF+bA8w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8670

Remove the single poky repository reference in this document, after the
poky repository was obsoleted.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/error-reporting-tool.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/dev-manual/error-reporting-tool.rst b/documentation/dev-manual/error-reporting-tool.rst
index 84f3d9cd1e..30d1ce2b31 100644
--- a/documentation/dev-manual/error-reporting-tool.rst
+++ b/documentation/dev-manual/error-reporting-tool.rst
@@ -7,8 +7,7 @@ The error reporting tool allows you to submit errors encountered during
 builds to a central database. Outside of the build environment, you can
 use a web interface to browse errors, view statistics, and query for
 errors. The tool works using a client-server system where the client
-portion is integrated with the installed Yocto Project
-:term:`Source Directory` (e.g. ``poky``).
+portion is integrated in :term:`OpenEmbedded-Core (OE-Core)`.
 The server receives the information collected and saves it in a
 database.
 

-- 
2.52.0


