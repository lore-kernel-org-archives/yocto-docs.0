Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7310C77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 15:23:02 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.1564.1750692181146286827
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 08:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=WlpcRtgc;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I8kLSUq++5qnbDBbDD6lE5EjZruMJ+3x/Rw5EqnMV7g=; b=WlpcRtgcEkaMrNlCawJQLO7lD3
	cdq+ST15fAasiJhzRWWMTuyOeL5uaZPSUSXJHqn1u6Md6IuDiZATkO+P37z+9QKNARS9FaRS3fQsl
	VXf9rx7BqbkbnS8Y6+UB00CsTk+RJFzkIoyy6JDoPB1/te5HSNd+8CTbtWuBY/z9H+q5YLNzt4ZFX
	IRH7VwvabThbBPDngEriGdPCNRcFLkIh4CPqgTtGahZeaN4/ENfTAVm9vf9rFuU62jvdcifq0GxAW
	M5ebi/YDAz3RAOkMwvG3NiBo/mOibf4HeizLVMGfm7+UuG1/Fz5YsTuM+78OvK+0lPRGjHwfxIAiy
	GWTzARTA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47418 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTj0b-0000000BQig-1AHa;
	Mon, 23 Jun 2025 11:22:59 -0400
Date: Mon, 23 Jun 2025 11:22:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: Replace "On the contrary" lead-in to
 sentence
In-Reply-To: <2ee944e5-392c-4023-baff-57684d6a2cbc@cherry.de>
Message-ID: <831cb5d3-e93c-5f00-fa7d-a3b3333e4145@crashcourse.ca>
References: <b651b956-eb9f-6d46-f878-f09bc6bdc460@crashcourse.ca> <2ee944e5-392c-4023-baff-57684d6a2cbc@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 15:23:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7164

On Mon, 23 Jun 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/22/25 5:09 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > "On the contrary" is entirely the wrong qualifier to us here, as it
> > typically introduces a *contradiction* to what has just been
> > expressed. That is not what is happening here.
> >
>
> Not a native speaker but my brain isn't too happy with the suggestion either
> (but that could be solely due the fact I'm not a native speaker :) ).
>
> Would "Alternatively" work here?
>
> But I agree "On the contrary" sounds wrong :)

  I was actually toying with "Alternatively". I think that, given the
contrast, I think I will say, "By contrast, ...".

rday

