Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62E8C83F26
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 08:02:03 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.14630.1753430520897748520
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 01:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=FmdoCvCY;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RcaesjyshsXYwYqiJgx/FMRrrhCI/EtD57O/1USeLS0=; b=FmdoCvCYomCvW3KIyqeOVmrGp2
	C2Oc1ZKJSs9hJrO/5+vn1BhBW+kY0uZmcvI0kgTfgZJvwtgXhy0T3PuRhXit13CEo/fCce8Cg625m
	PzwtK/gpd2bqchPJUNAop3futD3nLGl6tb72URWFfEPwHOQbl3Mt6D0IWAwCdeEgwAyn27NgPqSkx
	0CI/BEiyP6S1gElqMVrXdeZqKaGNnVP6CFqPG4gptTtNRCsSN67pCER3HE+fGgXAPRwCTSEod8dqf
	io6oZcfCJ3oiPPqYCdwsAElIOeK4ObOq9NPdczHVTADMQH8GccrB7ZxvVCuRPskg4B9zQrjOLVI+8
	4D/AlLpA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:48096 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ufDNM-0000000HJW7-06hC;
	Fri, 25 Jul 2025 04:01:59 -0400
Date: Fri, 25 Jul 2025 04:01:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] is IMAGE_PKGTYPE of 'tar' even supported anymore?
In-Reply-To: <DBKYL4DQWEE1.LLYBFXF4OB11@bootlin.com>
Message-ID: <31580294-43ae-dcf3-4242-184179876e09@crashcourse.ca>
References: <96c02217-f9fc-488f-d3ee-074fddd87642@crashcourse.ca> <DBKYL4DQWEE1.LLYBFXF4OB11@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Fri, 25 Jul 2025 08:02:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7381

On Fri, 25 Jul 2025, Antonin Godard via lists.yoctoproject.org wrote:

> On Thu Jul 24, 2025 at 10:30 PM CEST, Robert P. J. Day wrote:
> >
> >   docs sort of suggest it, but code sure doesn't seem to support it.
>
> Good catch, it was removed in 2023: 90ce19122802 ("meta/classes-global: remove
> package_tar.bbclass") in OE-Core.
>
> Do you want to work on a patch to remove references to it?

  i'll put something together this weekend.

rday

