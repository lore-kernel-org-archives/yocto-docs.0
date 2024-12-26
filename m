Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C901E77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 14:38:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.22229.1735223910765351092
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Dec 2024 06:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kGLAUJ77;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFFEF1C0005;
	Thu, 26 Dec 2024 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735223909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j4MXIw5dP8ZzIvmmVPZ+nxt9xvwmPPQTiKnK0vLnglc=;
	b=kGLAUJ777QuChaz6Wh6I67NiborgGvKvJ0SuRP5yUXxvITJbix3nmhveIcgkrCOadAzcxV
	WZHx3ByHwh6LUimq5DnVwT3UtK/6Ajg/LAvl497GucD2WlR+4de3Sjx4Qa0X4so9DYlpqx
	eNaNuGp5lTiNh/kCDA4A9JPCxJwc09jryWciLG3rTWnXMMjL0NiFcAUO8u6caJThTU632P
	21y8Y2L9oscxEe9ZkQ4P+gLDBDePWVlgxH28FKoqa9VsEobgsaq7h5AKQ72kfPtT1FwB3Z
	5S4XUOVBdiQ8NJScCdmhfTzSjuUwDdgaZpF556Li+ITo83i7pf1KUOmKuhKdcQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Move test related documentation to the test-manual
Date: Thu, 26 Dec 2024 15:38:06 +0100
Message-Id: <20241226-move-ptest-to-test-manual-v1-0-ef16b91c8971@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE5qbWcC/x2MSQqAMAwAvyI5G9C4gV8RD1VTDWgrbS2C+HeLp
 2EOMw94dsIe+uwBx1G8WJOkzDOYN2VWRlmSAxVUl0QtHjYynoF9wGDx56HMpXZcKtI86a5TDUH
 qT8da7v89jO/7AXonWa1rAAAA
X-Change-ID: 20241226-move-ptest-to-test-manual-d32febf77a52
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ado9GENY3FNtWpFBrWM73EXXi8X6qSQvc3KGrxgPR+k=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnbWpkMn638MQTQ8G3FmmaCYjr3yMdNdFOajU6z
 q1w7mg377GJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ21qZAAKCRDRgEFAKaOo
 NiBiEAC5j/aUdUbrW6eoDfaAy/ETaYkZC0v510T//8qfhBBduYcGJtwog/JbnD/OVxXUxn+zWgJ
 Vsbd0UJmPtFNfwVLXAs75XKtgeiSWcJ+mfKD8U+OuPOnXslBxbJ6l0kwkntzX6GhREbTsho59OV
 yN72brko9NK5snA1jnkbWhMIGFA4wlW3fPr4vl5bZ8KJroWJJVROvoyFSKiF0aIDA0+NWOEimoq
 yGekBkQWOkNadd4W2PHITS5LBbgQEWQHO62L0IleuZVaJUX4YeHn0k4BfAr2mJXVf/o0hJVjTBN
 9YbkCviULsDPg/wsf6MxcFYdKsp/rfpnjQEGV9nboggPBB+bP1Xtj4xZmM2LqxYiraoGPOX/ZW/
 aaZrczeiZXp2WZxg+ZhDMDJKOOqmnLMpdcs7dd96uAuXau7oESyWoj74vmYQad3HPwv5aAtNkBN
 e3Rho6iC5r7Feq5IYfhMWP42zou0kERzWjFPfzyxED1q9kG+/qk0iu8jZ938rPIIBAiMzNv8Rll
 SBSVfMOjetePt//5BmWzsBCUS6hjy2G+N6D/+KFC3lxOgD3rMSGcS1mRKYLikiu6IWT103HPuCo
 Z7ntyr8FMkj1n6Byz/hShU3G85PuWSY424YFPGGCVgJnUTvLn2R1CSkf4HQF/tZzztocx1/vgR2
 4Apcqw3Xod4L81w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Dec 2024 14:38:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6040

This series to fix bug 15106, which suggests to move the ptest part of
the packages.rst document to the test manual. In addition, also
move the runtime testing documentation to the test manual.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      ref-manual/packages: move ptest section to the test-manual
      ref-manual: move runtime-testing section to the test-manual

 documentation/dev-manual/index.rst                 |   1 -
 documentation/dev-manual/packages.rst              | 110 +-------------------
 documentation/migration-guides/migration-1.5.rst   |   4 +-
 documentation/ref-manual/classes.rst               |   4 +-
 documentation/ref-manual/images.rst                |   4 +-
 documentation/ref-manual/release-process.rst       |   4 +-
 documentation/ref-manual/tasks.rst                 |   8 +-
 documentation/ref-manual/variables.rst             |  20 ++--
 documentation/test-manual/index.rst                |   2 +
 documentation/test-manual/intro.rst                |   6 +-
 documentation/test-manual/ptest.rst                | 114 +++++++++++++++++++++
 .../runtime-testing.rst                            |   4 +-
 12 files changed, 146 insertions(+), 135 deletions(-)
---
base-commit: 28850c974a3896895bc921c094071523218d6d07
change-id: 20241226-move-ptest-to-test-manual-d32febf77a52

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


