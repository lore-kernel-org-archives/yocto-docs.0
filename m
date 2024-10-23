Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04112D2E01E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 07:32:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.3320.1729668764592576983
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 00:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h9xtOhB8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63116240008;
	Wed, 23 Oct 2024 07:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729668762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t5vZohCy+l+O9mkNXrEN+3+J+eH/M/KoLQeUvn8A13U=;
	b=h9xtOhB8lGtydog/iBGxvh6y7e1/v7KY0wuKerSm+Yh4BD9RXIwVs4R/4Rz1gV987wqFhy
	lxyVg/QYod2VVUyESxy8L1LFHPIafyHjc+aEE9BIWn4hG4UBZOOJ7WS4JPJSRFOxfeq2hM
	lmViuTEcRP9ATPi2n3xWQcEotceNx2RCxE1ka1I6enWzIz4FHzNRpng96ljCZwbi7NlnlX
	NSLcp+IQ+oaxT4oX9iIfZFQQSH/V1PnEqWd1ICz+EsE5q5/4hWTtX5eLsjy2qpnKgmObGS
	c1XnNttLEpHC5rKimla/wtZD3WV/+y4GBgSz+npDkgjxZMHtWzD+x7qA7CULzQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/2] ref-manual: release process: update LTS section
Date: Wed, 23 Oct 2024 09:32:21 +0200
Message-Id: <20241023-update-releases-svg-v3-0-a8367b5d4854@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWmGGcC/33NQQ6CMBCF4auQrh3TDmCLK+9hXJQyQBOkpMVGQ
 7i7hZUmxuX/kvlmYYG8pcDO2cI8RRusG1Pkh4yZXo8dgW1SM+RYCC4UPKZGzwSeBtKBAoTYQU0
 l5kqSUcawdDl5au1zV6+31L0Ns/Ov/UkU2/rfiwIElBxVVdVlIxW/1M7Ngx2Pxt3ZJkb8UBB/K
 wgcTiRlwdtKF8J8K+u6vgH3KY4a/gAAAA==
X-Change-ID: 20241018-update-releases-svg-be52387ec8cc
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yevlaGVz//gPbd2n0F/FKiRuQuWmx9OUjgy/fEZKiXI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnGKaaQX6VrzvKC94c3XDwf185ju1E7ZVRwE83h
 tK6SocUaruJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZximmgAKCRDRgEFAKaOo
 Nv1lEACMGt0bVM+l3RURmgqnokRqhAyjtHUtsYK8kkmsSYqaQGaNnzG8pCJjhu5qfer5+Zn2xvf
 x5Fqx0KcoiKrQnWjLKbJe+HBdvj0xUrPKt+ht/wax/69hHrvdwZ8/gwgCzZr1F1OtqXG1elVju5
 Qn0FC1dVf0d20FtiZHZ03iTsYugQ4XJvqdfELx7NggHzjJhwkkF7ZJKAIf0w9Cp1HXAjuG7OVpo
 USmvmEWgDJIVui3xnJgYwp0Gd0ViwFPmA3tmBckRPmLtmf3uSovC4wHwXF73PIqHGmIRVv09Xow
 jnN/LzMeS0mR/GXazxaSaA5Mcwe3XqKzRq0xqUOhU08iQ5duMzkfo3bXiJVoRJ1pKoj7Hi1gyPN
 GLPbwsIMsUrar9B+KzVfY9/01fsNvvw8Q4fe2jNJsTj0iv3M/DlZXqv+59Vi/rm4837af2ITtQB
 owGMbC866y8H3mKOmuS9MiNvb53uB+8rJ7Xb6jBcC1T1rAVCvLKxuuD341WXBzwSxQfe9zTvj4v
 qnxTCCjg2+ToRo5tDm6la8y3WgiuuOoqCFTFwlaacoQ5ZVkRuMMEzXvJEctR3/YuoZDs/SW1cV7
 +SwY/r2QNSHz2/qp2YaBqi8QIPCt8Uko8stJvN3nfGn+BnElI/p43BloMXjI479DWLF8z/VrXbP
 9McRRVJdW1pKRng==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Oct 2024 07:32:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5572

Update the releases.svg file. Link to preview:
https://lufi.bootlin.com/r/f_BcMLMB0o#UERvnOvvaoXRzxpwnmTmlgghoojSkBeKYYTI73i+xQ0=

Rewrite the paragraph above the diagram to mention the Scarthgap release.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Fix Styhead's color, it's now a current release.
- Add Reviewed-by from Michael (thanks!).
- Link to v2: https://lore.kernel.org/r/20241022-update-releases-svg-v2-0-6e7740f9a41c@bootlin.com

Changes in v2:
- Update release.svg with different colors for future/eol (see link
  above).
- Rewrite paragraph on releases and mention scarthgap. Add a list of
  currently supported LTS releases.
- Link to v1: https://lore.kernel.org/r/20241018-update-releases-svg-v1-1-502899b5d780@bootlin.com

---
Antonin Godard (2):
      ref-manual: release-process: update releases.svg
      ref-manual: release-process: refresh the current LTS releases

 documentation/ref-manual/release-process.rst |  15 +-
 documentation/ref-manual/svg/releases.svg    | 907 ++++++++++-----------------
 2 files changed, 355 insertions(+), 567 deletions(-)
---
base-commit: 143c3cacdec36c9d7ab81c89bbcc12c0c3936bd9
change-id: 20241018-update-releases-svg-be52387ec8cc

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


