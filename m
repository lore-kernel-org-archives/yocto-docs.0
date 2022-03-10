Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42B0C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 07:48:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.6991.1646898527516178041
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 23:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AhJUP/dG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF63DE000C;
	Thu, 10 Mar 2022 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646898525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RI24uNr6bYHyf8J8404dq6p5F0iTFPKvA4DPP8oHYlY=;
	b=AhJUP/dGLN7GRLrS+or2bCEe383qzy5uSK0bysO4e9DAI9CFaRIt9paRItgjMr1m+xXvWJ
	11TTsnkafQhnTixS3gPI49dRl4h7CzwvaP6ZvqQx2H5//r3T8XojKaNU+aUkxDrWmGMxf6
	JpLfqVrHGuBg/CoEi3jrJlYoIFCVqQ8XAIM+/CsFvTQcKKDj4rg2WDuk4HsrGrDTJk4pcM
	fad8+qIsKKVL8AfGYkRhojSQp5NftcuElK5JzTOFBQtjr0I5ReY9jlEi3r+U3TGKoZuX4D
	iNPTiYXDMtUmdaKJyTALwfKEOGNC8/ISPcJq/cOEim1jLJHczIMGo9Jt09tS0w==
Message-ID: <2957fc7e-3ac1-aaab-3e58-d138effc4117@bootlin.com>
Date: Thu, 10 Mar 2022 08:48:44 +0100
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
 <152aa65e-c736-81dd-360d-94877bdfa769@bootlin.com>
 <CADmuqUfyZgc+W-W2-38v1OAkZSa1MoDNNuLczQnGW-DxOBaOjQ@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <CADmuqUfyZgc+W-W2-38v1OAkZSa1MoDNNuLczQnGW-DxOBaOjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Mar 2022 07:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2568

Hi Tony,

On 3/10/22 00:48, Tony McDowell wrote:
> On Wed, Mar 9, 2022 at 8:57 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>> Hi Tony,
>>
>> On 3/9/22 16:53, Tony McDowell wrote:
>>> Thanks, Michael.  I think the problem is that I created it with
>>> TortoiseGit on Windows and it didn't capture the proper context of the
>>> files.  I'll try to fix it today and resubmit.  For the etiquette of
>>> this mailing list, should that be a new patch email or as a reply on
>>> this one?
>>
>> Thanks for asking!
>> I believe it's best to send the new patch as a reply on this thread, but
>> this is not a very strict requirement :)
>>
>> I suggest you to send your patch to yourself first, save the message to
>> a file, create a new branch from "master" and try to apply your patch
>> using "git am <file>".
>> Thanks in advance
>> Michael.
>>
>> --
>> Michael Opdenacker, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
> Hi Michael:
>
> I was able to apply my patch directly against the yocto-docs repo and
> it applied without issue and I saw the change show up in start.rst
> like I expected.  I have attached the .patch file that TortoiseGit
> generated for me if that works more easily for you.

Thanks for this update. I managed to apply the new patch.

I modified it a bit to fix a formatting issue that I had at least with
my version of Sphinx. I also added a Signed-off-by line to the commit,
which is required by the Yocto Project. Don't forget next time.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again. Don't hesitate to send us more improvements!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


