Return-Path: <Bo.Sun.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE79C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 12:42:03 +0000 (UTC)
Received: from mail-108-mta138.mxroute.com (mail-108-mta138.mxroute.com [136.175.108.138])
 by mx.groups.io with SMTP id smtpd.web11.9771.1751373713922197646
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 05:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mboxify.com header.s=x header.b=jB9T/QiL;
 spf=pass (domain: mboxify.com, ip: 136.175.108.138, mailfrom: bo@mboxify.com)
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta138.mxroute.com (ZoneMTA) with ESMTPSA id 197c60204d20008631.001
 for <docs@lists.yoctoproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Jul 2025 12:41:50 +0000
X-Zone-Loop: faf9264c8c86005de2c6be323caae2faaf819ec10ee4
X-Originating-IP: [136.175.111.3]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mboxify.com
	; s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
	Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LrevVKuVPRJqo5eeh8SBEi1UsnbQQLamI7vQFDQT6DU=; b=jB9T/QiL0VgOOzVXrQXGWnSkoI
	vlEqaQGFkvIQ0Ybq2G5t/AzQEK7t//dr/uAgg7/cWWgVlJzwgy8OR1OTEcqgzEZREonyfsdVLwRyX
	hSD6IwHrMlzP/3sX54Klo9SUUwQ/70ou946jlYBPzK3UUcT0m5NviwxnY29v33lOv/qFqMyihs47N
	S10rHtaowYf1moaXKs79jhd47VVvJrejT9CCJFqBHoFnxVgkGJQRodooUIa+CkJvyc4GjMUVZlJ1y
	EQjDYScyM2LqFLshULFM5kV90x+MkJeUpy0nl5j0MLegleZwAfC26OsXBEddbDZ/o1jgpCQOc9cCP
	uRkn66jA==;
From: Bo Sun <bo@mboxify.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] bsp-guide: fix branch listing command
Date: Tue,  1 Jul 2025 20:41:43 +0800
Message-Id: <20250701124143.1756426-2-bo@mboxify.com>
In-Reply-To: <20250701124143.1756426-1-bo@mboxify.com>
References: <20250701124143.1756426-1-bo@mboxify.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: bo@mboxify.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 12:42:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7257

Replace 'git branch -al' with 'git branch -a' to correctly show both
local and remote branches. The '-l' option is unnecessary and may cause
confusion.

Signed-off-by: Bo Sun <bo@mboxify.com>
---
 documentation/bsp-guide/bsp.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 3882172e2..7eaa4d870 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -204,7 +204,7 @@ section.
       .. note::
 
          To see the available branch names in a cloned repository, use the ``git
-         branch -al`` command. See the
+         branch -a`` command. See the
          ":ref:`dev-manual/start:checking out by branch in poky`"
          section in the Yocto Project Development Tasks Manual for more
          information.

