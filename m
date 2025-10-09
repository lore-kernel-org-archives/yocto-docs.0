Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAA3CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 07:26:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.6362.1759994802587825504
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 00:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fiabUVXn;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D64824E40FA9
	for <docs@lists.yoctoproject.org>; Thu,  9 Oct 2025 07:26:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD6856062C
	for <docs@lists.yoctoproject.org>; Thu,  9 Oct 2025 07:26:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47763102F215C;
	Thu,  9 Oct 2025 09:26:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759994800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=IsjS5BPB5kGSdgu5kXKu6eByEPCvi3+Ly1vEEVFz1DI=;
	b=fiabUVXnNFtxOvr1jT771qRAOMqCvXfvB0D0PKpx3StBNCfHoEYC8kY+CsBYteS09ld0SI
	dfGjLBx6xQWrdlLLysBEvaKpdZbNkDL92vFCtfJK+9QiMd5kDVe+DiCWJahLfTML48ZD3N
	P0YTOrVywr1H9ZNlWVwvVGcxTS0IqcIbT5KZCu8KVejcKwTy+KoN0i+jwC2nvCvx0vbWhW
	KWV94qN1UGDROIX5kFNa79gkJ4aKN700J7tXtnPX+cmIdrGxfEAT2fpyz20OxCmMc06wvy
	dvoPfSvHePfrI+S/ie3jil/KVKo1AovWEEW3rLInF8E/WwjYVIJtvkkXfUwerw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] tools/build-docs-container: add option to install
 essential packages
Date: Thu, 09 Oct 2025 09:26:31 +0200
Message-Id: <20251009-build-docs-container-essentials-v2-0-f135032bb43d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdj52gC/42NSw6CMBQAr0K69pkWLKgr72FY9POQl2BL+irRE
 O5u5QQuZxYzq2BMhCyu1SoSLsQUQ4H6UAk3mvBAIF9Y1LLWSsoG7IsmDz46BhdDNhQwATJjyGQ
 mhtZ4LW2HzantRKnMCQd674d7X3gkzjF99uGifvb/9qJAgdbnwepGmYvrbjbGPFE4uvgU/bZtX
 8Mtzp3QAAAA
X-Change-ID: 20251003-build-docs-container-essentials-6ad50b7e3467
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=s6hK7o/mAI6RUqUjyXTQcz2CCXz51Od+Px69RKi9gJA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo52OurOxCL1EPf1rFxSWBghUvq44o0U+40VwXe
 zln12EA6IqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaOdjrgAKCRDRgEFAKaOo
 NutsD/9qfDH4Xrkafo4vDXkW/ahgHBTZHAtUd3+26Pv1opHgZuErJB3nA1H9P1NWVtOcl9fLr+g
 UD7RZ8xT184U+gUZLAhv4XbYKVrieiV0Ih0Dyn4OhsxH+YQV4WqmOuT9V7F0pQbLIs89maJ7BAZ
 HxApyeKrtVtyGm/KHgrZ8AwT0D2dEdepFtvb2oYLqaljeyS593uMjsmVfNETqyv15vkkiOA4R2s
 MbB03wcCzRpCVhppPwfJRMqW3DVI76yoSuZ6nmwFjPWrdxHIUVqNkDCEajU3VbV4gWFQIMwOKux
 NE4YkqrojWp4Zc5RnfoWhrH45qO6QWZJSUfrK+JDkgMdLborh9D/euiLJmwZOJBl55Ev5G+Ijbx
 zt0mqF3snWJ1ZJ0Funme1dN6rckrp+RReUN65vJJFA/IakGZJ9iaOJUv3FsJF8cTeUy2cxDmhA4
 m1XfrNeIeHaLV3wgjdssJMySI3ZKWVEA/NNJhXXus4srYuIJBZqhuRduKVPgc5ns5cSx9VtJ89r
 J3mhDpNjvidur5t090nN8UQkMqy8WVDNi8Wf7GZIx1ijDyE+gkySqdheuTUEJ4E+4DLg63iv17H
 W7T8otZXU7VF8S1ZQGwtpwd8gXoUKp5QJHOE+LLVic3UVbOTtO2GlA2zdk59wIcw8r1pAiRkBTj
 +ouF17kmqATStXw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 07:26:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7667

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Rebase on master
- Add patch to remove obsolete comments
- Link to v1: https://lore.kernel.org/r/20251003-build-docs-container-essentials-v1-1-558fb531a9c7@bootlin.com

---
Antonin Godard (2):
      tools/build-docs-container: add option to install essential packages
      tools/build-docs-container: remove obsolete comments

 documentation/tools/Containerfile.apt    |  4 ++++
 documentation/tools/Containerfile.dnf    |  4 ++++
 documentation/tools/Containerfile.zypper |  4 ++++
 documentation/tools/build-docs-container | 37 +++++++++++++++-----------------
 4 files changed, 29 insertions(+), 20 deletions(-)
---
base-commit: 09c7800333b17b21e50d2a089a3ae1b123697243
change-id: 20251003-build-docs-container-essentials-6ad50b7e3467

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


