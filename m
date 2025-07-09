Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C605C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:36:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.91.1752075367436341398
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 08:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=EBLLzQcV;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1c1SDOY6j0zOtBcAXpDjkgOBfFRV7kLVcq1PO48CGFA=; b=EBLLzQcVmY1k/Qx5enrS3EGSPT
	ypsitjo6BesvXNtW/7CyiyjNxINeRQu5MFP+txpAU/NmUrWlkypn677xly8D9pZ8N5El6/Yy9GXbW
	YLQEhrYk3aVG7GIH4546D583avEs9vge59EJGjRZjVq8s3d7fD1tzO5qrxxZLF5Sl5i5VnS3t3vLy
	7OIOb8MOvdRTAyeXUnPVliY07lpWdZzYkrwOJODh4f1eV1Y/QARQoxAJC2NTYdOCd5F3bS5e/iP1R
	XXh839sSELc3iInguNhsTcl0DKVtSk3JSOGYnChG4UTtLumQxXuzO0LCCapCrhfTkyiN8BA8i7TLv
	jb2fjNfw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:45078 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uZWq0-0000000B8rt-0H6f
	for docs@lists.yoctoproject.org;
	Wed, 09 Jul 2025 11:36:06 -0400
Date: Wed, 9 Jul 2025 11:35:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: more nitpickery: "include_all" should be described as really
 specialized
Message-ID: <d0caadc1-6923-4114-8798-89ecf3e8e494@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 15:36:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7299


  (yes, i'm still being pedantic and i'm keeping track of all the
previous feedback, i'll get to it at some point.)

  here:

https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#include-all-directive

the explanation for "include_all" correctly describes it, sure, and it
also uses maintainers.inc as the perfect example. but it's not clear
from the explanation that (at least for now) that is the *only* usage
of it in all of the layers i have checked out.

  a reader might get the idea that, hey, this is a useful feature, i
wonder where i should use it, without truly appreciating that it
should be considered a *rarity*, to be used only in well-defined
situations. *then* the example of maintainers.inc can be introduced,
again emphasizing how this is really infrequent and needs to be used
only in clearly appropriate circumstances. or something to that
effect.

  thoughts?

rday

