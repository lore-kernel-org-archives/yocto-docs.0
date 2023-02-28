Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3692C7EE2E
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 10:04:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.19837.1677578649396154294
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 02:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dv5e3dwE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso4438815wmq.1
        for <docs@lists.yoctoproject.org>; Tue, 28 Feb 2023 02:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=siPX2pPALAYXwrqwWD8Drn6SHBNMgthSF4v+giKwQNo=;
        b=dv5e3dwEOsX7JyJD3p6mtFPqFs9JXrYI2PA9mJ5hxqPK44JHriVv7xWNIDJfd2N+Cn
         g0VE9jVY+sfsods26MC0jKmISyg2e1MazTfpQCXIIGNbg2FHMcYUmaOPZ+n9Gg2D7E15
         CXnKeixRPEcyjeOW00bwf1ptMUn0oL8dLIUek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=siPX2pPALAYXwrqwWD8Drn6SHBNMgthSF4v+giKwQNo=;
        b=jRY48dIKvzwAtmFSOyqWGpBO/DJIazMuvka1YIukHmDpuLmUdOiubznJOJp/nZUylX
         UhvXXPiUQiDNOLF7SrawSOHEWcLf2aCW659sh+I80MN4USlv9kqU3+NT8z2bS/K7Qmfj
         tY7vaTUsl+Lq/aHgWj/abNLBnOGIt5M22qBOHWcRiiywuYwS6eriS9oMjREjQ8qbhVo2
         d10WhZv1e+y4BNLDGfBYZtig/W1hSzJknhWbRNhXCfXDK0uH9G64gOEYQ6xGC7C2/8Lb
         jLD1XGroQcUa6YQ3hfglPVNNMR+pmUQD3O65xNQFyTT/SXlyoWs/zkQlpEECDp3v7x5F
         dMhw==
X-Gm-Message-State: AO0yUKW6sflqWfmJGrQ9SRQRxyslWAwaMGaVyyMu7Zf1MbFiFPGK1/MT
	nL75Eq6xAz1GccCOkbxndpgKsA==
X-Google-Smtp-Source: AK7set+Qr8iM5DoKkubC/5C6VGvNvg9uFwXeSYAuny4XgeXBaP7ypoCx3ltjscAPZIiCqpDb57F8iQ==
X-Received: by 2002:a05:600c:3088:b0:3eb:3c76:c241 with SMTP id g8-20020a05600c308800b003eb3c76c241mr1626465wmn.13.1677578647631;
        Tue, 28 Feb 2023 02:04:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba1a:ef91:9631:3e11? ([2001:8b0:aba:5f3c:ba1a:ef91:9631:3e11])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d6605000000b002c54d8b89efsm9264330wru.26.2023.02.28.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 02:04:07 -0800 (PST)
Message-ID: <c6d70d998ccbc09857f77dbd74684505273940eb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [DISTRO|MACHINE]_FEATURES_BACKFILL_CONSIDERED:
 confusing variable names?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Tom Hochstein <tom.hochstein@nxp.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Tue, 28 Feb 2023 10:04:06 +0000
In-Reply-To: <82ebb063-3d90-1f8c-3c93-d5e3a84fe764@bootlin.com>
References: <8a4852e0-7d49-dfc3-7f41-9bf6c0c28016@bootlin.com>
	 <DB3PR0402MB3852CCB16686C166ADAED151E2AB9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
	 <82ebb063-3d90-1f8c-3c93-d5e3a84fe764@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Feb 2023 10:04:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3753

On Tue, 2023-02-28 at 10:52 +0100, Michael Opdenacker via
lists.openembedded.org wrote:
> Greetings,
>=20
> Thank you all for your replies and comments!
>=20
> On 24.02.23 at 00:24, Tom Hochstein wrote:
> > I agree. The problem I have with these variable names is that it's ambi=
guous whether the features will be included or excluded from the backfill. =
All you can tell from the names is that the values were 'considered'. What =
does that mean? You have to go to the manual to find the full meaning.
> >=20
> > What's important about the variables is that they will be 'excluded' fr=
om the backfill, so this does look much clearer to me:
> >=20
> > 	DISTRO_FEATURES_BACKFILL_EXCLUDED +=3D "some-feature"
>=20
>=20
> Richard, would you accept it if I sent a patch replacing=20
> "BACKFILL_CONSIDERED" by "BACKFILL_EXCLUDED" in the two variables?
>=20
> Of course, I can understand if that's too late for the next release, and=
=20
> instead document this oddity, at least before we can make a change again.

I don't want to rush into this. The idea of the variable was that the
list were things that distro maintainers would need to consider when
upgrading and then "mark as considered" so in that context, excluding
them makes less sense. I'm sure there was discussion about the name at
the time.

I'm nervous about renaming variables in general as it does create pain
for users upgrading and some community feedback has been that we're
bordering on frustrating users. I know we have mechanisms now to help
but it isn't pain free.

> > Is there a good reason why we have this separate variable and can't jus=
t do this?
> >=20
> > 	DISTRO_FEATURES_BACKFILL:remove =3D "some-feature"
>=20
>=20
> Good question. Maybe because ":remove" is final, and cannot be=20
> overridden, if I understood correctly?

Right, the concern would have been it couldn't be undone and the distro
setups from when this dates from were more complex.

Cheers,

Richard



