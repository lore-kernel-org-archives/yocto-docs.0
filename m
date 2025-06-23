Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4077AC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 13:40:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.20060.1750686032989171261
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 06:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=qPXL3AN+;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4ochGTVIVvSJPfmq6QOTqCxvOtvIm1IUS5t1IGnm2Q4=; b=qPXL3AN+lJj/PKFrrKHjNskvL/
	bJQuralQZS30qpByOoXvQKKgAgqDQHHaWWZdlSGzr9IKxgjRFMGiwR+dyQtpTcea2QTxT3rJwJo9E
	GwaN29Vu2wtpvaRBHlZi/WI8tlxNlqVROXIHykQApesCzgw29dEGuvmFU2rUo4oG7F9wXeX0dpnAw
	ps5mdLXHqkFnuF+LBsTCD39FGPqw5m/HCxrxCS7aZqPDdSrUAWHiKH/Z7e+lM4LKMWUJps6gDiDEi
	s+dVqFkEVaVGWiMK4ibWbInPY6TNtdjydIgpKSNQcmZFF9aR0XifxxgZTOCYbZQXT8ZDAZuyDWfeV
	Hg0aYfKA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:41524 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uThPL-0000000BApU-37XJ;
	Mon, 23 Jun 2025 09:40:27 -0400
Date: Mon, 23 Jun 2025 09:40:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual, CH 5: grammar fixes and update
 recipes
In-Reply-To: <f096f57b-8889-4dac-8e9a-a15b04915344@cherry.de>
Message-ID: <458d6e15-944d-ef86-c9fb-b033f92bca22@crashcourse.ca>
References: <23ac0815-60ab-fef4-533b-920e61f5d38b@crashcourse.ca> <f096f57b-8889-4dac-8e9a-a15b04915344@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 13:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7152

On Mon, 23 Jun 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/20/25 9:09 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Major updates:
> >
> >    - update strace recipe version
> >    - replace git example with gnuplot, which actually has two
> >      SRC_URI values that need naming
>
> But is part of meta-openembedded. Can we use an example from oe-core maybe?

  i could probably find a suitable one under oe-core, but what is with
the numerous examples of:

  SRC_URI[archive.sha256sum] = "...."

that i see. is there something magic about the name "archive" that is
not explained in the docs, especially when no SRC_URI value uses the
label "archive"?

rday


