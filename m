Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E59C55172
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:19:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2766.1785489577437955185
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EVlQ7+an;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1A1D34E41046
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E413D6039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DD3E11C165E5;
	Fri, 31 Jul 2026 11:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785489570; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ozM2yvseaWJ+g8APFvojMIuHHBrS+A8OgDA+Fey+WE4=;
	b=EVlQ7+anRQZSD6B0/R4nsd64J0xldbZ7J4jm0VRlB7ElA2yHSM0v4UPPDT360NiJpO2gag
	DiM9p6uHho3uU6VnJZ82HJdTjDDegIC/RAYUghWLvtevXPocUwgNko46QmH+rtXRUf/ydD
	bUl+HUm/nqSo7oMWcTw3hoQ8npu0vOuwu/HH4Q1xvCnA7JtoklIPHK/3tTFuXWqlrpbke0
	3JHuUgEIlO7R4LEwutVoxkICYbqpBIr1VyULGNZ0QaD+r2axFMDVqJSPngdkaCekRLQ1Qe
	yHQ330qlWqPljngOiuCeX7mgNcm5gP+/BhEG4tgfZqrdO6DpEFWb9PeDOMQw1w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/5] Make the SDK section not specific to the eSDK
Date: Fri, 31 Jul 2026 11:19:23 +0200
Message-Id: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0JmbU3bhBJceQ/Doi2DjCIlnUo0h
 LtbYOvyJe//twBjJGS4FAtEnIkpjBn0qQDf2/GOgtrMoKU2stS14PYp/GAjdeRtyjaL2lonO1t
 bIxHycIrY0Wc/vTUH89s90KftaTN64hTid6/OavOOQPU/MCshhTEKTamlcr66uhDSQOPZhxc06
 7r+ALkTupzIAAAA
X-Change-ID: 20260529-sdk-clarifications-9aab0fa9a60e
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=78npv9iwbOkylgX07uoqW79psuNp4qwUbkYx66gLbpY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqbGigLpKUNapioYhcYU04J1TeyRY0JIkFPbxFL
 mYA5yWF4cCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamxooAAKCRDRgEFAKaOo
 NmDdEACpAs1XTdqZ/seWrrlv7EhAqGBRNtecr6hiqcPkScLBLDYoaM4gTnMBO/kvjIfLrtPF/ln
 69r9G7BT3um6QbTkASovx3Xou/IVg4r9xlbluaRFC+4rVcALl/v8yW6vbW63wn4fEYl5E2zDjdS
 PATrSopXJrY+5Wk8FKUwWHjWF+gri8gU9sKy2b+nyvxPiwdM0GPVkQOA3YBB7NUBF2VWVtakMBq
 KxMTziJJdKwdIO6w1Aa2BFzt7FBpv7Xx6hqzujZqOF+ciB1XrOCXJg6FaxYMMh+17qarhGjh/1j
 0BQHJUpt+wFLyRtuxH7j1QpMrGIgsks/qPDjoP2K4yUOEkngSCn+hOhnG2QuZe4yGcrkoHOCR9/
 PZ9jd758BgM9srZL8ZiwYM62nXqX+vntXHvt5m5Uj68cb+S4OAJl1tbWSwOtdDSB2l8j/UZ26VG
 MfYXQT3wtZ9M9+JPx1c2AjDYI1IaWwOGcm7sBZkYecccC9zKktVpo487St8pA/fUiOTkwiEA+m5
 Kp7Og18P3+2UzH3qA0rb1ewkNgDO3G9lz7cLcgAidPeVUo3jFFs19wuz3kxjyVkNewdSmLzGdP6
 a4hysh9elJJw4Sw2S5VWa8x6dMx8vwwHmg3xPf/tie8x64Akh7tO0hx0A6mrrr9oirhj7TOuirF
 EZm/o125TPvZ/EA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10206

While the content of the SDK section covers both the standard and the
extensible SDKs, the title only referred to the extensible SDK which is
confusing.

This series comes with other various patches to improve this section.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Apply suggestions from Quentin (thanks!)
- Link to v1: https://patch.msgid.link/20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com

---
Antonin Godard (5):
      sdk-manual/appendix-customizing-standard.rst: use code block for bitbake assignment
      sdk-manual/intro.rst: remove a confusing sentence
      sdk-manual/intro.rst: link to sysroot term
      sdk-manual: rename the section to remove "extensible"
      sdk-manual/intro.rst: detail differences between standard and extensible sysroots

 documentation/index.rst                            |  2 +-
 .../sdk-manual/appendix-customizing-standard.rst   | 11 +++----
 documentation/sdk-manual/index.rst                 |  6 ++--
 documentation/sdk-manual/intro.rst                 | 35 ++++++++++++++++------
 4 files changed, 36 insertions(+), 18 deletions(-)
---
base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
change-id: 20260529-sdk-clarifications-9aab0fa9a60e


