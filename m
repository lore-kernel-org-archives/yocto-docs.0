Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B5ED0E6FC
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 11:03:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.15730.1729595023473454541
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 04:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mZBTfn5F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9D8360005;
	Tue, 22 Oct 2024 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729595021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hPhw9GJkIYR3xdADnFrLBUtSN8EM7v8jPXqR97E76xk=;
	b=mZBTfn5FCPqB0r+OPxgq55nkOq9XqLJH0N3/8nN8pWBHESGO399nxOOvj+TXdZbor8IW2W
	Mv/LZYHolyFlTVWuXXaY/VBPI2aUtIkI28ylPmDiTSbq7jYoG98KN3H97LZSLNnzaqBXP5
	4ekGK4ChQtcx/zNP7JIzQWxPkaqwWwGUtXD63j0n9mh4i04mh5oBT/SmPH8XrZmc0zQIpe
	9CfhFuLMQ9vNoJcJN0hfOCNxTJ4gyP83AW/LhrAEu33boXhx4AAAemwdycSYdOQuKjQbrl
	oSqeqolU5AncxOCtRGvkRbB6B1exmMKw8FuzQ8VrEh9X+Ft2IL8QBm3rl3xh7Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] ref-manual: release process: update LTS section
Date: Tue, 22 Oct 2024 13:03:08 +0200
Message-Id: <20241022-update-releases-svg-v2-0-6e7740f9a41c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGyGF2cC/32NQQ6CMBBFr0Jm7Zi2SiiuuIdhAWWESZCSDjYa0
 rtbOYDL95L//g5CgUngVuwQKLKwXzKYUwFu6paRkIfMYJS5aqUtvtah2wgDzdQJCUocsafSXGx
 FzjoHebkGevD7qN7bzBPL5sPnOIn6Z//3okaNpTK2rvtyqKxqeu+3mZez809oU0pfcc0KcLgAA
 AA=
X-Change-ID: 20241018-update-releases-svg-be52387ec8cc
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vFI6c0mwtdTz3gvQbmFfAS7MwUgZormUDJ8bbHtnKT0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnF4aMjv0ZF2X8P51Xv7H/pe84rGTCtzFzF9/JA
 4dPXLCMec+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxeGjAAKCRDRgEFAKaOo
 NohRD/9ae+QSNLL2APJqVdSCWn0SRidsnmfJDGR8cxWpkb4Ll+elynyUG0S3JqaS+EToR11ot1K
 9k5mq3WJ7KyIE+sNyJ7qCaffMiKXdc7Cp62ERiQ0SjA2ToxBOm3D8CJBzau5PG3R6kMbf9v86N6
 LazMz/ZF7wI0XunD2V+B/anJMYuRVU+AxxyO/HJyE++9de6ApN/02SN7p2K7R33ZlmFEVTcl7bX
 Ee4Q8Ttwp28HgfeV4n3jxGn6RyHy1fifda1QxjHXiWIKohNtBFbDSLwD+iaiHoi/5Kyhk8Ai0AC
 4COoyYg0bMqsYlX/pX6JmCjRkzoJy+nO/gI6fAeyiEETOZoS1YzKzvKhsM/v2ZFFW0bM37/2YJW
 eGAXbP4GmZL0y2MC2WulQAuwxmRRBMil6wyskd/cRzjSZCT5Ff7PTSKe0M0Ig6onQnVRlSod3OT
 410kGDznQVT7eF2tW4NoYWaOREhqbRVOQygtlxZ70OI/MWaf8LpfNab+cGjsARjcNcIL+CTNB0d
 CumU0BEedMZ3vQPILJqAdVS8YBlPiEEOmzcjfQ7Q6iqFItoLzEW2Hpjx4FnMb4r0DBAXgyqaqzz
 0q0MoeL6Qi+1iQAb+oIUI3/tVrtvCrCJI33mIHFVAxT/dLML18LQjwE50X/6DkUcCDfimciuwCz
 gOwl1fIUq0x85zg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 11:03:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5553

Update the releases.svg file. Link to preview:
https://lufi.bootlin.com/r/VXPQ7d5NDt#kPjQDABd0EORG6GJCMG2U0IdU1+tGuUMHvWk8GofBsM=

Rewrite the paragraph above to mention the Scarthgap release.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
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
 documentation/ref-manual/svg/releases.svg    | 904 ++++++++++-----------------
 2 files changed, 352 insertions(+), 567 deletions(-)
---
base-commit: e4b64514673471850635a8dbbf62f34e710e276a
change-id: 20241018-update-releases-svg-be52387ec8cc

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


