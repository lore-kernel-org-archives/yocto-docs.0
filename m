Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D37AE9906B
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:48:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.152847.1775814493329351408
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 02:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BmuQHPX1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 185D9C5C19E
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF007603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55E41104500E3;
	Fri, 10 Apr 2026 11:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775814490; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Aq1NnzNUGq/2fJ170bXOHv+YHJuQsouMBzjAuUekH6w=;
	b=BmuQHPX1jvzlG4u+qafMMggs0wyxq3zK/Twfj7vmGuWVNxvmInh+TLS5nh5q2lyhuEUwuv
	gJh+cTPFEG8xMG1QbybD/BSuejD5AYrqaejg9I4tsi1Nm9XdCkDeiWybqE+Aw3LiwfKBlZ
	sSzxcG/inj3hML7NqhBHbBvQ2/LnST0RRqxsQV5ifoOzc42hs8jZsbNxXhJ9sY6EPM5Joy
	/hAI/0aABsKO512NK8rrZbP2Zz1FWT1PeGn4oZ3Aqc2fnk0HxvTT9VicimrMk/9Yke5wzs
	/It3FSXgFMeDtOT73NGwReC1xWt0U5MmJxQUukHOXSLg/q/mNR5KlJKzGyh6Rg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/5] Updates to supported distributions
Date: Fri, 10 Apr 2026 11:47:59 +0200
Message-Id: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTuQBLXgVcRF2vxoRNIwk6hQe
 nejLt/mraSQBKXTsJLgmTQtucPuBppvPl/BKXSTM+5o9tZwK8FXcMaLtZWySEVgwQNeoRxNtNM
 Y4sGNnvpRBDG9f//58re26Y65flPatg/XgiYCgQAAAA==
X-Change-ID: 20260410-update-new-supported-releases-f0f1b7df527a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=870;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Mcvzl96uEUCVr3UcMPYYKGuisNtxZfmqXLNWfO1bMcs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2MdYU4hz0KeaD9xxodpaDB2em8V+wIviUF7DC
 fYvZXFKcMKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadjHWAAKCRDRgEFAKaOo
 NstpEACj5zeCUkarjjPRxxdwR1Aj0bsfto/FbL+8cBqKiWvoXFSWLpZVEDj9GYbtUyKEpBydCAG
 OdkM97KO9o40BkCR2Chq7DDyctJe9+Z47gv/LbSu+nojpP5y2OEkXvR3LTzDFORy7QbhDkTIuP2
 zsxMkXd2R8Fca+yJvJV3cU6jyRjmwzj3w5qNEK46nA6IvnzW6n9mIefwUGhwmGQdyqSe7WSe7Wk
 +bnihank5jXpuk3koPJjy3z6ZTnpENhlewSbh3/7OglB/WyWc09vyeadeB/LsuI95L+uc0xJ1Eq
 Y3Ovl8wYvSeTwGUX1ks96tqQv7cRpzyEZ4uq9+VfzlZb4muJ6dKs3NVCebDSoM6j5Ej6yRFWNEQ
 hZ84lsM5uqGzjlBcNA8A3xuiFtiBYShdVWzVERAN66FwXGHuJGi0myIjkHGAPxjt2qa0cAlS/TK
 kXZlP4FhkBQjv2wfa95lT9gwV5VPd4nW4xixhHTj3ccrVIXdkj6Akf5/nQnQjS7ZszkVdgu9qV2
 GkqZ7pkUD4sVdldy3GSWqr5U+BEK3uJqaxsMTqD0NCVUNFNFhw/Pxg6W1HaMW87Ec3TIxG5vX0f
 r1tCZv0FYp6B8VzZpuzz1okcWX5uJHPxyc1HL9or3gXl3BUvyR4ePaj1FWox1/nR4y+5y9WK38L
 QP3xN1Hod5u8Ksw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9214

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (5):
      ref-manual/system-requirements.rst: update supported releases
      tools/build-docs-container: add ubuntu 26.04 support
      tools/build-docs-container: update fedora distros
      tools/build-docs-container: drop support for OpenSUSE Leap 15.5
      ref-manual/system-requirements.rst: add section for openSUSE Leap 16.0

 documentation/ref-manual/system-requirements.rst   | 47 +++++++++++++++++-----
 documentation/tools/build-docs-container           | 26 +++++++-----
 ...use_essential.sh => opensuse_essential_15.6.sh} |  0
 .../opensuse_essential_16.0.sh                     |  1 +
 4 files changed, 52 insertions(+), 22 deletions(-)
---
base-commit: 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90
change-id: 20260410-update-new-supported-releases-f0f1b7df527a


