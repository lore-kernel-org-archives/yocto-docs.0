Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D13CD4840
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 17:04:53 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55728.1778519091963169052
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 10:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=u7JA4OzV;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fpDbAW7YFmmzyJxXMuNW7eDWS0bb7zzWIyCJz9ojzYQ=; b=u7JA4OzVYozmgr9SuVXsI7PI6g
	nBLeZDSl9otKuF8y+V/SXZjKn2E53jLD40x87zZIE1aPpLfk4dPvh6GeCMC6UX2XZ7Xr5Y6UJJhJG
	8QyUJjDiJZbhW7/c8Wwxn3L/lGiGWahYkGUW61NnFDgA/mSvwGOodfN3HKpm8Qt1gBA06mDa6fMfe
	7LzheFI0XsraEJGjt7wlTlgEKxdfp2QOMO89itHinnm1wx14ScaQGKQrFbEz2wvUC4FAhk4Cfx0En
	HnSY/Uf28qO6/d5IPRiEWvTti74jdb4+9xg/AbF4iQ5bv6t8Mm4KEQTO/iy2SD65istKl8R4lNx+z
	4rsYC4BA==;
Received: from [147.129.179.166] (port=42460 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMU3l-00000005Kr3-2EbY
	for docs@lists.yoctoproject.org;
	Mon, 11 May 2026 13:04:50 -0400
Date: Mon, 11 May 2026 13:07:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Should explanation of "github-releases" class cover private
 assets?
Message-ID: <f3b7de9b-a40c-5638-7d5b-d7004f987b02@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 17:04:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9453


Here:

  https://docs.yoctoproject.org/ref-manual/classes.html#github-releases

there's a short, sweet explanation of "github-releases." This morning,
for the first time, I created a recipe that tried to fetch assets from
a *private* GitHub repository, which failed in just the way you would
expect -- "Failed to fetch URL ...". (I had not been warned it was
private.)

  So I went looking for the proper(?) way to define credentials or
authentication for that, and I ran across all sorts of suggestions. I
eventually ended up here:

https://lists.yoctoproject.org/g/yocto/topic/bitbake_fetch_private_github/115408881

so I thought I would just ask -- is there a YP-approved way to do
this, and should it be covered in the docs? Because as it stands, the
current explanation does not warn the reader of the extra complexity
when private repos are involved.

rday


