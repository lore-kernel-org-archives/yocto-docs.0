Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.527.1794325857563758623
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 07:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b9a3mmh8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D10F04E4079B;
	Tue, 10 Nov 2026 15:50:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DDA060012;
	Tue, 10 Nov 2026 15:50:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59E21103293FE;
	Tue, 10 Nov 2026 16:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794325854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PISZqAC2ZgsrYsAr1Pex+JPdfV+fGlDmtGFQvyf+iBc=;
	b=b9a3mmh80PgmUfkUlFcv0o4Qq4Nqm3m8qnrsdZ/nDJI9ZZr4Xqq7FWmrjiAWBaoc/4dorr
	vZSAe9UkEA8WLYE4KzAiT4p7L0QR2jEV89nF2UE9eobxFkgTliU26ks53BjcMjrgEGLXB1
	G8A9UCLrk+EeoL+tINXCPEYUSo6a9StNUQKUUOeiSr3PjnczYY3eeJOS8UN91uJDdNgira
	t/NsSpZjzAEIpUnr0C+wxeI8Ew9/bpLfFpUxAwyTlrhjPsszpodIEd9lyFCMdpt97UL7SX
	4z6c+y3P/qQyFJseeFbULFnce3C1On/o7Sw3IivgkCCxB0bznZPRJiFPQxPnrA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 16:50:52 +0100
Message-Id: <DMRNFH1B8TSL.2TXTSH83P6NY3@bootlin.com>
Subject: Re: [docs] i don't see my Oct 1 patch to add Wic as a term
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <84f94b21-5909-704a-b3c6-52b474ff3ff7@crashcourse.ca>
 <DMRJOCCCGZT1.1FM0B0CTP4902@bootlin.com>
 <e059bd28-c55d-2e0b-ad19-b2a13c1df4e6@crashcourse.ca>
In-Reply-To: <e059bd28-c55d-2e0b-ad19-b2a13c1df4e6@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 10 Nov 2026 15:51:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10788

On Tue Nov 10, 2026 at 2:09 PM CET, Robert P. J. Day wrote:
> On Tue, 10 Nov 2026, Antonin Godard wrote:
>
>> On Tue Nov 10, 2026 at 11:44 AM CET, Robert P. J. Day wrote:
>> >
>> >   several weeks ago, i submitted a patch to add the "Wic" term to the
>> > ref manual list of terms, and it was signed off:
>> >
>> >   commit 05c97b48227f0e50d008d078b224aa537c06aada
>> >   Author: Robert P. J. Day <rpjday@crashcourse.ca>
>> >   Date:   Thu Oct 1 06:51:58 2026 -0400
>> >
>> >     ref-manual: add a terms entry for Wic
>> >
>> >     Add a short entry for Wic to the reference manual in order to late=
r
>> >     refer to it from other places in the docs.
>> >
>> >     Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>> >     Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> >
>> > but i just checked and don't see it in the official docs (should be
>> > right after "Upstream")
>> >
>> > https://docs.yoctoproject.org/ref-manual/terms.html#term-Upstream
>> >
>> >   i can see that commit in the master branch. am i missing something?
>>
>> This patch was not backported to Blacksail as I didn't think there was a=
 strong
>> need for a backport here.
>>
>> You can see the term on the dev version here:
>> https://docs.yoctoproject.org/dev/ref-manual/terms.html#term-Wic
>>
>> This will display on the default page when Garburn releases.
>
>   ah, got it, i've been out of touch for a few weeks, trying to get
> back into it.  this brings me to my next question -- the whole point
> of adding that Wic term entry was to allow references to "Wic" from
> elsewhere; for example, here:
>
> https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-IMAGE_BO=
OT_FILES
>
> where you can see, in the first sentence, an obvious candidate for a
> term link:
>
> "A space-separated list of files installed into the boot partition
> when preparing an image using the Wic tool ..."
>                                   ^^^
>
> but once you do that, is it standard practice to introduce the same
> reference *everywhere* in that same section (where "Wic" occurs a
> couple more times)? or is adding the reference only the first time
> in a single section considered sufficient?

I'm pretty sure this is not followed everywhere, and even I sometimes fail =
to
do so, but we try to reference every occurrence of a word with its correspo=
nding
term when possible. However I feel it might be a little too much sometimes
(twice in the same sentence, for example).

So, up-to-you, you can replace every occurrence mechanically and we can tak=
e a
look, but you can also remove excessive replacements, if you have some time=
.

Thanks,
Antonin
