Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DECF30936
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 10:44:01 +0000 (UTC)
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41637.1772707434224457353
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 02:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=AUiVzh0p;
 spf=pass (domain: 0leil.net, ip: 45.157.188.13, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fRR3X1m76zK7B;
	Thu,  5 Mar 2026 11:43:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1772707432;
	bh=sb4/WSaICL+9I+4y48mCcHGI6JxKHSuUlMqh12SSd70=;
	h=From:Subject:Date:To:Cc:From;
	b=AUiVzh0pbQSKtQ6UTPT5NMOLYhclXlZHt4UXFxluKQPqkm0+RIJhy8C7uXNyQHsZR
	 tz5vscRtJQw09dvjFYLHpiXZRz4/rxLfVDVaH0INGN8eb5bGKwB0ZU5/LFXf+kzptw
	 oi8EaFcdH8ep3QywgczuwYhHxVBWUdyqYn8kevzglE95A+vcLlekh+KdcwKWhxUIkd
	 w3zG5kZMK+SM7ZUhpOi4SVKcXzIC5FMMfgwWqrT2b/fXhO78egEN286ymcCyA/I1OA
	 nsB7n/YMh+hWgjm6fYmM2o2rECvWLyqDg2/pvsgge3J+lJF+Wa0ICBPBbqqTZyLQrJ
	 2nfZqVzZVaCiQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fRR3W534Nz3Qr;
	Thu,  5 Mar 2026 11:43:51 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] ref-manual/system-requirements: update supported and
 EoL lists of distros
Date: Thu, 05 Mar 2026 11:43:42 +0100
Message-Id: <20260305-f43-v1-0-5dbf939b079b@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3TQTY91kg8REM7NE8xRz01QloMqCotS0zAqwKdGxEH5xaVJWanI
 JSKtSbS0AB8sGM2cAAAA=
X-Change-ID: 20260305-f43-c0aa66a7d75e
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 10:44:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9060

Fedora 43 support has recently been validated for poky so let's add it
to the list of supported distros.

A few distros have been marked as EoL by upstream so let's update that
list to reflect those changes as well.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      ref-manual/system-requirements: update list of EoL distros we still test
      ref-manual/system-requirements: add fedora 43 as supported distro

 documentation/ref-manual/system-requirements.rst | 3 +++
 1 file changed, 3 insertions(+)
---
base-commit: d97cfeaa55ed42722998d3313c1857aa377f6881
change-id: 20260305-f43-c0aa66a7d75e

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


