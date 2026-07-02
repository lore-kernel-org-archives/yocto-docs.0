Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D161AC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 08:41:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65019.1782981679875879372
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 01:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ehKufL4y;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kpC3m3yZwoR5Ttp2gjW0rQeRfcOA2wVk2VIYvL4G5Hc=; b=ehKufL4yIe+2yxWq5mDcQ19JZh
	JuOWXAmn1AkEDplmM9o4mrbPnY3LZcXcGkNq9B7pb5zmLZNmNi0ZM0ZYEqlwJRhRUW+J+6Djstjsq
	a0h0fR2TZEYFPNcRX+WfKHoIxsXv4+H/NxXPR4oo7AcujFWQMw+XhKLlAgWcxRr2h6sB9Q+mAxfhD
	PiuDHTRBPUibM4pSTQviCcU0NQ0rv2Ivhj2F/PwONomBrXX1rzMB5DBDzMK1UstUNkPYwn/YymIGU
	g3vKcfwvg3DDmd97C782uZCnmpdLr/htDIwqkx8grTveRI2I+L7Qn0Jmsb0ZdLijSjo3Knct+3Eeg
	w+cTqvpA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:45210 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wfCyz-00000003r9x-08j7;
	Thu, 02 Jul 2026 04:41:18 -0400
Date: Thu, 2 Jul 2026 04:40:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref_manual: add "fragments" and "templates"
 directories to structure
In-Reply-To: <DJNWW8OYSBHM.O3F4TCBX4XW1@bootlin.com>
Message-ID: <ec23fe13-95b2-fe47-9c94-8915341232e4@crashcourse.ca>
References: <21c2164f-ac8d-256d-f8ef-c15336fbba3e@crashcourse.ca> <DJHZHPQ4OTHU.G3OFW0N2RNNB@bootlin.com> <DJNWW8OYSBHM.O3F4TCBX4XW1@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 02 Jul 2026 08:41:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9996

On Thu, 2 Jul 2026, Antonin Godard wrote:

> Hi,
>
>
> On Thu Jun 25, 2026 at 10:23 AM CEST, Antonin Godard wrote:
> > Hi,
> >
> > On Tue Jun 23, 2026 at 7:43 PM CEST, Robert P. J. Day wrote:
> >>
> >> Add two new entries for the meta/conf/{fragments,templates}
> >> directories to the structure of OE-Core metadata.
>
> Will you follow-up on this patch?

  sorry, was there a request for a fix? not sure what you're asking
for here.

rday

