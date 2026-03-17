Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFCEFD7068
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:12:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72701.1773742311347153457
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 03:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fD2vLHru;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CD10C4E42629
	for <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:11:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A260D5FC9A
	for <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:11:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AF5E104503AE;
	Tue, 17 Mar 2026 11:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773742309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ERykbESUsgZRbvNooxlI5nvLkeYib9cLWsBoFK1LxBI=;
	b=fD2vLHru9XbOS9a4oG0jLyd4vktcsBCzbqbVBkU8hIY9tJL/pxRuCPLQ4G02qd/s3iEgM2
	6aafjuRNnQbxqiXJcZucvRAgvABmtzESOykp9rGHW1UVospaqvS5lPU7D+5t8E6AUKe3gA
	sIJrpBfeP71Av75CShe7VANwNGw9zctTr2FnKVe3+DhAnZV/l+YsCeqL2uPXcko4UuIPzJ
	lxtQ5MC/FlAVQah0X795dRNKTKWkq1uZILngkmaT+5JIjBTPZgrGlUhqui3FEL8SF4v0B5
	KRJ3n/paHezn2241lVALDHmzkVWLYXGctZvtpLhXEdc2gL76/xpG5Dgj4+DYVQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] set_versions.py: Use remote bitake mappings
Date: Tue, 17 Mar 2026 11:11:39 +0100
Message-Id: <20260317-use-remote-bitbake-version-mappings-v1-0-3c294fe04944@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMBCE4Vche3aTtipGX8V4aGGKq6E0bSEmh
 He36PE7zD8rZSRBpluzUsIiWaZQoQ8NdU8bBrD01WSUadVRX3jO4IRxKmAnxdk3eEHaZzzaGCU
 Mma+th1VnfeqNp1qKCV4+v5f74+88uxe6sqdp275O+iGphwAAAA==
X-Change-ID: 20260317-use-remote-bitbake-version-mappings-96fea0514d2f
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=870;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yLANBvG89KzbwgIDk2CT04gr5FHAri8lOHuiVPdcEXU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpuSjj+k+4SXJeDGNvh6ogeJySlY2XcRI3Qcfl2
 6R9S3ZPsG+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCabko4wAKCRDRgEFAKaOo
 Ng7dEACg4aeBI6CjONvrTyyHxlzHeUHmE0A8HAA9O/GvODEnQR2bnINkHK07ry1rIIF4G5ylGX9
 9I7VFuk+PJRdK+P9nuTDd/D49oT0w90E7L7lXcIvSkgYvueMyIfjzb/Uig4kV1o5d8EEU0xN8qa
 a6BKtNVKaeghsRgH56vlyD9Wcbil/z7R6TfCWzmMrLSkXQ/kRUjNCs1USdZ/7/nE6rvPY9i9SSH
 OiSrDxA5pG8iqz9e96i8vJ+7G5uu43w0DuSXCYwoz/qWJZ0UnCaojHv+knBjUBsHuNyn4b6c8La
 Qk00EHFejK8hc/U49d9/wz8I+k8YiAZqXjLeV0UNYkfh04lM2l53LDsgntoRvVPskz7ribeA0cP
 CBdBVDCTGQZDOB0ZMAYTU4Y7GtL3DbjxxFeQWnwTLeYSriuiu/xPuzJdCiWI2Vo4jRKk5WWMPHI
 57T+izQ4vlnvN7s10BQE8ThlgCzCrRdE6UcAz1OAJvEKEt5CieM7wvzR+y+aAq1ICKpL+cZ61oY
 e1QdrBx8QbBUdA/AElmuZdfADAMSFk+mi1C/sgnU9JcKrUVXmR7vxwe1b+l6rD2BQKYoYoAKsXR
 Qv/a0BMFfkDPQ4zartoXQmyGrDtRcb6Dyt02UuA0Iq6ephblvuhW6v5jDVXZuqchU5R+achqb3e
 bCMR5GL9++0k42Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:12:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9090

The bitbake mapping were added to the remote releases.json file[1].

Use them instead of maintaining static values here.

This series also includes some codestyle cleanups for the
set_versions.py file.

[1]: https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?id=62d06a23f8168863777b85fa106cf5a1ebb1eade

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      set_versions.py: use bitbake mappings from remote releases.json
      set_versions.py: move the poky_mapping dict where it is used
      set_versions.py: fix codestyle/formatting issues

 documentation/set_versions.py | 86 +++++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 45 deletions(-)
---
base-commit: a337c16d7608664c9d6f0f8a4727593c0a18437d
change-id: 20260317-use-remote-bitbake-version-mappings-96fea0514d2f


