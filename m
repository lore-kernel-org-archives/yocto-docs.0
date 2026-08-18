Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA11C5DF81
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 09:20:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4739.1787044837234919280
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 02:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1hMHmodU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2FD941A16FD
	for <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 09:20:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0599760355
	for <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 09:20:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2692111C74AB3;
	Tue, 18 Aug 2026 11:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787044834; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=g+qlMrZ1RdjfYSnVrMAULLEwOUoRajrdQqlpLyYCJT0=;
	b=1hMHmodU7xthmjuWQ68g9bsEQm+q29yz84kIr3cqwoC36EONTMjnvJKJ6IGjD9SfbIXfhk
	61rR0JkbA5stsT+KWtTQqYGcMN3/GifS15zbQiyylvipnV8LBGAE49Q+X+yDfPZZlAzIlz
	WMNL4m9nmM5VfUgxqiUBHMerZNC29ZjBhPqShC4PWHl75d882s4GcBWnEHr5gRuXTJbBYR
	sVy6sGifdx7rFzuHXwoma9VH1lMBWYR6YZw1LMK6sNwU3PX8FURa9WPen+wJGXfV4Cg7Li
	VCb7KPA/ZkyHa6LpNXMdTv+N4LmhhyMbvaNzK+yBt0HYG32hJfTnJHUMF74ZBQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Document package related variables
Date: Tue, 18 Aug 2026 11:20:27 +0200
Message-Id: <20260818-packagefuncs-v1-0-1f26764cbdd3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrA2oLVG8SnERx984CqlktBTEu
 zfV5bd47yBFFCi12UERH1F5h4Qyz4gnFzyMDMlUFZUtnmVtVseL8xj3wGoah9oODDSPnlKyRoz
 yvXav7rbu/Qze/g86zx8j4566cAAAAA==
X-Change-ID: 20260417-packagefuncs-8ae76dcee83b
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=452;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0GAG9rFqJBPzPftrAAj2EZV5edMECw3mDG7o8uYwGGU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqhCPgpeednfcovgwpjjQ0IDJKPlELXFZtT4nqU
 Ie1jNoXLR+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaoQj4AAKCRDRgEFAKaOo
 NmK+D/0QIBplik8lf2hh9EqCHyojsmaCNXT7Jl9qVPIfg9C7xLFlDP8sc42ahrRNmvhsWFsNjGv
 ugZQatMa9p6gDA5FsdnTKaQVsnq2lGNY5NavB4IVLcPCizs1CwnpidBDKyENNqAE1Lr8S1tB6tl
 l5mwk3hAtt5ipXbS/ePSMOBiZ+pviI+3G141ttFLpPJZXjf6bO8oE82b0C4+FUjDbwgnLjnU5WA
 9QX6f2a7kelBTzVLNECUb/DKBouwi5nPWImuKDm768MPZtpioI7KZWTz/ofufrDzrI3OahKVeUr
 D4TklVqLV6ByFk8jW6xzKrwfAZC5pgi24wXGVnCfTdV2nSx7qTdkJ7OhGOKqdArMzpaaByA3rmP
 0LF0fspUPfkn2ZT+8JK/+iydCZAtKai/gDNO2fOVpV2wpK0rD3XyethZVls5BtKPQHeoOTqwGY+
 p2PAPwRvNXu9isdS+7BhCmL7bKXRcGiOja5pOkEmjFSSILCzyVKRGB1v85jneip/aIU6z4N18oz
 fKp+tuUZlY3ICMD4gr6FziKdRI4Si4jfVMIfcp7loDqWlMVdbhw+HAe554KSfCtk9y3fyi9i4cn
 XlDpdIi1c2HNmU5TPruqC6E2hzRLOeY+iLMQtur/fq80srpMuj2XaJjziwQDfyJQycPHZSMoS5u
 Cpxsm7KILmU6+Vw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 09:20:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10296

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      ref-manual/variables.rst: document the PACKAGE_NO_LOCALE variable
      ref-manual/variables.rst: document the PACKAGEFUNCS variable

 documentation/ref-manual/variables.rst | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
---
base-commit: 3660b8085a5e790c1ea8bf75236fff4b216fe19c
change-id: 20260417-packagefuncs-8ae76dcee83b


