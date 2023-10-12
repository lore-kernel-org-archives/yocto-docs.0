Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB19CDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 12:14:11 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.9493.1697112849825446043
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 05:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ktgptZT7;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Kn/b89nLOQZm5wwSqmZhf/DYh0LhHoIG0X9CsboE4Ng=; b=ktgptZT7dXtqbtpk5/3rqKFxjz
	SwrOmQPlZ7hxlIC3q82gdh2sxvSf6N2RUx7lf8NECPFaRuaHGQYJUJMlQlb/zAifiAZtmAuBbRk5I
	3MGiC7tDORu0VU56IAYO6mi4eucxY6iXfSsGOaXbYW6KCop7nhIg/mWZlWTdYhl6jpgymF/FXFQ2V
	oeywC6O7X3+iUESSn5sEbxCD7C5OBlySKV1GQ1ziZA9PvkQ81ZBcu3xd5T3/irfds7sGW43kaqG6N
	V4Pcf5nJO0Wg+vwfzLRJfg2CN4doxq9CS4d6SI9QrkJI4VCd7orbrICDSQGxh6ZKAUNsD/w21uCff
	9M6ZVsdA==;
Received: from [::1] (port=45374 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qquZp-009557-2l
	for docs@lists.yoctoproject.org;
	Thu, 12 Oct 2023 08:14:08 -0400
MIME-Version: 1.0
Date: Thu, 12 Oct 2023 08:14:06 -0400
From: rpjday@crashcourse.ca
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: PATCH: dev-manual/new-recipe.rst: add missing parenthesis to
 "Patching Code" section
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <09705a7fc497768ca30a5de2b500e573@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Oct 2023 12:14:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4363

Add missing parenthesis, and another example of a compressed patch 
filename.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

testing a new mail client so hoping it doesn't mangle patch submissions

diff --git a/documentation/dev-manual/new-recipe.rst 
b/documentation/dev-manual/new-recipe.rst
index 02bb08474..e741cef0e 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -409,8 +409,8 @@ Patching Code

  Sometimes it is necessary to patch code after it has been fetched. Any
  files mentioned in :term:`SRC_URI` whose names end in ``.patch`` or
-``.diff`` or compressed versions of these suffixes (e.g. ``diff.gz`` 
are
-treated as patches. The
+``.diff`` or compressed versions of these suffixes (e.g. ``diff.gz``,
+``patch.bz2``, etc.) are treated as patches. The
  :ref:`ref-tasks-patch` task
  automatically applies these patches.


