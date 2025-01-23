Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4278C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:48:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.13446.1737647294419433989
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 07:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iV3b3WF2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6852C0002;
	Thu, 23 Jan 2025 15:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737647292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EP51dSo5ERkMG93mYmGqU/XCsa/GXx22WNQ+6r0MILI=;
	b=iV3b3WF2/ZzAXRwUBMmq+Ph6FD0jGqTLVFQbofuTYSo9v5grr/Cmty0aae8a1aCGvhQDJU
	Mh713+QKP7icIs8+mceffGa2jiJ0vyja/dfIWbEKtzTiW9LsHozLJqnknScqDmghRAcPmz
	COkSD9S4Wx67ywv5bk82dEqb8qzXYm1LLuqHT2cVADYtnALh8/71eJ++FJpqBw9/pV8oJQ
	F5TgTIK9aeZuCS7VPYBcCOug6tOIY6Nf6ID5ewgys+4I09QS055jYKMK1Sri5TKjim6Ikm
	8y3/Sk48OlVpfo43RIzeA9PCZfqgl4rpWTtu7DRzwxrkr0fURFl5hOsy6w7d4Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jan 2025 16:48:11 +0100
Message-Id: <D79KK1LIPW2L.1Y2PXKCE1J1KZ@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [yocto-docs][PATCH] test-manual/ptest: link to common framework
 ptest classes
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250117-ptest-common-classes-v1-1-043c7fd46da5@bootlin.com>
 <d8c1900c-d1a7-43a4-829e-b660ca5999fd@cherry.de>
In-Reply-To: <d8c1900c-d1a7-43a4-829e-b660ca5999fd@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jan 2025 15:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6163

Hi Quentin,

On Thu Jan 23, 2025 at 3:18 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 1/17/25 3:19 PM, Antonin Godard wrote:
>> We document how to add ptest support for a recipe by inheriting the
>> ptest class. We may as well tell the user to inherit a ptest class for a
>> common framework which does most of the job for you.
>>=20
>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/test-manual/ptest.rst | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>=20
>> diff --git a/documentation/test-manual/ptest.rst b/documentation/test-ma=
nual/ptest.rst
>> index dea1bad23bd98817a2020030efdad7ce4e4b36c0..d5a0d007ac118ced77c06b14=
1d4e681f81e60cd2 100644
>> --- a/documentation/test-manual/ptest.rst
>> +++ b/documentation/test-manual/ptest.rst
>> @@ -61,6 +61,19 @@ test. Here is what you have to do for each recipe:
>>  =20
>>         inherit ptest
>>  =20
>> +   .. note::
>> +
>> +      Existing class for common frameworks already exist in
>
> s/Existing class/Classes/
>
>> +      :oe_git:`openembedded-core </openembedded-core>`, such as:
>
> A bit of an odd choice to link to the git repo here? Don't we want=20
> :term:`OpenEmbedded-Core (OE-Core)` instead? or at least point to=20
> meta/classes-recipe/ directory?

Didn't think of using the :term: here, will change.

>> +
>> +      -  :oe_git:`meta/classes-recipe/go-ptest </openembedded-core/tree=
/meta/classes-recipe/go-ptest.bbclass>`
>> +      -  :oe_git:`meta/classes-recipe/ptest-cargo </openembedded-core/t=
ree/meta/classes-recipe/ptest-cargo.bbclass>`
>> +      -  :oe_git:`meta/classes-recipe/ptest-perl </openembedded-core/tr=
ee/meta/classes-recipe/ptest-perl.bbclass>`
>> +      -  :oe_git:`meta/classes-recipe/ptest-python-pytest </openembedde=
d-core/tree/meta/classes-recipe/ptest-python-pytest.bbclass>`
>> +
>
> Now to come to think of it... Maybe all of this would be more=20
> straightforward if we added sections in ref-manual/classes.rst for each=
=20
> special ptest class? Then we just have to point at those via the usual=20
> mechanism of :ref:`ref-classes-<>`? We could also explain a few=20
> class-specific variables, like PTEST_PYTEST_DIR, GOPTESTBUILDFLAGS,=20
> GOPTESTFLAGS (though those two are in go.bbclass for some reason),=20
> RUST_TEST_ARGS, CARGO_TEST_BINARIES_FILES to only name those.
> If you prefer to stay with the links for now, I would recommend to only=
=20
> keep the name of the class as that's what will matter to the user (to=20
> pass it to "inherit" directive).

Having some doc for each class would be sweet, I agree. It's a bit more wor=
k, so
we can delay that for later. Having links is a first step.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

