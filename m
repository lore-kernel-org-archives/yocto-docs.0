Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D27DCCFA1C
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 09:11:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10739.1762420299689580814
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 01:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pHwcNfKg;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E776C0FA83
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 09:11:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9ADAD6068C
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 09:11:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85B79102F2506
	for <docs@lists.yoctoproject.org>; Thu,  6 Nov 2025 10:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762420297; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding; bh=msIh4f+4D2jIjg8TE63DIQ9pKKOabPgrnBXlUYV9F2w=;
	b=pHwcNfKg/y1KlGLtO/QuMKWKDoGDTHapePeLLD+gTKDUk3seWPpXyhcrAv9pnlSjuTg/UJ
	VwwtrDPaAmhDSOYHiLtg5mkHkPjlAUyiqWunlNer9RC79v3iCL3gDBdUHCStpXw3xcBgXH
	MZVTY3UZy0WHuUE+5nVV/n7fYl//+ayYBn+SXz4I2MF+yTfP15dUNoJ0WDmyFhb8RKTb2g
	6Vg3xo2viMXhp5A8agck8DtFGPRVyoOnNXjButT578BT/5hCvAqNo4oP3PDECgr391KR1Z
	zPm0yTiZAOBSwPMNeuYTQ1EcDazIUfDa1X6Em4t2GTTCbtTFhh5SUxWyE//udg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/7] Start switching the documentation to bitbake-setup
Date: Thu, 06 Nov 2025 10:11:17 +0100
Message-Id: <20251106-bitbake-setup-v3-0-97db90f85f84@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADVmDGkC/12NzQ7CIBAGX6XhLAYotujJ9zAeWAoWf0oDlGiav
 ru0mhh72WSSb2ZHFLS3OqBDMSKvkw3WdRnKTYFUK7uLxrbJjBhhO0pYjcFGkDeNg45DjxthSgG
 sqoA3KDu918Y+l97p/OEwwFWrOEfmRWtDdP61PEx03n3bJVm1E8UEG86lkAxqReAIzsW77bbKP
 dBcT+zn58DaZ9kXewNAucq3+fenaXoDdR3dgv4AAAA=
X-Change-ID: 20251027-bitbake-setup-d8f38b266b4d
To: docs@lists.yoctoproject.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2865;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4sNvlprt13kdwHJSgSx0jvFPbmaxWAK9xd+eQUffAE8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpDGZG3k7MDoYByPtF2QYbvi9Cb5K3u5cyR/hD5
 g8GPuwFU5qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQxmRgAKCRDRgEFAKaOo
 NjbiD/91KUy7GTn/u1UqnJWCknFU1lj90vf5RBk4kjX/fvU7PyuXI5uhUj3C9AGJGdixhZeJ1NG
 zuglo5I7gDV8dReGjllhQxoh6mPvtQd9a4KSMK4pyO1R4/z6TSvnVGZnrExrIlKlA7La3kM7Fs7
 HngK50XrlwsgLPzFyby00t+NTNkPfL0hJNj/SSWElyaVEZK6fiohzDx7WFMfJl7HhTqQe6aN51e
 ZRRaAIc6UgHPs2YQ1lEpZuKFf02LlGE3vS+ZlozC01+iC3JBL/bzKqYphP7E6rrCluBy2+WtKF0
 lm0bLxN2ENhIGyeP5WB6+ngDSgf6cQsY37ozHoOFwBYO1BOy1fHF2nJ4avoaibuX8HCXzabUGNB
 AgWRF+FkdRUw5WwwFYBRZQhZAZtspqywbclOWJOyFXrLshRoZg/nIrXrO73Chk0i/YBT/DPwssO
 PLktmRk77FZL3LQeWcD82nA3WCKZ4qdgp0F/wykiDAZbfkGcdQcbH0bKfyWP3sZYrmo9K+Sq2nM
 7/Y37JUJk/hu4Bvf+MfXiMzAP8Zn0SJQogLylPIJ/8t1Rf+fsdFrd8eYyruDp/aSRQE2imOveGO
 nR4xWrNJxh2szMfUqLEy73spm/fnMcqrSN5TXMA+QkcG/TO2xxsqKujP/RRXucMHN/VBxOPSZwS
 hudNgGAty7QOQgQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 09:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7997

This series is a start for transitioning the documentation on instructing how
to build the reference poky distro with bitbake-setup instead of the
poky repository.

What this series does:

- Refreshing the local.conf and bblayers.conf documentation.
- Adding documentation for site.conf.
- Migrating the Quick Start Guide to bitbake-setup (thank you Tim Orling
  for the first iteration of this).
- Adding a new document to instruct how to set things up manually, using
  the different repositories that used to be part of the Poky
  repository.

There are still references to the poky repository in places in the
documentation. I will send updates to this series (or another one) as I
make progress on this. First, let's have some documentation on how to
use bitbake-setup, as a starting point.

Depends on: https://lists.openembedded.org/g/bitbake-devel/message/18241.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Add suggestions/corrections by Alex (thanks!)
- Add a patch to document core/yocto/root-login-with-empty-password.
- Add websockets note and mention buildtools.
- Use meta-raspberrypi as the example BSP layer.
- Link to v2: https://lore.kernel.org/r/20251103-bitbake-setup-v2-0-89fbb14cfbbd@bootlin.com

Changes in v2:
- Apply suggestions from Alex's reviews on v1 (thanks!):
  - change local.conf description
  - configure root login in local.conf
- Update references to use new bitbake documentation on bitbake-setup.
- Link to v1: https://lore.kernel.org/r/20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com

---
Antonin Godard (7):
      ref-manual/structure.rst: update the description of local.conf and bblayers.conf
      ref-manual/structure.rst: document the site.conf file
      brief-yoctoprojectqs: delete unused figures
      ref-manual/fragments.rst: document core/yocto/root-login-with-empty-password fragment
      brief-yoctoprojectqs: switch to bitbake-setup
      dev-manual: add a document to setup poky manually
      ref-manual/terms.rst: update Poky description

 .../brief-yoctoprojectqs/figures/bypqs-title.png   | Bin 14312 -> 0 bytes
 .../figures/yocto-project-transp.png               | Bin 8626 -> 0 bytes
 documentation/brief-yoctoprojectqs/index.rst       | 421 +++++++++++----------
 documentation/dev-manual/index.rst                 |   1 +
 documentation/dev-manual/poky-manual-setup.rst     | 128 +++++++
 documentation/ref-manual/fragments.rst             |   9 +
 documentation/ref-manual/structure.rst             |  70 +++-
 documentation/ref-manual/terms.rst                 |  19 +-
 8 files changed, 432 insertions(+), 216 deletions(-)
---
base-commit: 5cb37206ca0dfaa0dafabb28ebd546b591c88486
change-id: 20251027-bitbake-setup-d8f38b266b4d

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


