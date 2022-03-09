Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F0EC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 15:57:47 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.1888.1646841466097061333
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 07:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XnsyqLUn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8AFCB240005;
	Wed,  9 Mar 2022 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646841463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gEzu0i1ng/v+4SmBAflAg2Lep5LPyMYEwFXGaG9kVI0=;
	b=XnsyqLUn7zLxkZm75oSu1BWQcPMAOGaGTYfLK2++ONzdoEtyxkiWLbRHj4CsatHj+pU/C7
	8WWB8I+MLsTudDQySWPJOM2QxJkUaWwDPk5qy6LZpNhEydz8/qOPXMGqWe8jFx7oX020F9
	hpTuhKPY74c2poWbjFUgNIASfNz76iqY4bAwLWvCOaJnLIWVbyt3RLfgTsHgDGoOueGlcu
	iqStPeHyindDmWtQLrpCodlJMXgFtd2Rrn+cp3LOv4rW32O8LbMhBse4hT/6HXhkjFOQ2h
	cmrCl0iMUfgiHUIwC14NksCrHsKvyWndn6TXDplZWbfHAsnZPfkOS6gri2pvyA==
Message-ID: <152aa65e-c736-81dd-360d-94877bdfa769@bootlin.com>
Date: Wed, 9 Mar 2022 16:57:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: add instructions for compacting WSLv2
 VHDX files using DiskPart for those systems which lack optimize-vhd
Content-Language: en-US
To: Tony McDowell <svet.am@gmail.com>
References: 
 <CADmuqUfgVBj28RbjVwGGxcT2NnP2k=DxSZ8z6C=miBqtncoN4w@mail.gmail.com>
 <41207cc8-39a1-8257-0193-4fa353a7e662@bootlin.com>
 <CADmuqUf4APus--UcjJPogGcDA3Eru=-Z16c3iO2vOi9Wgw_=Wg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <CADmuqUf4APus--UcjJPogGcDA3Eru=-Z16c3iO2vOi9Wgw_=Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 15:57:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2557

Hi Tony,

On 3/9/22 16:53, Tony McDowell wrote:
>
> Thanks, Michael.  I think the problem is that I created it with
> TortoiseGit on Windows and it didn't capture the proper context of the
> files.  I'll try to fix it today and resubmit.  For the etiquette of
> this mailing list, should that be a new patch email or as a reply on
> this one?


Thanks for asking!
I believe it's best to send the new patch as a reply on this thread, but
this is not a very strict requirement :)

I suggest you to send your patch to yourself first, save the message to
a file, create a new branch from "master" and try to apply your patch
using "git am <file>".
Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


