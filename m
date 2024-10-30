Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009C0D5CC85
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 10:08:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.11581.1730282878172242925
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 03:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CCOhMqOm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B82CFF807;
	Wed, 30 Oct 2024 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730282876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIae1MyuWMmAPVZx6V+HEOTxKPtft1L//5eQWN6OO8o=;
	b=CCOhMqOmbECzCdJb1m0Wfhepcf7JAxz8SeHKdHiwgHL5m56iInSB0EXSX4Tg4Nftyrn5S3
	R7rXqDXOfwbyMf+wBxF8EMLlP6Cpe8+sD0k4aQ6+8N1VZnao/Cznbvx429ptl0qKiPBzzK
	y5Bsklho+fPQ4QE9+rP2tt2Ex1kYMXnv+YRwg6uvXme3s1CvefUNZztrcu41y+tXyx4vIZ
	+Kqlti5n+Y+vV3TScTyz/09HGbQNdxrfHuiuB2hIv88tRNJZYTaNwQ22Ac9eTH3rJNsxbc
	vtv8fS7Oqpqd19LorYQPjZMYuRywUL3KSlGxRJjR6z/NhxR/RkdOTwa/WsXtxw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 30 Oct 2024 11:07:28 +0100
Subject: [PATCH 1/2] ref-manual: release-process: update releases.svg with
 month after "Current"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-update-releases-svg-v1-1-1cafebd6c6d9@bootlin.com>
References: <20241030-update-releases-svg-v1-0-1cafebd6c6d9@bootlin.com>
In-Reply-To: <20241030-update-releases-svg-v1-0-1cafebd6c6d9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iEDUsZyZZVSwsdwODFQXRRQtuTadhtVxhKIw5lxE3jY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnIgV7MH7fPgpEyBCAqUWsI6mr4FFnT5osDXN3I
 KutklzDLtyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZyIFewAKCRDRgEFAKaOo
 NlklD/9X6vmKzvb/drzNp6Q04bOUIO43jUn2mG53dY9aJlrdywWmGTIGQJReJfrqLgTFCoWosY7
 AwT0mwB7kwP1FLkZlf8X3GC0Pw0p8gJ+CYQLwfk+zVKCvMXI+xGahuH+lJCRTN82N7Hf77crgHz
 NWmBrSPQXP/wxpawlJ60KosuBVa1GeNKmy0YHdKm8X/5m+7DA39fy+3aitMMqgzxr25y3YAghPx
 lGnqgkgg/7J7C0ORl3LAvAe+VzBLqjiYVN3mQ8PE0nvaCPzyVQ0iH3xiIfMqZWvpBtm3mYBPdsS
 30VwD4HMUjV4Ybd91UsWOFhHw5xO8QPRGz4Evqe9ALaMTS73/O1CVqIMJUGWMmadmuD/Vk1JPwi
 jjPQq+kpisvRgd28ERRmENQQVuy1K5mF8InXb7NXR7mB0LRawEATIjoRnObddTY+bsebrLQMfMF
 nc4w5Bzdzbmp+L/KyA+G/kNx9tnrjtnoHa8nApPpIOg1EgAr3dG5gNj8oxnr1Ij41tX4q9kkCpo
 xin+cXCOzGWRqamoXh4vraYpkout9g1+SRh+FRpFqWGFV9majsQPXItANJm5K5kB5vrizMjZbt2
 QK2Sre5VXQ4VCNzP2d7jH6z6hlpgAxWcolNpwP0itwM03uPc6+9ecZTlpD9wmI/NyLgmS9ON2yC
 RHZaLi5QmbS9ITQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 10:08:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5613

This way we put a timestamp on the image, so that someone looking at the
image on an old release tarball has a representation of the release "as
of <date>".

Here set "Oct. 24" as it was the last time the file was updated.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index b1036e066ceb65a7391cec616cb4304094728f3f..aad50cf593f56691d9961e427921af4ef25fdee2 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -409,14 +409,14 @@
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
      inkscape:window-width="3826"
-     inkscape:window-height="2049"
+     inkscape:window-height="2069"
      id="namedview4"
      showgrid="true"
-     inkscape:zoom="1.5536106"
-     inkscape:cx="868.94361"
-     inkscape:cy="273.87815"
-     inkscape:window-x="0"
-     inkscape:window-y="80"
+     inkscape:zoom="2.1971372"
+     inkscape:cx="1068.2082"
+     inkscape:cy="287.87461"
+     inkscape:window-x="2256"
+     inkscape:window-y="60"
      inkscape:window-maximized="1"
      inkscape:current-layer="g10"
      inkscape:document-rotation="0"
@@ -1494,14 +1494,14 @@
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1659.087"
+       x="1686.7159"
        y="-3.6722763"
        id="text1185-3-55-4-0-0-0-1-1-6-4-3-5-2-2"><tspan
          sodipodi:role="line"
-         x="1659.087"
+         x="1686.7159"
          y="-3.6722763"
          style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';text-align:center;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current</tspan></text>
+         id="tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current (Oct. 24)</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"

-- 
2.46.1


