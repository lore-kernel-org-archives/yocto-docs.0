Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4011E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.5381.1735810866872678493
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jan 2025 01:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Yznud+RP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0E7F1C0007;
	Thu,  2 Jan 2025 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735810865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=37MX0eFNWc/uxVIn+c42oV95/OHbkePwJ90d288DgTs=;
	b=Yznud+RPfyXRYyu+M71AKo00nbEnLHwOGPj0s3BIc2pBeSsjWCJzardhYZSuBw3pWaBXp3
	ikLIIHNA3ae4kxM+5aBaUgNMa0nt2aZA1uoCfcUCChWorgZmGxcPBws3+9Hl6kiEaSGxuG
	S3KM6oLaM16A3e2do0eO7/F32PlGmOYIc77ksB5erfVqOtqjJbE9XSbsWydJosES0o50Hm
	ImMEbkuc65XrJM+zPGIAgKW5oWvYZQNJuqezBs/6NDjmV1TzZk3OjE+WvJCMyI33fQi9Pa
	pTixguhNPMwtvLuQesWOtOHYVQYOEhcFJBaPnGbzH5Pq/795D+30MagIo+ZVGw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] Move devtool doc from extensible to dev manual
Date: Thu, 02 Jan 2025 10:40:41 +0100
Message-Id: <20250102-devtool-dev-manual-v2-0-db3fcb81b938@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABlfdmcC/22Py27DIBBFf8ViXSoYwDFe9T+qLHgMCZJtEiBWo
 8j/XpxU6qJdjc5Ic+7cBymYIxYydg+ScY0lpqUBvHXEnc1yQhp9YwIMJAcQ1ONaU5r2SWez3Mx
 ErRXDARQP2iJph5eMIX49pZ/HF2e83pq7vpa/6pb0V3yZ0p1Wk09YKRy8Dj0OBhQbV77rrSlIX
 ZrnWMdOWs2kEtozFbxxHAR63TuhFfRcBGux59CQ7I+cY6kp359lm2v/5Cde/tdr5ZRR5pwMVg2
 S8eHDplSnuLy3dHLctu0bWdb4Mz8BAAA=
X-Change-ID: 20241223-devtool-dev-manual-bb387251f9be
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Paul Eggleton <bluelightning@bluelightning.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DE6oSp3YhJAixyqspPgJok0u18zsFqYsAqKM1LuXTfs=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBndl8wGs93HvlyJTadqjW2TppOWt3Vr2JQaxjZ8
 hoTCbk4+q2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ3ZfMAAKCRDRgEFAKaOo
 Ng7tD/sFnQxI+Pl3m3N1ky6tHYkSyo03KCmoNqAQlBWIv2yhFn9doON6xTuUhx0Eb+aXxnixdbT
 kaUXMIS7rjefjEQWN0FQKFrUZICNVRjRy7JZRXokSVOeOuVcRl8s+v60pPwT+O9jTc/Ewkfg/WR
 y8SeB0FDWg65vG2Zj4KL+xx3UDsAIA5Nr1D9qYFVDaHfiKJ7Xba0fsePod8G0WvqfqgUYvf0Ixt
 mrhfXgPffcWbcLco2gHQUOpATluSJubuaYpDtgDoex52eGgF1mS2BvV0sSL9Ua0ONb8FswaG2j4
 QIJQnwcwTJjNJq0sLgMIJm/cTtzpAeyhO6Y9cmMPf/KLJFFavwpoSsbIwf7QnlPgEcC1AZyPLsA
 67l3zLWog84CJuTbobNYB1Wz0Nj08fa+u7verhwuHDXO4wL/L0w8W1+8eaxk/8fdTBXNdcDGpx6
 +3Irckj0rM5fnksGBE2Hi8+rfdsIbPm1jmtji1UV+zNM26/kWFibrw56bxcy5bFN/U7ieIhJekc
 Y8WtEdX56Nk6P2ZMOggpVTUacOXbii4bZLfVtIvN1RkcVZjyEyymgy8kb6IFNlI6q8B8nT9bxPP
 hYf63fNKYV4axhnuJEY4+w0sF1oJygrgjeud/qcmTspkLDHKV3jrJJHhSegPBpHaWg/ArwTmh60
 hpfuKC+LgKFqqTQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jan 2025 09:41:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6051

[ YOCTO #13417 ]

As described in https://bugzilla.yoctoproject.org/show_bug.cgi?id=13417,
the devtool documentation is not really coupled to the extensible SDK,
and so documentation for it could be part of its own manual in the
dev-manual.

The first patch of the series moves the documentation from
sdk-manual/extensible.rst to dev-manual/index.rst. The second patch
removes some reference to the eSDK in the manual which no longer apply
within this new context.

This series depends on:
https://lore.kernel.org/r/20241223-devtool-deploy-target-v1-1-ee00beb47691@bootlin.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- forgot to fix some references to titles in the previous version, fixed
  them in this v2.
- Link to v1: https://lore.kernel.org/r/20241224-devtool-dev-manual-v1-0-0cc4fb584018@bootlin.com

---
Antonin Godard (2):
      Move devtool doc from extensible to dev manual
      dev-manual/devtool: remove reference to the extensible SDK

 documentation/dev-manual/devtool.rst               | 954 ++++++++++++++++++++
 .../figures/devtool-add-flow.png}                  | Bin
 .../figures/devtool-modify-flow.png}               | Bin
 .../figures/devtool-upgrade-flow.png}              | Bin
 documentation/dev-manual/index.rst                 |   1 +
 documentation/sdk-manual/extensible.rst            | 959 +--------------------
 6 files changed, 960 insertions(+), 954 deletions(-)
---
base-commit: 4b904539d05fdac123ed96c3952613fbbe612c39
change-id: 20241223-devtool-dev-manual-bb387251f9be
prerequisite-change-id: 20241223-devtool-deploy-target-27d9f6e8a250:v1
prerequisite-patch-id: d3a98c5a92ce8ed4945595df218769028f552057

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


