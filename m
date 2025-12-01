Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118BED116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:55:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18193.1764582935595661079
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 01:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qzpoX6CP;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D99E6C17B4B
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 09:55:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AF0E606BB
	for <docs@lists.yoctoproject.org>; Mon,  1 Dec 2025 09:55:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A987119125AB;
	Mon,  1 Dec 2025 10:55:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764582933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ImX9QwARFZbTJ5zgISFzeNVlTubuOfMe+5ONI/5BWrc=;
	b=qzpoX6CPWCOj7zqK6Zf4iEG5ghSwpvVf5NX00zsh8cScroosM7PvMc+LB2CKnEJVZxasuV
	6RQQJsv3JPKBOAIF2KmV3Jq8V/nRyetTUgXKBT7nhzqOjn0l0WNag7le2tnYaxs4bp09kD
	ihEC0HpThlfOCg8veiCqMaRMLZHnMBfjfoklrR9PeywFdJTK3XOn0EY4rBfW55ObEYZuo4
	yZ0z8DHb3MTrLxvWj99ebWHfQeVv2wnxd5CV0thdHeCRKE1QT9sys+aEQ6AvV74BudE9vY
	Rhnt3P1qffeWRhLEltcSVlmW6HJYQJuZ3/NpjfxKTM8Xh6Zhpc6tA7AAcLijwg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 01 Dec 2025 10:55:22 +0100
Subject: [PATCH 4/4] overview-manual/yp-intro.rst: link to YP members and
 participants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-fixes-v1-4-1cf15a5a4cbe@bootlin.com>
References: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
In-Reply-To: <20251201-fixes-v1-0-1cf15a5a4cbe@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=C9MUUZoA8tE1qhY2gw7Xb20oGVj4NJufPjxb/48uyrA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLWYTnhRFMgUNcdSNkWJnLVQOluaQ9E6+ggZyE
 0eycwMT/riJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS1mEwAKCRDRgEFAKaOo
 NixMD/kBmPBWJ/2vU/wc50idKNdEOuR3zFyu+H7uAan6jq57ZYR0vLmCgCIOnLoWdqKB9qtSusp
 +qGKecnhO8ZjXmVrPy742MoHTCskG0CtDJtTps/dhgnaE9wgwv7c2GQQ8rFoB3/IsByvgA45MH2
 4MU5fM76zL6jJ3hCN7p9mHiS6DNzB875BGGW2MjI0rjSqSR3+cyavaeugdcZQAexCWfp1Rrgftd
 N7Or/JLt2uuu3xswZ/jHGOpWaLYTmBu6AFP3TWaDbSKKwdbbnOYKPzdOjZYUhF9VWMge/KfH7Lx
 Verl591K0BnkqrXPkZaywdn8JKywa4DmqrF3J0mKx9Ty1DQfuGyNL4wGSmPKP19KMssNGDv189v
 m7I/Ly0N2bd7qA2a9cp8CE5syLwCx6PSBhN2xp53cacbJNguGx489ASbmXo4xrZ5zv+AeH3pD4j
 Tr+2lDlI/ulhLg1Xrwmk6exfYLSOIoiyeJsUflcHFPaPODjK0LlpR323nk3/yjOSnrs14+1EHxP
 IyV4ASDEzlRP/noMkiuOgg0uh/YQ3+00Ck2zbrHsURGja967QFaTaoYUF0NGd3CUn4xSygJrIvY
 5uAoW1JIOx0dVQ9mx2oLZ5wGZJUFPtLh4xBJksw6tMEnjTfZ7o8XmzdQ04O4NKfyF9JTde5N2Q0
 99Swr57jSAAa2Zw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 09:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8184

Instead of a fixed list of commercial vendors, link to existing lists on
the YP website.

Reported-by: "Robert P. J. Day" <rpjday@crashcourse.ca>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/yp-intro.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index c724a397b..dc4d5125d 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -62,10 +62,9 @@ Here are features and advantages of the Yocto Project:
    move between architectures without moving to new development
    environments. Additionally, if you have used the Yocto Project to
    create an image or application and you find yourself not able to
-   support it, commercial Linux vendors such as Wind River, Mentor
-   Graphics, Timesys, and ENEA could take it and provide ongoing
-   support. These vendors have offerings that are built using the Yocto
-   Project.
+   support it, commercial Linux vendors listed on :yocto_home:`/members/` and
+   :yocto_home:`/about/participants/` could take it and provide ongoing
+   support.
 
 -  *Flexibility:* Corporations use the Yocto Project many different
    ways. One example is to create an internal Linux distribution as a

-- 
2.51.0


