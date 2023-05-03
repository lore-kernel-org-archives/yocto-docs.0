Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C64C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 15:44:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.23256.1683128679254032181
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 08:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=LCv0WOFR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f182d745deso52218255e9.0
        for <docs@lists.yoctoproject.org>; Wed, 03 May 2023 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683128677; x=1685720677;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YVEXMVAhyvoV8A0tSGcaBLW1kykOtfP0Fb09rSrNdxA=;
        b=LCv0WOFRQ4YD4v93K7llmnmBt10UWHuEePez+dpUqTD91mMc6RU4ct941n0aylfIz4
         PUOlO/pDGdQ0YRZe37OtkavsQCrN5uyG2FAlBRVza2Cu1b8H03Tqn+bKowJovAMc/99z
         9jwDgseai4fjlC0YIoW8qZeeKGFVG/Oc0woNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683128677; x=1685720677;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YVEXMVAhyvoV8A0tSGcaBLW1kykOtfP0Fb09rSrNdxA=;
        b=IW1dFl1bCLZ+nE1Bm4frWVOoDwN52L+Mi/f0j6cKH0CtGxkegt7ktG2RsjL3O3my0M
         NyV/WpAKly6iQBUNcFvrFEYqZSW7RMvPEvnkMW6gyPUvq1FazkNfoduuzWnP0GcMK7Ec
         QEKvy/CZ1H7D35q0BPD5QrDTiCwDxRnErbekPKpwkqbv69DCq0Ur66FvlxTwDbBHluNl
         ZoTZn32xubJGiEWWA7AdD4IyCuNRIwgY1S19F7ir+sVeTlT2VXzJLAwu3ECdAZ3Iu2Td
         5dLDb98A13Mc47deCM+mR8FcAGH5rj7n9GtqIfh9/2Uv/pxke7fsB5ToboY3/vfsnEsH
         OKJA==
X-Gm-Message-State: AC+VfDzQqDCtFDJqCt9sjNGfKJnqKbA6r4YF58sPKMlluIhfircVJxil
	Gakj55Cw/pCoYFXcSXDltwuWhA==
X-Google-Smtp-Source: ACHHUZ5E0BuSElEjTYtcf9sHMI+dev+wwDaooW0nsy+xZvzzX2vCned2m4wbd9HEC+1tzH3o7oOGqg==
X-Received: by 2002:a7b:c4cd:0:b0:3f1:9b77:f581 with SMTP id g13-20020a7bc4cd000000b003f19b77f581mr14896348wmk.33.1683128677602;
        Wed, 03 May 2023 08:44:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id k22-20020a05600c0b5600b003f40049a65bsm1029109wmr.21.2023.05.03.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 08:44:37 -0700 (PDT)
Message-ID: <83da1e5d83a06e41a00b64b0eb1a305a756ce3b2.camel@linuxfoundation.org>
Subject: Re: [docs] Start of 4.3 migration guide docs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs <docs@lists.yoctoproject.org>
Date: Wed, 03 May 2023 16:44:36 +0100
In-Reply-To: <a00e3eba-e10b-c47b-8425-3005a4c72445@bootlin.com>
References: 
	<d7788bbd4dba10c004fa56f0f4160f6c46bfd6f6.camel@linuxfoundation.org>
	 <a00e3eba-e10b-c47b-8425-3005a4c72445@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 15:44:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3903

On Wed, 2023-05-03 at 17:30 +0200, Michael Opdenacker wrote:
> Hi Richard,
>=20
> On 03.05.23 at 16:55, Richard Purdie wrote:
> > As mentioned on the weekly tech call, we need to get better about
> > documenting changes for the migration guide and release notes as we go
> > along. Whilst we're not far into 4.3, I realise I made or merged
> > changes already which will need notes. Since we don't have a guide yet,
> > let me note them here on the basis Michael will inject them into a new
> > doc.
> >=20
> >=20
> > * The '-crosssdk' suffix and any MLPREFIX were removed from virtual/XXX
> > provider/dependencies where a PREFIX was used as well as we don't need
> > both and it made automated dependency rewriting unnecessarily complex.
> > In general this only affects internal toolchain dependencies so isn't
> > end user visible.
> >=20
> > * runtime testing of ptest now fails if no test results are returned by
> > any given ptest.
> >=20
> > * the bitbake cooker log now contains notes when the caches are
> > invalidated which is useful for memory resident bitbake debugging.
> >=20
> > * glide was dropped as "go mod" has become the standard
>=20
>=20
> That's a great start, thanks!
>=20
> I was waiting for the release to made before creating the new pages, to=
=20
> make it easier to merge last minute changes into the "mickledore" branch.

At this point I think we can diverge things.

Cheers,

Richard

