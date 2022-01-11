Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96567C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:46:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.11993.1641926810582868013
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 10:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.199,
 mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5A55FFF804;
	Tue, 11 Jan 2022 18:46:47 +0000 (UTC)
Date: Tue, 11 Jan 2022 19:46:45 +0100
From: Quentin Schulz <foss@0leil.net>
To: yocto@lists.yoctoproject.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>,
 "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [yocto] How to unpack a .tgz archive in a .zip file?
In-Reply-To: <a55c6066-cc1d-934c-68a3-5122cd6c4a79@bootlin.com>
References: <a55c6066-cc1d-934c-68a3-5122cd6c4a79@bootlin.com>
Message-ID: <00C1BF23-5182-42AC-8D8A-1E07187DFB71@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 18:46:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2380

Hi Michael,

On January 11, 2022 11:38:06 AM GMT+01:00, Michael Opdenacker <michael=2Eo=
pdenacker@bootlin=2Ecom> wrote:
>Hello
>
>I'm working on adding the wiki guidelines for dealing with pre-compiled
>libraries
>(https://wiki=2Eyoctoproject=2Eorg/wiki/TipsAndTricks/Packaging_Prebuilt_=
Libraries#Versioned_Libraries)
>into the main documentation=2E
>
>I'm trying to test the example recipe, but the latest pre-compiled
>versions of libft4422=2Eso are now available in
>https://ftdichip=2Ecom/wp-content/uploads/2021/01/libft4222-linux-1=2E4=
=2E4=2E44=2Ezip,
>which actually contains a =2Etgz file!
>
>I know that's absurd, but how would you handle this case? Through a
>custom "do_unpack" task in the recipe?
>

IMO that makes it unsuitable for the docs as we strive to have "simple" ex=
amples and having some custom unpack task seems a bit too much to me=2E Any=
way, just my 2=C2=A2 and I don't have any other prebuilt lib to suggest as =
replacement right now=2E

Back to the topic:
I think you could have an :append for do_unpack and probably call oe_unpac=
k ( https://github=2Ecom/openembedded/openembedded/blob/fabd8e6d07d3cd0cc93=
c2a0fc804f8c8f316c649/classes/base=2Ebbclass#L158) on this specific file (a=
fter it's been unzipped), or even call unpack_file from the OE libs directl=
y ( https://github=2Ecom/openembedded/openembedded/blob/fabd8e6d07d3cd0cc93=
c2a0fc804f8c8f316c649/lib/oe/unpack=2Epy#L50) like oe_unpack is doing=2E Be=
 aware though that since it is a Python task, your :append shall be Python =
code too=2E

Maybe there's another way but I don't see it right now=2E

Cheers,
Quentin

>Thanks in advance for your insights=2E=2E=2E
>Cheers
>Michael=2E
>

