Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA68C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 16:24:25 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11163.1787329463441245070
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 09:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=BdEv8zKr;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ThOWzWMxgmD3kGPE8giP60/NGxW6vARW79CuYEQlCi0=; b=BdEv8zKrH/LWDs/Bgk5PBMBfFA
	j4+xs1NHbiRNZPBLO60gzQEpboZ1NwDAKppYCPaevFZ3Ns/PxbysoIv0/Lri9LoeBDPbJjF4U37a1
	5ec5v8S1EJAOff16t+azKjW2kATk/U1yNKslHMCvBQdyuQoi+CIld4O2KHtwo5K0nZLgeFyrgzS+i
	XdhM5NcrWOSnvT7HvnLmX5eE6+afjpw/hBOhtIuXGxivUgF3UVTfH6xN4OzJ/tdvH0cZICdA6T9fa
	EzsrX0hHv+7l/ApViM5Z7U3qyCjRnVZUJqRbCPCcfsJvaeuBK6oCA8ezJXtR4P0qc4ETtTdAWfFU5
	Yh88NPSw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:45266 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wxS2W-00000003Do8-0Swq
	for docs@lists.yoctoproject.org;
	Fri, 21 Aug 2026 12:24:21 -0400
Date: Fri, 21 Aug 2026 12:22:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should yoctoproject URLs use consistent protocols?
Message-ID: <dfa91d03-3aa0-bf09-75e2-a5ed2825a937@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 16:24:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10315


  just noticed that the docs files bounce around between:

  - https://git.yoctoproject.org/...
  - git://git.yoctoproject.org/...

obviously, both work but should the docs pick a consistent standard?

rday

