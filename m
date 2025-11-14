Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B61CE7AEA
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 11:18:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15618.1763119122381819480
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 03:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=itHQOzFi;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BD18A1A1AA0
	for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:18:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 84F776060E
	for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:18:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7706102F292F;
	Fri, 14 Nov 2025 12:18:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763119120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=deKWXQKXAj7mj/l4d56e3vPOCNkI5sjr+Yb2OYnAFjM=;
	b=itHQOzFiPSPN+6L8hzEFq0ZBIfWc043u6nqqeXWxnrB0wtrqfIMdhLUvDQWSyB83L7Qhrm
	uvv0U7IX8T1iMVyU42cmXSUc6M+Jn/Wn/xM6c1YyTeZQNaCBzGwGnwHKV6cINZ57w3we7M
	hz9r0SH3aJeTNRbod1Eg7txUkt2dDUq90EAfVgd8uTPc5P8tuqvmGsJl/RXF5HcmqUMpRo
	7wlbYWdMZMSF7aGHD8CFp34XLG8B9jRJUfADKwuD1IwfhwqNeIa1/9fkhw5eechjFpklVz
	p5BNAu8ShxPhPWua5kmCnICFV1Ln3i0PyGj70T1/Yx5Dr9bIvk9tCz67FlT/WQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] bitbake-setup doc updates (yocto-docs)
Date: Fri, 14 Nov 2025 12:18:22 +0100
Message-Id: <20251114-update-bbsetup-doc-v1-0-07e623b8ad2a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4PF2kC/yXMwQ6CMAyA4VchPduEDjDRVzEe2FqwHGBZN2NCe
 HenHL/D/+9gklQM7s0OSd5quq0VdGkgvMZ1FlSuBte6gYh6LJHHLOi9SS4ReQvoiK8duY55uEE
 NY5JJP//p43nail8k5N8JjuMLH41LxXYAAAA=
X-Change-ID: 20251114-update-bbsetup-doc-21d63123dd59
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=560;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mOqVX/DuG+mHU09kSffCST2W7JVE16nDme2GhB+yuBQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpFxAOczlx0Yz8mKUhgI0jK0KIrx+mE4nBaXc4J
 CbN0O8vGF2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaRcQDgAKCRDRgEFAKaOo
 NmThD/9LP5ovBJhXjoPQqfzh64DrOZKtgl+LLof8tePodYhGBEFh4Zc9sylJ4Q8nt1krGUO7wjs
 Cb0bvcVq0pskXCPASodxuA+mm9Fisl1ksg6WoWqPT1SYnM+OZEvMhGgzGRAwxnQ31TueREGTmwz
 xZiicacyzZb/eVTj1z3BmbmhL+0m25O8kWDoWf7EKfBEMSDYimJJfxmKOuYoSWOs3PeNZ9obGYP
 hEnhZz0z8dzSRGWDSA7wioa2NzcGmC6BfVw7ZdWBODjiotSKBW15Eop/polJpFmtAzmVG8DDJJW
 m7a87i9o+hq/+sLGOvNdksOJAAgkMq/X96mNOwkPZvcuyoamDU4JvjmKkB8cS9KSbOBcvBfp5yR
 9pUZFKbb9upr4MTQrh1fzoJz27mx5CEXQvH78podPFtgkTuBye640eBFGTtTBpGkmPd2AzdCf0Y
 i9oQiXv7qkNWjnHYJRClmDw7BtTWVIis8LrwA+9WTnyH3PkKPqhBg5HaoMgCGW+WePspLLVFNv0
 U8o5jlURv3hHAnvqGiCbyeDYlPclJdMKe9k/4uSEdihRe5H0KJTMKT7nrIbpQ++c+kMD5nqW3Bi
 WDBu4E4nBjGwKorKAwl2SJv+UTg3grSRi4X+7aW+4d9F+yjYsEV0aKyKfoR2dlMnn7Ww+W+sAkj
 +dpX1h+saF9FPfw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:18:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8042

Update the quick start document after changes from upstream
bitbake-setup.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      brief-yoctoprojectqs/index.rst: update the bitbake clone command
      brief-yoctoprojectqs/index.rst: refresh after bitbake-setup updates

 documentation/brief-yoctoprojectqs/index.rst | 49 ++++++++++++++++------------
 1 file changed, 29 insertions(+), 20 deletions(-)
---
base-commit: 9fec9ff39df9649c99b4f945fb879651f222a61c
change-id: 20251114-update-bbsetup-doc-21d63123dd59


