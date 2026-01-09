Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE48D167EA
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:33:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6747.1767951199881782365
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 01:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BO6p9rML;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BEE74C1F6D3;
	Fri,  9 Jan 2026 09:32:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D94C260734;
	Fri,  9 Jan 2026 09:33:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99242103C87CC;
	Fri,  9 Jan 2026 10:33:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767951197; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=auHeEGBg8Rp84MVKpCN4Nwgg2Gu8+RRghqWeVs9Bkrs=;
	b=BO6p9rMLFDaymvSlpP5buIVzHkCISvzx1wzES56u2YAfTL4HeHhBbv9GKqHRvEb3CxiYKG
	2DmR1kp0SDwxGz0dmY74Ro/bgL8sxYcRF/Ygo+C8vKslY39+ldgwbC5xUrCXTW7MxfcpU5
	BozPrsiVNsojgPnjK0Nc/LHbiz4M+mEOeFwhk5ZMgkkvCxlh35FhLc/Jj8IS8mKYh1Np+d
	3Zyw1Si16UzWFlgoTuoyC/7+6XPWBgQhLPU2QOcYNHcu7XHldaNY/tjr6yNJgrTZZ8U/tU
	TDVnK9rPCsBrgJ5K+VY2/SVI13nx3YG5dfzQX7y+1KVbSC2SFeOly+AJTCjr0w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 09 Jan 2026 10:32:59 +0100
Subject: [PATCH v2] contributor-guide/recipe-style-guide.rst: explain
 difference between layer and recipe license(s)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-layer-license-clarification-v2-1-3b7f0682df97@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEvLYGkC/42NQQ6CMBBFr2K6dkxbkwKuvIdhUYZBxtTWtJVIC
 He34AVcvuT99xeRKDIlcTksItLEiYMvoI8HgaP1dwLuCwsttZFKGnB2pgiOkXwiQGcjD4w2lx1
 UsuulPhs1VEaUwivSwJ+9fmt/nN7dgzBvyc0YOeUQ5/1+Upv339OkQEHToGkIla2r+tqFkB37E
 4anaNd1/QJJSIYM2gAAAA==
X-Change-ID: 20260106-layer-license-clarification-70bd02361f76
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Paul Barker <paul@pbarker.dev>, Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=QTkJ5yPYlVRdgemcMcJCtT/KXtv61vmTEg1m0dVwl+8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpYMtclo4pspOBKvPRacion2XAuIg7cONuGIBJ6
 9CW6Dd0dRCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaWDLXAAKCRDRgEFAKaOo
 NlVDEACQaBPxxhyDN+nOIPecnChQutz8kcqxBws2UjzfxeuFWmwxjoFlYeb4xvl4FpaXEsbhbFG
 zBcNQZpZuC1OmwAmwJs8xr9/ogq8qXL3I47tPtiJu0zLiXh6N9YxX0eNCUWaMe8OP0LoAg6aC6W
 DLuY2nKAfwM1xYwRWhA95Uo0s80IxenJdz/Z+bMlSv0nK7XF23TngH3hWgipEuDbQZrcqomelPU
 rSBb/WrBPkqgX46khI+z6lyatYY83X1dESx9RrqANakxczkpLSwhavUpJZFwKD3aSs4CDtgKHUt
 Twl2PRw/4PZ4ga3YCA2tykDifD5z2VKPYuv/YfjOcrHwnXQczsSuemnr8xtyVGEXY3NkaRpXRUT
 Vsx6ZfWo94FArAsj+Zod/P8uj3I2SFp81j/1Lb6f4k1WbX56IDufbP4Uq9qX5umBJ/SEF+m7ilj
 fZLeHgpC+W+DiHZerb9ixDefdyqNYmYwG03DAnJAFSWQdaodCUGkP3WenlxvDpJ8jxrb1TXbKKH
 nOzDpXqqP8CcMY7iSmC1IsZ8ibKtl/3bHmaIyoTBUYLNLakoOvmu1RFbiSEydXqCGvu0rVNIb/G
 tVDEIplOn40r0/mJJNTXqbsu+zefUSFYRdlX/t/DRvdPfc4h7N/4ajKLhG0cWRnhCWjA4KsPFbE
 KokxsBNd2wsWePg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 09:33:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8439

Explain that the LICENSE set in a recipe does not apply to the recipe
file itself, but to the underlying software. The license of the recipe
file is the license provided in the layer itself. Give OpenEmbedded-Core
as an example for this.

Fixes [YOCTO #14410]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Apply suggestion from Paul, thanks!
- Link to v1: https://patch.msgid.link/20260106-layer-license-clarification-v1-1-99c69ec1a878@bootlin.com
---
 documentation/contributor-guide/recipe-style-guide.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 806bf2384..464895212 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -221,6 +221,20 @@ Recipes need to define both the :term:`LICENSE` and
    ``meta/files/common-licenses/`` or the :term:`SPDXLICENSEMAP` flag names
    defined in ``meta/conf/licenses.conf``.
 
+   .. note::
+
+      Setting a :term:`LICENSE` in a recipe applies to the software to be built
+      by this recipe, not to the recipe file itself. The license of recipes,
+      configuration files and scripts should also be clearly specified, for
+      example via comments or via a license found in the :term:`layer` that
+      holds these files. These license files are usually found at the root of
+      the layer. Exceptions should be clearly stated in the layer README or
+      LICENSE file.
+
+      For example, the :term:`OpenEmbedded-Core (OE-Core)` layer provides both
+      the GPL-2.0-only and MIT license files, and a "LICENSE" file to explain
+      how these two licenses are attributed to files found in the layer.
+
 -  :term:`LIC_FILES_CHKSUM`: The OpenEmbedded build system uses this
    variable to make sure the license text has not changed. If it has,
    the build produces an error and it affords you the chance to figure

---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20260106-layer-license-clarification-70bd02361f76


