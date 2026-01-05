Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF73C79FA4
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 16:03:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67371.1767628983508773729
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 08:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lhP9KGbS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 05E2B1A266A
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 16:03:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB86460726
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 16:03:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B613103C858A;
	Mon,  5 Jan 2026 17:03:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767628981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rwe/2hE+DNWjOlU5OLxYeSC2NDGCuVqSSt2W+wWtumk=;
	b=lhP9KGbS6emk9O06Jgdk7q8fLCrH1tQI72sW4TIE+3W/lCczGAZm5Ap+I/DxzNv3HyU8MS
	lPCigoj2Sn62jqZ/vjoMp5oUoyiwtnmkoplAEywUSUp5RGVKJuhA1Yag3sFcjuo7di86LS
	sb69Aqo199SahUwMaPnlz2JRj8gOnHry0GEp1qA8gpQ4SUu/nolHO7Qh1zgdTpVEYQ0BNt
	aegjrfSo+ZvAnvLH4NEyAZsmXahu4Y3twVAMTpcE09CGOsnAZVl/WRv9+Zr9Xb4QvO+pZD
	ZyVwA8H+EG1ehRbDR6Vlim4LYIyennG/2yM6HJEHnzAsUy0fL+GzloXaWGCNvQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Convert YP flow diagram to SVG
Date: Mon, 05 Jan 2026 17:02:54 +0100
Message-Id: <20260105-update-workflow-diagram-v1-0-fc1c6f402064@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/gW2kC/yXMQQ6CQAyF4auQrm3CNJIQrmJclJkOFpUhHRATw
 t0dNW/1Ld6/QxZTydBVO5i8NGuaCtypAn/jaRDUUAxUU+OIzrjOgRfBLdk9PtKGQXkwfqJ31Lu
 yyE0L5T2bRH3/ypfr33ntR/HLNwfH8QEqWWqvewAAAA==
X-Change-ID: 20251224-update-workflow-diagram-c12b1b1bfa58
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JZRCIhDo82ZdCJB98k3MW0El3+p441bYr2a0IqSg3kI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpW+C0qQWmEKREHiaWRFYAaVAJWwbvOCVvcARxo
 UGUF2JgWmeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaVvgtAAKCRDRgEFAKaOo
 NodTD/9Cb1nBm+x8p8hL0/E1ktyfhcBZQzjTR8WF++0saUCx+DwvweLnLGN1D3WBdtoBHgxo0MP
 5813FD/IuN0kVC6CfGFJJbPf1NimbyS4JLstBQmf/qXLgWlfGt1du63e8Zs3Qnyj846+1ULrk+n
 A/xRqXo6ZAhG4aIB5j+rzKP88Fcis/duLmFggyInRZ6GjhmQhIYzhzKVDODgd1r5JjxJtgscaHD
 VgG+ZQFF77Fw91M+TOZE0LKVpkjOfzHZ0Bx4JYRdnYGTKKyY85ym541iGW4uu+wQh+/p8ZctJ3H
 xIuF9QBoPP+I/GgFU+LPciqgoyjL64lsCXxPdKiXAjguQA1mNad0Xad2+0QoXxFv4q1TwT6y8+o
 MSB6v19+6nduUqYNtYLEstGI8FWzhdY68umcP8rN9+Lkf9pDq9yF6P8tcLab4ePngyv4NzS910Q
 tbQApF4p34VF1Kwnfh/9ysMlbPxQMfqTG1N1lHylYvoc1hxk2HYZbTYY6O71w1AXRtCmsI+l6m5
 axJieovyX+R1m04O9/790wGOvGJArQmxbVgxQ27nWLgSOuXZKFdtUTvC3XKIWPbQmLGXmY5jO6g
 sEfGlrwH7ssRbcu/DKKipj86CZAIjP2L0yF4Iwp4+f55zdu5pnwr4lfWO/f3SMytq1z4qZVKIq2
 58I9BVlmALDoibQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Jan 2026 16:03:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8390

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      overview-manual/yp-intro.rst: fix SDK type in bullet list
      overview-manual: convert YP-flow-diagram.png to SVG
      Remove diagrams directory

 diagrams/poky-buildprocess/Pokyarch_diag.jpg       |  Bin 285707 -> 0 bytes
 diagrams/poky-buildprocess/Pokyarch_diag.svg       |  205 ---
 diagrams/poky-buildprocess/Pokyarch_diag2.svg      | 1544 --------------------
 diagrams/poky-buildprocess/pokyarch4.dia           |  Bin 3495 -> 0 bytes
 diagrams/poky-buildprocess/pokyarch4.png           |  Bin 52531 -> 0 bytes
 documentation/overview-manual/concepts.rst         |    2 +-
 .../overview-manual/figures/YP-flow-diagram.png    |  Bin 190715 -> 0 bytes
 .../overview-manual/svg/yp-flow-diagram.svg        |  950 ++++++++++++
 documentation/overview-manual/yp-intro.rst         |    5 +-
 9 files changed, 954 insertions(+), 1752 deletions(-)
---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20251224-update-workflow-diagram-c12b1b1bfa58


