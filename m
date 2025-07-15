Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D02C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 09:27:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.4363.1752571645211092966
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 02:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HUwNzv+p;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-ID:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b9itSPrKSy8IiEnws4jb1Eil2GeHAb+PQV+KNmHltc8=; b=HUwNzv+pC0zXKoFEsCMps02uSS
	49Vq/MzDrJb3GaI35xJFADBdEdb+ndlZF8N39VFUkVLmYBWEdKckjNo3wPYqJyHYl1tY83YPHHZ6k
	nwV0sbDbXOnw2qJ97T8AdMtfCqa0iULvwCO5ginzjTgCByIFkj4FB1i07A4iMBPSGMk4AuDPrPiTS
	6t/eepEEsfc1nvaMUR3Po637HMRBfvy49XcIrpBo8rIAznEhhwnLs0N+9Mw9V8QX2eVa0m14qNbU+
	/nDKbSfAjrrcnYFGfYQxjHpwoWUbgh68Mp4EzwJuJCaxH9ZIrf95BOnFlkgdLyLDOTRlCVjpC0Gij
	JR/NZzJw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:59694 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ubbwU-0000000FXyd-0loR;
	Tue, 15 Jul 2025 05:27:23 -0400
Date: Tue, 15 Jul 2025 05:27:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] pedantry: what is the proper descriptor for :append,
 :prepend and :remove
In-Reply-To: <CAMKF1sr=FxYFe93CS33SDGuq2JPreEjA1spXhaPe8ekTc2XUiA@mail.gmail.com>
Message-ID: <fc752a82-1909-3cc4-0745-812ea30a8b76@crashcourse.ca>
References: <3115a61f-25c2-5be5-d221-3b28314f07c1@crashcourse.ca> <CAMKF1sr=FxYFe93CS33SDGuq2JPreEjA1spXhaPe8ekTc2XUiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-721551449-1752571289=:1863765"
Content-ID: <07ba0b1f-841e-e532-61ae-0bc961efa760@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 09:27:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7333

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-721551449-1752571289=:1863765
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <73fdf8bc-263f-db5a-de34-081e4e112a55@crashcourse.ca>

On Mon, 14 Jul 2025, Khem Raj wrote:

> On Mon, Jul 14, 2025 at 9:59 AM Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> >
> >
> >   I ask as I have seen documentation that describes those three things
> > as "overrides", apparently because they appear in the same place as
> > variable overrides, but that seems wildly misleading. It seems that
> > they should more properly be classified as "operators", and if that
> > was the case, I think some documentation could be made clearer by
> > distinguishing between "operators" and "overrides" when you see stuff
> > like:
> >
> >   VAR:append:arm
> >
> > that sort of thing. So what's the proper descriptor for those three
> > things?
>
> variable:operator:override

  actually, i was asking about the proper descriptor for the three
things "append", "prepend" and "remove", but this is making my point
-- those three things are properly described as "operators", as
opposed to "overrides", so one might say that the correct syntax
would be:

  VAR:operator:override(s) = ...

in that order since, as quentin suggests:

  VAR:override:append

is almost always wrong. i remember asking about this distinction a
long time ago, and that distinction is covered in the BB manual:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#examples

but maybe that needs to be extended with this caveat -- that an
"operator" should precede any overrides in almost all cases, as i see
no actual valid use cases for that second, weird form.

rday
--8323329-721551449-1752571289=:1863765--

