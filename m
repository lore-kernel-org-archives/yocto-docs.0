Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC4FD6ACD2
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 13:37:30 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.71774.1732714646020575214
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 05:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PR8+Y+kj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E57E3E0006;
	Wed, 27 Nov 2024 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732714644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiXqfAH2pkbzidcaG7VQIjiVfufcughI5vRPcWu9+LI=;
	b=PR8+Y+kjygw/uUvc3hLpqbbD0XGhs9gQb/ITM1XQIG4dTZMmwS/AHyW1Xj5lHUpkiJ/1bw
	OU4202KqH+Uqy/UjPAr0sNF0Ds6VjujTvYe88XB9tRSRrxOm+k/0DAUeNB/YVZ+UAVw3kQ
	DwNDGgWFih0u/R/Hct9CuyKvDsDDDwqZgJhLJ069f9Haa8juWu47jwEICQS1tsMZxc4DuO
	3McpWmIS/GsvZj70wPbPFCXtkkerbcjtZXrww6Xx1qdl3tQNMhL4nFFfbnQM58Ner1SKFm
	34wekFRVSf8fCabkqgtpnJTivHCT2nZSY1VeXLXHCytnNgpqTwU8klZuTW6T5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 14:37:23 +0100
Message-Id: <D5X02UDHCLWS.1H3RX1HY2T7UP@bootlin.com>
Subject: Re: [docs] [yocto-docs][PATCH v3] ref-manual: classes: fix
 bin_package description
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241127-fix-bin-package-v3-1-ee09055000ac@bootlin.com>
 <0b545655-dfc0-449b-8cdb-5712a0715f87@cherry.de>
In-Reply-To: <0b545655-dfc0-449b-8cdb-5712a0715f87@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 13:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5830

Hi Quentin,

On Wed Nov 27, 2024 at 1:36 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
> On 11/27/24 12:36 PM, Antonin Godard wrote:
>> The previous bin_package description was confusing: it would instruct to
>> use the git fetcher to extract the content of an RPM package using the
>> `subpath` option - but that's not possible as the git fetcher can be
>> used to clone a repository but not to do the extraction.
>>=20
>> Update the description by telling what it really does and what it
>> doesn't do, and by giving an HTTPS+RPM example.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Changes in v3:
>> - Actually explain what bin_package does and what it doesn't do.
>> - Link to v2: https://lore.kernel.org/r/20241120-fix-bin-package-v2-1-91=
7a5c2745d2@bootlin.com
>>=20
>> Changes in v2:
>> - Instead of updating the example, update the description of the class
>>    with a more common (and working) example usage of the class.
>> - Link to v1: https://lore.kernel.org/r/20241118-fix-bin-package-v1-1-90=
6f0148fdaa@bootlin.com
>> ---
>>   documentation/ref-manual/classes.rst | 42 +++++++++++++++++++++-------=
--------
>>   1 file changed, 25 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-ma=
nual/classes.rst
>> index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..ff9979d1f1ac0afb0ee59fcd=
193dec2c1323e1fe 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -159,27 +159,35 @@ software that includes bash-completion data.
>>   ``bin_package``
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  =20
>> -The :ref:`ref-classes-bin-package` class is a helper class for recipes =
that extract the
>> -contents of a binary package (e.g. an RPM) and install those contents
>> -rather than building the binary from source. The binary package is
>> -extracted and new packages in the configured output package format are
>> -created. Extraction and installation of proprietary binaries is a good
>> -example use for this class.
>> +The :ref:`ref-classes-bin-package` class is a helper class for recipes =
that
>
> Would put a comma after recipes so people don't think it's for recipes=20
> that extract the contents[...] but rather that the class does it for the=
=20
> recipes inheriting it.

+1

>> +disables the :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` ta=
sks and
>> +copies the content of the :term:`S` directory into the :term:`D` direct=
ory. This
>> +is useful for installing binary packages (e.g. RPM packages) by passing=
 the
>> +package in the :term:`SRC_URI` variable and inheriting this class.
>>  =20
>
> I would also provide tarballs as another example of "binary packages",=20
> not sure how to word this though.

I'll add another example afterwards.

>> -.. note::
>> +For RPMs and other packages that do not contain a subdirectory, you sho=
uld set
>> +the :term:`SRC_URI` option ``subdir`` to :term:`BP` so that the content=
s are
>> +extracted to the directory expected by the default value of :term:`S`. =
For
>> +example::
>> +
>> +   SRC_URI =3D "https://example.com/downloads/somepackage.rpm;subdir=3D=
${BP}"
>>  =20
>> -   For RPMs and other packages that do not contain a subdirectory, you
>> -   should specify an appropriate fetcher parameter to point to the
>> -   subdirectory. For example, if BitBake is using the Git fetcher (``gi=
t://``),
>> -   the "subpath" parameter limits the checkout to a specific subpath
>> -   of the tree. Here is an example where ``${BP}`` is used so that the =
files
>> -   are extracted into the subdirectory expected by the default value of
>> -   :term:`S`::
>> +This class assumes that the content of :term:`S` already contains the
>
> """
> This class assumes that the content of the package as installed in=20
> :term:`S` mirrors the expected layout once installed on the target,=20
> which is generally[...]
> """
>
> ?

I agree, better wording

>> +installation paths on the target , which is generally the case for bina=
ry
>
> Spurious whitespace before comma.

+1

>> +packages. For example, a RPM package containing a library should alread=
y contain
>
> s/a RPM/an RPM/
>
> s/containing a library/for a library/ # to avoid redundant "contain" verb
>
> s/should already contain/would usually contain/

+1

>> +the ``usr/lib`` directories, and should be extracted as
>
> s/as/to/?

+1

>> +``${S}/usr/lib/<library>.so`` to be installed in :term:`D` correctly.
>> +
>
> It'd be nice to encourage people to use versioned shared libraries even=
=20
> for binary packages but not sure how to word this here.

Replace by ``${S}/usr/lib/<library>.<version>.so``? and implicitly encourag=
e it.
Not sure this is the place to give written advice on that.

>> +.. note::
>>  =20
>> -      SRC_URI =3D "git://example.com/downloads/somepackage.rpm;branch=
=3Dmain;subpath=3D${BP}"
>> +   The extraction of the package passed in :term:`SRC_URI` is not handl=
ed by the
>> +   :ref:`ref-classes-bin-package` class, and is done by the appropriate
>> +   :ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetc=
hers>`
>> +   depending on the nature of the package.
>
> What do you mean by "depending on the nature of the package"?

I meant the type, like RPM, tarball, deb=E2=80=A6 I can replace by "type", =
and add a
"(RPM, Deb, tarball, =E2=80=A6)" in parenthesis afterwards.

>>  =20
>> -   See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetc=
hers`" section in the BitBake User Manual for
>> -   more information on supported BitBake Fetchers.
>> +   See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetc=
hers`"
>> +   section in the BitBake User Manual for more information about suppor=
ted
>> +   BitBake Fetchers.
>>  =20
>
> I'm not entirely sure this is relevant here? Or maybe we should update=20
> the BitBake docs to reflect which fetcher is extracting=20
> packages/tarballs with which option?

Since I mentioned the fetchers above I thought it would be nice to keep, bu=
t the
link is already present in the sentence above so I'll remove this paragraph=
.

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

