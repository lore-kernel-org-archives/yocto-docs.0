Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732A1C5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:22:06 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50481.1786440117994930760
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 02:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XWp9K0yN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so21056235e9.1
        for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786440116; x=1787044916; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tc3KB3GB9qHi3jlt5B6tu9dGBFZri8ntz0VNGKjki3w=;
        b=XWp9K0yNgoBwRogBDVV7BFlod5fdHD9U97YHsV3YaksKiJlPsSxLRa4revEjuIn7AJ
         dL3+M/dp3fOK14BRVO9wHtEv4QZwleSil3sk4ljbM8VPlDVC4blYjBaZsChbpgaj8HTg
         4q9wrPywkdtDHCj/2g7hFn32bf/H8s+hVRT2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440116; x=1787044916;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tc3KB3GB9qHi3jlt5B6tu9dGBFZri8ntz0VNGKjki3w=;
        b=ju0IZ2xIILyheRDn24NgAXtGCfzpPFBMIm8TN+bl2hJZqsw4yrnX3rraOuMgT3f4mW
         Fn8kZw1MGbR2x/w1evF+VNk9ekun9sigvCLGnT3MKGLnO3Qw5r5lZc5j+VGRzlZv3Pum
         c31fobuMIdsOPDRXYWwEYWzGkdQ0BMp8nb15dXCbKbJ3PtDcR6R0scJ+PZ/hl3YSIP2v
         IC9FfDThABt0DBDdvxhrakrNyLD9C5N+NeBaULAUQKRMMlmd0lbvv+2D+JumtDxlR/f3
         vpMls/x5wYzRTmVIecYL2+c4w5wCupjf+A506bIpUjKDZ1Q84gnwVBXZUTOMGvrZnPC1
         Loyw==
X-Forwarded-Encrypted: i=1; AHgh+Rofi01B2h/Jhgx60fRdnzICMPKANy5DF/zXW8Ucwk9xXXKjL2vPAr1stLVd4g8ghj+z03wA@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxdXwIVQMPzj0m+qCcbi+wGr8z6il07AWyHZPLwhuQkd5Eqq01p
	E+q/FDIv+Nw2o78lVA9L+/qu39Bd4/1pEqJc33BHjrgSn1CjU+nLECQTzHwbk96aU+U=
X-Gm-Gg: AR+sD13bQ+fc+g+fbQB0KPNUI6jkD5fcdg7h2YzTx1hdvQ7oLGLduccHhw18Ha6fswn
	WsU9U/HMP0L7vZ+6KasA4LLVtQbatWEiRjwBBp7royQM1WU6t+9YZ7Ql38OhrU0PDTdNddqG1m3
	7oAyUx1keWKrYGBZlc1Hcx0hdNS6tPYlkjcGFUw5eSriDHXP7miHLYxS6DgARq0pDsXpnswTQV6
	RP5ZQh4iZyqlkrqM027IUNAxkEsj+o42PKE17pBkKrYDnL2Xxq3e+WwYnaMJUl5o8dwVvzDdlsS
	3ufyP+4gp8MlmmK8pDbAzVGlsunUE0FOoYf62sxo3M5Sof6FMgpsI+4C3P0wiEpnf30do2JQHGi
	pQZ7uGebp4BYlLocZGT2xHOqoGKPd1L+/rA5mrAonkSrDJs9jkmLlmVBgVblZcohDVlI7eeG0RI
	COaDVWc8JP+kJwN9DEg0B5AkpNrO09KU1wU3dGZyVt/IoOXsSr3PV436ILbtMyWGstkjC6IPahm
	UADFVFoJGO+ae1zN3/Fca9hg2Rooajweqs9sARHvIV409SIHP9qzu10oPsKcsRRTQ==
X-Received: by 2002:a05:600c:8219:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-4997842db6cmr33756565e9.4.1786440116143;
        Tue, 11 Aug 2026 02:21:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a? ([2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5ac856sm2987748f8f.8.2026.08.11.02.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:21:55 -0700 (PDT)
Message-ID: <8a6a89e56177790a6b0271b62ef80f0fa4eb3580.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v3] security-manual: Add information about how
 security is handled in builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Date: Tue, 11 Aug 2026 10:21:54 +0100
In-Reply-To: <1bde5db8-15d5-49c0-938b-92ec0efb14b6@cherry.de>
References: <20260811090254.3611885-1-richard.purdie@linuxfoundation.org>
	 <1bde5db8-15d5-49c0-938b-92ec0efb14b6@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:22:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10256

On Tue, 2026-08-11 at 11:08 +0200, Quentin Schulz wrote:
> On 8/11/26 11:02 AM, Richard Purdie via lists.yoctoproject.org wrote:
>=20
> > +
> > +-=C2=A0 :term:`OpenEmbedded-Core (OE-Core)` is well tested for reprodu=
cibility issues but other
> > +=C2=A0=C2=A0 layers and their recipes and code may not be as well test=
ed. Those reproducibility tests
> > +=C2=A0=C2=A0 are available for others to run against their own layers =
and code.
> > +
>=20
> Would be nice to have a link to those reproducibility tests (or if we
> have documentation for those, that) so we remove friction for layers to=
=20
> figure out how to do them.

It would. I was going to say it is a bit more involved however it would
be good for someone to document it so let me at least write down that
bit in the hope someone can sort the markup/docs entry for it.

To test a layer's reproducibility, you would setup a build with
OE-Core with the addition of the layer you want to test. You'd use a
configuration along the lines of:

EXCLUDE_FROM_WORLD:layer-core =3D '1'
EXCLUDE_FROM_WORLD:layer-yocto =3D '1'
EXCLUDE_FROM_WORLD:layer-yoctobsp =3D '1'
EXCLUDE_FROM_WORLD:layer-selftest =3D '1'
OEQA_REPRODUCIBLE_TEST_TARGET =3D 'world'

which would setup the reproducibility target as 'world' but then only
include the additional layer in the world build.

You could then run the reproducibility test as:

OEQA_DEBUGGING_SAVED_OUTPUT=3D/place/to/save/failing-output oe-selftest -r =
reproducible

where differences would be stored in /place/to/save/failing-output for
debugging, which is handy in CI.

Cheers,

Richard


