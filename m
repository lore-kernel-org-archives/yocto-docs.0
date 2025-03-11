Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4E6C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:44:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.9456.1741700633642452710
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 06:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K0GvxbPQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52B414428A;
	Tue, 11 Mar 2025 13:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741700631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tN+sGcMRzjGx61NOr5z4CJR3UOg8nWlei5jalM9Gsvo=;
	b=K0GvxbPQLWLRJocemKxSGMsskkS6e2lq2q2P/GYFOMxuuIl2pE52IFpa8MQYbuHg7jMasE
	k6gLzjmy9NsxRDLTsUJm91JjUDPYJyyg7MQb0LMpxnHvZqX7T6/Z95bklnB7yCW0TEtzx+
	iPEJDAj1XyC6QKLzCtZ8IfToSmfOtybXsgdnPBIL5xw5yCT9rZVHPMBIUqpOb3iFbft9yU
	EiCeXyXbZ2xycITBU4T5Vvsw63ux51H4q0JlGNeXuRB4UMR2Q1KoGxCad4mclh36yvVQLT
	Ah5L5HC35W2E1ONiPbrTC7ooWpFWiImVb1Z2CY19SZgKxjNrqmCinmJf3Wii3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 14:43:50 +0100
Message-Id: <D8DHCFXRHX0O.2N6IIENJPP37W@bootlin.com>
Cc: "Ross Burton" <ross.burton@arm.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] migration-guides/release-notes-5.2: add known
 issue on stalled NVD
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com>
 <0d48ca3f-8bb3-4ec7-b431-9cc32fdaa395@cherry.de>
In-Reply-To: <0d48ca3f-8bb3-4ec7-b431-9cc32fdaa395@cherry.de>
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddquddtmdenucfjughrpegggfgtfffkvefhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeivdeivefgveeugfekkeehgedtfefhheejleeuhfdtffeihfejieefieelvedtffenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhnihhsthdrghhovhdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegth
 hgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 13:44:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6541

Hi Quentin,

On Tue Mar 11, 2025 at 1:50 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 3/11/25 11:56 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add an entry to the known issue as the NVD is not up-to-date, the
>> impact on current CVE reports and future plans for the Yocto Project.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/migration-guides/release-notes-5.2.rst | 17 ++++++++++++=
+++++
>>   1 file changed, 17 insertions(+)
>>=20
>> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/docu=
mentation/migration-guides/release-notes-5.2.rst
>> index 417b202cdbb16d1ae6b95d8737b36f76a58cf6ef..eb8011a2797b1d3cc58514ff=
ce01f0c8e7ab6f63 100644
>> --- a/documentation/migration-guides/release-notes-5.2.rst
>> +++ b/documentation/migration-guides/release-notes-5.2.rst
>> @@ -402,6 +402,23 @@ New Features / Enhancements in |yocto-ver|
>>   Known Issues in |yocto-ver|
>>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>  =20
>> +-  The current :ref:`ref-classes-cve-check` class is based on the `Nati=
onal
>
> -current
>
> It's implied since this is a release note for 5.2.
>
>> +   Vulnerability Database <https://nvd.nist.gov/>`__ (NVD). As some are=
 aware
>> +   of, the NVD database has now been stalling for the past year and CVE=
 entries
>
> "for the past year" doesn't mean much when read from the documentation,=
=20
> which can happen years from now. Maybe add some info on that so the=20
> timeline is clear and people can cast doubt on the sentence a few years=
=20
> from now?

Right, that's a good point. I think troubles on the NVD started beginning o=
f
2024, I'll put that instead.

>> +   are missing the necessary information (:wikipedia:`CPEs
>> +   <Common_Platform_Enumeration>`) for the :ref:`ref-classes-cve-check`=
 to
>> +   properly account for them. As a result, the current CVE reports may =
look good
>> +   but the reality is that some vulnerabilities are just not accounted =
for.
>> +
>> +   The Yocto Project team is working on a solution for the next release=
 (October
>> +   2025). This solution should be based on SPDX version 3, which is alr=
eady
>
> Maybe use the release name in addition to the release date?

I think we don't know what the name of the next release is yet?

>> +   implemented in the Yocto Project with the :ref:`ref-classes-create-s=
pdx`
>> +   class.
>> +
>> +   The `CVE Project <https://github.com/CVEProject>`__ has been working=
 on
>> +   catching up with the missing CPEs an so is a candidate for being a n=
ew input
>
> s/an/and/ ?
>
> maybe "and is therefore a candidate" instead?

+1

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

