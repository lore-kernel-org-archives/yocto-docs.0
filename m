Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D62AD1D47A
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 15:23:23 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8789.1767885800761810595
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 07:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=CybB/cT4;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AHCt7b3kgD8ffV4GakFVdzC7Bgtb7VBb21+4OQB7PAg=; b=CybB/cT4u3rd09kbvi+v/BAglb
	3PcHMcVT2dwc1sey/8VFTTLn3vlIL+qN3V3qbRXibnHOiAhKIb/PLmOQCvdSimUlVst5jC7HHSpNp
	F8RrhS6Yt8vcFZ5hak+cEO6rlKlM/Sbh2qVe3qSIxqUsDIL3Xx0sAUM3B+kL4lvg2U30KSpXwsmnj
	059/ueUeLzBlGdJBTtkzsB8yGAh9pgSRGK+UH5mhItK22ZFC91HFelJeHcA+fXZESbYu2+jFhj+xn
	pk8cZ/dKsfMOKs3cZnlt3EFwCb6ekIVupb6wm35oEUekYUZzNEEUG3H9SUPPSheIOVHMoZ3issvAR
	+zVuRrJw==;
Received: from [147.129.179.166] (port=34184 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdrr4-00000001sv9-2t1v
	for docs@lists.yoctoproject.org;
	Thu, 08 Jan 2026 10:23:19 -0500
Date: Thu, 8 Jan 2026 10:26:16 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: how to properly render option double dashes without monospaced
 font?
Message-ID: <3a81c9ef-61a4-7ceb-5eed-55d3b1637c2d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 15:23:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8425


  more nitpickitude ... here:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-tasks-against-a-set-of-recipe-files

it's hard to tell that there are double dashes in "--buildfile" since
it's in the regular font. however, it seems that they will be rendered
more clearly if one uses "\-\-buildfile". i'm going to submit a patch
to clean up a couple minor things in chapter 1, is it appropriate to
add that change as well?  (and anywhere else similar?)

rday

