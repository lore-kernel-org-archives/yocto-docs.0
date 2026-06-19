Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844BDCD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:42:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45486.1781883726910806992
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 08:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=o3pJcdsM;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2sEuyLKE9aptgsYr+GV070wYfhVZclX/T9kS1DLB7LY=; b=o3pJcdsMzJfRzQXmFSojhscEwc
	THG3VMU1HaX2ajWT2ncpD0Xg6CE2AAy2htvGEI4KprClGYmJts6HE8NbRarWusO2EBputoMkhO1Fw
	PyNjmr0TiD+qJGJNkit/slrYF6n+96Pic9LKsb9R3oWHhT8VK+LqCiSymofndNJJuhZpx89OaEVWQ
	lNksnSbatw0vBDGQbmj2z9CBBlWpMWNbelTQtNIWgUu/pUGo1NtTz6sP4ikyut9ia0Y9ps8Svik9J
	mdzPPM0h9DlnduU1/PRCDATFa3g/GfhznEAww312rQQuCnnlM5RDcbtUgSLvTxvH8LaHIxcg0PniI
	G3N4RyvQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34724 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wabM4-0000000385P-2fO3;
	Fri, 19 Jun 2026 11:42:05 -0400
Date: Fri, 19 Jun 2026 11:41:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] security-manual: some grammar and wording fixes
 in intro
In-Reply-To: <d052854b-4d69-4685-90ca-6f0e76589261@cherry.de>
Message-ID: <865e438d-59d7-1b2f-3b90-8364e9455229@crashcourse.ca>
References: <6f15263e-56f3-fe32-ea3c-c81d89f34d05@crashcourse.ca> <d052854b-4d69-4685-90ca-6f0e76589261@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 15:42:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9803

On Fri, 19 Jun 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/13/26 9:24 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Tweaks:
> >
> >    - grammar
> >    - punctuation
> >    - delete word "necessary" as that is too strong a word and implies
> >      that what is being discussed is mandatory when it isn't
> >
>
> Please be mindful about the added comma or similarly opinionated and
> tiny changes, I don't believe it brings much and I don't think it's
> worth the churn for maintainers or reviewers.

  i typically won't try to patch minutiae like that unless there is
some other change in the same file that really merits fixing. and i
thought removing the word "necessary" was a sufficiently notable fix
that, while i was there, i fixed other trivialities.

rday

