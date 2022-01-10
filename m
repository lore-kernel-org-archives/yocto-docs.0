Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1B9C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 11:58:50 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.30583.1641815928057950921
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 03:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1n6tK1-0002Wq-KV; Mon, 10 Jan 2022 12:58:45 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1n6tK0-00DJ3w-FK; Mon, 10 Jan 2022 12:58:44 +0100
References: <16C812800894D4AC.11018@lists.yoctoproject.org>
 <20220107190840.784216-1-michael.opdenacker@bootlin.com>
 <6rbl0kjd8a.fsf@pengutronix.de>
 <d0c7cd99-2d79-b109-eb72-f119283832f8@bootlin.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH V3] overview-manual: document hash equivalence
Date: Mon, 10 Jan 2022 12:25:31 +0100
In-reply-to: <d0c7cd99-2d79-b109-eb72-f119283832f8@bootlin.com>
Message-ID: <6rv8yriyyz.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Jan 2022 11:58:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2363

Hi Michael,

On Mon, Jan 10 2022 at 11:49 +0100, Michael Opdenacker <michael.opdenacker@=
bootlin.com> wrote:
> Hi Ulrich,
>
> Many thanks for the review!
>
> On 1/10/22 7:29 AM, Ulrich =C3=96lmann wrote:
>> Hi Michael,
>>
>> a good summary of hash equivalence! Perhaps you could add somewhere that
>> reproducibility is a key ingredient for the stability of the task's
>> output hash, hence the whole mechanism's efficiency strongly depends on
>> reproducibility.
>
>
> This is a very good idea indeed. I will add this.
>
>>
>>>
>>> +Hash Equivalence
>>> +----------------
>>> +
>>> +The above section explained how BitBake skips the execution of tasks
>>> +which output can already be found in the Shared State cache.
>> s/which/whose/
>
>
> I thought that "whose" was only meant to refer to living things. Would
> you have a rule supporting what you're proposing?

It simply felt wrong to me, as there is no expression of possession. But
I am not 100% sure as I am no native speaker. The only thing that I
could come up with after searching the web is [1]. Alternatively, what
do you think of the following replacement

  s/which output/the output of which/ ?

[1] https://www.englishgrammar.org/relative-pronouns-3/

>>> +
>>> +Now, imagine that a Shared State task is modified because of a change =
in
>>> +its code or metadata, or because of a change in its dependencies.
>>> +Since this modifies its task hash, this task will need re-executing.
>> s/re-executing/re-execution/
>
>
> I used "needed re-executing" as in "this wall needs painting", using
> "need" plus a gerund to express a passive meaning. This doesn't sound
> wrong to me...

Ah, okay, I read it as an infinitive - now I understand, and your
version is correct, of course.

Best regards
Ulrich


>> s/Share State cache/Shared State cache/
>
>
> Oops, fixed, thanks!
> Thanks again
> Michael.
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

