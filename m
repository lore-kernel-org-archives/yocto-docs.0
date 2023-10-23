Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBC5C25B45
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 18:44:03 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.129448.1698086636292235502
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 11:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=O+EO6FUI;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6y7Jkr2tJ6UwAJ/sba9wMHB4c1stnG7HfEi87S4NPYw=; b=O+EO6FUICcRL987ORJpeDYO4gs
	MQKfBNOgtWoiyMe06BJaiYpiZnIPlnesR3UJHXKCDw34QB0+3r9M/Yx9XMg1IXGuNDFwUwo17JRoh
	PIKGIH0/GXDAHU2qrG6fmCHs7+VBiLE1jq0elMVBKv6oEb4R63AIp3e03nWkPmGB0qziU8mVVI0uy
	vTo5yvpjjcNzRpC2KLZSbhjmGb2kuZm3KZQ7sjlmpA1jtuwunXEAeEg5ufuUi0BnE4DqEcjNtCD6F
	yCq3vqDG//G/BJFUSD1123DOQglcQ3sv6YxkgWyHjxVUOhqhnL7DS59Uj7s9hnkwkPpMFDUKKP2Hr
	mY6TyIrw==;
Received: from [::1] (port=60000 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1quzu1-00EEcO-2k;
	Mon, 23 Oct 2023 14:43:50 -0400
MIME-Version: 1.0
Date: Mon, 23 Oct 2023 14:43:43 -0400
From: rpjday@crashcourse.ca
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: docs@lists.yoctoproject.org, Marta Rybczynska
 <marta.rybczynska@syslinbit.com>
Subject: Re: [PATCH v3][docs] dev-manual: add security team processes
In-Reply-To: <20231023183323.10676-1-rybczynska@gmail.com>
References: <20231023183323.10676-1-rybczynska@gmail.com>
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <89a6e25a48ec36cfab31f113218efa6f@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Oct 2023 18:44:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4459

On 2023-10-23 14:33, Marta Rybczynska wrote:
... snip ...
> +If you are dealing with a not-yet released or urgent issue, please 
> send a
.. snip ...

   This has the potential to be misinterpreted as a "not-yet urgent"
issue ... I would rewrite as:

"If you are dealing with a not-yet released issue, or an urgent issue, 
..."

rday

