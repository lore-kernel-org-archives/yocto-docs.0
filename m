Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C836C0218C
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 09:58:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.48498.1737971914322536397
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 01:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lrTJvsH1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB6CE6000A;
	Mon, 27 Jan 2025 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737971912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/52rwfvykSotTuXQNqsJjOEM5IZFqcydsUEDK064RzQ=;
	b=lrTJvsH1sYPpeHMmPLyc42rXVTdPNN5ev73EJo5IDDdEw+TMVz0mWAQ8dVGRHUUJ714B1j
	d2r+V/dpNvL9PL5frgAVvPDmoDu+8u5PC7hHxeIwCPmoZitYctxAZggpuBUV+55eRc9UNo
	lyRR1C7sEl0UE/0r77ugewxx8XZBANrBX+HC2Voje+ZnoADq7wdsM+CW8oWIliOWHtU7XK
	bF0UhyyGnpagjv+LbJUXUJM0TD1efBSROPvrot/3CSWhfgEalhK+pk1WMgNBiD91Q6iA2q
	ET1xoZ5WQUygSw6dvpeEcTq20iS7U/8dmJCsg3YRZNv8h+18w2GnzQ6bzKvZgw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [yocto-docs][PATCH v3 0/2] Move devtool doc from extensible to dev
 manual
Date: Mon, 27 Jan 2025 10:58:21 +0100
Message-Id: <20250127-devtool-dev-manual-v3-0-0e7ed17cfde4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1Yl2cC/23N3wqCMBQG8FeRXbfYP2l21XtEF26e5UBdbXMU4
 rs3DQnCq8P3wfl9EwrgLQR0LibkIdlg3ZADPxRIt/VwB2ybnBEjTFDGOG4gRee65eK+Hsa6w0p
 xeWIlNZUClB8fHox9rej19s0enmO2469sbYjOv9fhRJd22xB7G4ligonWwqhSCkLlRTkXOzsct
 evRAia2ISWhhO0iLCON4kYrSVXF/5B5nj/WN4uYEAEAAA==
X-Change-ID: 20241223-devtool-dev-manual-bb387251f9be
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2256;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=T3p+8hiYDSBXgea2UFF63lpxdU1MrNnmZxq9jdVVzjg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnl1jHg+IKfyyCG49IxwQJSCbwdzB2Si4k/0oWO
 wwTsUdRN0aJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5dYxwAKCRDRgEFAKaOo
 Nm6TEACH4OZLA5bilTDzOgypfORnh6lgfiy2ZYkEglKgXP4lczvGU+U1QT1bpPk3cjKIrwLFipC
 lHACHI2AfpEmko0c4m/zTF8hyKLpiSWUx8v6TqYpp0PFRzx05V4Tfw/aQGZLd1W9777Tln/CHoT
 ft9MTuy7dPceYJu/9H8Bekhi7EAlOgR0PE+lTI+S9SVBUq6FYgezRu3MGiYbEcwjlQ/9jhneOJB
 bzT4D5tfR7gHYgfoknwAqNMx0SDZQ7aJ9adIxulqTMj09n2dx7vIK+nyz7REwp45Fewv9G0NCLI
 Gk/15FkrZtjCvqA2n+vSlDtYRkBcS23FG+OBb55YLeBgpI93g/zfiuLyAgckkQn9wiRUka1pNG+
 cpQp3a48p+5YqA6lboJ0ir1xPaDnvJZKxXpQWUj0fgj75CaUy79hpUSXfQz/yjZ4pUtj53WQB9x
 V7FNma6ym/WjhtTeMHacrHGvcmPjazw9mfc53VRRSYi3+aBmdR8PpD/hIFpJhSY9qp1FIAQOSqJ
 QauMJ+kdneIlSM7OLV0rHjdOpTvV05cx0qBRUyWP4mainpf/zrdZlsV60hf8aXz7JEzXDsSUPSk
 g5dqFbnvWr7NdPOdgMc0/npgjwEkonszjw0xQIrfxEe+ORfB/essTBKJ+5DJy4BiCB4gomUWfpK
 DUt5nAjJK1ovtZg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 09:58:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6191

As described in https://bugzilla.yoctoproject.org/show_bug.cgi?id=13417,
the devtool documentation is not really coupled to the extensible SDK,
and so documentation for it could be part of its own manual in the
dev-manual.

The first patch of the series moves the documentation from
sdk-manual/extensible.rst to dev-manual/devtool.rst. The second patch
removes some reference to the eSDK in the manual which no longer apply
within this new context.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Also move the ide-sdk section of the extensible document, after
  rebasing on Adrian's changes to this section to make it non-related to
  the extensible sdk directly.
- Link to v2: https://lore.kernel.org/r/20250102-devtool-dev-manual-v2-0-db3fcb81b938@bootlin.com

Changes in v2:
- forgot to fix some references to titles in the previous version, fixed
  them in this v2.
- Link to v1: https://lore.kernel.org/r/20241224-devtool-dev-manual-v1-0-0cc4fb584018@bootlin.com

---
Antonin Godard (2):
      Move devtool doc from extensible to dev manual
      dev-manual/devtool: remove reference to the extensible SDK

 documentation/dev-manual/devtool.rst               | 1322 +++++++++++++++++++
 .../figures/devtool-add-flow.png}                  |  Bin
 .../figures/devtool-modify-flow.png}               |  Bin
 .../figures/devtool-upgrade-flow.png}              |  Bin
 documentation/dev-manual/index.rst                 |    1 +
 documentation/dev-manual/new-recipe.rst            |    2 +-
 documentation/dev-manual/upgrading-recipes.rst     |    2 +-
 documentation/migration-guides/migration-2.1.rst   |    2 +-
 documentation/overview-manual/concepts.rst         |    2 +-
 documentation/ref-manual/devtool-reference.rst     |    2 +-
 documentation/ref-manual/variables.rst             |    2 +-
 documentation/sdk-manual/extensible.rst            | 1323 +-------------------
 documentation/what-i-wish-id-known.rst             |    2 +-
 13 files changed, 1333 insertions(+), 1327 deletions(-)
---
base-commit: 287817f33688d61f7a71c056bfa5c645edb4fc4e
change-id: 20241223-devtool-dev-manual-bb387251f9be

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


