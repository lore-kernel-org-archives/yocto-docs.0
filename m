Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B50C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 16:23:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.10731.1634919785838942058
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 09:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 51186E0009;
	Fri, 22 Oct 2021 16:23:02 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RFC 1/1] Start of documentation standards document
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20211008185850.1032542-1-michael.opdenacker@bootlin.com>
 <20211008185850.1032542-2-michael.opdenacker@bootlin.com>
 <20211011132004.n7cwcmzuc2qaqvzs@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ad09d687-4114-450d-0a84-ed2744384793@bootlin.com>
Date: Fri, 22 Oct 2021 18:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011132004.n7cwcmzuc2qaqvzs@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 16:23:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2043

Hi Quentin,

Many thanks for the review and the fixes!
I took all your suggestions. Let me just comment the open questions.

On 10/11/21 3:20 PM, Quentin Schulz wrote:
>
>> +The "GNOME HIG Colors" palette is used for our graphics
>> +(get it from <https://urldefense.proofpoint.com/v2/url?u=https-3A__gitlab.gnome.org_Teams_Design_HIG-2Dapp-2Dicons_-2D_blob_master_GNOME-2520HIG.gpl&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QF3FZ993w-Eq44rMQY6KNn14ixpGQT25sTiSTI-PGOPWUDrRFhSlyigzrwqiikfb&s=6cYqH1OYrt_hp21c09Bm4naMFbxGx6VNLQ24IwHZ8H8&e= >
>> +if you don't have it in your installation of Inkscape)
>> +
> "if you don't get it from Inkscape" ?
>
> In any case, missing a point at the end of the sentence.


I'll let you check the update I'm sending soon.

> While we're at the moment we pick color palettes, are we sure this one
> is ok for colorblind people?


Oops, that's a serious concern. This prompted me to read
https://www.smashingmagazine.com/2016/06/improving-color-accessibility-for-color-blind-users/

Perhaps we should state that graphical items shouldn't be differentiated
by color only. They should also use a different shape, pattern or
different text. We could also make it mandatory to write text in black
or white with sufficient contrast with the background.

In particular, using "red" or "green" should be the only way to
differentiate between correct and incorrect. Additional shapes (such as
STOP and OK signs) and text should explicit the difference.

What do you think?

> I would even go as far as to say the source of the clipart should be
> given in the commit log so that we can check ourselves?


Makes sense. I added this.

>
> Thanks for starting this Michael, long overdue :)
>
> I shall dig into my mail archives to add the rST rules we came up with
> some months ago :)


I'm definitely interested in these rules.
Many thanks,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


