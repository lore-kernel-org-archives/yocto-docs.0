Return-Path: <Bo.Sun.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE2EC8303A
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 12:42:03 +0000 (UTC)
Received: from mail-108-mta91.mxroute.com (mail-108-mta91.mxroute.com [136.175.108.91])
 by mx.groups.io with SMTP id smtpd.web11.9772.1751373713926392276
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 05:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mboxify.com header.s=x header.b=oPkFLKUm;
 spf=pass (domain: mboxify.com, ip: 136.175.108.91, mailfrom: bo@mboxify.com)
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta91.mxroute.com (ZoneMTA) with ESMTPSA id 197c601ffac0008631.001
 for <docs@lists.yoctoproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Jul 2025 12:41:49 +0000
X-Zone-Loop: 833e21a349482fa9a902750279704fdd1156e5951ba6
X-Originating-IP: [136.175.111.3]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mboxify.com
	; s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=IrjqFSUyspKjBd5pT51tIkG0SN2tF+PjU1XOdNJQnZU=; b=o
	PkFLKUmEBp0cX0yshdF7tlEm3nTiR6NIqg9y2bYgdkkEjfJxgcorjof2BgrPJO0/N475m0EVOXY2D
	W9LfK+eaSapKjzHuPmsmn8m3HEgvEcjYLRfihOvePikAI97lWpwFviU1BnWd8pDJSX0jhUc+QBfdi
	dR9IqoFDAIvDeeMeaOguTSjL4RbR4IvFS9Xb1wMA74AEWYDYoFEHpdb8KcUuSij/AKGe3clB0+YOc
	fFBlmvAxIQknPbAdZaRnXM+w7WV0ufnV241fEoVD6dIS4E6vxry2Y5t9LfSXCbkgmsqN3LNMsDHhu
	gh0oFlAjD0QCYVtnTlIRMQ2QPgIX1LIRw==;
From: Bo Sun <bo@mboxify.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] bsp-guide: fix README link for meta-intel layer
Date: Tue,  1 Jul 2025 20:41:42 +0800
Message-Id: <20250701124143.1756426-1-bo@mboxify.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: bo@mboxify.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 12:42:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7258

Update the meta-intel BSP layer reference to point to README.md
instead of README, reflecting the actual file name in the repository.

Signed-off-by: Bo Sun <bo@mboxify.com>
---
 documentation/bsp-guide/bsp.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 09246b4ae..3882172e2 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -172,7 +172,7 @@ section.
 #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
    based on current Intel CPUs and devices, you can leverage this BSP
    layer. For details on the ``meta-intel`` BSP layer, see the layer's
-   :yocto_git:`README </meta-intel/tree/README>` file.
+   :yocto_git:`README </meta-intel/tree/README.md>` file.
 
    #. *Navigate to Your Source Directory:* Typically, you set up the
       ``meta-intel`` Git repository inside the :term:`Source Directory` (e.g.

