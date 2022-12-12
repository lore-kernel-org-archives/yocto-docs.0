Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4DFC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 11:31:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.40801.1670844695806051894
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 03:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bfhWSWMQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id ja17so2104470wmb.3
        for <docs@lists.yoctoproject.org>; Mon, 12 Dec 2022 03:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fI5ne2X8qm+edXovaKUJHhrzEZQX+LnblpwnaHPHlFY=;
        b=bfhWSWMQBD4t2utMi0Gamyllx6s03jaKlwkJoERnHPupzXDbzzE3ZzO90DkLUV91fj
         d3KwZRGObDuc1FEvJYNxlUkKwPJT6C5o49Iccu+yNCFbUXqui2h1OkxvJ1WESp211ovC
         Smmv1z9TUdWOUu5BVYkKr9mwdwDh+ZV+cKzak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fI5ne2X8qm+edXovaKUJHhrzEZQX+LnblpwnaHPHlFY=;
        b=8PmyLOkjrpoO0yRi+qCmTAq93ISPJHYpT99Au5qPB/aa5vzhtgYD+1nB8kNKd6Op42
         8CExA/wLLCryLwWlOSjUXpozcaQix6c4jWl/8XACaNBNa96e6+jjl5gjVtJDlc1W0vzR
         +vxinFdewjr2UfuJbg/Sv1vFMVIC19H3yljIy/M/TXh7WxkO327qynAqQKPzJdH10uwC
         T7yNuLeZWn/HMNX+ugR4bZ4T9N6M0JR90N/AAIQAHeyvYdWo5essqLaE8gkai2IlH5hf
         1LNN5LA/ALGt0GAEbhktv4W5qN+9KpuncatvPVLM+Uh0I3xt4JiLOyd6LDNq5gKk4eA5
         5s+A==
X-Gm-Message-State: ANoB5pkIXRQhDwGjWxhJ6AWtIlKfkVQkFYPoAVrqCxeElJtxXqh0lJyY
	AqDwJJ070RprLPzQ+qi9BdCV0g==
X-Google-Smtp-Source: AA0mqf7oysEZ3OJmbFQT54aV22rnXc6/2PIA3YHdtfcSRtbLWrUpWfnH1FLSMcofJcTcUmd8Me97kQ==
X-Received: by 2002:a05:600c:4e54:b0:3cf:51cf:91c with SMTP id e20-20020a05600c4e5400b003cf51cf091cmr12246841wmq.11.1670844694207;
        Mon, 12 Dec 2022 03:31:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cbbc:8f6d:4f6e:ffe4? ([2001:8b0:aba:5f3c:cbbc:8f6d:4f6e:ffe4])
        by smtp.gmail.com with ESMTPSA id l41-20020a05600c1d2900b003c6b874a0dfsm11570542wms.14.2022.12.12.03.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 03:31:33 -0800 (PST)
Message-ID: <698eaf5ecbd97ed92a9cbde2f8a2413218aee6b3.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] manuals: final removal of SERIAL_CONSOLE variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, quentin.schulz@theobroma-systems.com
Cc: docs@lists.yoctoproject.org
Date: Mon, 12 Dec 2022 11:31:31 +0000
In-Reply-To: <09e50cc2-dd35-9b5c-d05b-c1f002e038b5@bootlin.com>
References: <20221212094955.58455-1-michael.opdenacker@bootlin.com>
	 <14b23bc2-f744-4452-64ac-ba1926324b7d@theobroma-systems.com>
	 <09e50cc2-dd35-9b5c-d05b-c1f002e038b5@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Dec 2022 11:31:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3549

On Mon, 2022-12-12 at 11:26 +0100, Michael Opdenacker via
lists.yoctoproject.org wrote:
> Hi Quentin,
>=20
> Am 12.12.22 um 11:22 schrieb Quentin Schulz via lists.yoctoproject.org:
> > Hi Michael,
> >=20
> > On 12/12/22 10:49, Michael Opdenacker via lists.yoctoproject.org wrote:
> > > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > >=20
> > > This deprecated variable has been removed for good through
> > > https://urldefense.com/v3/__https://git.openembedded.org/openembedded=
-core/commit/?id=3D9d053af1fb570b4e3483de4ecd6827e1e0be61b7__;!!OOPJP91ZZw!=
mdIhsk9314XecKGpMxgc_65hSaYE2VoOo41x1ne13KiL-CTEfSgyidbnwYhCshdThpFx9pkMiUT=
oxlsznioCpyDfYgQ641L54bUJg6MTpZwevFvYDYzv$=20
> > >=20
> > >=20
> >=20
> > Should we start a migration manual for 4.2 that we update every now=20
> > and then rather than a big change to review right before (or sometimes=
=20
> > after :/) the release has been made?
> >=20
> > I don't know exactly what's the workflow/process here, just asking.
>=20
>=20
> Yes, we already started writing the migration notes ahead of time for=20
> the previous release. This sounds like a good time now for the next one.
> I'll submit a first draft that people will be able to contribute to.
> Thanks for the reminder!

We definitely should start one. In particular, we need to document the
need to use the new "addpylib" directive in layer.conf files to enable
lib directories within layers.

Cheers,

Richard

