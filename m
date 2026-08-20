Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5BAC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 20:46:19 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3380.1787258778253929367
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 13:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ZQ5hxcEe;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nXkz5QkRMvUGCC+tk4J+9MIwzZZ2km0AJMLj8/KU5Vs=; b=ZQ5hxcEeBfXeARgsJWeWPLjn4p
	57HGfgEZ7WJSvdC2TZyhOpmLZlkuAHGCh/EyiwDmunoDHAfqs9iiywLyxTmNxBqwCNMgv7dm+wC2F
	OxUvW4nO2AxvcecMF3PHNSOc9QZ5zXhoQ4dxOqX204DJj6GMDOz/iLRp+fokREeDe33562ovv1aue
	7eUvDSBuxUCRxv6scy/z5smff/A4SKAf8uZ6uDMxYFb51vzKYota41QN6SJeLpl0Wu0kGZeUWsVU6
	i6I1mrCDcu9jKY9ATFspTYHMOMUJczDgdVhVAY1QFN6bnVzlXdVxSKvQJoBAdKGu53vzZlkXE+kKm
	Y3iUbmSA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34876 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wx9eR-00000000nsS-1AWE;
	Thu, 20 Aug 2026 16:46:16 -0400
Date: Thu, 20 Aug 2026 16:44:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: tgamblin@baylibre.com, YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] commands to do "pip install" in docs README file need
 enhancing
In-Reply-To: <7cb4a92a-9eaf-4592-a99d-286d65f76b5c@cherry.de>
Message-ID: <a70897f9-2428-4ca9-1190-5a334c6c0550@crashcourse.ca>
References: <959e65b6-e7eb-bcc3-992f-bed7276c8449@crashcourse.ca> <DKTSXW5WZTQW.383TF2WMPIE77@baylibre.com> <1b02e8ba-0946-40b0-a8e7-a381fd8cb81e@cherry.de> <49274709-3cac-6623-0c3e-7e4b1656e034@crashcourse.ca>
 <7cb4a92a-9eaf-4592-a99d-286d65f76b5c@cherry.de>
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
 <docs@lists.yoctoproject.org>; Thu, 20 Aug 2026 20:46:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10307

On Thu, 20 Aug 2026, Quentin Schulz wrote:

>
>
> On 8/20/26 4:58 PM, Robert P. J. Day wrote:

... snip ...
> > need installation to run the executable commands sphinx-lint and vale
> > are the packages with the same names, and they are special cases since
> > their purpose is to supply those commands, so the simple solution is
> > to install using "pipx", which is designed precisely for that purpose.
> >
> >    one can install pipx with pip, then follow that with:
> >
> >    $ pipx install sphinx-lint
> >    $ pipx install vale
> >
> > and it all now works just fine on debian 13. maybe down the road get
>
> Does it? I tried from within a container. First it tells me the path
> pipx installed to isn't in PATH so it won't be available. Then it
> tells me to run pipx ensurepath, which I do, and it then asks me to
> logoff or source ~/.bashrc. Only then do i have sphinx-lint. What a
> pain.

  FWIW, here's why this just worked for me. on debian 13,
/etc/skel/.profile contains:

  # set PATH so it includes user's private bin if it exists
  if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
  fi

well, it just so happens that, for whatever reason, on my debian 13
system, i have that directory so that it's automatically added to my
search PATH upon login, which is exactly where pipx installs commands
like "vale" and "sphinx-lint", so stuff like that just worked for me
the instant i installed those two packages with pipx.

rday

