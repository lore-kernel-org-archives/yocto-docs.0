Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4886CAC5BF
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:54:49 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.12259.1758873285494002210
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 00:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bd0NjUUU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2818C003F5
	for <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 07:54:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43747606B5;
	Fri, 26 Sep 2025 07:54:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E91A102F1870;
	Fri, 26 Sep 2025 09:54:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758873282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TTAbhvQklCh/f8yfrvZzay/MJr4bqbcHaEJLpVYc1uw=;
	b=bd0NjUUUU/pV/9IpZps1GYxTFrsvC8HE5c3mTjig/X4UEqN49vRz9GVhbZ4UGdtFOvM0+L
	+nrCg4y7oR7VqzEoXSklyBwnMUqlYmBR3Y6XmAWaZOGzY85tAWkMQDL/jZihrg0e398F5q
	wrbJCf7JJvuxBC/F2moPbQrKRM9U0wQgJNsJNqJVKu2NUYIgtamMl2vpD94lYA4wpPg/X9
	/EOtUM26CMmQ3+cFKK5lG3K8lvsAGxBFGNWpgf80O9P78WWshuiFraphRkDBGhGEpM28Yx
	r8FHaKtcBYuc027msGCKy/T8lfz4JP48Ycs3Y2y5YNTWgnX86v620tH7s8SihA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 26 Sep 2025 09:54:24 +0200
Subject: [PATCH v3 2/3] test-manual/yocto-project-compatible.rst: fix a
 typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-update-compatible-doc-v3-2-3740c44e49b2@bootlin.com>
References: <20250926-update-compatible-doc-v3-0-3740c44e49b2@bootlin.com>
In-Reply-To: <20250926-update-compatible-doc-v3-0-3740c44e49b2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=h7YgUnQMEjzpiupdkOtmsDaRp9RVceNjVxN+7anBqKw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo1ka7csO87kurUdUQJVvvDaPED3oO2g6owdti2
 A0du9gflLGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaNZGuwAKCRDRgEFAKaOo
 NuXPD/9uheBc47RULZ88AuVETRpuqqY+EWClE+eBAao+bseXYFBThgFCsJF6d84BZHOZ3wQJ6x7
 yPALCVoZF69AeMESOSDSejLJlDGhHOiv9MGxSIIpbIHlcJprac+01DUeeYV6pgdWOOxQlxDqEZS
 qJ/p7W5ZjvU3fjUtuF74W0rdNRbOWZfsN43CtpmH3TIJzy3tLBs+SlIUHAqROm/m+grkzkTLM8V
 hQ1bJ1YA7iU/g4Sy54xPZQakq/VJ2ggJ1F/n8wM4UALqZuS4ex4HHQE2wyeILx/zdMk4qij8A2F
 Vyf+7J3eWCM/DtVwJtWVwn8gsa8xs+wg8z2KDGA1laAm52Dr0GKfKYFtuvKha7BetuOJh9ZOReB
 FlTTiLb/pTLAtq9kFcudbJVhN9vBuewZJ6iui7TJ5p6pF7Ik9wHt3ICwcLxHKopDcXA+y3tMiPr
 x7SySEQ4TJ1r/Cz45A245F6eUpV5yneNfTYMkCv6zuEYZDLUce9o3pcMAYnBs2JR+PAizzLoFwu
 Ity14/TyjvvYBpmCsedYtzUVPJo1Hpj8f2wn57OGQRkvOeNd6Acj2On20sJS2c+7e2iVHp+qrzw
 +XLzAjFWQ8lBNdGCXuglofil0NNyyUoAB21c+nB1/glAXwHIVkdbD6QwBMOl8rJa1CX89JfB/xZ
 VfxHnetIhlBLZtw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 07:54:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7609

Fix a typo in yocto-project-compatible.rst.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/yocto-project-compatible.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/test-manual/yocto-project-compatible.rst b/documentation/test-manual/yocto-project-compatible.rst
index 65d924fad9..7a2e00a99e 100644
--- a/documentation/test-manual/yocto-project-compatible.rst
+++ b/documentation/test-manual/yocto-project-compatible.rst
@@ -38,7 +38,7 @@ Benefits
 and flexible: it gives users the ultimate power to change pretty much any
 aspect of the system but as with most things, power comes with responsibility.
 The Yocto Project would like to see people able to mix and match BSPs with
-distro configs or software stacks and be able to merge succesfully.
+distro configs or software stacks and be able to merge successfully.
 Over time, the project identified characteristics in layers that allow them
 to operate well together. "anti-patterns" were also found, preventing layers
 from working well together.

-- 
2.51.0


