Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844EECA6C9D
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6056.1769501980417837644
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XRVgq8KW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D650A4E422CC
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE029606F5;
	Tue, 27 Jan 2026 08:19:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E681E119A8695;
	Tue, 27 Jan 2026 09:19:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501978; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nwZAw1fI/cU7zhrCsIvB3YieEQIhPoU9tsyVTd7R/Bs=;
	b=XRVgq8KWQSw4HQigK86zHno6RyJpbcelJr6GbHjtVGqoojetXbffaNLsJAcpaJcTLRiqPL
	QshE1F1F7GgRy4RLtcugk1OUqLUnPTsUEA7Nc8nmWgukUKyNe07hAv8z0Ax+TGj2lzMifD
	sPW4nd1jONYVSdBxANo22IIu1IJDVneK67dYfuu9kAr7D4+AX22WqsnRNkxpw6u+x4KJbJ
	rsvFuoZklhmTUf5oK5TfEqXFmMIxOB/xyzTpNOJDnP/XHgmfqa4bj86kHSUnvCEpyP7SfT
	c2SH54MqaMv+YvXf4ghG7Y/AQrVcm1lk9NS+7+qqIgCfsM4AXmTksH/+CIhxlg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:20 +0100
Subject: [PATCH v2 25/56] ref-manual/images.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-25-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yhKBxzRJ4I7sjT2yEEavNGBnCJ11sdwGukEhWYN31Xc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUCePJ9NvZ/9S9yrlyRMeSe4TGTRUCzKISDK
 fFfD7I7ctuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AgAKCRDRgEFAKaOo
 NmoID/wPP0skMIM64qEu63doZYvrYHjTHfgWhEoRdkI/+RE8JDfkaUqozMYQuOHaXH/9GIjuE82
 YNovlF/Saa+GZcP48ZHl5CmiPWHKPWm1aVc5xdwlFOe4vnZhBf/94/UDZ2BaYP6GTR/LrTP6+Eb
 mFp//IDukiOJYl3HQ0ObAemWnTTPsYQqCraiSzIHJXspQVM03atg40n+glnuLRlknAMO8RK2RVl
 LQ0RL4be2t4XLMb1XcKujnEfokR4UWgwTJrbQMfP+MuhteNJc0SnmkCiBWVzTb7AhKsyRlzM1gF
 i1yYUHgY3ClrcThvKSsdTgZlgJJa7094IYndWorw9MLbrz9FwiyYQ6rwSN3JwT75cIkpxUFDT17
 CC88qxB18k9q0z7ApETygsAb6f+03pT5awYOob6qDnjLpalARG+K/OeU9EL2hwXJVIufjvOFaml
 xerK6QTwyPi1iARbM7mo2IohigYc9KxrVco+N4JxqqaduIK/TLKHCxis2BIFuGXqk1zT+X7PPhN
 7/G7Eo2jG3sqktzb5PL90F0BbrcOyBQhrWxk6PbDAMody385nZSx0dnNGuSA7DraWw2MqYv2wJF
 OQm3y6ZXOxet5ZN9H1dXKvf0ccyy76crUtTKygu/T0Q/EwJr6SFLpNls5DdnDtbpmwTuy2hNzFq
 XO6qFb/Urz67WaQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8686

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/images.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index c9d898926..94e412de3 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -26,9 +26,8 @@ image you want.
 
        INCOMPATIBLE_LICENSE:pn-your-image-name = "GPL-3.0* LGPL-3.0*"
 
-From within the ``poky`` Git repository, you can use the following
-command to display the list of directories within the :term:`Source Directory`
-that contain image recipe files::
+From within the :term:`OpenEmbedded-Core (OE-Core)` Git repository, you can use the following
+command to display the list of directories that contain image recipe files::
 
    $ ls meta*/recipes*/images/*.bb
 

-- 
2.52.0


