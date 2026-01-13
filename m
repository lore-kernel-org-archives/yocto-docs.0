Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A090D0C855
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 11:14:42 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56531.1768302872295118961
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 03:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=yAoYbaWv;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bNpbMT2Qn2mEuJ4q0M4EKdm3VrfFMJZDOWfU4udv06o=; b=yAoYbaWvd6Oo5/QDIbwYoW/vtR
	gsvZ3J0zZ6P6aZ9yHhM/2zU7goL6+paArGWujm9ilu3QByasa4lIrCUhcwIlur3VduI6CSWnIQMCq
	VMA7GhiB8L/HYSaitrX5k/wjBLwf440+pejjDUr8sWuKBod3oKRvXi05xxCx5mDkkrbdwuZoc0aGi
	XN7wjP35+yurg9xgwvxDEML9a1xwb4EsQi9L7HDtKwELRJLddTTFm9ZC97HJcEyDJh9z69NIwb9HD
	lWfKmdErJ0DCrLIZ/a1WQWtol2uppwwW/dW17hcjPbfB6MUMS9Ghnh6CR0aWbwbccuXh0sCpTirHA
	1uKo4vqQ==;
Received: from [147.129.179.166] (port=33810 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vfcLz-00000001k8g-0myY;
	Tue, 13 Jan 2026 06:14:31 -0500
Date: Tue, 13 Jan 2026 06:17:35 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: Antonin Godard <antonin.godard@bootlin.com>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] why is "configuration fragments" in monospaced font?
In-Reply-To: <ba31ea3b-08ea-4a6b-aeee-2f84bd97fbad@cherry.de>
Message-ID: <36321457-bc45-1f5b-b1ec-471a58cd2057@crashcourse.ca>
References: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca> <4c7492bc-177f-4bb4-a8f4-cc19323fd242@cherry.de> <d59faeb3-8e61-7023-cc26-3918de5f0ab0@crashcourse.ca> <e118a38e-0e45-49f2-9010-01c1a4d7d1ad@cherry.de> <21105206-6e15-da26-2da0-de604fc4c905@crashcourse.ca>
 <f98abd3b-78da-4d20-886a-a08284d88641@cherry.de> <c72f1d20-7006-e705-8674-12133dfcd1db@crashcourse.ca> <DFNE3LZGWR7Z.296DD6XD8Y4ZK@bootlin.com> <ba31ea3b-08ea-4a6b-aeee-2f84bd97fbad@cherry.de>
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
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 11:14:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8486

On Tue, 13 Jan 2026, Quentin Schulz wrote:

> Hi Antonin,
>
> On 1/13/26 11:29 AM, Antonin Godard wrote:

... bug snip for brevity ...

> > The autosectionlabel plugin works until a certain section depth, IIRC, so
>
> https://www.sphinx-doc.org/en/master/usage/extensions/autosectionlabel.html#confval-autosectionlabel_maxdepth
> indeed but if we don't set it (we don't) then it doesn't stop at a given
> depth.
>
> > deeply nested sections won't be automatically labeled. In that case fallback
> > to
> > custom references. And you can't really increase that level otherwise you
> > get
> > the same label multiple times in some documents, making Sphinx unhappy.
> >
>
> How about using
> https://www.sphinx-doc.org/en/master/usage/extensions/autosectionlabel.html#confval-autosectionlabel_prefix_document
> as to avoid this issue then?
>
> > I personally prefer a mix of both. One one hand, high-level sections are
> > nice to
> > have autolabeled. But on the other hand, a well chosen naming convention is
> > also
> > very useful. For example: if I want to reference a class by its name, I know
> > I'll just have to write ":ref:`ref-classes-<name>`". Same goes for tasks and
> > fragments.
> >
>
> OK, I think Robert's point was how to know when to use which one and have it
> explained somewhere so contributors know which to use?

  precisely. if we want to encourage volunteers to write/improve the
docs, we need to make sure there are clear instructions on how.

rday

