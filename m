Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1ABCC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 13:35:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.13349.1743687311821320448
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Apr 2025 06:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=By4qy9zx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBF06440D9;
	Thu,  3 Apr 2025 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743687309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AI32muVpgbFeFo+STlEHLzAmHcZss2VDxZ4bNywiX10=;
	b=By4qy9zx6Aq9uprIo07bTXG4hMiZqtEt5X+sLzIJ+yC5DJRW6UOHJQB9yVcsjx2CEcKi0t
	npuvG7fDxCMOvfgBo1obHF3PCuoskQF5OU1LDFPjfjB2XjHiJNtqmQXXpbx3A4BZgLkAos
	6unKlfqGjvpNtlOmgs+rZ5sOLZP9Qw6QIGYZwX/TqNXSQKp+8guSbHDqgMM8b1s/ujnu6v
	gOFWgbFHxZBrsEbtY9XMRS6nfxrcLvoLmQ5KuXpNFZHDp7K9LUdk52Ir4OhzQURzXG8baN
	T/FBeHt287GYcHqgEPn6e2oW0S5Oc9lprPwGxPmOLoWWTLBePgL9Dq1aDgIA3g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Apr 2025 15:35:08 +0200
Message-Id: <D8X1KB5HUHY2.2BK1EOCQ3NDUZ@bootlin.com>
Subject: Re: [docs] [PATCH v2 01/12] ref-manual/classes.rst: document the
 ptest-python-pytest class and variables
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <antonin.godard@bootlin.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com> <20250325-release-note-5-2-updates-v2-1-19f050d61da3@bootlin.com> <d4c01a9b-fdb1-4f83-8ff1-1ac55f0db1fd@cherry.de>
In-Reply-To: <d4c01a9b-fdb1-4f83-8ff1-1ac55f0db1fd@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeehuddtieeigfdtudffhfeukefgffeigfejueeufedvgfefffekhedvfeevgfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhphihtvghsthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopegrnhhtohhnihhnrdhgo
 hgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 13:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6703

Hi Quentin,

On Fri Mar 28, 2025 at 2:58 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 3/25/25 10:20 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add documentation for the ptest-python-pytest class, and the
>> PTEST_PYTEST_DIR variable which can be overriden.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/classes.rst   | 15 +++++++++++++++
>>   documentation/ref-manual/variables.rst | 10 ++++++++++
>>   2 files changed, 25 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-ma=
nual/classes.rst
>> index 6797927fe..8b930fe3d 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -2707,6 +2707,21 @@ For information on setting up and running ptests,=
 see the
>>   ":ref:`test-manual/ptest:testing packages with ptest`"
>>   section in the Yocto Project Development Tasks Manual.
>>  =20
>> +.. _ref-classes-ptest-python-pytest:
>> +
>> +``ptest-python-pytest``
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The :ref:`ref-classes-ptest-python-pytest` class can be used in Python-=
based
>
> s/used/inherited/ ?
>
>> +recipes to automatically configure the :ref:`ref-classes-ptest` class f=
or Python
>> +packages leveraging the `pytest <https://docs.pytest.org/>`__ unit test=
 framework.
>> +
>> +Within the recipe, the :term:`PTEST_PYTEST_DIR` variable can be overrid=
den to
>> +specify the path to the directory containing the tests (default value:
>> +``tests``). Test contained in this directory are installed in :term:`D`=
 by the
>
> """
> Within the recipe, the :term:`PTEST_PYTEST_DIR` variable specifies the=20
> path to the directory containing the tests that will be installed in=20
> :term:`D` by the [...].
> """
>
> 1) Try to avoid having a default in multiple locations in the docs, so=20
> we only need to change it in one place if it ever changes.

Right, I'll remove the default value, thanks.

> 2) No need to say overridden, it's a variable, it's implied it can be=20
> overridden.

True, in this context, you can override it after inheriting the class. Some
variables are harder to override when they are assigned with the =3D operat=
or,
especially for global classes.

Usually, I consider the ones assigned with ?=3D to be the "overrideable" on=
es. But
it's true that in this case, it's not super relevant.

>
>> +:ref:`ref-tasks-install_ptest_base` task, as well as a specific ``run-p=
test``
>> +script for this task.
>> +
>>   .. _ref-classes-python3-dir:
>>  =20
>>   ``python3-dir``
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index 41bda5d0d..8e0833bff 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -7110,6 +7110,16 @@ system and gives an overview of their function an=
d contents.
>>         at build time should be done by adding "ptest" to (or removing i=
t
>>         from) :term:`DISTRO_FEATURES`.
>>  =20
>> +   :term:`PTEST_PYTEST_DIR`
>> +      Within the :ref:`ref-classes-ptest-python-pytest` class, the
>> +      :term:`PTEST_PYTEST_DIR` variable represents the path within the =
source
>> +      tree of a Python package holding the unit tests to be tested with=
 the
>
> s/tested/run/ ?

Indeed!

> Looks good otherwise.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

