Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDAECD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 14:11:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21325.1780495916859763482
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 07:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=XTtDFklo;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G87Bq+P7D9w5CFP85SBI89mMAJ9H7y2pCnxBB/+xKwA=; b=XTtDFklobzBuprQRYkYMKzCdlV
	dxaNMzTJOsLXUkFjqxr0raZy2WVrS0jG9Cr/bcvPwqOo2J0LFjeQtf6ezkeUjPrP3M0fiabXe0zUE
	UQzS9XuKXMAYp2+/d3n9DVtnhkZ8zTSnHzpGFBRCLmBOoPrnKapvFwpK0gqACJjyPhHD43oT0AOk8
	RYkeDVdQa5NfB0PWPYVyMa2lwVQnYbFz/NzH1Cv0mw2rbpgJZgV9/jLiNHzZ9BP3gTRhMmPm6RMjT
	6wBRC6eM8Kafn3wj73jk2nxq3Eeb4PSTMCpXkgfQOj33gKHrJ1AQm/CXl3CycLo36UhvxLgeGcQia
	uN+vWayA==;
Received: from [147.129.179.166] (port=38804 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wUmK1-00000008m53-2Sa7
	for docs@lists.yoctoproject.org;
	Wed, 03 Jun 2026 10:11:55 -0400
Date: Wed, 3 Jun 2026 10:11:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: provide a more expansive definition of
 "layer"
Message-ID: <ffbcb1ff-434d-50c2-9c40-9810b63864f9@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 14:11:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9560


A layer is not simply a collection of recipes; it can include any
combination of recipe files, machine and distro configuration files,
class file and more, so make that clear. In fact, a layer is not
required to contain any recipe files at all.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 9f8522b25..b2d687795 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -674,7 +674,9 @@ helpful for getting started:
    their code available to other application developers. For information
    on the eSDK, see the :doc:`/sdk-manual/index` manual.

--  *Layer:* A collection of related recipes. Layers allow you to
+-  *Layer:* A collection of related metadata, which could include any of
+   recipes, machine configuration files, distro configuration files
+   and/or class files. Layers allow you to
    consolidate related metadata to customize your build. Layers also
    isolate information used when building for multiple architectures.
    Layers are hierarchical in their ability to override previous

