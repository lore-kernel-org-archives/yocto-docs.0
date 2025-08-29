Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC055C8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 07:37:09 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.8216.1756453020373890459
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 00:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=h243iUL+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D84E4C8EC77;
	Fri, 29 Aug 2025 07:36:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B6E3606B9;
	Fri, 29 Aug 2025 07:36:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 539BF1C22D47B;
	Fri, 29 Aug 2025 09:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756453017; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rPms/fEwWjOgfiUtBhYAUbFVlcgYhWWwYkwuXtRaCKA=;
	b=h243iUL+pZDpPnczSjETamIQDHzUnoGg27oq++qtDs4a1uoPzX06rvUf5hlL8yZGgPRFsU
	2EEAN59/+dHUq3F4ZRdjDp5qCLLgh+2ZlUn5dGD9Y8HwoHdZJc1pHMSxOJyXyKsWzRlvbH
	bae7Oi5Eju/qSeK9ROKRJHXZNt1w8qzweE4/vilkVaiS2viceMlRSvn4VMG/oceplt1N02
	xEPN1VNdFre53v4SDNefpy2GXNsVpqGVSZV8xeGKlfN6DDUgCPmfcxkYMwFgBqIpGh5NTg
	8nGP+wup0nfZhwh4yGb9qBmEwQtJcN4ZRZWFZe8UmRUdiWkPBExHC0AVBeIV8w==
Message-ID: <e8d962a1-5b99-4ea4-83db-2a19acd1fd31@bootlin.com>
Date: Fri, 29 Aug 2025 09:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs][PATCH] ref-manual/variables.rst: expand
 IMAGE_OVERHEAD_FACTOR glossary entry
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com
References: <20250819160431.382820-1-joaomarcos.costa@bootlin.com>
 <a106fc65-b72d-4701-b1f7-917dbfe5bfc6@cherry.de>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <a106fc65-b72d-4701-b1f7-917dbfe5bfc6@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:37:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7464

Hello, Quentin

On 8/22/25 16:32, Quentin Schulz wrote:
> Hi Joao,
>=20
> On 8/19/25 6:04 PM, Joao Marcos Costa via lists.yoctoproject.org wrote:
>> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>>
>> There's a (second) overhead factor applied in images generated with Wi=
c,
>> and this is already documented in the .wks reference. However, the
>> IMAGE_OVERHEAD_FACTOR entry does not mention it, and by looking at the
>> partition sizes (e.g. with parted) one may find it confusing that they
>> don't match with the expected rootfs size (e.g. in a scenario where th=
e
>> extra space is "0" and IMAGE_OVERHEAD_FACTOR=3D"1.0").
>>
>> This second overhead is already documented, though:
>> https://docs.yoctoproject.org/ref-manual/kickstart.html#command-part-o=
r-partition
>>
>> Mention the '--overhead-factor' option in the glossary entry and add a
>> reference to the wks documentation.
>>
>=20
> I'm wondering if this isn't rather a bug than a feature?
>=20
> Why would we need to have two overhead factors?
>=20
> Also, I'm wondering if this isn't a case of:
> - IMAGE_OVERHEAD_FACTOR for setting an overhead factor for the filesyst=
em
> - --overhead-factor for setting an overhead factor for the partition
>=20
> In which case you would have a filesystem which doesn't take the whole=20
> partition. I assume if you have systemd-growfs/systemd-repart it'll tak=
e=20
> the whole partition at first boot?

Even though I like the idea of having a partition size coherent with=20
what was defined by those IMAGE_* variables, I wouldn't say this is a=20
bug. I see it rather as undocumented behavior, hence this patch.

> Both would have a valid use-case. I imagine that it'd be perfectly fine=
=20
> to have an overhead-factor of 0 for a filesystem that already has an=20
> overhead (e.g. for journaling).
A "no overhead" would actually be "1.0" (since this is a multiplier),=20
not "0.0", right?

>=20
>> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>> ---
>> =C2=A0 documentation/ref-manual/variables.rst | 5 +++++
>> =C2=A0 1 file changed, 5 insertions(+)
>>
>> diff --git a/documentation/ref-manual/variables.rst=20
>> b/documentation/ref-manual/variables.rst
>> index d559899c6..c18bc7ba4 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -4166,6 +4166,11 @@ system and gives an overview of their function=20
>> and contents.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 added to the image by using=
 the :term:`IMAGE_ROOTFS_EXTRA_SPACE`
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variable.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 When using Wic tool, beware that a sec=
ond overhead factor is=20
>> also applied.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This overhead's value is defined by th=
e ``--overhead-factor``=20
>> option, and
>=20
> Gut feeling says we shouldn't us "'s" here.

Not sure if I got your point here. Is there any link between the "'s"=20
and the possible misinterpretation?

>=20
> How this sentence is worded could be interpreted like so:
>=20
> "I do not put --overhead-factor so there is no overhead factor"
>=20
> whereas what actually happens is that the default is 30% if this=20
> argument is missing.

I'm not sure about the likelihood of this (mistaken) conclusion, since I=20
refer to it as "a second overhead factor is also applied" rather than=20
"may/could be applied". Maybe replacing "defined" by something more=20
bullet-proof? I'm open to suggestions.

>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not by :term:`IMAGE_OVERHEAD_FACTOR`. =
See the
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ":doc:`/ref-manual/kickstart`" chapter=
 for details.
>=20
> Maybe we could point at the section (command: part or partition) since=20
> that parameter only applies to that?

Agreed.

> Cheers,
> Quentin

Thanks for the review.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

