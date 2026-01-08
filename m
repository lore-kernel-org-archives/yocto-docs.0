Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DCFD1D484
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 17:29:23 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12135.1767893359599917420
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 09:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZSuD4Pdb;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mN6YRwCOjDJtQctYxafJ3PPXX3qbF9C5XTGqhsfqpqA=; b=ZSuD4PdbGOyml+xVdVpt8Z54s9
	4Nz1XrGedb5Vr/SbeZYa9t4e4QKiu6IKj4lKGkAgV0gwSgxZTALLEZ7qEbF3JytZeVH6iLshuf8ak
	Xnwh5o0oAC0RQheOAji30gdQPYnB3HA12skX84ZN9yauj+ohkMw3xVClS/WvH9UJkK81rUab/wfyI
	CLXAt1hfWqnZRQWZQEJJQmPYEOLaEjkLfkTZohoDyYgNmDyHthSs/L+BDwXglrLY8N5QUGT/Q1ATb
	WFH8ddCv97wdqCKDgV2RJ3RNatixgwVan7MwG+KIWXrcIu0w78xkVbd4oeaDx6mdJYuHYV0Od+IFu
	MWrdw3CA==;
Received: from [147.129.179.166] (port=51594 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdtoy-00000002CxD-3Yqm
	for docs@lists.yoctoproject.org;
	Thu, 08 Jan 2026 12:29:17 -0500
Date: Thu, 8 Jan 2026 12:32:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: must BBFILE_COLLECTIONS use "+=" and not just "="?
Message-ID: <824c542b-08cf-0ded-a1a3-732a363294ef@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 17:29:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8430


here:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#locating-and-parsing-recipes

you can see a snippet from a layer.conf file:

BBFILES = "/stuff/openembedded/*/*.bb /stuff/openembedded.modified/*/*.bb"
BBFILE_COLLECTIONS = "upstream local"
BBFILE_PATTERN_upstream = "^/stuff/openembedded/"
BBFILE_PATTERN_local = "^/stuff/openembedded.modified/"
BBFILE_PRIORITY_upstream = "5"
BBFILE_PRIORITY_local = "10"

am i correct in thinking that the assignment to BBFILE_COLLECTIONS is
wrong, as it must use "+=" and not just "="? (that is, it doesn't have
magic properties like PROVIDES where either operator works fine.)

rday

