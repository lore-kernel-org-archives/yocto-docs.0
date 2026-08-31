Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3422C61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 12:26:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28337.1788179196970825776
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 05:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OD2UIP0b;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA99C4E41493;
	Mon, 31 Aug 2026 12:26:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 877A560231;
	Mon, 31 Aug 2026 12:26:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40FB611C783F8;
	Mon, 31 Aug 2026 14:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788179194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2aL0x/2ChSNwCqijCYgxtl7+gWoQQkQtPF7BeEul+7E=;
	b=OD2UIP0b7X6LD0e0M8pD5HEHwSBNG/asu1bEjrZ6MZOt/ZecEjDgOiIb4mdJ+QOUqBTyZ2
	co5deZ66mg6uOerez0gGxfdonde4ZbFcLmMYw7yeYnXOQEgBmAgkGcNXVqYHZ907UK7P2X
	WsVO6/3pykll6cJVg+3YMZopAlScfjoyY4NStvxhgVGD+ank2XYHjybpJvuyi2DFdXxMBC
	8tww3ohPhVhIziEnwtBnbUMTAZ4b0rCUEoCGqVuqONndX1gj3VPUouwo+oPmyK1JOyvlzF
	T3GB7g0UB3e7REQaVxAswPAx9FjxPLvHOYxUlWsMefPR693zrRC5N66gWT6MBw==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 14:26:32 +0200
Message-Id: <DL34MCC6G8T0.12NMB0V503NE4@bootlin.com>
To: "Jose Quaresma" <jose.quaresma@oss.qualcomm.com>
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: add ccache
 in distros
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260831095856.2298-1-jose.quaresma@oss.qualcomm.com>
 <DL322H0N4CF5.IO2KG3IOZPKD@bootlin.com>
 <CADWMC-bO57E5JZPfNXCp0rjOH-hGyWGyF8_bnBrvf8NrHRaDjg@mail.gmail.com>
In-Reply-To: <CADWMC-bO57E5JZPfNXCp0rjOH-hGyWGyF8_bnBrvf8NrHRaDjg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 12:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10421

On Mon Aug 31, 2026 at 12:48 PM CEST, Jose Quaresma wrote:
> On Mon, Aug 31, 2026 at 11:26=E2=80=AFAM Antonin Godard <antonin.godard@b=
ootlin.com>
> wrote:
>
>> Hi,
>>
>> On Mon Aug 31, 2026 at 11:58 AM CEST, Jose Quaresma via
>> lists.yoctoproject.org wrote:
>> > Looking at the Yocto docs, ccache is missing on Debian/Ubuntu
>> > and OpenSUSE but is in all the others.
>> >
>> > The ccache can improve significantly the builds speeds when we can't
>> > take advantage of the bitbake sstate cache, in such scenario we need
>> > o compile the code. The cache storage needs to be available from the
>> > previous builds so we need to store these ccache artifacts temporary
>> > on our permanent storage.
>> >
>> > The ccache is required to build "-native" packages in oe-core
>> > because it requires HOSTTOOLS +=3D "ccache".
>>
>> Thanks for the patch. Actually, it makes me wonder if we should rather d=
o
>> the
>> opposite and remove this for all distros, as this doesn't sound like a h=
ost
>> "requirement" to me.
>>
>
> Yeah, This is opcional and not a requirement as you said.
>
> However, this can greatly improve build time. So it fits in the same
> category as the
> python-websockets, which are not a requirement because upstream hashequiv
> server is not enabled by default, but it also appears listed.

websockets became a requirement when we made the "poky-with-sstate"
bitbake-setup configuration proposed as part of the choices when running
"bitbake-setup init". It would have made no sense to suggest a configuratio=
n
with a missing package otherwise.

> To take full advantage of the ccache.bbclass, you need to have the tool i=
n
> the host;
> otherwise, you can only use it for the ":target" arch.

I think this should then be stated in the ccache class documentation, in
documentation/ref-manual/classes.rst. The host requirements should be kept
minimal, IMO.

Antonin

