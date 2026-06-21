Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FBECD98F0
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 17:48:34 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27847.1782064112504221173
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Jun 2026 10:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=EqNkpNRQ;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/2saxvAaI/llm7CtTGzEABZD0EMHk2msNHsbvnjw17M=; b=EqNkpNRQC6X/8dJqFOT0TlORL7
	e1AKEEh/Mpbc69SrUzXeNg5ji45EyonyktIHrNZpclPc/wupZUSaEB8jTwJK5tIWisDAMdD4TwRrI
	pPtX0HDzZDJN1YJVT2owuB8tz0XBOLO0tBuXRexMVcIIHM36I0u6JIgNGdswGc29O946n6xbnKYBY
	4NpcmNBdeNEOg1orN3Ae618oyDzYu9/LOjGB9mwpigXaXLcOLAF2OsWMZ6RJrMdVp2BIgrfpaRZur
	SUD5Fsszcz8Ok2NIW93WcelMCablFauu2NPXXB9WThpZ8T91zB7yOZzwEoVkfxFhUphriP3TvGPim
	98oYXvYQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:50120 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbMHU-00000008QTz-1pkO
	for docs@lists.yoctoproject.org;
	Sun, 21 Jun 2026 13:48:30 -0400
Date: Sun, 21 Jun 2026 13:48:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] ubuntu/debian alleged doc-building packages seems
 inaccurate
In-Reply-To: <18BA98A920CBE661.717820@lists.yoctoproject.org>
Message-ID: <b63fa0d9-162b-fbce-8c47-52540ed6ff94@crashcourse.ca>
References: <18BA98A920CBE661.717820@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Sun, 21 Jun 2026 17:48:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9813

On Fri, 19 Jun 2026, Robert P. J. Day wrote:

>
> here:
>
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian
>
> we are told:
>
>   Here are the packages needed to build Project documentation manuals:
>
>   sudo apt install git librsvg2-bin locales make python3-saneyaml
>     python3-pip python3-venv
>
> i've been building HTML docs all this time on my debian 13 system,
> without:
>
>   - python3-pip
>   - python3-saneyaml
>   - python3-venv
>
> also (as should be obvious), i refuse to install python3 packages
> via "pip", choosing instead to install then as debian python3-*
> packages. so far, it's working out fine.

  after a few minutes of research, here are my observations on what
packages are required to build docs on my debian 13 (and, no, i'm not
sure about any underlying subtleties so i'm not submitting a patch).

  first, so far, i have avoided the use of "pip" entirely, preferring
instead to install python3-* packages. from what i read, the preferred
approach is to install debian packages globally, while preferring to
use "pip3" exclusively inside a venv environment. i'm not going to
comment on that either way, just saying that i've managed to avoid
even *installing* python3-pip3 on this debian 13 system.

  as for packages i don't seem to need, as above:

  - python3-pip
  - python3-saneyaml
  - python3-venv

also, installing the debian package python3-sphinxcontrib.svg2pdfconverter
already pulls in the dependency librsvg2-bin, so that does not need to
be listed explicitly.

  finally, i have not installed python3-websockets, and i can build
the HTML docs just fine.

  if someone wants to do anything with any of that, have at it.

rday

