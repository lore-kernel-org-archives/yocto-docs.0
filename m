Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA28BC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 14:57:11 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.11027.1741705025000390536
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 07:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iDQYExcO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDBED2047B;
	Tue, 11 Mar 2025 14:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741705023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlGx+nbrD18eyJhW/ZmtCFzKNwftzzwG1cD+8H26M5w=;
	b=iDQYExcOXVMj8KaS83W7wn5Y+G8Mt8C9vq8xRRLgW1UJMTy99bitPqbcGGriDGBZUE7YVR
	fkmmE4INBwEQT6lvAd9atAYDCe0Ph8tGjfFKimgzAl4zBTOO1qlqrMTPnLVyybUuQJwbni
	hOdthK0Lp/9MXpbZblRXMq8ORhEk+fKgx8BgEKXo2fSvYyGuofnuMydLEXDewx3iuE6zve
	5xAR9p8ZSMYxQwIiCWZIXJHvwSFXRw+SwwubbOHfJr1Uj2zIhrX3KOeSQan3a/c7t9Kob8
	xSXt9WYOVXSylsvu+EB4GLnEy8nTAx8Epfskg/XeZgQH2uXH3Wiz0jwvUnkogQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 15:57:02 +0100
Message-Id: <D8DIWHD3OPLN.3HMPHIEEHESMN@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Marta Rybczynska" <rybczynska@gmail.com>
Subject: Re: [docs] [PATCH v2] migration-guides/release-notes-5.2: add known
 issue on stalled NVD
Cc: <docs@lists.yoctoproject.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250311-nvd-stalled-v2-1-fd3825beaf01@bootlin.com>
 <CAApg2=SbxpCqVy29dnC8baTGpU+P-OrKo=-EMrvupdoQk4q8Eg@mail.gmail.com>
In-Reply-To: <CAApg2=SbxpCqVy29dnC8baTGpU+P-OrKo=-EMrvupdoQk4q8Eg@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -106
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddqiedmnecujfgurhepggfgtgffkffhvffuvefofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueffhfeijefgtdefveevteefgefhieejudeggffhleehueeijefgteehkeeltdffnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpkhgvrhhnvghlrdhorhhgpdhnihhsthdrghhovhdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprhihsggtiiihn
 hhskhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 14:57:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6544

Hi Marta,

On Tue Mar 11, 2025 at 3:07 PM CET, Marta Rybczynska wrote:
> On Tue, Mar 11, 2025 at 2:59=E2=80=AFPM Antonin Godard via lists.yoctopro=
ject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>
>> From: Antonin Godard <antonin.godard@bootlin.com>
>>
>> Add an entry to the known issue as the NVD is not up-to-date, the
>> impact on current CVE reports and future plans for the Yocto Project.
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Changes in v2:
>> - Typos and suggestions from Quentin Schulz (thank you!)
>> - Link to v1:
>> https://lore.kernel.org/r/20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin=
.com
>> ---
>>  .../migration-guides/release-notes-5.2.rst      | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/documentation/migration-guides/release-notes-5.2.rst
>> b/documentation/migration-guides/release-notes-5.2.rst
>> index 417b202cd..ca681ce2f 100644
>> --- a/documentation/migration-guides/release-notes-5.2.rst
>> +++ b/documentation/migration-guides/release-notes-5.2.rst
>> @@ -402,6 +402,23 @@ New Features / Enhancements in |yocto-ver|
>>  Known Issues in |yocto-ver|
>>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> +-  The :ref:`ref-classes-cve-check` class is based on the `National
>> +   Vulnerability Database <https://nvd.nist.gov/>`__ (NVD). As some are
>> aware
>> +   of, the NVD database has now been stalling since beginning of 2024 a=
nd
>> CVE
>> +   entries are missing the necessary information (:wikipedia:`CPEs
>> +   <Common_Platform_Enumeration>`) for the :ref:`ref-classes-cve-check`=
 to
>> +   properly account for them. As a result, the current CVE reports may
>> look good
>> +   but the reality is that some vulnerabilities are just not accounted
>> for.
>> +
>> +   The Yocto Project team is working on a solution for the next release
>> (October
>> +   2025). This solution should be based on SPDX version 3, which is
>> already
>> +   implemented in the Yocto Project with the
>> :ref:`ref-classes-create-spdx`
>> +   class.
>> +
>>
>
> I propose to add something about what people _can_ do:
>
> During that time, users may look up the CVE database for entries concerni=
ng
> software
> they use, or follow release notes of such projects closely.
>
> Please note, that the 'cve-check' tool has always been a helper tool, and
> you should
> always review the final result. Results of an automatic scan may not take
> into account
> configuration options, compiler options and other factors.

Thanks, I'll add that to the next version.

>> +   The `CVE Project <https://github.com/CVEProject>`__ has been working
>> on
>> +   catching up with the missing CPEs and is therefore a candidate for
>> being a
>> +   new input for enumerating and classifying CVEs.
>> +
>>
>
> This is not correct. The CVE Programme is NOT catching up with CPEs. They
> have
> added a possibility for CNAs to add it.

Ok, then I propose to just simplify the sentence to:

  The `CVE Project <https://github.com/CVEProject>`__ is a candidate for be=
ing a
  new input for enumerating and classifying CVEs.

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

