Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367B0F3092E
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 10:26:51 +0000 (UTC)
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41168.1772706407475899824
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 02:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=Y6oAPqeX;
 spf=pass (domain: 0leil.net, ip: 45.157.188.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fRQgn0nYTzR2f;
	Thu,  5 Mar 2026 11:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1772706405;
	bh=x4ml4desJs0F8zD5YHPUEBiiolTZxSImnzsgM7Fved0=;
	h=From:Date:Subject:To:Cc:From;
	b=Y6oAPqeXFZmtc7eBe+p7gdYVNYNZNLMloQDBjXRgSAXmxhDrjcF5ebC7+eBzglLgN
	 HKfN/IsqGYf0IlzcjAQLjftHWv7ZBPuVvbWVi8SV1JqgOfr2BLVRSvDyqGKgvGaH89
	 DOozMoVciuf0O3WFvLu7xdfPdAo+yVoi+WGQHyxuLMSVJ8qkcHdW24R4TklrVUj4o5
	 B4vHneZMBXwBl6c1xWemamdt1s6CL5OHosAofqMe3+nwzrxZrvA4n6SSYE+rrwiRmS
	 cMTV/5lJ4gaqmwhVBvqzz27X4cQvxG9OtLT8nLcSomVACFT2zPHKze+iKCLBWam92R
	 w1ika+eIjWIpg==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4fRQgm3qNHzmBb;
	Thu,  5 Mar 2026 11:26:44 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 05 Mar 2026 11:26:34 +0100
Subject: [PATCH] overview-manual/concepts: list other possible class
 directories
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-oview-concept-classes-v1-1-7a4effc0c572@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrDsQFRV6ldJFOv62U0oiGbWCe
 HfTuvwW721kSAqja7FRwqKmMWSUl4Lk5cMTrH02Va5qXe0ajoviyxKDYJxYPt4MxnXZoxPXet9
 0lNsxYdD1/73dT9v8eEOm34z2/QCLNTq9eQAAAA==
X-Change-ID: 20260305-oview-concept-classes-31de7c06aa57
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 10:26:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9058

From: Quentin Schulz <quentin.schulz@cherry.de>

Classes can be located in three different directories since Langdale
(4.1), so let's update which directories you can find in a distribution
layer.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/overview-manual/concepts.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 2655b0d3a..3f5c3201c 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -398,7 +398,8 @@ in your ``conf/local.conf`` file in the :term:`Build Directory`.
 The following list provides some explanation and references for what you
 typically find in a distribution layer:
 
--  *classes:* Class files (``.bbclass``) hold common functionality that
+-  *classes*, *classes-global*, *classes-recipe:* Class files (``.bbclass``)
+   hold common functionality that
    can be shared among recipes in the distribution. When your recipes
    inherit a class, they take on the settings and functions for that
    class. You can read more about class files in the

---
base-commit: d97cfeaa55ed42722998d3313c1857aa377f6881
change-id: 20260305-oview-concept-classes-31de7c06aa57

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


