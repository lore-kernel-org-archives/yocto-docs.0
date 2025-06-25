Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FECC7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 07:23:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.9715.1750836222535767234
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 00:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wywgkm9Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77E3E44397;
	Wed, 25 Jun 2025 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750836220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xlm3MN1rpe1RThdWccjs0hbsbBiTO8Tpfw9EvJ4liXQ=;
	b=Wywgkm9Y0BK9dAsRuUkK6sgVMzpCPXmdU18609tBI8qLrLkar6B9OZ2L4nfRe9QFY65fWP
	kOEo6xCDWdfCa55jq+TehUiNqwFL4uj6UuhTOTclkJ5hX7TAhEunhnePUWvCnHOnOvcbMc
	Y96mx3tBvj1GR7veSdoBy4oPeZA950P53Tmj/5i4bR+vR+X41wsHXaYg8aTYAN8p3/pZQc
	BQsqZhYpAZ3gSkbpBf1LMcC8k/czrGZO6/4bkm5GQigK3A0q190WMUGXEB9hBoOe2enq7O
	5F9mjE+iGRL4YQ1IflD1xBaQVCYD8PrRHBllZ/PrXSzGWlYCKKOkv7utq7smtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 09:23:40 +0200
Message-Id: <DAVFN3QK4XD4.161B45BALGWA3@bootlin.com>
Subject: Re: [docs] [PATCH] Add a document on limiting host resources
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20250624-resource-limiting-v1-1-f8f5edbdaf03@bootlin.com>
 <f1e26a85-18d6-4eb5-86d8-e94bec5e89fb@cherry.de>
In-Reply-To: <f1e26a85-18d6-4eb5-86d8-e94bec5e89fb@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejveegueeuhfekudduueektdejtdeluefhtedvjedtffehueeiuefhtdegtefggfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdiishhtugdrohhpvghnpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhop
 eguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Jun 2025 07:23:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7220

On Tue Jun 24, 2025 at 5:25 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 6/24/25 4:42 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add a "Limiting the Host Resources Usage" document to share the
>> different techniques that can be used to limit the host resources usage.
>> We do have a document to document how to speed up a build, so this
>> document comes right after.
>>=20
>> [YOCTO #15111]
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/dev-manual/index.rst              |  1 +
>>   documentation/dev-manual/limiting-resources.rst | 85 +++++++++++++++++=
++++++++
>>   2 files changed, 86 insertions(+)
>>=20
>> diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manu=
al/index.rst
>> index 63736e0ab..4abfa59e9 100644
>> --- a/documentation/dev-manual/index.rst
>> +++ b/documentation/dev-manual/index.rst
>> @@ -22,6 +22,7 @@ Yocto Project Development Tasks Manual
>>      building
>>      multiconfig
>>      speeding-up-build
>> +   limiting-resources
>>      libraries
>>      prebuilt-libraries
>>      devtool
>> diff --git a/documentation/dev-manual/limiting-resources.rst b/documenta=
tion/dev-manual/limiting-resources.rst
>> new file mode 100644
>> index 000000000..df8208bdc
>> --- /dev/null
>> +++ b/documentation/dev-manual/limiting-resources.rst
>> @@ -0,0 +1,85 @@
>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>> +
>> +Limiting the Host Resources Usage
>> +*********************************
>> +
>> +While you sometimes need to :doc:`speed up a build
>> +</dev-manual/speeding-up-build>`, you may also need to limit the resour=
ces used
>> +by the :term:`OpenEmbedded Build System`, especially on shared infrastr=
uctures
>> +where multiple users start heavy-load builds.
>> +
>
> We could also say "or building on low-power machines".
>
>> +This document aims at giving the different configuration variables avai=
lable to
>> +limit the resources used by the build system. These variables should be=
 set from
>> +a :term:`configuration file` and thus take effect over the entire build=
 environment.
>> +For each variable, also see the variable description in the glossary fo=
r more
>> +details.
>> +
>> +-  :term:`BB_NUMBER_THREADS`:
>> +
>> +   This sets a hard limit on the number of threads :term:`BitBake` can =
run at the
>> +   same time. Lowering this value will set a limit to the number of> + =
  :term:`BitBake` threads, but will not prevent a single task from=20
> starting more
>
> I was convinced this was the number of tasks BitBake can run in parallel=
=20
> (which is what we say here and there in different places in the doc as=20
> far as I could tell), but I also see that we have a bunch of calls to=20
> bb.compress.zstd.open in bbclasses that pass this variable as the number=
=20
> of threads to use. Sooo not sure what to trust anymore :)

Shouldn't they use oe.utils.parallel_make() instead? I also assumed
BB_NUMBER_THREADS was limited to Bitbake tasks.

>> +   compilation threads (see :term:`PARALLEL_MAKE`).
>> +
>> +-  :term:`BB_NUMBER_PARSE_THREADS`:
>> +
>> +   Like :term:`BB_NUMBER_THREADS`, but this variable sets a limit to th=
e number
>
> s/to/on/ ?
>
>> +   of threads using during parsing of the environment (before executing=
 tasks).
>
> s/using// ?
>
> +the parsing?
>
>> +
>> +-  :term:`PARALLEL_MAKE`:
>> +
>> +   This variable should be set in the form of ``-jN``, where ``N`` is a=
 positive
>> +   integer. This integer controls the number of threads used when start=
ing
>> +   ``make``. Note that this variable is not limited to the usage of ``m=
ake``,
>> +   but extends to the compilation commands defined by the
>> +   :ref:`ref-classes-meson`, :ref:`ref-classes-cmake` and such classes.
>> +
>
> I think it'd be better to say this applies to configure (?) and=20
> compilation steps, and typically for make, meson, cmake, you name it,=20
> build systems.
>
>> +   If you have identified a recipe that you want to limit separately fr=
om the
>> +   rest, it is also possible to achieve with the following syntax::
>
> """
> you want to have a different limit from the rest of the build
> """
>
> ?
>
> Please specify where to put this variable (in any configuration file,=20
> but most likely local.conf I assume).
>
>> +
>> +      PARALLEL_MAKE:pn-linux-yocto =3D "-j4"
>> +
>> +   The above example will limit the number of threads using by ``make``=
 for the
>
> s/using/used/
>
>> +   ``linux-yocto`` recipe to 4.
>> +
>> +-  :term:`PARALLEL_MAKEINST`:
>> +
>> +   Like :term:`PARALLEL_MAKE`, but this variable controls the number of=
 threads
>> +   used during the :ref:`ref-tasks-install` task.
>> +
>> +-  :term:`BB_PRESSURE_MAX_CPU`, :term:`BB_PRESSURE_MAX_IO` and
>> +   :term:`BB_PRESSURE_MAX_MEMORY`:
>> +
>> +   This variable controls the limit of pressure (as defined by
>
> s/This variable controls/These variables control/
>
> I think we need to state that this requires the host machine's kernel to=
=20
> support pressure reporting/handling. I vaguely remember this was=20
> discussed back when this was implemented.

Yes, true, also the last variable kind of implies that but I should also me=
ntion
it here.

>> +   https://docs.kernel.org/accounting/psi.html) on the system, and will
>> +   limit the number of :term:`BitBake` threads dynamically depending on=
 the
>
> Is it threads or tasks here? I also don't entirely remember if this can=
=20
> also impact already running tasks (e.g. dynamically reducing the number=
=20
> of threads in the available pool during a make call in a recipe which=20
> started with the limit not reached but is running while the limit is=20
> reached).

It is only tasks as I understand it. I'm just getting confused by
BB_NUMBER_THREADS which controls the number of tasks, so mixing up words a =
bit
here.

>> +   current pressure of the system.
>> +
>> +   These variable take a positive integer between 1 (extremely low limi=
t) and
>
> s/variable/variables/
>
>> +   1000000 (value unlikely ever reached). Setting an extremely low valu=
e, such
>> +   as 2, is not desirable as it will result in :term:`BitBake` limiting=
 the
>> +   number of threads to 1 most of the time.
>> +
>> +   However, having a low value at the beginning makes sense to get a se=
nse of a
>
> beginning of what?

An "initial low value" would be better maybe, but I wanted to convey that t=
his
variable can/should be adjusted over time.

>> +   reasonable value to set for your system. Indeed, :term:`BitBake` wil=
l print
>> +   message on the console in the following format each time the current=
 pressure
>
> s/message/messages/ ?
>
>> +   exceeds of the limit set by the above variables::
>
> s/of// ? or s/of/that of/?
>
>> +
>> +      Pressure status changed to CPU: True, IO: False, Mem: False (CPU:=
 1105.9/2.0, IO: 0.0/2.0, Mem: 0.0/2.0) - using 1/64 bitbake threads
>> +
>> +   Take a look at the value between parenthesis: ``CPU: 1105.9/2.0, IO:=
 0.0/2.0,
>
> s/value/values/
>
>> +   Mem: 0.0/2.0``. They correspond to the current pressure value for th=
e CPU, IO
>> +   and memory respectively. Monitoring these values during a build shou=
ld tell
>> +   you what a reasonable value for your host system is.
>> +
>
> Mmmmm... I'm perplexed. If we set the value very low (e.g. 2) won't we=20
> simply limit the number of threads to something very low which actually=
=20
> could mean we're not necessarily nearing the maxing out of the=20
> CPU/IO/Memory?
>
> It's like running your 4-stroke motor on only one piston: "I see I can=20
> reach 60kph so this is a safe limit for my motor when not choked up"...=
=20
> which yes is true, but now you're not going on the highway because=20
> you're limiting yourself to 60kph and taking the long way home. Safe=20
> yes, but not sure we can derive much from this test except a very low=20
> safe value?

Hmm.. true, so maybe the best option would just to monitor /proc/pressure
without any setting, and then set the value.

>> +-  :term:`BB_LOADFACTOR_MAX`:
>> +
>> +   This variable will limit the number of threads :term:`BitBake` will =
start
>> +   by monitoring the current load of the host system. :term:`BitBake` w=
ill print
>
> I assume we're talking about CPU load here?

Yes, I'll add that.

>> +   the following when the limit set by :term:`BB_LOADFACTOR_MAX` is rea=
ched::
>> +
>> +      Load average limiting set to True as load average: 0.718826293945=
3125 - using 37/64 bitbake threads
>> +
>> +   This variable has no effect when any of :term:`BB_PRESSURE_MAX_CPU`,
>> +   :term:`BB_PRESSURE_MAX_IO` or :term:`BB_PRESSURE_MAX_MEMORY` is set,=
 as it
>> +   was designed for system that do not have pressure information availa=
ble.
>
> /system/systems/
>
> Hopefully the glossary and this document stay in sync :)

What I can do is revise the current glossary definitions to be minimal and
redirect to this document which would act as a better overall guide on how =
to
achieve resource limiting. What do you think?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


