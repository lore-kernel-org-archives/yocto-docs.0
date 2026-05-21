Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98884CD5BAF
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 15:16:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39073.1779376580624209835
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 08:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=f6BpcvMk;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=03TZaUrYmxv+qltMc0sWxc8wTMnRc15ohUxx5cHkzA4=; b=f6BpcvMk0AlWx2YWVwjOWKTxaj
	1o447oae3Yl2+Z2LRxoXdXmOiEhsJj3/Zodp0kJR/H2zooIUF1kZgOYv248ntW6kSv78k729CyYzB
	/KLwHJMnuhNUDNepPloMnMyUdD76TOqyQIJW3Kjlt0iMKwYLkbF0vGhJVKR8UllfgAkeyIfpDEIHI
	v+A/ReCiZwIbvSGEpZTorkEbmAMezboVJKpODsXdDmF94r/MHL/j8NNuFaEmHYB75tiZYTIyUH9g6
	SdIuBiQkdIUt1gAUWJRS6Gmp4LSLV59YH5cFWBFw+F6/63oofzAD9bqdLPn14HEV11XLBZSlg5s7I
	K2nUk3zg==;
Received: from [147.129.179.166] (port=41828 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wQ58D-00000002vW7-38Qa;
	Thu, 21 May 2026 11:16:19 -0400
Date: Thu, 21 May 2026 11:19:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
cc: docs@lists.yoctoproject.org
Subject: Re: [docs] I am confused by the combination of using "?=" and an
 override
In-Reply-To: <90821be7-12b0-4cb1-a2d8-dfef836abd5e@kernel.crashing.org>
Message-ID: <71fa0de1-28ee-4cf7-a8f5-c4d12a664911@crashcourse.ca>
References: <18fea83f-44b6-2034-cb65-93044c010c14@crashcourse.ca> <90821be7-12b0-4cb1-a2d8-dfef836abd5e@kernel.crashing.org>
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
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 15:16:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9519

On Thu, 21 May 2026, Mark Hatle wrote:

>
>
> On 5/21/26 9:40 AM, Robert P. J. Day wrote:
> >
> >    I may have totally misunderstood something basic all this time, but
> > this seems like something that needs a clearer explanation if it's not
> > explained forcefully.
> >
> >    In a current build, I set a debugging variable thusly in my
> > local.conf:
> >
> >    ST_OPTEE_CORE_DEBUG = "y"
> >
> > assuming that any ST-layer processing would honour the fact that I
> > explicitly gave it a value. However, when I checked the eventual
> > value:
> >
> > $ bitbake-getvar -r optee-os-stm32mp ST_OPTEE_CORE_DEBUG
> > #
> > # $ST_OPTEE_CORE_DEBUG [3 operations]
> > #   set /home/rpjday/BOARDS/nexus/wrynose/build/conf/local.conf:14
> > #     "y"
> > #   set
> > /home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:37
> > #     [_defaultval] "y"
> > #   override[stm32mp15common]:set?
> > /home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:38
> > #     "n"
> > # pre-expansion value:
> > #   "n"
> > ST_OPTEE_CORE_DEBUG="n"
> >
> >
> >    Huh? That output clearly shows that I set the value first, but it
> > was set back based on these two lines in that file:
> >
> > ST_OPTEE_CORE_DEBUG ??= "y"
> > ST_OPTEE_CORE_DEBUG:stm32mp15common ?= "n"
>
> The above is saying that the _override_ value:
>
> ST_OPTEE_CORE_DEBUG:stm32mp15common is set to "n" if not otherwise set.
>
> The override (stm32mp15common) is always processed separately after the
> override value itself is established.
>
> > Apparently, even though I set the variable myself, that override
> > assignment was setting it back to "n" -- not what I expected even
> > though that override was in effect.
> >
> >    On a hunch, I used this assignment instead:
> >
> > ST_OPTEE_CORE_DEBUG:stm32mp15common = "y"
>
>
> So if you do:
>
> MY_VAR ?? = "y"
> MY_VAR:MY_OVERRIDE ?= "n"
>
> The system will process it as:
>
> MY_VAR = "y"
> MY_VAR:MY_OVERRIDE = "n"
>
> <process overrides>
>
> MY_VAR = "n"
>
>
> So then if the user sets:
>
> MY_VAR = "1"
>
> same sort of behavior:
>
> MY_VAR = "1"
> MY_VAR:MY_OVERRIDE = "n"
>
> <process overrides>
>
> MY_VAR = "n"
>
>
> So in order to affect the variable MY_VAR:MY_OVERRIDE, you need to
> specifically set that.
>
> This is the reason your change above worked.
>
> > and it worked:
> >
> > # $ST_OPTEE_CORE_DEBUG [3 operations]
> > #   set
> > /home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:37
> > #     [_defaultval] "y"
> > #   override[stm32mp15common]:set
> > /home/rpjday/BOARDS/nexus/wrynose/build/conf/local.conf:13
> > #     "y"
> > #   override[stm32mp15common]:set?
> > /home/rpjday/Layers/wrynose/st/meta-st-stm32mp/recipes-security/optee/optee-os-stm32mp-common.inc:38
> > #     "n"
> > # pre-expansion value:
> > #   "y"
> > ST_OPTEE_CORE_DEBUG="y"
> >
> >
> > That is *not* what I expected -- I thought that once I assigned a
> > value to that variable, no combination of "?=" or "??=" assignments
> > could affect it, but apparently I was wrong.
>
> You have to remember override variables are themselves variables.  Overrides
> are processed _AFTER_ all of the values are established.
>
> >    Is this the expected behaviour? Because it caught me by surprise,
> > and if this is the way it works, it definitely needs to be documented.
>
> Yes, this is expected behavior.

  Thanks, I knew most of that, I just never ran into precisely
this situation. I will be far more careful about this in the future.

rday

