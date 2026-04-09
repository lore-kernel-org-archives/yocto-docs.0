Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31EAF31E4F
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:48:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.131587.1775739703420337581
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 06:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AcNe/umy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E1BF71A323F
	for <docs@lists.yoctoproject.org>; Thu,  9 Apr 2026 13:01:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2A1A5FDEB
	for <docs@lists.yoctoproject.org>; Thu,  9 Apr 2026 13:01:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52DBE104500B4;
	Thu,  9 Apr 2026 15:01:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775739701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=S/hqSk/cFLL77/qdRij7NU07t3b4ZYRpjzlqGcfS5hE=;
	b=AcNe/umyDq7JM6+iQS2WnK8i+oOWDT0zPvtwcMIThfYX2+7MBmEoss42T9BIoem4x7KWaw
	0FLqNCEFjQxNLKmb0ItGZulz0Cg8UbOp3Oks76TaEy/7S3eVhlh+yraPji+/X43/pguvlX
	srJCE9P0xBEugm+DSnHEzMtwcpcYkxBs8Xo//sqjk+asWmKl4Y24lH0ULE0AI5UAH0fsAm
	CB+m1BqyvxTj7wNWKK3fRctCpTZ6L0S0Mlu9NoAPdDDR6iN1FgcrS6nUs8KukGd5RPz7xs
	kauMt6k1S0hzbUAJsP7B6ozsBgiRUle1o3fY9mZIwEI/kDAa3Rbwwf0guJjciQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] set_versions.py fixes
Date: Thu, 09 Apr 2026 15:01:34 +0200
Message-Id: <20260409-fix-milestone-tag-builds-v1-0-33b14f05fad0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQ6CMBCE4auQfXaTggriVYwPtAy4BovpFkJCu
 LsVHr9k5l9JEQRK92ylgFlURp+QnzJyr8b3YGmTqTBFaS6m5k4W/sgAjaMHx6ZnO8nQKtu6grG
 5q663M6X7NyBt9/TjeVgn+4aL/x5t2w8aZ9AjfAAAAA==
X-Change-ID: 20260409-fix-milestone-tag-builds-b97e0b1c7583
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=443;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=H2Ebn5i9iFcInUpyrvnxvfL/dq+LMTvo5K7O1KDCLxQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp16Mz3we3oyvaTDIhcLVseHhERz2WeFRBmeYCd
 sorgmfr5/6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadejMwAKCRDRgEFAKaOo
 NoMPEACGLS9ANgEfGRjDTaEwQ9AO0dp1XUEg5z+4xC4TKx1PbUasLI6mG7LeamHyLa8LBNb7uS0
 ZtzJ9OaiGXEsPc1chqx1bnkuxDcGDcm7A2TXIpVgEuLsihY+2VfFDFa7ulJXwe2JqZ5EibNxE1G
 JJDERqAKAJjIuYvu4EbgtBzSA7HDKIphlPGQBNGOPJdVJ5kcrBlt6wPgOHfJsgH8RK4zeOKQFy0
 ai7RE0t8PBF3WbWNreEDjoT668kcLjurltC9DxTuTLHX4LsPdBwtp/jHFhMpdmA5jBrxovHmwoB
 dnlXh8xjHVhpY2nkcUnI4yLR5whywmT5XRCLT3yAw74Z+biVF4U17ay2MpumFwCfHSFcvg9GwGg
 xyW6rnVZgWvzvSD1Xwg23obP32eVn1zX1VXb7Bc5Tq67aYVR4M+bp/rjjFrFGPjHqdTjArp2KWA
 hvfEnAHAzttQP+/ReNEFpK+Ps7Mdj9eZejCFHVSYvi5jA7pNOONwUoMl7WW5jf85TcoTUsn7utf
 tfF6ruvpHKSLdLqHzdFeFw5jc5rsZ7/slADZ4tX5cmNvx5mc9K9qnDb9ub/sdIilMmK7RfLLkW8
 q/f3Kd4m/9MMtK6OgDueyUhVQGu56+YRjbsdL1NhKuV6vv7IUX4dhco1S+erB/I6rf8es/ZdNib
 GXmQtI00EANEFZg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Apr 2026 15:48:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9210

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      set_versions.py: fix seriesversion for milestone tags
      set_versions.py: use bitbake "dev" version when our series is devbranch

 documentation/set_versions.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
---
base-commit: 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90
change-id: 20260409-fix-milestone-tag-builds-b97e0b1c7583


