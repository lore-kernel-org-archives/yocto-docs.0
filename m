Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E169BCC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 14:06:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40607.1792073210331676218
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 07:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=R70VU18k;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 02FB14E4125D;
	Thu, 15 Oct 2026 14:06:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A42360360;
	Thu, 15 Oct 2026 14:06:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4EEA10328189;
	Thu, 15 Oct 2026 16:06:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792073202; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=68rIlw0FmgbF+gW4nBvQotyTapE4iZ4V2oXqhLtIpds=;
	b=R70VU18kqi++4oPb7XBFgsAQZIYTq+uSFlAl3VrdlePgC5N6jBEINyqeHLf+wh7PWy5oES
	2BkejZvsra0ebjP5UYUy8/t2TN2ofxGnuF/QWxHVB9/sflB/DZccUAVEprM1FWIC17NLtP
	raf9MPw+TG7xzvQh+G+WsAyJTrdl9MC/jBtWEr+x7X5/7oOOaiqrmmUU8d/29E8TbCTM54
	BhqbsTr725Qk5UJkzwKml5YEYbgTsjZcFBmSQudzqpFHJY5e3LT6RR1iFNUzmUxtKH2Uf+
	YcTLB7LCZ25ckBPGZ0coeY630Cup0C68+ULwLAHrl6Z079PoPyu6seGcPrkXUg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 16:06:40 +0200
Message-Id: <DM5GXJ5UBL8U.17J94SLMCN9QJ@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] ref-manual: add a terms entry for Wic
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
References: <37230285-e554-fadb-1b33-b5748362f710@crashcourse.ca>
 <DM5BMT79952L.281463MGN52YL@bootlin.com>
 <a7c0aa1c-cdee-526f-3636-823444bb876d@crashcourse.ca>
In-Reply-To: <a7c0aa1c-cdee-526f-3636-823444bb876d@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 14:06:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10683

On Thu Oct 15, 2026 at 3:11 PM CEST, Robert P. J. Day wrote:
> On Thu, 15 Oct 2026, Antonin Godard via lists.yoctoproject.org wrote:
>
>> Hi,
>>
>> On Thu Oct 1, 2026 at 12:51 PM CEST, Robert P. J. Day wrote:
>> >
>> > Add a short entry for Wic to the reference manual in order to later
>> > refer to it from other places in the docs.
>> >
>> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
>> Looks good, thanks! Could you follow-up with a patch that replaces
>> wic occurrences in the docs by this term?
>
>   did you want to apply that patch as is and let me add all the
> references to the new term as a followup, or did you want me to amend
> that patch with the references? i would prefer you add that patch, and
> i can leisurely peruse the docs to add the references later.

This patch will be applied independently from your follow-ups making the
replacements. You can base off your work on your patch locally without amen=
ding.

Thank you,
Antonin

