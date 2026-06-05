Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38810CD6E79
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:22:23 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9359.1780669334999715479
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 07:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lWmQX2L3;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ae4d+BdNgAV/OM8GKEugEJubqHLMx2IfNB230gpMPAY=; b=lWmQX2L3Gcr8lqV5/iUKHC4bCe
	Pzyx7zfCT9OnDnD0tHiLZA0dfMeD/IgY/KLxwY5VXEU9U7SrcA/nZlanwXniLmRoKpnXzo+8QHAra
	PsSKNkeus9z/B1S6gOPlvwGO+R4bcaCoqfxUmLsjv1Nh+7xwf5SJAkC4+9Aaooez/m1invHl7RFPe
	c7h3A8ggrUNd8J3/69V6FzYP/x0ygXL7Ygk41kObH+X0AzMSnOea6nrq2tcA3hrQN3BzCdIgxkpyw
	vfOT3STCpRoF5u15s3KcY8oa9lSJndHMyti9BD4I0yv6sHHe8tkd+sQtzINo78C6lfqF8HRjrGG6p
	E4kaCYqA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:33218 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVVR5-0000000DrE2-3Nn4;
	Fri, 05 Jun 2026 10:22:13 -0400
Date: Fri, 5 Jun 2026 10:22:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "Required Variables" aren't really "required"
In-Reply-To: <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>
Message-ID: <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca> <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 14:22:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9609

On Fri, 5 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:

> On Fri Jun 5, 2026 at 1:40 PM CEST, Robert P. J. Day wrote:
> >
> > here:
> >
> > https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#required-variables
> >
> > the section "Required Variables" goes on to say that four variables
> > "should" be included in all recipes ("should" does not equal "must"),
> > but a quick test build showed that none of those four variables seemed
> > to be required for successful parsing -- only a missing "LICENSE"
> > triggered a parse error during my testing.
>
> What do you suggest as an alternative word for "Required"?

  Well, it makes no sense to first say that short list of variables is
"Required", then say they "should" be included in all recipes. It's
common usage that "should" means only that something is *recommended*
or *encouraged*, not mandatory.

  Then based on my testing, none of those variables are actually
required since leaving them out didn't cause a parse error. So I don't
know how people would want to word that or what it should say.

rday

