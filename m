Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DC0ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 11:19:03 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.4947.1663154332342078849
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 04:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1oYQPp-0006Dj-OI; Wed, 14 Sep 2022 13:18:49 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1oYQPm-001TiU-Fe; Wed, 14 Sep 2022 13:18:46 +0200
References: <20220914093528.3073257-1-u.oelmann@pengutronix.de>
 <ab373eed-5d35-2134-c82b-a41888735412@theobroma-systems.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: fix typos in the context of 'icecc' &
 clean up whitespaces
Date: Wed, 14 Sep 2022 12:12:31 +0200
In-reply-to: <ab373eed-5d35-2134-c82b-a41888735412@theobroma-systems.com>
Message-ID: <6rfsgucig9.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Sep 2022 11:19:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3166

Hi Quentin,

On Wed, Sep 14 2022 at 11:46 +0200, "Quentin Schulz" <quentin.schulz@theobr=
oma-systems.com> wrote:
> Hi Ulrich,
>
> On 9/14/22 11:35, Ulrich =C3=96lmann wrote:
>> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
>> ---
>>   documentation/ref-manual/classes.rst   | 14 +++++++-------
>>   documentation/ref-manual/variables.rst |  4 ++--
>>   2 files changed, 9 insertions(+), 9 deletions(-)
>> diff --git a/documentation/ref-manual/classes.rst
>> b/documentation/ref-manual/classes.rst
>> index 424c505715ff..949de0758d01 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -580,8 +580,8 @@ Finally, here is an example that sets the root passw=
ord::
>>   .. note::
>>        From a security perspective, hardcoding a default password is not
>> -   generally a good idea or even legal in some jurisdictions. It is
>> -   recommended that you do not do this if you are building a production
>> +   generally a good idea or even legal in some jurisdictions. It is
>> +   recommended that you do not do this if you are building a production
>>      image.
>>     @@ -792,7 +792,7 @@ The class stages directories with symlinks from
>> ``gcc`` and ``g++`` to
>>   ``icecc``, for both native and cross compilers. Depending on each
>>   configure or compile, the OpenEmbedded build system adds the directori=
es
>>   at the head of the ``PATH`` list and then sets the ``ICECC_CXX`` and
>> -``ICEC_CC`` variables, which are the paths to the ``g++`` and ``gcc``
>> +``ICECC_CC`` variables, which are the paths to the ``g++`` and ``gcc``
>>   compilers, respectively.
>>     For the cross compiler, the class creates a ``tar.gz`` file that
>> @@ -800,8 +800,8 @@ contains the Yocto Project toolchain and sets ``ICEC=
C_VERSION``, which
>>   is the version of the cross-compiler used in the cross-development
>>   toolchain, accordingly.
>>   -The class handles all three different compile stages (i.e native
>> -,cross-kernel and target) and creates the necessary environment
>> +The class handles all three different compile stages (i.e native,
>> +cross-kernel and target) and creates the necessary environment
>>   ``tar.gz`` file to be used by the remote machines. The class also
>>   supports SDK generation.
>>   @@ -811,12 +811,12 @@ using ``which``. If :term:`ICECC_ENV_EXEC` is set
>>   in your ``local.conf`` file, the variable should point to the
>>   ``icecc-create-env`` script provided by the user. If you do not point =
to
>>   a user-provided script, the build system uses the default script
>> -provided by the recipe ``icecc-create-env-native.bb``.
>> +provided by the recipe ``icecc-create-env_%.bb``.
>>
> % is not a valid character for recipe filename I'm pretty sure. I underst=
and
>   what you want to do but I don't think that's the right way to do it.

to be honest, I already "feared" that this valid argument would come up
for last week's commit [1] in OE-core.  ;-)

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D7fd33565df5=
d ("icecc.bbclass: fix typos")

> We could also use the exact filename since the recipe version hasn't chan=
ged in
> 11 years so I think it's better to use: icecc-create-env_0.1.bb.
>
> If you're afraid we'll get out-of-date, you could use a link here and som=
eone
> running linkcheck (we really should start doing it...) will be notified o=
f the
> dead link. :oe_git:`icecc-create-env_0.1.bb
> </openembedded-core/tree/meta/recipes-devtools/icecc-create-env/icecc-cre=
ate-env_0.1.bb>`
> would probably be the link.

That's a good idea: I am going to send a v2 of this patch shortly and a
corresponding fix for OE-core, too.

Thanks for your review!

Best regards
Ulrich


>>   .. note::
>>        This script is a modified version and not the one that comes with
>> -   icecc.
>> +   ``icecream``.
>>     If you do not want the Icecream distributed compile support to apply=
 to
>>   specific recipes or classes, you can ask them to be ignored by Icecream
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index df7d4bfbae55..98a981b19b11 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -2966,8 +2966,8 @@ system and gives an overview of their function and=
 contents.
>>           If you do not point to a script that you provide, the OpenEmbe=
dded
>>         build system uses the default script provided by the
>> -      ``icecc-create-env.bb`` recipe, which is a modified version and n=
ot
>> -      the one that comes with ``icecc``.
>> +      ``icecc-create-env_%.bb`` recipe, which is a modified version and=
 not
>
> Ditto.
>
> The rest looks fine, thanks :)
>
> Cheers,
> Quentin
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

