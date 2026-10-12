Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0292BCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13163.1791811249370348145
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Oct 2026 06:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rjq6XfHX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 49B124E411F8
	for <docs@lists.yoctoproject.org>; Mon, 12 Oct 2026 13:20:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 112BD601A6;
	Mon, 12 Oct 2026 13:20:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9307711D70D17;
	Mon, 12 Oct 2026 15:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791811246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1qiWD6y/x7+Z92OG8wbyh3a1Z5LG7JNGdl/UUC7yXKc=;
	b=rjq6XfHXXCIslUicm8UUzTs1c5sJ0vDhn4IK1PIlL9A0tuMHvsyWgnR/yVaM1J7U7ryx17
	h1DKoNwqiY5j727+V43xn7zb2ZSDg3jSh/yXEKmPXhsZQcHWMnJYAq8cQuKGctdzvzyeiG
	LK6nHkJtoXfE7KsS3L2g7gocZJkS52nU4vBHR0rRu6CuU28QSXzLDJ70XFDBZMGLop2FmL
	uUfsLmiN03AoruN2RdVbtTa95SB36I/GmTejezr4/1vKSpE7YGOehaH5g5p/p5pnsscTaq
	0KPLPG8uns0cDb0bOax8N0SA+fBMMXe5lKuYNaMTyCxbC3Wz1Gr1pUaJZNLkOw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 15:20:45 +0200
Message-Id: <DM2W2QFSWNBT.2A6RT11K7VMT1@bootlin.com>
Subject: Re: [bitbake-devel] [PATCH] doc: document dependency tracking
 associated with addpylib
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <yann.dirson@vates.tech>, <bitbake-devel@lists.openembedded.org>
References: <1791793541.8631fc262581453bbf619ec5b2062170.1a12f37b16e00080d7@vates.tech> <DM2VSZ91PNOJ.YXQAWC84B6NR@bootlin.com>
In-Reply-To: <DM2VSZ91PNOJ.YXQAWC84B6NR@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Oct 2026 13:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10659

On Mon Oct 12, 2026 at 3:08 PM CEST, Antonin Godard via lists.openembedded.=
org wrote:
> Hi,
>
> On Mon Oct 12, 2026 at 10:25 AM CEST, Yann Dirson via lists.openembedded.=
org wrote:
>> Reported-by: Claude Opus 5.5
>> Signed-off-by: Yann Dirson <yann.dirson@vates.tech>
>> ---
>>  doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/=
doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
>> index 621aab253..eef1f9624 100644
>> --- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
>> +++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
>> @@ -2264,6 +2264,14 @@ The specified <namespace> is imported automatical=
ly, and if the imported
>>  module specifies an attribute named ``BBIMPORTS``, that list of
>>  sub-modules is iterated and imported too.
>> =20
>> +Additionally, Bitbake will detect usage of functions from such a
>> +library and include them in task hashes, so changes in those functions
>> +trigger task rebuilds.  Note that only functions inside modules
>> +declared using ``BBIMPORTS`` benefit from this dependency tracking,
>> +any name defined directly in the specified namespace (e.g. in
>> +`<namespace>/__init__.py`, or in a library hat would be defined as
>
> s/hat/that/
>
>> +`<namespace>.py`) would *not* benefit from this tracking.
>
> Otherwise, this is clear to me. I did not know about this limitation/feat=
ure,
> and this is definitely important to document, thanks!

Reading the code[1], it seems that functions prefixed with _ are not includ=
ed
in the task checksums - if I understood correctly. I think it would be also
important to mention that. Could you add it in a v2?

[1]: https://git.openembedded.org/bitbake/tree/lib/bb/parse/ast.py#n319

Antonin

