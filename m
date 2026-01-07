Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30124CFD647
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 14:46:26 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7420.1767797180869638381
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 06:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DjZ9eEe8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so14670365e9.3
        for <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 06:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767797179; x=1768401979; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCpI35+aF3vyA4P+G/rW5iKlLeJGh6GduuRcGtKWHn0=;
        b=DjZ9eEe8QY8SvoInK+t7Sj14K5AoK+z40vr3gVzZa0nIqSvccSaW2QnvFUGhZ0Ja6Q
         pOVagf/43+OWBGiylvw0DNUGFywJu2SiUFyj7sX7rT7uAVQhCtFSQrD/y7+sMC9RXw4v
         sKiiOGP+//75PCL1h1Ayot5ApQnQsY3t/wrtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767797179; x=1768401979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCpI35+aF3vyA4P+G/rW5iKlLeJGh6GduuRcGtKWHn0=;
        b=oFcwTGNrUbWGDlIPpCkh+fVw5ktBxkTxCOwrGG/FpMaLQZfo+LH2uAJh3XhKskHQOK
         1+iaVaMTVr+0wueY87FJ+VYlb0R5u4DpCETI1aIoCdOXKfjZQI5mSclOHC0kLAFqLAVr
         wt3qnqe11qVhDZRa5VhLhwnS/tqYw8onGsE4IDpYgOnIEwGs9hX2ph9TLrjCnyS+ObpG
         a+7qsOQXEsGek8c2Q6rE9tpvQf3C4J6fAX/rUEly/Gxjtbpi1zWdFJ7ALHD3TVYLsoks
         e75JTwqQk9LFjcawwvkqifQ7GZ4bPqS1cv2JssKkgfAphhBqOJUO6uVOV+KqWj3WF8K+
         Sd+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXz4p9p2eUCD1jI+B8oz9S0F9FVxGaUsxNYSnTGbjEN/wpYCHJGDjvQ31k6YdmqQcJwZjJ8@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyS79Ei2zLlZelECEiBHrqE6qxMJo4L9d5i9yoqQ5etjHrzyo/A
	31sFfKLLoug27UWcE3m6e9VIVxJ7jWJ2KCVjj6qzupfhbmAaF1dr6dUED4r5j+xAWHk=
X-Gm-Gg: AY/fxX5AKCTEZHlMP3cE9IYnBsF5stnswTFVpsHHZmUnFSW3McpOLif65rSGX33BvqG
	9r4IKUG/bXDPFfb1NRiVaMTo6XhHuoIDgIo+z0wKKaewyHrsZ/mzxk9HqoAxujxIddUCy+1Yqk7
	SYYTeJ6OS8JAm/o07eQqhZ/rSe9OlmzxlS5OMDUAUrYn3E9cGw1pKz6jE2sOGnogru1l6fW91uK
	3sxRrUbvc+dChG4GmJETxUsoCyMkj2cYB+8eV9tl+x/bxe53X/zNdoxSaJaZi7h2aodH3gbPh1+
	rKYFtVJcn1RPtBVkE6XU921j7DXIZ+NDm6z2XU4K6kOJw68KOJwPifVNu+HOVlC8oPXKQQbQk0V
	tjBtBW0ZFevEZqEeTPRD5/rEuP5Ho+B07d6uiXX2MlCk59jPD2Qgd33kn8WVyT7BLI5Rp4Sszfp
	p+h09mkojyo+CEo2+zOXYA75dmMPD8inmEKJ7EUkw+ICIA7Su5sTqQtPPq8zc9yrpNbhSMhvY5s
	JSppoir6rk=
X-Google-Smtp-Source: AGHT+IGWomRFcJ9jB1w6Os0pLYQFXsiRv3qrpSWXi7xZGatThBTXhlDyyG18Z4773xOTl9gPc53IjQ==
X-Received: by 2002:a05:600c:4f0e:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47d84b1a3dfmr32704425e9.5.1767797179110;
        Wed, 07 Jan 2026 06:46:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:97d2:bd66:800:7506? ([2001:8b0:aba:5f3c:97d2:bd66:800:7506])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dabcbsm10033748f8f.7.2026.01.07.06.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:46:18 -0800 (PST)
Message-ID: <e88a8ee06cbb9c3f25cd7485c898308fccd4b08b.camel@linuxfoundation.org>
Subject: Re: [docs] BB explanation of BB_ENV_PASSTHROUGH is confusing
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 07 Jan 2026 14:46:17 +0000
In-Reply-To: <5cc0f4e6-3722-74a3-cf42-4f919d1ed314@crashcourse.ca>
References: <5cc0f4e6-3722-74a3-cf42-4f919d1ed314@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 14:46:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8410

On Wed, 2026-01-07 at 06:39 -0800, Robert P. J. Day via lists.yoctoproject.=
org wrote:
>=20
> here:
>=20
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-ref-variables.html#term-BB_ENV_PASSTHROUGH
>=20
> the explanation:
>=20
> "Specifies the internal list of variables to allow through from the
> external environment into BitBake=E2=80=99s datastore. If the value of th=
is
> variable is not specified (which is the default), the following list
> is used: BBPATH, BB_PRESERVE_ENV, BB_ENV_PASSTHROUGH, and
> BB_ENV_PASSTHROUGH_ADDITIONS."
>=20
> seems weird since it suggests that if the value of that variable is
> not specified, the list that is used recursively *includes* the
> variable itself. and this doesn't seem to match the code from
> lib/bb/utils.py, which does *not* include that variable:
>=20
> =C2=A0 def preserved_envvars():
> =C2=A0=C2=A0=C2=A0 """Returns the list of variables which are taken from =
the environment and
> =C2=A0=C2=A0=C2=A0 placed in the metadata."""
> =C2=A0=C2=A0=C2=A0 v =3D [
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'BBPATH',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'BB_PRESERVE_ENV',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'BB_ENV_PASSTHROUGH_ADDITIONS'=
,
> =C2=A0=C2=A0=C2=A0 ]
> =C2=A0=C2=A0=C2=A0 return v + preserved_envvars_exported()
>=20
> can someone clarify how that explanation should be interpreted? or how
> it might be made clearer?

It probably needs updating after this:

https://git.openembedded.org/bitbake/commit/lib/bb/utils.py?id=3D0a33b56023=
3b983456178541603ab96fea22238b

Cheers,

Richard

