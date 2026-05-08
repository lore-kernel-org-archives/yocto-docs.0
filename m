Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC01CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 19:17:48 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2220.1778267860701567631
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 12:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=CBL7kJDm;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CS+OLBXP7YDeud2Hmz9ZlKjXqDpPCLua8UfmJE0A7Hg=; b=CBL7kJDmodoPnsOcfCWsdd54et
	6E82z2QRP5kV/JV/nbgssKL9uv2e9+zY884F1Z7Z8h3Ht2Iuf3beVqQLjo3u+LDey0SgzqpFx2pvm
	ritCT+zWGY7mkt047yz9AJhfYbzIUPDVEIw9yGtewbMFK71iHm2RUXmenhQswuylGzlBwqqiMTmJg
	Fiuv3tXIBENmsqlo+fMLDKodZ8tVWcChNke399Ryg/sqBPw36rdHkShawMY/fyH7Xr3l1wm7jH9gM
	exDh3qvOMMnZCd/xieoI2LuVtfcyH6jjB465c1n28ylI/LDUt9hwARDYnhIhLTicaycsqqcg71bBI
	Ee0Ni7uw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34506 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wLQhe-00000004P55-0hvF;
	Fri, 08 May 2026 15:17:39 -0400
Date: Fri, 8 May 2026 15:20:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: alex.kanavin@gmail.com
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Quick Build using word "naive" sounds a bit
 condescending
In-Reply-To: <CANNYZj8TrFArNqiE2uTowv5RvnourbGoweJ_ySDXmjFKsx=P2w@mail.gmail.com>
Message-ID: <103d2b47-6ff4-a22b-5117-59bea7b84383@crashcourse.ca>
References: <e9ecc3f8-c93c-caf1-eb73-de73633cda10@crashcourse.ca> <CANNYZj8TrFArNqiE2uTowv5RvnourbGoweJ_ySDXmjFKsx=P2w@mail.gmail.com>
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
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 19:17:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9421

On Fri, 8 May 2026, Alexander Kanavin via lists.yoctoproject.org wrote:

> On Fri, 8 May 2026 at 20:37, Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> >
> >
> > https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html
> >
> > "If you are not in an interactive shell, dpkg-reconfigure will not
> > work as expected. To add the locale you will need to edit
> > /etc/locale.gen file to add/uncomment the en_US.UTF-8 locale. A naive
> >                                                                 ^^^^^
> > way to do this as root is:"
> >
> >   Can we not find a slightly less patronizing word? What is this
> > trying to say?
>
> TBH, I would remove both notes, they just seem outdated and not helpful.
>
> This whole Debian-specific section is also duplicated in the
> reference manual, so the quickstart should simply defer to that:
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host

  So what's the easiest solution? It seems like almost the first two
sections of the Quick Build guide could be replaced by a pointer to
the reference manual, per your suggestion.

rday

