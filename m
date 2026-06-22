Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6979CDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:00:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38192.1782115242781337552
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ARzRp4xf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2AF221A07AD;
	Mon, 22 Jun 2026 08:00:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3B42601BB;
	Mon, 22 Jun 2026 08:00:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D96B106C8961;
	Mon, 22 Jun 2026 10:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782115240; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hBbrOSZHkBCuhWRbARUV7C07kjCbrJEAv5uRMLWOxi4=;
	b=ARzRp4xffw1BI/J+94J0bnwhv+kydKjkhp/WbyqtDRen4cBcEa3veIckhsoRvd651lTAVb
	9+R3QgpHIHFegjK0mS+LRebYKCpfWFGeHZ4civY+acc6+LdKE3yT35BUGJWGt+py7xSuxA
	DEan5BxtP+MS4ChkRtzQSq9R+UGaLJrRBoGrU7o8uUXTN75ERKqgNudTD0JpMBheHJsuHr
	CXJAOD6gSznp9KbulSIyGkP7sCF5fr9jtMXZ9q1BWZZxQXls0lo84Ocl0GQvzw/s+mdHk/
	czGlSyWUeWvIx5XUpatvkHioy6HiCVnrBOvilR2kMMvuHIOmTZ6bsZCRitmjdQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 10:00:39 +0200
Message-Id: <DJFF4MO9VPEF.1Q1LX7KBQEIU8@bootlin.com>
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Quentin Schulz"
 <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH v2] dev-manual: add second way to assign "PV" for
 external SCM
References: <c3dc6fcf-3e0e-f788-3308-1fac1fc4ea57@crashcourse.ca>
 <cb699e59-1d5a-4e32-9c31-1bae48f660cc@cherry.de>
 <5c45e703-6140-019a-3aff-2b11c3a93b6f@crashcourse.ca>
In-Reply-To: <5c45e703-6140-019a-3aff-2b11c3a93b6f@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:00:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9816

Hi,

On Fri Jun 19, 2026 at 5:56 PM CEST, Robert P. J. Day wrote:
> On Fri, 19 Jun 2026, Quentin Schulz wrote:
>
>> Hi Robert,
>>
>> On 6/16/26 10:32 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>> >
>> > In addition to hard-coding a PV value in the context of an external
>> > SCM, show also just appending the string "+git" to the value already
>> > calculated for PV.
>> >
>> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>> >
>> > ---
>> >
>> > diff --git a/documentation/dev-manual/external-scm.rst
>> > b/documentation/dev-manual/external-scm.rst
>> > index 3ca9079b3..cac23ac1e 100644
>> > --- a/documentation/dev-manual/external-scm.rst
>> > +++ b/documentation/dev-manual/external-scm.rst
>> > @@ -13,9 +13,13 @@ Subversion (SVN) and Git.
>> >
>> >   To enable this behavior, the :term:`PV` of
>> >   the recipe needs to include a ``+`` sign in its assignment.
>> > -Here is an example::
>> > +Here are a couple examples of how this can be done --- the first
>> > +hard-coding the value for ``PV``, the second simply appending
>> > +the string "+git" to the value of ``PV`` already extracted from
>> > +the recipe file name::
>> >
>> >      PV =3D "1.2.3+git"
>> > +   PV .=3D "+git"
>> >
>>
>> This is confusing. Do you mean that
>>
>> PV =3D "1.2.3+git+git"
>>
>> will end up being
>>
>> PV =3D "1.2.3-gbebedada+git"
>> ?
>
>   no, the text mentions that those are a couple possibilities for
> setting that variable -- you'd use one or the other, not both.

I think I see what Quentin is saying, that you can misinterpret this and ad=
d the
two lines to your recipe, while only one of the two is needed.

I think this would clearer if you split the two examples and precede them w=
ith
what they stand for.

Antonin

