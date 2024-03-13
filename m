Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DF5C54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 10:24:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.13301.1710325488470992546
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 03:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: u.oelmann@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1rkLmw-0001WG-8E; Wed, 13 Mar 2024 11:24:46 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1rkLmv-0065ts-7P; Wed, 13 Mar 2024 11:24:45 +0100
Received: from uol by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1rkLmv-00FX5U-0T;
	Wed, 13 Mar 2024 11:24:45 +0100
From: =?utf-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: yocto@pengutronix.de,  Yocto Project Documentation
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: classes: update description of class
 'image_types'
In-Reply-To: <df0b53b8-49f2-4c83-b875-90290fe2ddda@bootlin.com> (Michael
	Opdenacker's message of "Wed, 13 Mar 2024 10:09:58 +0100")
References: <20240312203807.1646308-1-u.oelmann@pengutronix.de>
	<df0b53b8-49f2-4c83-b875-90290fe2ddda@bootlin.com>
User-Agent: mu4e 1.12.0; emacs 29.2
Date: Wed, 13 Mar 2024 11:24:45 +0100
Message-ID: <6r34supgya.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Mar 2024 10:24:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4949

Hi Michael,

On Wed, Mar 13 2024 at 10:09 +0100, Michael Opdenacker <michael.opdenacker@=
bootlin.com> wrote:
> Hi Ulrich
>
> On 3/12/24 at 21:38, Ulrich =C3=96lmann wrote:
>> Cite usage of IMGCLASSES variable in class 'image' as found in OE-Core's
>> commit [1].
>>
>> [1] 451363438d38 ("classes/recipes: Switch to use inherit_defer")
>>
>> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
>> ---
>>   documentation/ref-manual/classes.rst | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-ma=
nual/classes.rst
>> index 5aaf8ecc0c24..412dc5ca2fe5 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -1184,13 +1184,17 @@ enables the :ref:`ref-classes-image_types` class=
. The :ref:`ref-classes-image` c
>>   ``IMGCLASSES`` variable as follows::
>>        IMGCLASSES =3D "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASS=
ES}"
>> -   IMGCLASSES +=3D "${@['populate_sdk_base', 'populate_sdk_ext']['linux=
' in d.getVar("SDK_OS")]}"
>> +   # Only Linux SDKs support populate_sdk_ext, fall back to populate_sd=
k_base
>> +   # in the non-Linux SDK_OS case, such as mingw32
>> +   inherit populate_sdk_base
>> +   IMGCLASSES +=3D "${@['', 'populate_sdk_ext']['linux' in d.getVar("SD=
K_OS")]}"
>>      IMGCLASSES +=3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live is=
o hddimg', 'image-live', '', d)}"
>>      IMGCLASSES +=3D "${@bb.utils.contains('IMAGE_FSTYPES', 'container',=
 'image-container', '', d)}"
>>      IMGCLASSES +=3D "image_types_wic"
>>      IMGCLASSES +=3D "rootfs-postcommands"
>>      IMGCLASSES +=3D "image-postinst-intercepts"
>> -   inherit ${IMGCLASSES}
>> +   IMGCLASSES +=3D "overlayfs-etc"
>> +   inherit_defer ${IMGCLASSES}
>>     The :ref:`ref-classes-image_types` class also handles conversion and
>> compression of images.
>
>
> Many thanks for this update!
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Merged into master-next.
>
> Do you think we should add the IMGCLASSES variable to the variable index =
too?

I am not sure if it is intended to be used externally (e.g. by extension
in the distro- or machine-configuration or in local.conf) or if it was
designed to only serve as an internal variable when it has been
introduced in OE-core's commit [1]. In the former case it would benefit
from an explaining addition to the docs - does anybody know how it was
meant to be used?

Best regards
Ulrich


[1] 9b6cda7ff443 ("image: Combine all the class handling code into a single=
 section")

> Cheers
> Michael.
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

