Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF07D21688
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 14:58:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45783.1764860311276833517
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 06:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=VizAPpiA;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A8804C1786B
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 14:58:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16F256068C
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 14:58:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CCB3F1192272A;
	Thu,  4 Dec 2025 15:58:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764860308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=zOBrUOseG20DqqYzg6XakLY87sL53njoVpkpVS95ELg=;
	b=VizAPpiAMwvqGkXh0TosrlHaQS+ZCDNEoEWgyGPKhF6NU/4bsXILAeEyRrU0k4iyMe0sCn
	x75jaSspzbFPtUnKTGJEOZxjqh3mRns/uJbl8FgETsQIw+kW4Ts8wKMMoMwjJsIuxAYCwJ
	zcYdVDrTdGZRKeg2vSVB+AaZCGZwfRRWlB9TQF6r6YZ3fso/c0hgDg5/WA+oaiau1jRkWc
	gqMO/MfQEmOPPFCM84GbC6KmlLJRFEU8GOqHALXRjoqoBBo5/nf18iXLy6ryu9Z138FlG3
	LtBneUALs44/Yri3RaOyWogbBQd+VXdFRWPS2YLQ1KlOnzfW5EEJlduhXDelKw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 04 Dec 2025 15:58:24 +0100
Subject: [PATCH] ref-manual/yocto-project-supported-features.rst: fix TSC
 wiki links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20251204-fix-tsc-links-v1-1-5e1a2c4e410b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAI+hMWkC/yXM0QpAQBCF4VfRXJuyG9q8ilywBoOWdpCSd7e4/
 Oqc/wIhzyRQRBd4Olh4cQEqjsAOtesJuQ0GnehM6STFjk/cxOLMbhI0Rucqa/O0UwbCZ/UUBl+
 vrH7L3oxktzcC9/0AwuifonEAAAA=
X-Change-ID: 20251204-fix-tsc-links-882615d64f18
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BQRNGL+YA+UMmzkXaroi7Pc4VqSW2BhyZC/ydsH01fU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMaGTjB3hGiJrrQu/ltSTu+ufe8lKs8OskQUJ4
 AE7UnLAqBiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTGhkwAKCRDRgEFAKaOo
 NkH+D/4lr5HagwwyJIVFG99/wOW2NTEkTIXo0uj15SO22zrx/Z5zc0+ygxtdjxnTQG5JgRIYmLx
 Iju5YuRPrJpHiFI5Nplrxw1ZAfCiTct0sB2sUz9Auv/0b5rmeKCFmRrI9gKD6AMOhLQCeQQeyAM
 pBYGohob39ibIAmQ+slDNvQpBpIbf8YcKaGncCq367ou4KpH5WJSgKnrC0BMdRSiKpNfQX6sJ/o
 cspaREY9qqXdNGbY8JxQRkOxcrFbgfNTZ8+pfgtWlSVqkpGPZoolcIhFd7i2eptFUMeRtg46uAC
 nedZWgPfXP0Q3Fh9x89dlwNts/bE+jCbHZKUUA6CloHNaqQpexREFgnU60nK0gEzD4weEo74Rg0
 tRxfqW6p0+HGbXtIFNookjG4DY9SdMVjtmx9MP7E7giwN4KjLI8ZBIbLsMVYTuYHQ2ZmEAR4i9S
 CMRev+1lH2wfOxiotOUhm9cQi58qZlhi9cORU14eFWl3Mt7Emrq11HqlCLG9PIc82euYSj623Rt
 BMWMPVXcxpPygtUih4yYLGnUEFIlA9cXSkPp5TTsy5S8ULKlMrXsb6pFQJHQFnkxN6iYUuBB6QQ
 I4rT5hUUO8jdMAKMwmgt0YL8ojYlaNwbNEYcIYOaoBjZ6qysB9nePs/EcOLq+3HSJ9dJpqHSP8i
 TiRld4Nr4c2aVtQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 14:58:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8221

Fix the TSC links to refer to the Yocto Project TSC instead of the OE
TSC.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/yocto-project-supported-features.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/yocto-project-supported-features.rs=
t b/documentation/ref-manual/yocto-project-supported-features.rst
index 0e6c33cf6..eeae6b24a 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -189,12 +189,12 @@ We therefore have the following criteria and polici=
es for such items:
=20
 -  Test results can be submitted as part of the release process if=C2=A0=
desired.
=20
-The Yocto Project :oe_wiki:`Technical Steering Committee (TSC) </TSC>` m=
akes
+The Yocto Project :yocto_wiki:`Technical Steering Committee (TSC) </TSC>=
` makes
 decisions on features in this status and Autobuilder testing. Such suppo=
rt would
 be dropped if the maintainers/testing were inactive.
=20
 If you are interested in providing resources for improving testing pleas=
e
-contact the :oe_wiki:`Technical Steering Committee (TSC) </TSC>`.
+contact the :yocto_wiki:`Technical Steering Committee (TSC) </TSC>`.
=20
 Below is a list of secondary tested features, their maintainer(s) and
 builder(s):

---
base-commit: 79e597aa45c4b171c8340d48803fa9987926851e
change-id: 20251204-fix-tsc-links-882615d64f18


