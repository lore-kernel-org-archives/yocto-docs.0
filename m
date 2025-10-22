Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2867CCCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 15:13:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.12105.1761146000619061946
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 08:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=asLrXAre;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2vlOw7avLj5qwE4ZtdyZl8ZCcWVJRaW4KoD8MisCw8k=; b=asLrXAreEXrtTkSFkZ0GSC046D
	0HthIdtIk3aqFb+7r2xxVP3WkicuKnGgpKV6PsVJ+RaUIeMAdoaOMpVzJpiibQHBujzJtex+LDrfQ
	GQka79cZqhs90uYoSzv8OmufkUV7S2FRKk1HVApykp6OrrD+fCbKdPKz7NXNZ6sw3pmxtfT+IYfS8
	kOBt/zqCIXuZKtbVIu/+x1juPXWgNWaanQstiBU0p+aqLCnK2U65EAXx5hcw0fCyul9Jq4faD0kve
	LzCQ6Uqd89PG5yAr1wkCXc4MXsbYqn8gYrTDoeeR1UWkpLj/loRabB/ARzKeHHblmV0CFoxhhkR+i
	m4APMW6Q==;
Received: from [147.129.179.166] (port=58306 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBaWa-00000009CL6-0uuY
	for docs@lists.yoctoproject.org;
	Wed, 22 Oct 2025 11:13:18 -0400
Date: Wed, 22 Oct 2025 11:15:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: diagram for build hierarchy in overview manual seems wrong
Message-ID: <6647a7d3-3aa0-5e24-edb0-8f9d434672b5@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 15:13:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7771


  just noticed this as well ... here:

https://docs.yoctoproject.org/overview-manual/concepts.html#source-fetching

the graphic states that the default name for the UNPACKDIR directory
is "sources-unpack", but the setting in bitbake.conf is:

  UNPACKDIR ??= "${WORKDIR}/sources"

where does that name "sources-unpack" come from?

rday

