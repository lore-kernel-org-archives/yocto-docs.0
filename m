Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2295CD3427
	for <webhook@archiver.kernel.org>; Sun, 10 May 2026 18:13:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34489.1778436819491688945
 for <docs@lists.yoctoproject.org>;
 Sun, 10 May 2026 11:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Acr5TyQl;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Durin3fXMe7+4mPap9wkY+8U7sJ9HvDBAa+byWhpImU=; b=Acr5TyQl5unn28ezsqendZVrIZ
	cRDyMkBwU+2qK9PZNhz09wm74EMoohbMNPXHUu3nbyg0VRT+yUNRit3ErhkSF1LTD1J98SOSefgPp
	JNdL2rvpL6tCOmLpi2j/Ov+VErCgKu2rTK2U1+nuCgdW0NHdrXSUTxJJnkdD26SJx9GxEHT+BqG4K
	8nwDTHg4w+2OtbDYAOW4bmMFXfZn8DXKUzj1iTVJrrHrspEoY6WZkd5J6VaxUtKAnL666BMdh2avE
	6BiQdisuLbdSqUg0i/hJlaEswlcbu3ozJ3nA8iqWWf67lDzh8kfPak/cohpYhJht0blNDPoYbjfZV
	KzqU6/BA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:32936 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wM8em-00000002gMF-3Xle
	for docs@lists.yoctoproject.org;
	Sun, 10 May 2026 14:13:37 -0400
Date: Sun, 10 May 2026 14:16:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: should the docs even mention "hob" anymore?
Message-ID: <8173f6d4-57d3-139f-7f95-f61f50de37f9@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 10 May 2026 18:13:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9433


https://docs.yoctoproject.org/overview-manual/yp-intro.html#archived-components

should the docs even mention hob as deprecated?

rday

