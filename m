Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB36DCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 20:40:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.5039.1761165610762452439
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 13:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ykL5aeYz;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y97miLxf6O62iBWMM6y8WMPtgZMNRsgZRirrol0vSxM=; b=ykL5aeYzB6yn5hldAWqr9hQsj8
	VzAweC9v9aENw1x+WvN3AMk1iBpflzyQ3q/U8chrJiqa/teEJuu9xZ3BvHa/Ozi1S9pi0tlZpFXAh
	XXE3+9VtvWPKTc7APyJNyGZwBbLnQSWwjsccYLmz8oXgJLYLVmPNe+aZEs026GC84hf7kcJCsOGka
	5rZzcklAy0uB+EoPWUo1M+vd3lH85q6egnBqTriwvZ+WRjY29V+nWre70+EjsiQ2G6FbTHSTyMpgd
	EyiNaQoiK7AwNoclEmgEAxJpEKRDY12TeYU8zLXFWH+BDk6rOjg2Sgtv7A1EW0jszqDwN+TGwr6V3
	QBqrBqcw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:42302 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vBfcr-0000000A0gA-3kXr
	for docs@lists.yoctoproject.org;
	Wed, 22 Oct 2025 16:40:08 -0400
Date: Wed, 22 Oct 2025 16:42:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] political question: which vendors should be listed as
 providing support?
In-Reply-To: <1870EAA42BD3BD22.8642@lists.yoctoproject.org>
Message-ID: <972dfe54-331c-54d3-29f0-5408cfd156da@crashcourse.ca>
References: <1870EAA42BD3BD22.8642@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 20:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7776

On Wed, 22 Oct 2025, Robert P. J. Day wrote:

>
>   reading here:
>
> file:///home/rpjday/oe/layers/yocto-docs/documentation/_build/html/overview-manual/yp-intro.html

  argh, i accidentally linked to my local build. sorry.

rday

