Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37136CD6E79
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:44:53 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8645.1780667086878835014
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Z0XaWra3;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UJ3JTMXwLcges0BujzJXQEzxSVw1ClTHScwh+x3ab80=; b=Z0XaWra3lIska9OW94Kquc3Rp9
	9jMYeBb/4rZj8htJwkJXU6BCm5AAfcm0DiSrdgSd/3W7viFKyg2E/VAnwv6pBtXcvG5N77y1vrA1s
	7uCxo274t4A+f9kPiup59Yjw1EQZGmEpKOPOcgpjLGGo2iJucu5Wun5/C/CHRwIHwYSNjmMC3Oo34
	pJQmpKP9tYSDoqHbqdRIxCQJaJxwVw+y/dllNvc3UEF8Fo6JtEf893E3onn574wVrIglCxoGy04YC
	xpPqwdROCcU/5vad6Yq+GR1/mAk12jzePokMuupT2XTUFFUNBDeq9mqgXUDwE5GiYzOKOBu/EeXN2
	XbtMAyMw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53866 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVUqp-0000000DmoD-2RGC;
	Fri, 05 Jun 2026 09:44:45 -0400
Date: Fri, 5 Jun 2026 09:44:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] overview-manual: update deploy.bbclass snippet
In-Reply-To: <DJ15P69LMOKY.3RPJL80QFHAE3@bootlin.com>
Message-ID: <757e54a3-9b7f-a383-a771-f5687ee01cc7@crashcourse.ca>
References: <bb559e86-8f2b-03cf-cd87-4992e9f38a7a@crashcourse.ca> <DJ15P69LMOKY.3RPJL80QFHAE3@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:44:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9604

On Fri, 5 Jun 2026, Antonin Godard wrote:

> Hi,
>
> On Thu Jun 4, 2026 at 7:11 PM CEST, Robert P. J. Day wrote:
> >
> > The current contents of deploy.bbclass is slightly different so update
> > the code snippet.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> > index 76ace6fcf..fb9a56607 100644
> > --- a/documentation/overview-manual/concepts.rst
> > +++ b/documentation/overview-manual/concepts.rst
> > @@ -1776,7 +1776,8 @@ adding shared state wrapping to a task is as simple as this
> >         sstate_setscene(d)
> >     }
> >     addtask do_deploy_setscene
> > -   do_deploy[dirs] = "${DEPLOYDIR} ${B}"
> > +   do_deploy[dirs] = "${B}"
> > +   do_deploy[cleandirs] = "${DEPLOYDIR}"
> >     do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"
> >
> >  The following list explains the previous example:
>
> But you also need to update the bullet point covering this line below this snippet.

  argh, you're right, of course. will submit v2 later.

rday

