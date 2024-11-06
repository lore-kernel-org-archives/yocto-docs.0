Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27564D29FBC
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 07:48:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.40796.1730879325981221365
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 23:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IfKYiRKu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 600F0FF810;
	Wed,  6 Nov 2024 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730879324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6odvHeEccHqPazOUZqUfbkumvKTfmUAh7IBuO83e5S8=;
	b=IfKYiRKuVDjEqQ/NTXvgSubarQa3SxDEtCb267yBEHrhvaXmMlwLSoNy02R3e0zZYA4xS/
	9/cx4WCrYVU296bG9cF7hboweBomDhQWfvbln5/Su+1jc9XbU3dMDW5r4Zw3ogJL3gHheS
	B0MMXSxHByJO0gCJ7XufIOjTduN/d/gTrfEG2Syq9zVQpfbSyd/19dejw9mLJHg5JwwdqY
	Wa11oJDAfPgHfo0z3MlYP4XaiCVLBxIgNX8pQDogvyrtui4mtayV8ozI+jn9/b/7Mplr/b
	B+IvssT0zMYXtQ0kjFoZ9SobzsewDpMDFEx3NzZfBpCIIope7urwbU4TYeVS1g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 06 Nov 2024 08:48:26 +0100
Subject: [PATCH 4/5] doc: add a download page for epub and pdf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-pdf-xetex-v1-4-044eab7e77d3@bootlin.com>
References: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
In-Reply-To: <20241106-pdf-xetex-v1-0-044eab7e77d3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=t52IMbOEq7R+9/cO3fNGzOUg+1ltuQwfTeNvG85FJA0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnKx9akaP6r8IbP+ywNr5ltX1pyLTwv1zNBWy5V
 79krAgdbKCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZysfWgAKCRDRgEFAKaOo
 NnBeEACgY31G2tAbUmg4XQHMmUZF1iCzQLV+tWrdfJJNcm4EF23S0G2qVKYm8C/1y6FY8NHOYl2
 9KkPppwQE/5VccLS0odEt4krZ6rv3dX6UKf9F776sN7KE/VBW5+IgKm6iMSZZCscYATAZWPkVla
 xJ2znXTgbtiKPsCWDkIzifO4i2gkrQfF1182nNEdxZuFaHE85vy9qBoiE0JOWrzYgXkE9tPp9vn
 r6jbwMCNaxUWkESkQlNP/UqdfqL92NgWhA78kRqOkWTxn6SxrnFxQiRq+PUHljLkwoqDGeyFssz
 oBNM3xnnN0SggdJErFjQnnBeZAbqBbrputOtxUyEoCpZ8/98i6gYTnFODnWq+TV8hRP5YbzI+C9
 hbKs7KTXjFpJ0P64bpfjBCkb0HUU6mTcegNyTZSQJkQGQUFyXg1DKFAWfpFl1KtsPrSXIztK+Kf
 7mFtFvcIki10zkNgIL+pjdkxTLfkXLwib3y6j12AuXDme1IS686H6slbivM07farVBij8CHo+E4
 CBCxBOd3I5kYeD4mJUI+UBVQizPFVxKDSpTBcsU0ssu2L7MmIMUAq3ZqFwDkUm54YvdviBSF32L
 KOCwqSugUIEC7+N0T24ajP87/MPL4RNvFNgtW+SLD8yYuEHwCebNaiMeMUgkeAySIzufQYc/Gao
 sdEmIiOgYejCCOA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 07:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5689

These files are placed in the _static directory during publish. Note
that Sphinx does not complain if files do not exist during compilation
(since they are copied at the end). This is why this was used instead of
the ":download:" role.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/downloads.rst | 11 +++++++++++
 documentation/index.rst     |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/documentation/downloads.rst b/documentation/downloads.rst
new file mode 100644
index 0000000000000000000000000000000000000000..7ec978ef2da80c33f4e3b2aab47320ef01973187
--- /dev/null
+++ b/documentation/downloads.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+=======================
+Documentation Downloads
+=======================
+
+The documentation can be downloaded in file formats to be read offline or on
+another device. The currently supported formats are linked below:
+
+-  `EPub <_static/TheYoctoProject.epub>`_
+-  `PDF <_static/theyoctoproject.pdf>`_
diff --git a/documentation/index.rst b/documentation/index.rst
index 3fef1704a481da9e5e4c697a8efa995525ae5e6a..6c6be38a7e8c46bcc910d14abdc18f78b200c399 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -51,3 +51,10 @@ Welcome to the Yocto Project Documentation
    :hidden:
 
    genindex
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Documentation Downloads
+   :hidden:
+
+   downloads

-- 
2.46.1


