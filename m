Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667DBF30938
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 10:44:01 +0000 (UTC)
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41373.1772707434852170494
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 02:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=CAnO0GXx;
 spf=pass (domain: 0leil.net, ip: 45.157.188.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fRR3Y1kZPzHgH;
	Thu,  5 Mar 2026 11:43:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1772707433;
	bh=94h/RIxYzDT3Mobgp3/HORcfZVADyECNcbstRSkkezY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CAnO0GXxZa3gsY+LUO3qtRlrVfgpqsvXbvuEmHpk2flYth2LlhVvhi4jFws2kVW3W
	 I88tlNlLCwu/LBWqI0ZR/xkkY3nuhbbGb6AE5RqH2waMEZ515qh1yI4ShKQiuHmD+x
	 Ix99sr4E6KXvd55Zl/gn1O9WM5zQY3En8nz/YRQpRI7TQ8c1ckTFXtV/hiN7yuqsSu
	 yYr0aqO/8d5iM3KMPjZ3N1IHS2eiYMbaLBflV0UkAVqEdb8vkMNHwAr1pWOqCnwRGM
	 oMLE1C9s91D6/8XlGUV7cD3MPhqFPvtjic862Vyx5PWDPhGoUjlWXCtcrVc1S0Pktn
	 w2SYZKGHgZapQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fRR3X5pxBz3Zd;
	Thu,  5 Mar 2026 11:43:52 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 05 Mar 2026 11:43:44 +0100
Subject: [PATCH 2/2] ref-manual/system-requirements: add fedora 43 as
 supported distro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-f43-v1-2-5dbf939b079b@cherry.de>
References: <20260305-f43-v1-0-5dbf939b079b@cherry.de>
In-Reply-To: <20260305-f43-v1-0-5dbf939b079b@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 10:44:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9061

From: Quentin Schulz <quentin.schulz@cherry.de>

Fedora 43 is now properly tested for Poky[1], so let's add it to the
list of supported distros.

[1] https://git.yoctoproject.org/meta-yocto/commit/?id=4c156ef673f8ff7c967b2b34dd1d366e1b74d41c
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/system-requirements.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index c51061643..7b4f9136f 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -72,6 +72,7 @@ supported on the following distributions:
 -  Fedora 40
 -  Fedora 41
 -  Fedora 42
+-  Fedora 43
 -  OpenSUSE Leap 15.5
 -  OpenSUSE Leap 15.6
 -  Rocky Linux 8

-- 
2.53.0


