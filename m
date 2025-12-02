Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C52D11714
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 16:14:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1088.1764692062661936397
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 08:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=17Ue9ClD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BF81CC16A22
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 16:13:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08F83606D6
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 16:14:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7478211919D06;
	Tue,  2 Dec 2025 17:14:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764692060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Dv3SZKj7J35bFgUn/hJlZVIO89k4Q3SbmTk8xvmtjr4=;
	b=17Ue9ClDu7gVYLY2aEujdR3ae7CRCHZO1RFefv1sRj8otOlu2R8DIBYK0wn6T/Fv00etwc
	ev21yZAnYB/4XStqej9veJfbGBh2q5vfGz/e7JSaZRbnHxDg4qdmZcFmWR7BrV13IToFtu
	b93X+ep3GXXY1+hxj2QAc2pssQnHXfT6j77Q2D0VexKTTPn0O83v77WMrZP7bxLVJ7soof
	DR5PJFfa220+ZLtvbUQ3cIy3brlcNEcobtRrRugNSQCPIFesUkrJ3zAJUaS1qEq48rTXoF
	ABE5J/MyftjOpvRwb5lMU3wC8QJxjafTgGnGgeCIcxmk9wxN46njiuCf8xwlOA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 02 Dec 2025 17:14:14 +0100
Subject: [PATCH 2/4] ref-manual/svg/releases.svg: mark whinlatter as
 current release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-release-updates-v1-2-889513ccc384@bootlin.com>
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
In-Reply-To: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Yira4u6M3QMP1bIBNbLmD6vKkBes6SZhyj5nrrwZl5o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLxBaXVC20bwNlO3V43jTf2StKhOee+xPZ5q7r
 Vook8oxVG6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS8QWgAKCRDRgEFAKaOo
 NnTbEADHo4YVt677xE51BZ0flmWOUwVudzsPkYUgZnVSkhsiw1lAj+k9n839GaTfHd0rhvcm5MX
 Z3yEcMfbjOVyXo+imRYx8mq8E0jEdZxuBCQ88eJ8UfJof3uSWfuH3GGZVn3tn572YPW4Tqc286i
 uhM44rPARm5L566rCKGt9MwFW2Uz5iepn/qYnBYuuPc/ynJb7h1Z/v2YWpo5uNZO4GaIrD6dEJs
 Ch8ivUjeRfVK1QcuswMFWy3WSt6Atbc+R8YT1sQ+M410Zy2366xuvu8JUJz5sBIePETbIozaHO9
 CsAlUwL9/YlEgMfKaboHv8Zw8Fqjwpp8RoiKqBQCn9IiaHmVFYSjuluwBRzml8GciK89jj9+VWD
 ogv2PBXbMG2qL2Ro6uTfeiVVR90I4kYWOaAhtpmwTB8ijoLZoTSz8uUjmR0c8fpKEU6fBGm8iAl
 ZThjDgxLYx4/wvxc75AadWlYoTZaJ4PEn+WkYcHh1MtOHkFlDtDhhVz7xxkG0QRsi3veo6hWCmw
 e+1ZM3LxFLoVAfoaj99k9IK3/kiW0SzC66uxMc4jc+Wlno7o/fAEV11/uc81uCmvQrdwG3E6KM6
 vEz7V+qe0JpJ9mUOzpRobpOXpmQgfNLnBvh1jzvogX8axUd6wurZdkSx31cJLe7AZtOyZlh4gH8
 Ht56ts7HxP3RkHQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Dec 2025 16:14:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8186

Whinlatter is the new current Yocto Project release, mark it as an
active one.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index e6038935f..7a0b99c3a 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -656,7 +656,7 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4-6-5-6-9">5.2</tspan></text>
     <rect
-       style="opacity:0.75;fill:#251f32;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+       style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5-3-9-2-3-67"
        width="140"
        height="45.000004"

-- 
2.51.0


