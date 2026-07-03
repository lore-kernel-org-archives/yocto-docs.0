Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BA9C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:35:42 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94526.1783089334423352770
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 07:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=mt7bPti8;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=icjlcgmDrKyNz7kUm3M/0Nra2vN6yDQZS+eWthd3vk4=; b=mt7bPti8Pm1yY/lv/Pwc0xrrnw
	DuSdL3pG0XvjbpFOQXpPvPMJEbfoX5hyFJjgQjQrrXNLfWqvnkRAaRbq7zCyZDqLbRZZMCAKRA5M+
	5Jw9AKF2HQurkLjOfNTMSfhFShQN4myJodP3Jx+qpW8ZYUa8k69tv8f9FY5MAxbyVedJ0LnWQs5St
	3MjN1NLl5ajjzTT6zOs23YiKGROqGu4+vdbDXmB9A1pyTRoM35dSs2V0PqyxOA42NbpvZp9DwPMNj
	TVb2Po2T7LPoxrQIngmXFXRZ4rxcjzYd9PZURXk9mhGq80PssDesTGwr7BW2UV/EoDBhJo1JIl1gS
	k1gjZ+OA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:48912 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wfezJ-00000007H5C-2ZLK;
	Fri, 03 Jul 2026 10:35:32 -0400
Date: Fri, 3 Jul 2026 10:34:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: antonin.godard@bootlin.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: document variable and task for kernel
 version check
In-Reply-To: <DJOZQ24ZS3L3.BNPZLMDSAVOC@bootlin.com>
Message-ID: <f87fac25-8ce9-0e32-8785-710f630d02a1@crashcourse.ca>
References: <57f7256c-e8b5-c425-0fb8-7699b0cbdb5d@crashcourse.ca> <DJOZQ24ZS3L3.BNPZLMDSAVOC@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 14:35:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10034

On Fri, 3 Jul 2026, Antonin Godard via lists.yoctoproject.org wrote:

> Hi,
>
> On Fri Jul 3, 2026 at 3:25 PM CEST, Robert P. J. Day wrote:
> >
> > Add the associated variable and task for kernel version checking:
> >
> >   - do_kernel_version_sanity_check()
> >   - KERNEL_VERSION_SANITY_SKIP
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> > diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> > index e1db2d5ed..5744d47dc 100644
> > --- a/documentation/ref-manual/tasks.rst
> > +++ b/documentation/ref-manual/tasks.rst
> > @@ -787,6 +787,14 @@ which can then be applied by subsequent tasks such as
> >  :ref:`ref-tasks-patch` and
> >  :ref:`ref-tasks-kernel_configme`.
> >
> > +.. _ref-tasks-kernel_version_sanity_check:
> > +
> > +``do_kernel_version_sanity_check``
> > +----------------------------------
> > +
> > +Validate the version of the kernel
>
> This doesn't explain what this task does.

  Have you *seen* the RE/pattern checking in that task? I'm open to a
meaningful one-line descriptor.

rday

