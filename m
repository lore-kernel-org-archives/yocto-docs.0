Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798C9D20692
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:36:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43528.1764855408786828173
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 05:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BJtbH2Wm;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0CC04C1784F
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 13:36:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A1336068C;
	Thu,  4 Dec 2025 13:36:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8385D11922576;
	Thu,  4 Dec 2025 14:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764855405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PRzEsrznZDtW/KhPUtmjq8sK2zzUCgAOm0rBWWKzAYc=;
	b=BJtbH2WmxRjokXHqoFv3PNmJJdXi4MeOW0UBl37A6tbF9vUFQpr7JTFTN7LZNZYDZhXidF
	mSrjgqjB/lnABhV5g89EZe3d4KAAS2pOH3jA/Vjtn2MLjX66WUAcexhp2GGHlZI+X3s3YE
	ofAFqFHjf9v0fSDXkAom+rukSrB1zLKtIlqG/tC47zgCk6IXxQ/6HE9E8/p8IcrKMDirFV
	ZJS2oWrJmCMhOSD0XdhSNCGwlNHf6fdwvvtLC7CX+nTsGtnMJ9JpzzmO36Ngw//jZ3EYpm
	KdP1XGAM3lUX+KrFUqcSOGHtMVe1K58fFgla7vmfP744pNILmw48tQrwEx95cQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 04 Dec 2025 14:36:38 +0100
Subject: [PATCH v2 1/4] ref-manual/svg/releases.svg: mark styhead and
 walnascar EOL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-release-updates-v2-1-04ca6c26ddd5@bootlin.com>
References: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
In-Reply-To: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2816;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VPFUDSGji2uMF0TvhNKHDOr5OrMBtI6OQ0szPn9oxuY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMY5r/iOg3RpqbT1YQrwgGUNCjxFcDpkOZDBa6
 KQK2XmsIPaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTGOawAKCRDRgEFAKaOo
 NuufD/sGN2D/4iY4wSKaVF80b7DSI5vxoAeLO5oTCOpX05DYD9uIzvI0fvKizo48J4m6Zj5+FCD
 GO4hFyE3nfWe1LOjQ88TiQhqRTjAn/+/fR+ik1udyKJmrUxH+j+nsTPmHmSNou7j8+679YO7MyI
 EUM4I/W3xSqQRYJCV/nGSXYK7ZNuNba58Bc+FnxclGTVZ7oWl5TUeWZ3fsyOMOAfcARDckijjIM
 +vBZjk+dsulQoV4AK/QeRF1rqRrkR2vUPKvxUEavXdHkS8N24OtvKirge5FZF769Vj8qbz4EKKj
 ywWnMrMtS7cNqd0JdJ17P3eJ1ZqNAIVV4wV/EEHmMbUUjZK3c8WpIXa9EWPC37+lnNUo9BJvb6r
 fegUVKDDhHSYPVzOzZNNN+8XArGtXO26pBQCbY7k5s6YjuNODD2d6CpG23YDmYRk3mIVbqNwD9C
 Yg87qtAx/EjB8zcC93LOrd2RochvNlw8+9ZAqoLNhU3oSh7xeeim+9m+muWu/Uo43xDoqNW51Nl
 YcCZsYAv5aYAVyM72ErjqxBhJltWsxly9+RvLrhaPOH0rLaqACq9u0kxJ7ix8ibg+A6iRfzl0Tf
 ULTx90aPFwuWbvAamNzCBc0UkmTNmUbSsbpcR6zdNCfwNaG6F5fqBucdXJ39u4wpwedPwyLvbVL
 2/miOcSJiCB13/w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 13:36:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8217

Walnascar has stopped being updated a while ago, and Styhead is EOL
since May 2025.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index 3a379078b..e6038935f 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -608,7 +608,7 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4">4.2</tspan></text>
     <rect
-       style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+       style="opacity:0.5;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5-3-9-2-3-6"
        width="140"
        height="45.000004"
@@ -632,7 +632,7 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4-6-5-6">5.1</tspan></text>
     <rect
-       style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+       style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1;opacity:0.5"
        id="rect917-0-0-4-4-9-4-5-3-9-2-3-6-2"
        width="140"
        height="45.000004"
@@ -1847,7 +1847,7 @@
          x="2128.7158"
          y="-7.6722765"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';text-align:center;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current (Apr. 25)</tspan></text>
+         id="tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current (Dec. 25)</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"

-- 
2.51.0


