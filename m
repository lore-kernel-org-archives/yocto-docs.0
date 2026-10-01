Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA25CA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:20:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9798.1790857224647752380
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 05:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=J5Uk2njm;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=K9ag/ZosqblnLHfrH2UsnaJCnfIjkMqx8VZuERtFlTA=; b=J
	5Uk2njmMIYZbMSybAgwKBv0kWkYx+2DsTiwfCclXb4+vSUx31Mdg2lzYRIEIAxyXIHp5CyzmPI4Lk
	Hb6LvjdqJKCwR4BfuHQmRY3vGVjagRDE47WvOrueB+2olaTYmvQ7lGM40LLkjhH1NfSAbKWmKumED
	+/PpZtT4l0xrxLIGnKeHO3zPC/6Ejru/MfmIz2ZvzjQhN0lZ8KAglMaOX9x88eRPKDTbDxqvJeK/D
	UqOTtE3+Tbr7p9xzHdYaWy1J4E3xrXpLMxjAMiTJ69OT/C+zpdnvL6BTUt1pS9bn1ZCgEjj2ngs1t
	hXDyLOFXTa0RL6Tv+lX8GfA/EWXp32FHw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:40386 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xCFlq-00000002SrO-399X;
	Thu, 01 Oct 2026 08:20:23 -0400
Date: Thu, 1 Oct 2026 08:17:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: yoann.congal@smile.fr
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] where to explain difference between .wks and wks.in
 file?
In-Reply-To: <DLTHQ3IQ5BGF.3NA4QUGWKD6KE@smile.fr>
Message-ID: <b3a6cc9e-4b79-ec9a-d833-c1daf571c1b0@crashcourse.ca>
References: <ca707b47-08aa-4cd4-97aa-070f0d515008@crashcourse.ca> <DLTHQ3IQ5BGF.3NA4QUGWKD6KE@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-471391943-1790857081=:3226761"
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
 <docs@lists.yoctoproject.org>; Thu, 01 Oct 2026 12:20:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10647

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-471391943-1790857081=:3226761
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 1 Oct 2026, Yoann Congal via lists.yoctoproject.org wrote:

> On Thu Oct 1, 2026 at 2:02 PM CEST, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >   it seems there should be at least a paragraph or two explaining the
> > difference between .wks and .wks.in files, but should that go here?
> >
> > https://docs.yoctoproject.org/dev-manual/wic.html
> >
> > or here?
> >
> > https://docs.yoctoproject.org/ref-manual/kickstart.html
> >
> > rday
>
> Hello,
>
> FYI, I reported this recently:
> 16432 – In wic class, the ".wks.in" template feature is not documented
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=16432

  apologies, i should have checked bugzilla first.

rday
--8323329-471391943-1790857081=:3226761--

