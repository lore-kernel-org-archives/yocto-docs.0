Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B43D2ED17
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:17:17 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8670.1768922232547430918
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CbWbkxqC;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DFB7B4E421AD
	for <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5315606AB;
	Tue, 20 Jan 2026 15:17:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C134610B6B39A;
	Tue, 20 Jan 2026 16:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768922230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=7bE3ubEttBwPref94wnqtpKkPvVOV54GK0k3JKAkDcs=;
	b=CbWbkxqCchBHmjA6Mn8DyUes4rwUnkb6QMzjlyARddVM98LFX8nkq7gCKSzlpH9I1Lty2g
	2W6UOLZuLS9zGDmaBD97krDMXDwgmeAEfnHIyiMiaflTaIqGaPNYhFkbTGVyanuN34yrA3
	YRJP/7x901aVZL/9jiUP/yzs7NWDaw9u5a/3FeqOyUo+Hmb0lOWG8EnxFvoIiTw3UTI3qh
	o1ez1tSETwUGSH2HpXY+EutUMNx6IkQDWH7ai82QwB+EXCod/fXDq6aHeQ5jcuPT4Ey9Zb
	F/Hi4FRD0Pm3/ogXBuIDCkgXccvDgWEdFjCQl8b80V/AiC4diNHiXWPYReCJ3w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/5] Redefine terms now that the Poky repository is
 obsolete
Date: Tue, 20 Jan 2026 16:16:59 +0100
Message-Id: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGucb2kC/3WNwQ6CMBBEf4Xs2Zp2EQOe/A/DQdpF1gg13Uo0p
 P9uwbPHl5l5s4BQYBI4FQsEmlnYTxlwV4AdrtONFLvMgBorg3hQkcIoKlAfSAZlnXUVNkSVriF
 vnjng9+a7tD+WV3cnG1fJ2hhYog+f7XA2a++fezZKq2NjSmx6p8u6P3fexwdPe+tHaFNKX2i7s
 PC+AAAA
X-Change-ID: 20251224-terms-refresh-cdcd529ee508
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=eDG4BTyHNvHJHAk6pAR3lzfvaPEA6C21WkwxJWxL6ho=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpb5x0GqREeFQotGK4p1Vay5mjpHpeCIduC9us6
 udOuMm0J6qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaW+cdAAKCRDRgEFAKaOo
 NrbtD/9JyoX15B1GiDmcFKri+JGJ1IyeOQ8h0WAKEGrlyQw8X/PXKZyNKEeN0qFCuu2afW2kSRv
 E7DMyyeVZ4DyiIMyAT53bV0bfhyiD18vK7eyo3Z7EapEmWHIW1YtlBYlB8luDIH4IVdqn4oyE8N
 VSlrrM7MikmT0MZFZQRA434AkNgIL1KO3P+g9iayWPhy4Z1/g5EwjLBkGYiY/xkDKUGLLspwYl0
 rs6N3WKcdFkmZm/mzAjGnEfQ7rUdrbuhn118+TRpR4nhLFXxmnQxsWFUCt4Ucy3tOnPkltDSZTt
 ZhGscsUaL5jEXWHIqmfVeONUPVxxzOS+GmAWhUzS6CJx64/eSyGWVE3WEMvXIfrGkqMTnkeQRbS
 WbtjDiw9nGiN+9ChgRxJ0/Ix7yYh/PlxzYpDLetwJOdUbt8YEU+Y+WJ8OUVOOEDnP+onoV+sNjf
 u7FNrO2cJZUM8xt3cAS3U8vz2X1X9dVHlpuoTSEMZOpLWIjv5+eNonU9UC4/Y8KBL8l3RNQYhyN
 TDO4mP3NS70VnHrSJRQN263voUv958neCJ4CQBgcihXdw7/7H1o6anFF5xYNYqujQPO2iX5qJOV
 VbZuZtayCAV9b9UW4ot+Qro5ikf5+15yQOKPFmX37ViyLYomeE16VCvzrp7omu6HUWgtIUSquZN
 JfBjNZqghQCm5BQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:17:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8593

The Poky repository's master branch is no longer updated:
https://git.yoctoproject.org/poky/tree/README

Redefine the terms in ref-manual/terms.rst to adapt to the new
intended way to set things up, that is: either using bitbake-setup or
manually cloning the oe-core/bitbake/meta-yocto layers.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Apply suggestions from Quentin (thanks!)
- Link to v1: https://patch.msgid.link/20251224-terms-refresh-v1-0-691329fd038f@bootlin.com

---
Antonin Godard (5):
      ref-manual/terms.rst: refresh the Build Directory definition
      ref-manual/terms.rst: refresh the OpenEmbedded-Core definition
      ref-manual/terms.rst: simplify the Source Directory definition
      dev-manual/poky-manual-setup.rst: mention the Source Directory
      ref-manual/terms.rst: refresh the OpenEmbedded build system definition

 documentation/dev-manual/poky-manual-setup.rst |  11 +-
 documentation/ref-manual/terms.rst             | 142 +++++++++++--------------
 2 files changed, 73 insertions(+), 80 deletions(-)
---
base-commit: b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4
change-id: 20251224-terms-refresh-cdcd529ee508


