Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAC3E9906F
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:48:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152535.1775814493293241206
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 02:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xkZnC/Ck;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8057BC5C19F
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69913603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF46410450962;
	Fri, 10 Apr 2026 11:48:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775814491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W9b4o+UizT/m5W7aKrm0V2tRBWH7VfSWDRgS3AVrpAY=;
	b=xkZnC/CkrJ/Hv6iIYNMCOMITHNXdKmwS1cyTsQFBmN0h1PmInUTjM5hSK3OqHy0zcYhP9g
	OnfAUzI+cz/4n2MZDGGDhTuoo2FrULwLwYv04+GRxtS/3W0m5fBbEp2sQXtw3C8y4iLGxr
	SM/YkS14T916DQqMiruN32CEHyqG2urFPDeLGm2j47Q51L0oB1EzbCVLqK9QhOAQI+hWKz
	25oR/L5tUhixuOFyMdOkj4bCVqUm+aMwuPc//fRk3GnXRlP3PlFXGJDCoh85PrHns7OeOL
	NNCY24Opg/T6GOcYlQ1Qtx28bxYUY/+B07CGCIlIn6aColgy4OFEwaHtgjxI2Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 11:48:00 +0200
Subject: [PATCH 1/5] ref-manual/system-requirements.rst: update supported
 releases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-update-new-supported-releases-v1-1-fc53a1fbbdac@bootlin.com>
References: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
In-Reply-To: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zDdMura+dAVrX7wJ/24mRIw/7MJ+bYmRNV0fj087wI0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2MdYG3bIHRaiJhJiwH7NXjYyYDMHY1x1BqTnJ
 WtnWpIM+iCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadjHWAAKCRDRgEFAKaOo
 NjK9D/9PANA7mkqaZRGpmy9VRl6G+MVA6sSchWBpkAL8ixFsfmY7w+Yq8h8y2FHjOW1lyx+J255
 AV/ZItmtIxKAVBwSAY1K35S+3yB5cqGjP3XHwCsGjJCEMiOkJYjdlMKD155xDi3iH/d8Upujejv
 8BZsiKHee0jz+neISv1SHimubcQNLb/vPiUz0LiOU352EUzLDO2bg1ORBtNzmPQAVR0yczv6seu
 5ioGhiyDJW2tLc3heSgG4jJYTH3eFygxvPrS09XrgCj2JeCgznfWN/OrDzioNe0Vq1a7LtNFSpc
 0/B4Sue4U0QNuLDZOyF1Ei1tk/8ACs7A+Cz1IsBFwcn3BhHTi2iE5uwVYZDBqCZg7/K+tfNpizu
 qaTuTYSKB1XW3Zcg8bzqPv3q4LALaWuPTwV5zhTbWS2jtkDLEAuzWPkVoCAP/yP7ZReEcq+KDKT
 W/Or06044CYMIuo7CuRQMd2nHL6OVEm1HoQasrymcd+Fi1VZdsKTTQJpEBwEvSxWd2E+Oz6O1FU
 pxOhIbzx/A6g33P2NIR4vLuMZ5EP+z0F6eCZHxg7xQbQcmpKEBiywLE6YIEGH2v2KPwnTlp+iWX
 3YuQNBH+pjIP3YXC4cgI77vYM3ZEQjKpTcyMNp8NaBhunu0YqZywBwo7c/DYhlrGPqjqxQ0Po94
 f4IkcgAwiAemoQQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9217

Add the newly supported releases that we test on the Autobuilder. The
output is a copy/paste of the command above the list.

After bff5329a82ba ("poky: Update SANITY_TESTED_DISTROS") and
49cbb01d5252 ("poky.conf: Add Ubuntu 26.04 to the sanity tested distros
list") on meta-yocto.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index b427e2c64..e94825958 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -60,26 +60,25 @@ supported on the following distributions:
 
 ..
    Can be generated with yocto-autobuilder-helper's scripts/yocto-supported-distros.
-   yocto-supported-distros --release master --config yocto-autobuilder2/config.py --output-format docs
+   yocto-supported-distros --release master --config yocto-autobuilder2/config.py --output-format docs --check-worker-statuses
 
 -  AlmaLinux 8
 -  AlmaLinux 9
 -  CentOS Stream 9
--  Debian GNU/Linux 11 (Bullseye)
--  Debian GNU/Linux 12 (Bookworm)
--  Debian GNU/Linux 13 (Trixie)
--  Fedora 39
--  Fedora 40
+-  Debian 11
+-  Debian 12
+-  Debian 13
 -  Fedora 42
 -  Fedora 43
--  OpenSUSE Leap 15.5
 -  OpenSUSE Leap 15.6
+-  OpenSUSE Leap 16.0
 -  Rocky Linux 8
 -  Rocky Linux 9
 -  Ubuntu 22.04 (LTS)
 -  Ubuntu 24.04 (LTS)
 -  Ubuntu 25.04
 -  Ubuntu 25.10
+-  Ubuntu 26.04 (LTS)
 
 The following distribution versions are still tested, even though the
 organizations publishing them no longer make updates publicly available:

-- 
2.53.0


