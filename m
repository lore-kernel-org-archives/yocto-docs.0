Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CC0D5CC87
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 10:08:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.11434.1730282878137420451
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 03:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hy/hAXuw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BF09FF806;
	Wed, 30 Oct 2024 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730282876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/JjPbDmFtOYCvPwayHJjwbx2BVg1fMvJ9aj2JT3zWPk=;
	b=Hy/hAXuw6NndIgtCR4HQqCi5WEQZVMUjsmtEvFw3tZeMGfovV3lYyw31AbrGMnvAvgpFLH
	v/azqsjxZZVhjNDgaAc17YkFAwvBcH+8ezsJg8CB4uXBd4ww7uUOcNWxL/3CLbuoBDKo/B
	tES0Wc91E03AnvFvdF/gKmN0Xup9TVyUSN7OihwHm7j83ybFbRDqJfkO88CIJmM4apiCgv
	ABAv2gPgDf5RLoTTZQr5x64oj9v+s0MTlLLV3aa3d9I5e38A53ZgU0PiUiIJcgF/0DVlvj
	/gTKSbLPO20Jn94axujEVqylLIqdT1E5errezWI8gqSSw+KGBkZqt4hDW4zrtg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Improve release process section
Date: Wed, 30 Oct 2024 11:07:27 +0100
Message-Id: <20241030-update-releases-svg-v1-0-1cafebd6c6d9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8FImcC/x2MQQqAMBDEviJ7dqGtxYNfEQ+1jrogKl0VQfy7x
 WMgyUOKJFBqiocSLlHZ1gy2LCjOYZ3AMmQmZ5y3pjJ87kM4wAkLgkJZr4mtr72NdZ8dR7ncE0a
 5/2vbve8H0010X2UAAAA=
X-Change-ID: 20241030-update-releases-svg-14641c6b0242
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=783;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=GqVweV0QwrIiCegA3eiPnHKI0zHUAAe2npKw7iybAbg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnIgV7G/Hio7uafUtZA3Vq/MShvcTrfzlmm7l5a
 wc2bn6qcP+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZyIFewAKCRDRgEFAKaOo
 No+5D/0ULMJgjQiSatN8CHmZVWGc3v0ECHnPwexyiWI8LNzO2se+0Zhkf1CclmeWFr/4fzRBKnZ
 WX31Iopz87ZAmnYVCfq2pKSWSRD0J3Zi5shyfKo0tbZO8yWkdX3ySUiIOJP3wGrJv1Tloao/Ow2
 4SkwJALq6tFNtQjmJIezfutA2+7HYpf7g8vy0jyrdDxgJertgSL6hwStg2IeSpSCzEGTGi2eYRt
 cXAXxMlO8mIV4DpHiyge4FfwjgYmMQNJB3eoDkoKBnM0etyw/gnU0Wd3J/G8cTjWnsctm4c9r/o
 gVrGEACPydZcndDtx3lpwFHkCgx3f/EPtvyOBDimPJN4Gp0Hgp+evAbaiLD14N8uzdVULcjt8Y1
 seFNKbM4Xlep5aRIpm5Qgl0gw7/GdlzqTjsO/VWQSsY+1e7jdK4HiHAE3TwxLezfI1CJzbRwOPt
 tMXD/A3pmvWj5/nXygHJPJbV3n+/OQhdUTrRkMmVAgbB0mSUfEuNz8DeGES973t3KdO/xbYwKsd
 IdMoDCvITQTESokBsumkUUnX5Rv5ANo5m7Vem0y3lM4X9E1FfMvdLRH16AwZk82O9d82hjSH2js
 OWsCSeE4yuSSSuzYhG6Ushy5QCQWp1QzrAcj//+2kA4HyfHzeo7/5r+GyFJ9s0XtU3D8fZ/JAYJ
 2Guw1USrbtRyo+g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 10:08:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5612

Following some discussion about the releases.svg file, timestamp the svg
with the month it was edited last, and refer to the release the doc was
built for using &DISTRO_NAME.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      ref-manual: release-process: update releases.svg with month after "Current"
      ref-manual: release-process: add a reference to the doc's release

 documentation/ref-manual/release-process.rst |  2 ++
 documentation/ref-manual/svg/releases.svg    | 18 +++++++++---------
 2 files changed, 11 insertions(+), 9 deletions(-)
---
base-commit: 4c81e2856c268d7d0221ebb6b8156ad65b9e83ca
change-id: 20241030-update-releases-svg-14641c6b0242

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


