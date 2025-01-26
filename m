Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D299FC0218E
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 10:38:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.28172.1737887893395643137
 for <docs@lists.yoctoproject.org>;
 Sun, 26 Jan 2025 02:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ikvziP66;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361f664af5so40104325e9.1
        for <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 02:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737887892; x=1738492692; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puHUPc+hyMKk4FaeKjW2r4FObY2EBRM+O13X767Wv5M=;
        b=ikvziP66kSeY9ReU0Oi9E0ez8pLNQbDH86+gtipblXp9wahjhzOJpO4hy3w4n5LtJ+
         PFXJZXZGsUljvJBGbWtggxSQbgN49CfadhfZJarGO8McFfSFdSpM1qTXvL2XPRdFtX2V
         G5sttp1NWTw3DkFiM6T45usZTnTy5XVvYSktk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737887892; x=1738492692;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=puHUPc+hyMKk4FaeKjW2r4FObY2EBRM+O13X767Wv5M=;
        b=gt2oZXO500/LJ0JDpt1sNBNbvf+LHekiSUNCyYVoGHNXAK9j5JihZ+l9DhBdr3rH5Q
         cC+rKD3PevSA5JmP7Rg3HHDWvwE5foY8XeLzkEE6x52kzPyhMSH1WjjM5vUj6vKqMVSb
         kkNkb6XT1MdNm2bkK/ug1TKZEokjbslU4n9FBJepxf+JK8FO5Nub/YLGto8IvPT2XUqD
         pMEES6iIN6Lz6YKcTPM5t+I7hs+dM1mKW8LaHzHjVzCRJxI8Ozb4K8JlIIprNUxlMeO/
         jsry9V80srA+xUFfp8wTZQSz7vnW3d2hOg35o1qlC6PBOyUJZdSwE6rMSJzTzO3vmWbT
         F+oA==
X-Forwarded-Encrypted: i=1; AJvYcCVZCCY5YANrHXRSQPm3lltWfFZAeVZHjYOmJxfc/UaScyGeCQQLZiGKh9Gs6VtGpT3KH949@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwvhrQ/2IL3ZJ/soAVkrFafvNorJtZCHXi/WSggfQMlAfcLTYFX
	qRibg+5ZSr0J5quGHNqqg5DlFdolqbKVfxih8zTzR81AQEvIq5cQNEefJy4nYF4=
X-Gm-Gg: ASbGncsxgjKoLpLo62wNRaroAv2vYWl7QY0Bl6adqj592SvPYXJSqFm08838qZtMMfx
	RyxP3UA7BuT3IHvugmWuFKl9oQJoP+PgAUEYLVVQFdSvUrNX/SWGJZCg4BTx9h+vZUdRVX/ngaM
	Nshqofqs1BiKEJUlOZK41qpxh8U/BmiqjMqa+VGXWNuNLKsMcDbnC6yjk5XHQMoFvlmiKplLX+L
	SLX2FcDBI2wxIip1m4/e8lnCzassvPAxtvINgDEhRlesujt9wNH5OiAU/eH1plppltaWsLJRi7b
	hN59G3QWz0qvNKIkCFnpCwUYa+mANn4ElSWnOh+Hx2jVDqWEu7jGB6BWPP/t6vdk6BA=
X-Google-Smtp-Source: AGHT+IE4NA3XIYrvGJMsAM3U3wwS7qZaQcaltXQ8yagLgDcVaCNHqAjjh/Gie123fi921HLdOUvpcA==
X-Received: by 2002:a05:600c:a07:b0:434:f9c4:a850 with SMTP id 5b1f17b1804b1-438913cb16emr363364095e9.10.1737887891211;
        Sun, 26 Jan 2025 02:38:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6905:4568:b67b:291? ([2001:8b0:aba:5f3c:6905:4568:b67b:291])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48b11esm91562165e9.19.2025.01.26.02.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 02:38:09 -0800 (PST)
Message-ID: <4f6e1a70fed80b6310476a9e04071d0da7447211.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] doc/logging: small clean-up and name
 environment
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joerg.sommer@navimatix.de, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org
Date: Sun, 26 Jan 2025 10:38:08 +0000
In-Reply-To: <6ab2ca1d7d9cd7ebf98aaca7e19612b3de0f133b.1737884847.git.joerg.sommer@navimatix.de>
References: <D6UW0L5UHG5P.1JGNQ7WKC2N6@bootlin.com>
	 <6ab2ca1d7d9cd7ebf98aaca7e19612b3de0f133b.1737884847.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 10:38:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6175

On Sun, 2025-01-26 at 10:47 +0100, J=C3=B6rg Sommer via lists.yoctoproject.=
org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> The variable *BB_LOGCONFIG* is part of *BB_ENV_PASSTHROUGH_ADDITIONS* in
> /scripts/oe-buildenv-internal and can therefore be passed as environment
> variable.

We have to be a little careful here since that script is in oe-core and
bitbake can be used with things that aren't oe-core and may not set
that.

>=20
> -Then set the :term:`BB_LOGCONFIG` variable in ``conf/local.conf``::
> +Then set :term:`BB_LOGCONFIG` as an environment variable when running
> +BitBake, or set it in ``conf/local.conf``::
> =C2=A0
> =C2=A0=C2=A0=C2=A0 BB_LOGCONFIG =3D "hashequiv.json"

We might need to document that it should be included in
BB_ENV_PASSTHROUGH_ADDITIONS. Perhaps making that a bitbake default
might be the easiest...

Cheers,

Richard


