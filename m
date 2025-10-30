Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487C1CCF9E3
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 16:29:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.2131.1761841754192034856
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 09:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KTF6WNBs;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4E4D4C0DAB8;
	Thu, 30 Oct 2025 16:28:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBFDB60331;
	Thu, 30 Oct 2025 16:29:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 821EC11808BEA;
	Thu, 30 Oct 2025 17:29:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761841751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Dvo9xwxYg5BBAOH7BlLm3lFVGXbu147+Scn0f6DyOSQ=;
	b=KTF6WNBshSASrz6/h2PjpO9Bj+Nd/VGGgvuXQOI2iQFt3S/lSiqOfcdf482GCPX+WbSz83
	9KXTH248j94Z5Ioi9wbEsQ9g/fi+/82/Ss+SgG3yFZZnHIG5g806gi9GRwaGknJEZDL/Td
	7uxUCmKo3gRw/ZSAXMkdBQXojAmxi6gmfc7d9S2jR6bbQIlRI+ocerwIsISUoWcmaQPuM+
	0gTJjqa6JKEXrXlvcTh2NYkuXyKZO2lyzXp7Dlk5LAKnj8O+r+w7M0Dsu9USL75jcqBVGY
	4qtVGi1fhPST8PPxBV+d4mBawOCKltoKmgW6wkm4LYvSwQYDZW4Zz7uM5H9lMQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/6] Start switching the documentation to bitbake-setup
Date: Thu, 30 Oct 2025 17:28:29 +0100
Message-Id: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC2SA2kC/yXMTQ5AMBBA4avIrDWhfuMqYmF0MCRIp0Qi7q5Yf
 ov3LhCyTAJVcIGlg4XXxSMOA+jGdhlIsfEGHeksjnShkB22Mykht2/KlH1Sos5zTA34ZrPU8/n
 96ua37DhR594J3PcDgUHmJHEAAAA=
X-Change-ID: 20251027-bitbake-setup-d8f38b266b4d
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Tim Orling <tim.orling@konsulko.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Zdg3iBZUJnmrdIwOs9nKKLKCx7qN7Un02nqfYKcAaSo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpA5JVwMmss7aV1KX9X2o7NdcoqE1cTImoscHev
 mYitShTGq+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQOSVQAKCRDRgEFAKaOo
 Nv7kD/wJe+GvDNwYGpi0Xxhn41Xl2xaQhAQpCHcpW54cPHYg9gR8A+CxwAUJBBoIX3lnksK7hjc
 JVC5m7RJodZIiyb4AecvlfhK7/96OC0m1An4eCgSqu2qrN4VbQtfC86Q9StqsJic2gI/Or47L2p
 Es/IZzAXFMzEzRcgvgP8UspuKBkROk9YsamEEUaVryXwr4MCd/7v92Fzs/5vIaQk6AyASaKJNRH
 Ytthpv7fHANVhq2+X8PKQWnhKTrxLthKc8e6FuVnV0hLp3CHjaWkJidr0JyAlmSw9oc8996hBfa
 kwgPTUPhfMH1slPNNTm4GJMKVplt0HvFF9OJkyszKeFS8Lo5hfrmHcChIozjZoSAP8KDipVg72O
 rDh6VOZicFdK/oqdgk+lO/XSSRtbwx/WnOTrtz6hJlxRgYkAemzi6poHZC3V+oyVmBKk0kvAlON
 EGpGefKlrKmy1d7IP1S5VIRmeva3CqN4Ay+2Gq/fVnYw3jatO8h/MPemCWBBl6fsS79aiAoU9B/
 H+5zDheR5ibpyg5Q+bFBl5avdJ1/4AwOlrUQ9iKft5U7jAtQX7cKeVnF0dhDlQMPQjbH6iOZPYy
 zH8b3weYHmKy0fxP3de/4GXsK3apVCxJ6v1eRyGJ5lJXk7+8msljT3nlI80pwwdstki13Xg5ChH
 XpjApF6LhAsBFTg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7929

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

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (6):
      ref-manual/structure.rst: update the description of local.conf and bblayers.conf
      ref-manual/structure.rst: document the site.conf file
      brief-yoctoprojectqs: delete unused figures
      brief-yoctoprojectqs: switch to bitbake-setup
      dev-manual: add a document to setup poky manually
      ref-manual/terms.rst: update Poky description

 .../brief-yoctoprojectqs/figures/bypqs-title.png   | Bin 14312 -> 0 bytes
 .../figures/yocto-project-transp.png               | Bin 8626 -> 0 bytes
 documentation/brief-yoctoprojectqs/index.rst       | 398 +++++++++++----------
 documentation/dev-manual/index.rst                 |   1 +
 documentation/dev-manual/poky-manual-setup.rst     | 125 +++++++
 documentation/ref-manual/structure.rst             |  66 ++--
 documentation/ref-manual/terms.rst                 |  19 +-
 7 files changed, 390 insertions(+), 219 deletions(-)
---
base-commit: 6ee2a9a04a4c8201a96a1173cf00aa7d206170df
change-id: 20251027-bitbake-setup-d8f38b266b4d

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


