Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD19CC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 15:19:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.53141.1747063172896283914
 for <docs@lists.yoctoproject.org>;
 Mon, 12 May 2025 08:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jTGRGd5X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73DDC43A54;
	Mon, 12 May 2025 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747063170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GyMP/bvQebGEnfYi4XcfPc55ApSJY18jFwxv+XrjkEc=;
	b=jTGRGd5XdnjDEvp5zqnKgxWpUlQsySBkTqZqN1MGI4KGjlGMw4P6JjTulpduL6BAvn4JTF
	9yUOMTTeaKYb5Mkwv2uJqpNNmRldc073CgwUNzkrPyWSmin8G4BrkcqJAjC/7TB4ilJoSS
	oW08hdQUUhimJ+kPmF7zLU3JHKwk2X+F+mmYThQrmI0bWiXIuGnFEnfRkCuotjwGN6xo8D
	U4GciAhSmkWKTxVDV3q7Z+auff0wlsxWaInWFugj7kZPFe9QizZBB3Fvxruo3n/xSnst4l
	nnHqsM3ArFu1y3s0dkYb30gWT9VNCA+j3FGc0SbgykLQiHclWf4X1EnuZ+usEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 May 2025 17:19:29 +0200
Message-Id: <D9UA7FZ1WXZ7.392FZOO10PXVZ@bootlin.com>
Subject: Re: [docs] [PATCH] conf.py: tweak SearchLanguage to be
 hyphen-friendly
Cc: <yocto@pengutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <ejo@pengutronix.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250502203501.3364973-1-ejo@pengutronix.de>
 <5484b251-9bd5-4de3-abb0-b3567ffd5631@cherry.de>
In-Reply-To: <5484b251-9bd5-4de3-abb0-b3567ffd5631@cherry.de>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedvueetgeektefgjedthfffhfejudfhtedugeffvdetjeehffeiteduhfehffeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopegvjhhosehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihot
 ghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohephihotghtohesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 May 2025 15:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6809

Hi quentin,

On Mon May 5, 2025 at 11:11 AM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Enrico,
>
> On 5/2/25 10:35 PM, Enrico J=C3=B6rns via lists.yoctoproject.org wrote:
>> This modifies the default indexer split() and js splitQuery()
>> methods to support searching for words with hyphens.
>>=20
>> While this might not be an ideal, rock-solid, or fully future-proof
>> solution, it at least allows searching for strings that include hyphens,
>> such as 'bitbake-layers', 'send-error-report', or 'oe-core'.
>>=20
>> Below is a bit more detailed explanation of the two modifications done:
>>=20
>> 1) The default split regex in the sphinx-doc SearchLanguage class is:
>>=20
>>     | _word_re =3D re.compile(r'\w+')
>>=20
>>     which we simply extend to include hyphens '-'.
>>=20
>>     This will result in a searchindex.js that contains words with hyphen=
s,
>>     too.
>>=20
>> 2) The 'searchtool.js' code notes for its splitQuery() implementation:
>>=20
>>     | /**
>>     |  * Default splitQuery function. Can be overridden in ``sphinx.sear=
ch`` with a
>>     |  * custom function per language.
>>     |  *
>>     |  * The regular expression works by splitting the string on consecu=
tive characters
>>     |  * that are not Unicode letters, numbers, underscores, or emoji ch=
aracters.
>>     |  * This is the same as ``\W+`` in Python, preserving the surrogate=
 pair area.
>>     |  */
>>     | if (typeof splitQuery =3D=3D=3D "undefined") {
>>     |   var splitQuery =3D (query) =3D> query
>>     |       .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}]+/gu)
>>     |       .filter(term =3D> term)  // remove remaining empty strings
>>     | }
>>=20
>>     The hook for this is documented in the sphinx-docs 'SearchLanguage'
>>     class.
>>=20
>>     |    .. attribute:: js_splitter_code
>>     |
>>     |       Return splitter function of JavaScript version.  The functio=
n should be
>>     |       named as ``splitQuery``.  And it should take a string and re=
turn list of
>>     |       strings.
>>     |
>>     |       .. versionadded:: 3.0
>>=20
>>     We use this to define a simplified splitQuery() function with a spli=
t
>>     argument that splits on empty spaces only.
>>=20
>> [YOCTO #14534]
>>=20
>> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
>> ---
>>   documentation/conf.py | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>=20
>> diff --git a/documentation/conf.py b/documentation/conf.py
>> index 2aceeb8e7..02397cd20 100644
>> --- a/documentation/conf.py
>> +++ b/documentation/conf.py
>> @@ -13,6 +13,7 @@
>>   # documentation root, use os.path.abspath to make it absolute, like sh=
own here.
>>   #
>>   import os
>> +import re
>>   import sys
>>   import datetime
>>   try:
>> @@ -173,6 +174,26 @@ latex_elements =3D {
>>       'preamble': '\\usepackage[UTF8]{ctex}\n\\setcounter{tocdepth}{2}',
>>   }
>>  =20
>> +
>> +from sphinx.search import SearchLanguage
>> +from sphinx.search import languages
>> +class DashFriendlySearchLanguage(SearchLanguage):
>
> Could you extend SearchEnglish instead, which is I believe what we=20
> should be using today?

A question on top of this: using SearchLanguage instead of SearchEnglish re=
sults
in _not_ using the stopwords and stemmer code defined in SearchEnglish. Is =
that
intentional? Maybe there is a good reason for not using SearchEnglish, but =
I'm
curious.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

