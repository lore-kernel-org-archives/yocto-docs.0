Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6718D11707
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 16:14:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.963.1764692062364773736
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 08:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2zuwEabL;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F4B5C16A21
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 16:13:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CD10606D6
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 16:14:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0591A11919D04;
	Tue,  2 Dec 2025 17:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764692060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=naHi3RsqzouRtyPACzIgFUeElnPIvYe9NkUM7+EyuXA=;
	b=2zuwEabLYJ5nlRdoA3uK1X1u32KVbV/yMY4ZajmncsS+ojLcP2QOTLauqWv3JGFItVs5va
	pfduBlj9KBbEVnaGoLMvQGYYHYKnHN42UMCmYvGCwDhKJBo6LKtJ4mZaUcijdb1vCZO+YK
	y4ALlGV3T6upMXfHjYLbh3mQrvwlJ+TV9kO+zZ01HGVFjsfVk2LpyR9uM/6Ac8gE3tYDSm
	gY1s/amG58SOIzMIZ0VklIlDzCU2dxSH4Z/vLcFjrjSVsRHtgjrYIYZ7HMaZd68MX+niVI
	fCLvG0tQ2h2eDwUCgJYy7AlkO+A5EKAZfmrYorluR1Bv3BDF043P0AGecjLRGw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 02 Dec 2025 17:14:13 +0100
Subject: [PATCH 1/4] ref-manual/svg/releases.svg: mark styhead and
 walnascar EOL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-release-updates-v1-1-889513ccc384@bootlin.com>
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
In-Reply-To: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2760;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uIa+Q91Zix5lvxxWPzbVd/V641ZPpUOja1FIjlRzQIU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLxBalJwxFi4OJ+sdBr17BJfw26Kox07fxvWnW
 ipSu/VF0I6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS8QWgAKCRDRgEFAKaOo
 NqTpD/4lS14w1zDojg1W4hlyJF/lZ/FR8njn+G46yL936VCyaM17KyehfP8xv1AHkymwB0FqUut
 tm66a+SSvwdgopLIzs9I7cBewWN0Z93XVvUg4o7EWWdBwwpxCbsP0PJxQ0GtM5v4BzHhe270B9b
 uDTzoJmGWfZV2EUXoZudFsAzXrr6HwYROIhA06iAdjiEhoWBgvtSD0lGcwi6DnVhj/ViJoZdMI9
 O1XHkqaZnayWs27BNtM0YpHfmxX3/jWgnwaBZmQr5PMr4v1IkZQ5AmvRlt+omUd0IPqL/gF3w9e
 1TuSFfBhCOMwqSwQZEAs1jj9d1LeW7nEzPxUPJBM2/LrgppcO70rwERGNuZSj2wySr3uuOCNNg9
 9L3kguZf1nYR/BGWPw/sUpIZO+0Zkc4PmA+tQTH9OnCN/bK/NfmkLIoO2d2uE3uuYhlLnz+HTB7
 YCLTPHGFZ796tsMsLzQLTcbKJPSIotM15l37QNVzykIEQ9IzOm+3K4TmcjI07wIw+9wFvLRuPu8
 08x4b+Haa1YaNA4He10z82kJVRZGNNAsQEWT5djNpJQhNAoBgahqcK+wtdPJhZEhSYK/xYUb4B1
 c4Wy50H3I1E8qNlvcpQd2+/94A+wEA/cm8gxrRhD/Yvimyn1Tn6wclMK2NoqZeKGie9cJwYMTfA
 JQ5+M8nF+SKApfg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Dec 2025 16:14:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8187

Walnascar has stopped being updated a while ago, and Styhead is EOL
since May 2025.

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


