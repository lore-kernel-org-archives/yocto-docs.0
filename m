Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4AFD3CC87
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 22:30:28 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23082.1768429827801892811
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 14:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=IcGJMxFn;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UqSSKD20EJTIa39PGtjAlp55IYbUnYoaDq1PgoylAc0=; b=IcGJMxFny1Ga16BYG4U+CeuO6g
	U5wG/ql3pxWZli+pyqF/HJoJffNdfFZhZCaZ9KDg53HncDWpeZ69FbYB5vk/TJhMP79xUalTHA1m7
	HosVp4lZZFWz6JxDn6tl4MFpLElLHLYZzvR8c5QF/wLKBih9MiyLWfb8q+2c8Fvu9up1e194fKHR2
	DqbEzj6mzGa2b/N3Y+urk45Sb4sbD8Aps7oSXn4GPoKelNjFfrG8h1CC8NroK4mUz9YZUM5PG/f+z
	PLwoZ7IroyWpYffK30qd0k6XERKkGj+9cp356h8m9NLXbzDl4MfWGM2PwVm0+EaWrbqh1h36FZ6Ve
	rEbzRaYQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37734 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vg9Ng-000000077gg-0LJl;
	Wed, 14 Jan 2026 17:30:26 -0500
Date: Wed, 14 Jan 2026 17:33:46 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] must BBFILE_COLLECTIONS use "+=" and not just "="?
In-Reply-To: <4c573ac3-2c69-44a3-b9ac-42dd3dbc136e@cherry.de>
Message-ID: <dd148458-2ebd-a8e6-4b2b-f478061cc591@crashcourse.ca>
References: <824c542b-08cf-0ded-a1a3-732a363294ef@crashcourse.ca> <4c573ac3-2c69-44a3-b9ac-42dd3dbc136e@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 14 Jan 2026 22:30:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8562

On Wed, 14 Jan 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 1/8/26 6:29 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > here:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html#locating-and-parsing-recipes
> >
> > you can see a snippet from a layer.conf file:
> >
> > BBFILES = "/stuff/openembedded/*/*.bb /stuff/openembedded.modified/*/*.bb"
> > BBFILE_COLLECTIONS = "upstream local"
> > BBFILE_PATTERN_upstream = "^/stuff/openembedded/"
> > BBFILE_PATTERN_local = "^/stuff/openembedded.modified/"
> > BBFILE_PRIORITY_upstream = "5"
> > BBFILE_PRIORITY_local = "10"
> >
> > am i correct in thinking that the assignment to BBFILE_COLLECTIONS is
> > wrong, as it must use "+=" and not just "="? (that is, it doesn't have
> > magic properties like PROVIDES where either operator works fine.)
> >
>
> If you only have one layer it doesn't matter. Otherwise, yes, that
> is an issue.

  right, that's the point i was making. i'll submit a patch to fix
that, to make sure no one misunderstands the proper syntax.

rday

