Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AD9CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:40:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45457.1781883617390282242
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 08:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=G+IJjJgH;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UlHLTcwDR5B/L/xF0AhoTMuXLj8gLOj8zUT3SxxbWf8=; b=G+IJjJgHY+3R6Wo/ArSvkW/7hK
	ZJkSFWyRs0zN9s01oYtk3Rq13Z9n5zuPj+3DgJL/rm4i9xRvVtmxDAnhvJUqD7yx5iYWrkdqjOEEs
	JCkYwjyCnEIOxmC5CXYeRBcHBTGLcq/uYUtk6PXxWO04N95B7OfTYekLm1pe/BWHFVKa46GjtfFIc
	bRDzdf95FI3BZzaTov6WmbOUGMW8SdEKk+iQD6ycocgb3ItstDaI1VFLoskb7JJfVJ4LbWlg3Aj7k
	Wh/yLws0LcpaPnwICZKpwSNgOFvWVYSFG9QETKIFZfJH/cB6Imo4d2+3pnle7FE8RwQjQowzRr4Hw
	bHfND2Tg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:42058 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wabKJ-000000037pr-0h2l;
	Fri, 19 Jun 2026 11:40:15 -0400
Date: Fri, 19 Jun 2026 11:40:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual: Emphasize that use of Subversion is
 uncommon
In-Reply-To: <b6b3b322-cbdc-4518-96a6-3fa76aa20fdf@cherry.de>
Message-ID: <bde614c9-c55a-8293-555d-06fb938ed664@crashcourse.ca>
References: <4e4b3cbb-27ed-e6b9-7369-2f190cf3969f@crashcourse.ca> <b6b3b322-cbdc-4518-96a6-3fa76aa20fdf@cherry.de>
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
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 15:40:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9802

On Fri, 19 Jun 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/11/26 11:57 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > At the moment, there does not appear to be a single use of Subversion
> > in numerous OE layers, so mention that it is effectively deprecated as
> > an SCM even though it is still supported.
> >
>
> Why? How is this helpful to the reader?

  i think i already told antonin to toss this patch. if not, then i'm
telling him now. :-)

rday

