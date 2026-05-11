Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E68CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:47:09 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46340.1778492820255837995
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 02:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KKuN9uvn;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bo3IZ7WBB0fa8rzcXygUd3QTxKvslZ1U/7ds3paLw9g=; b=KKuN9uvn6LzG1+NaccVLtqi2iY
	rFJ9D2X+S0mEJp8+XifppdiQUgSLdZrjlrZYiZB+SQcPGngTIdXBfyievp/LXAzrADyJcm5uP7jfD
	QAcWM0gTe3ZvXNtSboLbBPlx2OLsp8/D77bKtasD/TNOZN2iNvuPRZoSCfBD+7pWpHm5G56Gmh1JA
	MLiO9Ofkkzp9ZdayY2WLF/xLRzYMw9a0c3YmySLD5DuVAFLC0HvOZ4ViikW2LE95F4xY3txfi+lcP
	4dNrBOIY3/usPU77bAe2zsGU6/AHV5mOkAp1gCLnDbEVU0ytfjqkmB6LUJdFbBV8+l0tUWEIqI7Pj
	veSryAIQ==;
Received: from [147.129.179.166] (port=40018 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMNE1-00000004RMs-2Onp;
	Mon, 11 May 2026 05:46:58 -0400
Date: Mon, 11 May 2026 05:49:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: quentin.schulz@cherry.de
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] YP Quick Build: use "set up" as a verb
In-Reply-To: <6449364d-e8c9-40aa-81be-95be14e00e93@cherry.de>
Message-ID: <6b4d2737-eca8-170a-8f6f-47721edc2147@crashcourse.ca>
References: <24bc012b-dc44-ca34-b3d0-b08200bf77d8@crashcourse.ca> <6449364d-e8c9-40aa-81be-95be14e00e93@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 09:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9440

On Mon, 11 May 2026, Quentin Schulz via lists.yoctoproject.org wrote:

> Hi Robert,
>
> On 5/8/26 9:14 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Pedantically speaking, the difference between "setup" and "set up" is
> > explained here:
> >
> >    https://grammarist.com/spelling/set-up-vs-setup/
> >
> > - "setup" is one word when used as a noun
> > - "set up" is two words when it functions as a verb
> >
>
> The downside of having non-native people write docs in their
> second/third/fourth language :)
>
> Same remark as previous patch on commit title (and your next patches as well
> but I won't repeat myself again :) )

  apologies, i will do better.

rday

