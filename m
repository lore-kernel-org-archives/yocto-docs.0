Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77354C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 07:31:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.5454.1667892697267105533
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 23:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jI3OeGXo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D7865C0009;
	Tue,  8 Nov 2022 07:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667892695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HejMKl5nqw/BD1xbepLP8OIVKLac75ZSr4DIJMHWT6w=;
	b=jI3OeGXoH2yX7PBP4Fdweh9ZibYAFI7pMf8+bkS6naDiKfGKxSpuZvenhFqK2cdC/L92Ci
	9U26Rp0kldQLfzqPy1UxAX2d46JXyjYts5LuVLL7UjwGhou9hPOnaArm8h8V1/mMHxzpA4
	XtfvIBHIN92szldks3W3r+oa2rLdKC7Gsh3CMSGrohnJ6sWoHzWkj4F0tMjXNR6A5bcl4c
	neNjfFwKbMiISb8fJDkukxrFr+IgrcGoJvvjKYXSTuTpszn3C854LJQEoo5Z5LOEaTC7M5
	GbrTXJuKX1fJNUwB4qU5YqmXSlSGR3czaYfsHlfZ2wYdADkoVIx/vbCGnpYFhw==
Message-ID: <8a14e2ce-2719-52ae-0259-f280da69f6c8@bootlin.com>
Date: Tue, 8 Nov 2022 08:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [yocto-announce] [ANNOUNCEMENT] Yocto Project 4.0.5 is Released
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <DM5PR1101MB23614EEED79BF6514F03E1B2B93F9@DM5PR1101MB2361.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <DM5PR1101MB23614EEED79BF6514F03E1B2B93F9@DM5PR1101MB2361.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 07:31:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3465

Hi Chee Yang

On 11/8/22 02:47, Lee Chee Yang wrote:
>
> Hi
>
> We are pleased to announce the Yocto Project 4.0.5 Release is now 
> available for download.
>
> http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/poky-2e79b199114b25d81bfaa029ccfb17676946d20d.tar.bz2
>
> http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/poky-2e79b199114b25d81bfaa029ccfb17676946d20d.tar.bz2
>
> A gpg signed version of these release notes is available at:
>
> http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/RELEASENOTES
>
> Full Test Report:
>
> http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/testreport.txt
>
> Thank you for everyone's contributions to this release.
>
> Chee Yang
>
> chee.yang.lee@intel.com
>
> Yocto Project Build and Release
>

Many thanks for the release update!
Would you have the release notes in rst format as well?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


