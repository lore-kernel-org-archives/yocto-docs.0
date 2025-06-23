Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636F3C77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 16:19:06 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.374.1750695541045466233
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 09:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Ulo8Fd4J;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XwDLcwMRYfHMZPfB2oG7E6zgU8XF7tVFsXhX/jbySSw=; b=Ulo8Fd4JZbx7tEcnqxQvA6gsib
	ZSU5KpSK8tAMNXL9+zjQwn67Ymw0xHr+h03M8OGTYuyWMkr3w+ZKgrAlQy1f44yp3mrxLN8BKiTrF
	GYuhLUbK2fGm5Yyr1jRATZpZfFC4RlhFVK+pxxmTfTgdpzD6MgoGyL+V9M4GO4ZhvhsW7efUzAPHf
	wGA4+w+hfiZ3wPY7C7lQYErtTlCg/ani71piJQ0JZeNYHX0XSN/XHdgZVmgW0srbeoTIBD14LqQJB
	VGE7Q1K0toWX8hEtQ8T5GhvdPvzox2ZMhk4evTaew0Psjw2lDlP7ulhu2EJyIOH8yiktOGi6iX/fZ
	OZlPFKeQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:49332 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTjsn-0000000BZWA-1xDI;
	Mon, 23 Jun 2025 12:18:59 -0400
Date: Mon, 23 Jun 2025 12:18:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: quentin.schulz@cherry.de
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] improper rendering of ":term:" in bold
In-Reply-To: <72507079-aaa2-40c4-b1cd-9f374e839bfd@cherry.de>
Message-ID: <1ddf83fb-7230-597d-b772-03a2be9b5aa5@crashcourse.ca>
References: <8a705bb7-e1d2-a784-0018-a3106d02bbf8@crashcourse.ca> <72507079-aaa2-40c4-b1cd-9f374e839bfd@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 16:19:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7170

On Mon, 23 Jun 2025, Quentin Schulz via lists.yoctoproject.org wrote:

> Hi Robert,
>
> On 6/22/25 10:42 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > if you check here:
> >
> > https://docs.yoctoproject.org/dev-manual/building.html#building-images-for-more-than-one-machine
> >
> > note the improper processing of :term: in that first bullet point,
> > which is rendered verbatim as:
> >
> >    Share the :term:`Build Directory`:
> >
>
>
> Good catch!
>
> Indeed, seems like it should be
>
> *Share the* :term:`Build Directory` *:*
>
> ? Can you test and send a patch?

  Yup, that is a solution. My only gripe is that my standard is that
even if the title of a bullet point is bolded, the following colon
should not be, but since that standard has already been adopted
throughout the docs, I'll stick with it. Patch coming shortly.

rday

