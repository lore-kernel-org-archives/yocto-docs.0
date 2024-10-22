Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7525D1CDD5
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 11:03:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.15729.1729595023139021711
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 04:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DRNUvCXZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A426060002;
	Tue, 22 Oct 2024 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729595021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btH0/EtviK+UBzAZ3HC3dWJQ89jw9bQS9L5P5Pp8O3w=;
	b=DRNUvCXZO5pd43UpfgYTy6CKxtKMC+cbyRpbdXE/uL7CGwgU3RyjTXFcJxOT1QuemHaqrj
	cFcCvZ3yFmV5h1ffE/SLn4H4g/kVwIf77H8+XhSKQdpFPesnJSaOldciZn5euvOgZi3StZ
	3CeYuZeq+R3wrwNVoIfJ5XvpCGCfXIlgQ3WqdctdkXtv+gz0ejm0iOHFbR2MOSy8EUuOL1
	QEiaL0AFkSMykBkW3hmFppRCqP7t88BGnHSeG+Vt0q4CnmEGIdYWwPsfykEGg9Mb4ev0F8
	gL/yNLBkiOyZq90r7l14QRZEoQAV9WS2CZbPzA/t3uK5p3B//1iSRVeVSQpITA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 22 Oct 2024 13:03:10 +0200
Subject: [PATCH v2 2/2] ref-manual: release-process: refresh the current
 LTS releases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-update-releases-svg-v2-2-6e7740f9a41c@bootlin.com>
References: <20241022-update-releases-svg-v2-0-6e7740f9a41c@bootlin.com>
In-Reply-To: <20241022-update-releases-svg-v2-0-6e7740f9a41c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=sxNMfQXT02maKKrdalk0BU4anF91qVCTE7GSSu6G6TI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnF4aMNpWG7v/JQkOtq9M1TnyCptT1xnt3FwgRQ
 ahi/QhbZgeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxeGjAAKCRDRgEFAKaOo
 NqLID/9cZwi+KOi0di4xyMV6DJFUdXxJA57t9GRKlif4Zw22MEenxh1RA6fD0xCztiXlBSK6hQE
 ED3Avw6visVU7bosnI33Cu5WRoaTqANvYzV7XFeYYQC2fGLYXZYnj3zfh1pHwuPdUEI2O3hfgpm
 lKWkEbO6LACiB+FibUYIsN4f01MDgRtqlrOb7nvBeFV/vV3svc5rbcEAKWR0QAHSFFpv7fe49KQ
 UbGHzM4mwBU5EYwFVrSrNGSQKW/6LguVr9TTkpI47jsldlW/GCLS7pGAEsj3UGJsO4itjisKdE3
 +G2ZGZSavpslW4o0Dvku2HgZKrLsRNO7UjnDUEq0wfFK91YLdwVMarqTR6lcO2nc0H7+oyQdUIU
 YIOVI8O8mIidT8RZeSvWe+W6N2c0EwbfltJmnfQjyTJlh9M+hZT3BzylXBHO58aFc/ifbd6AtWM
 cugOBm7Q98lIS+dDa5jwGsRmAwlwfezsF4LqVE5nYRURUadxWWDlQdRQCINYNg+RFIcAJHdQJZW
 EAUcpzgjrB+9jvMcXAhnw9apb9IfV12y6xIZN5B2DNJoaDTcGF2uSlkvFmKD2kigXPrGZf2Ea1a
 2RDjit4w8ucKzxGI0RV91q3klyZUepD7UbQgQaASi0OKCqfpMynU+5lR0r/4g5ZHoeRvDYw3CUo
 lDGDvcVslsA+qMQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 11:03:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5552

Mention that Scarthgap the latest LTS in a bullet list next to
Kirkstone. Reword the parapraph a bit to make it clearer after this
change.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 920794679d2256cf0f8e9677c7739e5540c4bdd4..75532addbdcd52cb0ab13ee8ffd57a70e1fc8045 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -103,13 +103,16 @@ have reached their End of Life (EOL) won't receive such updates.
 
 This started with version 3.1 ("Dunfell"), released in April 2020, which
 the project initially committed to supporting for two years, but this duration
-was later extended to four years. Similarly, the following :term:`LTS` release,
-version 4.0 ("Kirkstone"), was released two years later in May 2022 and the
-project committed to supporting it for four years too.
+was later extended to four years.
 
-Therefore, a new :term:`LTS` release is made every two years and is supported
-for four years. This offers more stability to project users and leaves more
-time to upgrade to the following :term:`LTS` release.
+A new :term:`LTS` release is made every two years and is supported for four
+years. This offers more stability to project users and leaves more time to
+upgrade to the following :term:`LTS` release.
+
+The currently supported :term:`LTS` releases are:
+
+-  Version 5.0 ("Scarthgap"), released in April 2024 and supported until April 2028.
+-  Version 4.0 ("Kirkstone"), released in May 2022 and supported until May 2026.
 
 See :yocto_wiki:`/Stable_Release_and_LTS` for details about the management
 of stable and :term:`LTS` releases.

-- 
2.46.1


