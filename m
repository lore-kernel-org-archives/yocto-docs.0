Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0BAC5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 09:33:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.25370.1748252019139130554
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 02:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=OSn9Bme3;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0vUBXQT9QcUQHXPqhV8/2E7c2kI37VtZy6TeLYdTrjc=; b=OSn9Bme3ERbJDqswuBFSsQQg4j
	iOjyzITY2v5raDbE/zW3lPhuJQsjzjDO2GY0CEB4cCGyml7p6mWvGWfGVsT/IwzUDZaCB4jUZ6ecV
	Tp7Xfhmsf1o2FosnLJofIED1PhyDS5F+B3uBMm2sEwp/Gz+p+8XLkgah0QlLnwh6ex5GLCEJIo8fd
	deq0K09hj2pWcgg59r+J1gQBWpthH67O+YOM+oQ/f6jM1q4KfEhk0tpucfcyeuOvYmwDXcNDhNEDg
	SzxQFuhHdD8A/863V2RsE7Vnp+DjqBNvBm7U4r1Ap2gLu6myxaQfvLDMKud1v2r4c+MyB/kv4K14y
	DdcG8agg==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:49178 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uJUDA-00000009bs7-0dO5;
	Mon, 26 May 2025 05:33:37 -0400
Date: Mon, 26 May 2025 05:33:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs][PATCH] Simple cleanup of explanation of minimum version
 requirements
In-Reply-To: <96ff6922-ede0-4b22-abd5-1887dc36118a@cherry.de>
Message-ID: <f34c7722-a848-635f-fec5-ebb562017157@crashcourse.ca>
References: <727b1435-c923-6c06-c2df-e1ff35c8968c@crashcourse.ca> <96ff6922-ede0-4b22-abd5-1887dc36118a@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 26 May 2025 09:33:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6923

On Mon, 26 May 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 5/26/25 11:23 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Trivial list rendering and grammar fixes.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/brief-yoctoprojectqs/index.rst
> > b/documentation/brief-yoctoprojectqs/index.rst
> > index 2f6e4cf02..a8d877a54 100644
> > --- a/documentation/brief-yoctoprojectqs/index.rst
> > +++ b/documentation/brief-yoctoprojectqs/index.rst
> > @@ -57,7 +57,7 @@ following requirements:
> >      :ref:`dev-manual/start:preparing the build host`
> >      section in the Yocto Project Development Tasks Manual.
> >
> > --
> > +-  Ensure that the following utilities have these minimum version numbers:
> >
> >      -  Git &MIN_GIT_VERSION; or greater
> >      -  tar &MIN_TAR_VERSION; or greater
> > @@ -65,7 +65,7 @@ following requirements:
> >      -  gcc &MIN_GCC_VERSION; or greater.
> >      -  GNU make &MIN_MAKE_VERSION; or greater
> >
> > -If your build host does not meet any of these three listed version
> > +If your build host does not meet any of the above version
>
> Not a native speaker here, but should we rather say "does not meet all the
> above version requirements"?
>
> In any case:
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

  ah, exactly so, will resubmit v2.

rday

