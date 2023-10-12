Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE89CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 10:47:21 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.8280.1697107640227720896
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 03:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hyKBVmGi;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5KaSAI2tZW3Tic/Dcz5ypnFtE3FjaaOaYhJrmazLyOI=; b=hyKBVmGi2UTsfPZglXHv1J0aN+
	wSSL1fIba3wHoJEM1H4ehndkh964MIwaTgPsIFhaCXAgkwygpVNQFf5jp1oe/ddGH6SMZWJRsFKEO
	OmyMkEOXO1OWixm/L/bz3eWrWNQb+KyH2Sb2JpfNt5lpeCSyhhDepXkeiYPYu2AipPBWtlzXANL+l
	u8tScegx7TCOglNYYiYDsZnlf/60S7h0PvqKG8SOmCmsHxMqYyw6rNcigeMi+OmA3snp5IrmUG/a0
	mPs+B2F8al23K0/XSkK52vb51Eur+8cYnRXNrxTjZnOWRI1zpYO6l0IJsyl/DVeHLHmPuwI1+k8TY
	rVqS7n8w==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:53474 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qqtDo-008xgz-0B;
	Thu, 12 Oct 2023 06:47:18 -0400
Date: Thu, 12 Oct 2023 06:47:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] BSP Guide: intel-quark not in meta-intel anymore,
 intel-skylake-64 is
In-Reply-To: <d39c0048-b1b5-4d3e-9694-a8c02fe27c6a@bootlin.com>
Message-ID: <d3c3d3ff-6dd8-7ed7-585c-e884323283@crashcourse.ca>
References: <e5a575c3-b75c-1289-6380-c5f73c8a154c@crashcourse.ca> <d39c0048-b1b5-4d3e-9694-a8c02fe27c6a@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 12 Oct 2023 10:47:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4359

On Thu, 12 Oct 2023, Michael Opdenacker wrote:

> Hello Robert,
>
> On 12.10.23 at 08:38, Robert P. J. Day wrote:
> >    here:
> >
> > https://docs.yoctoproject.org/bsp-guide/bsp.html#developing-a-board-support-package-bsp
> >
> > the Note refers to (among other core intel BSPs) intel-quark. what is
> > actually in that layer these days is intel-skylake-64, not sure what
> > sort of rewriting that would involve.
>
> Actually, I'd update this note to remove the "edgerouter" machine.

  except that edgerouter is the poky MIPS-based reference machine,
even to this day.

> And why does it mention "meta-ti" as a part of the Yocto Project
> release? I don't see "meta-intel" in recent releases (except maybe
> for Dunfell). Maybe we could just remove the part of this note
> mentioning meta-intel.
>
> Feel free to update this in the patches you are preparing. I could
> do it too.

  you can clean up that bit as you wish, i'll keep working on other
sections.

rday

