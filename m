Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D32C88E5D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41380.1789138590163304679
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QLyrAnN4;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 56524C653FF
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 853A1601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C548411C7AFA5;
	Fri, 11 Sep 2026 16:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=49mEcdQsIX8XNVIBRtM01NWiRm4ur/5Hb00tY63QcM0=;
	b=QLyrAnN4NXHjAK2TqNWAHpE4mCqFCcwr0wCZHnQGTaYpirCamIxxxIjzOuiV3zQJIRJky7
	cUgD+hFW2Zcy02adflJ7J8SoYv6lYYzBP9T8QE3cVImsPzC4gLz4/2qBI6n17Pd3iWEPi0
	DcbJlujT/Mg8IhTDCAFLZa55fy2z7ci0fKYGe+cmbWZvh28sa7BEURkmDnnsJorDslP1D8
	/UnwT8wnRNEv5jty6HncK4Lq+89fd3lYIYIvpdFqph/zrg/pXDlrGpxidg3WvgFV2zM/Ju
	YB+OygFuCUvvX9vKRfdWgT+4FCqowAsqisnpMytajnQr/3QeXwGfr9C6UdTXog==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 16:56:06 +0200
Subject: [PATCH 06/10] ref-manual/features.rst: add tools-profile
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-assorted-fixes-v1-6-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=OmyPdepJ0F1EKE5CiZx7JP01xGRjtaAZoGF0DEljwiM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaWqkxy/cv3ZK19g8jrIDmNs1oCRmRiT9S31
 b7y7QedSc6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlgAKCRDRgEFAKaOo
 NjGgEADOPy4wFDI0H6kOy+NcErCG6AG95rbYWiV2XPsNAEIhzpSwe1yfS/rsGoqI4u/qBQufxDP
 ZgNwo3Tj2ja9gtQO6oKRj4YdqCHxe6GP9OVHoI02iaIowx8/sWOGkpVrJk8/jtUYPO4ZnXZoIvd
 F1WFn2IaLHgd5AW40DVMRMTcXuGAlz5WkFAIaaBG8iMjXks1TZLH5i/XLM2jwHFpOTUGYCO+qv7
 nRllf37IKA1/f8rQCmipAffeIQ9cLirh6nzUmScPOC0b7Gba9G+BUQPgy/Hg3trLX+5vlnvHR0F
 PgCmiDIzoGgzBbn0HrShKsuG1bDH6m/m3D7HftrmGKS5F+bpmhLW3/WbIHS3PgsMVEA/QHocRjf
 OG7pyVe+cAthOy6FJ0nG4zrnSqbozF+B5rDlnqGfhNuip6jdzED6yxnyAhr7RyuuGHUK2LgGVGS
 ZkVGpWnAX8HrGE9DpUvmQZkfYm6vNGcYHoBAuc/GleVF8kJqz2ld22iDzZrvG4pAc/W31uyN6s7
 bg0/O/WxT0JWRtBZiUHfDD618z4z83T4/lVOGMV7eNk1IsmB45sAWOpdgwDmb/n7DQsSM0lpB5F
 wwXb/cpP9PgifAqoeu9N6NZLC5By5+eyjF44xPTtE6NoH46FFH5vr9YmLkD6rp9FUibVV9ZW+y6
 TNBcGGHabnlI1gQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10460

The tools-profile feature was introduced in 2007 with eabfa35d7ce4
("Rewrite IMAGE_FEATURES tools options (people may be to update their
local.conf), split into debug and profiling and add more profiling
tools.")  but was not documented. Add the feature to the list.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/features.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 4ee6e20c8..879d98ca1 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -406,6 +406,10 @@ these valid features is as follows:
    in the Yocto Project Development Tasks Manual. For information on
    tracing and profiling, see the :doc:`/profile-manual/index`.
 
+-  *tools-profile:*: Installs profiling tools such as ``perf``. See the
+   :ref:`profile-manual/intro:Yocto Project Profiling and Tracing Manual` for more
+   information.
+
 -  *tools-sdk:* Installs a full SDK that runs on the device.
 
 -  *tools-testapps:* Installs device testing tools (e.g. touchscreen

-- 
2.55.0


