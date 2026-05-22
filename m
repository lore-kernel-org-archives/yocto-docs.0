Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17816CD5BB0
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 16:22:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20542.1779466966933691786
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 09:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Z09ixyK8;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n1LItbCIEMe4Sg5O55zoxNb7aCsfybH++QjTsUSOD2E=; b=Z09ixyK8oKEh60eMNLVHPM2KqJ
	qGhAtU8OJAjX7xRhae8ys6YcGEvS7oVaXTsf4U57q84Lap5nbciKps6iKoIzi4eIftkamtzSyMM+X
	/1pYv92/kv26EZ63YclssXzYjsNYl42pKgVjQ2s2mcfhcg0Qs+OJjgCAv7EV5LnZj5tQoNjwTSla6
	jK1NVFebSXSBV4imt59CZQjR2lujeUxFBWQ4iIKepFK9GaYxCJOXWWXjAA7GMpjqr4UGJXcORIcat
	2Hadl1iCyxn1XW1W7k7qObd3g/5FeXZONS4na7nsrO9dQ8azPvDKIORH0CFpqoUtxADeu9Z+uwa1M
	0nQc1wog==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:51190 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQSe4-00000005ob9-0LEr;
	Fri, 22 May 2026 12:22:45 -0400
Date: Fri, 22 May 2026 12:26:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: clarify that PACKAGE_EXCLUDE supports
 DEB packaging
In-Reply-To: <005af954-7f10-4b76-9257-d86b25713d32@cherry.de>
Message-ID: <3ef2473d-af97-e952-6279-45e8438a7380@crashcourse.ca>
References: <cb7c2ab0-bf11-5fa5-5730-2776d56dad0d@crashcourse.ca> <005af954-7f10-4b76-9257-d86b25713d32@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 16:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9531

On Fri, 22 May 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 5/22/26 6:15 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > As an accompaniment to earlier commit
> > 0d05dedd62a6d4c726f120a23654ede1f0b23d8e, correct that the
> > PACKAGE_EXCLUDE supports the DEB packaging backend.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/variables.rst
> > b/documentation/ref-manual/variables.rst
> > index c65794229..2773e9864 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -6927,8 +6927,8 @@ system and gives an overview of their function and
> > contents.
> >         an iterative development process to remove specific components from
> > a
> >         system.
> >
> > -      This variable is supported only when using the IPK and RPM
> > -      packaging backends. DEB is not supported.
> > +      This variable is supported by all of the RPM, DEB and IPK
> > +      packaging backends.
> >
>
> Considering those are all the backends we support, can't we simply remove the
> paragraph entirely?

  i mentally flipped a coin and thought about people who might have
remembered the earlier situation, but i'm happy to toss that last line
entirely.

rday

