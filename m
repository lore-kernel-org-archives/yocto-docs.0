Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E904C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 20:41:24 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.165.1789504879270734282
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 13:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LfnxaTKj;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso1833165e9.2
        for <docs@lists.yoctoproject.org>; Tue, 15 Sep 2026 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789504877; x=1790109677; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aC+/3wrHZHuz1K5PluS33/ewqnDoVnggJKMlZ7nbtYk=;
        b=LfnxaTKjfGJighQ3uLz2vLrecjh4eQqUUb8XPSHXZPOKHeHAMjgYZRnfpcvzmsCPl5
         Q6QgWFOsnMoC9XzwYOZd9Uv/NapUMNFWGMGfjRbLMklpUzKHlPjmeiDBXocGYqKWJ2Hg
         o7rtzjtsgx5xi3Y3ubQ2q0o/al6qJxyACYg2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789504877; x=1790109677;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aC+/3wrHZHuz1K5PluS33/ewqnDoVnggJKMlZ7nbtYk=;
        b=gdhATBIkbQG6/SxjVd8Xucomv/HNMLc6GIb2pv1ZZ6+DxxhfrgcqrhEQ4ISET06rVF
         ekZZvOM9jHnzwt+LwpdDUftCF6vQSCr6X1Nfx7bXUJ0szaq9qPZv4dc408DWw5BJ7uA9
         WXasIHSpnm9AaVO79jvE9RGQvF7RZBZ6745i1c8Freq4oe9Fm3FzbHNPhFWLkZQLfVvV
         Geq5OnI+gwMYyVAZFM4V/SEv30lGLODxXmH7KW3wR+9LIbnJ5U1fnUTfUgwrpJDmMJaP
         Lo+cIDgE5aJUF4vKZPU+XsRG3dcDJuzv67LiQzkIM/3i/6W/amCvJUpsrVl16E6IS9ph
         ZdLA==
X-Forwarded-Encrypted: i=1; AKwUvBy4dkc1/9ty9RTyQm0KBnfO7Hj/HOjqZm+RQxdc07A0dNuYC3TJ0q6aYKLymFiBR8ZGmWEH@lists.yoctoproject.org
X-Gm-Message-State: AFuF++lliZGaKPwALxlKKzSkAp9kQwVZN2gn3UY4uOtEnPih70riCH36
	tcVYf1iAbG7RtLSiFsBt8Lc0EfwH6jPTjZhNFUXcDy5Pap9mXtWMo4buaMHk66j7X7E=
X-Gm-Gg: AYBFou2DLO0sUSxpKqaTARyPDpCNqjNNdfcDnBDWYyRIKABPSHZ1hNt5L4y5FgzN7zL
	Kd27MyiVUeAGlY659wrYhF01EOVVh3U9cKEFONt8owO04DlGYQ/eYXQe6m6ZOxu77WX6i72T63I
	CukY6pEuJwX9+IthveWM94sNHtwhNC3spHIWJs7zyJcknjh1x2How7t4Dz5Sw3RnNBxApRkuF21
	GS4dda9UhAx450NTYzlisSTFiR/n/jQXD8EeBYgORpDCP1vPCQTeM0eG3+KH7vYG6sDv/1aYY1y
	6MHe5ArAJl4YZE2QhlQvoLuosLVzX5Ikgh6LGdU1pK/OJepmrt4dsr9xlZrKIUSP9dm2eFKtJRw
	w64o4JEidZdd45rPn2QuzfTrwBwj+yNgFoIIZH2cfLwpLoBGoa2d2FVFxW99S3mrKu0lVQD9XCF
	3xn6hJkvtxa3DsqXbmg/XdcaLb4UBr1Ng1ZZxdkWkn2dZ5JTj7FSSL3EeYyqiNZdeb5h2CoHoU8
	rFxuh2y76bYZmQlAcnp3QhBFBHUmNbA7wDsD/mUubdYqkTIYs7XXMScxv80gA==
X-Received: by 2002:a05:600c:6212:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49e7a66b636mr105382625e9.20.1789504877300;
        Tue, 15 Sep 2026 13:41:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8a6f:78a6:4575:a18? ([2001:8b0:aba:5f3c:8a6f:78a6:4575:a18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83addf36sm20509655e9.5.2026.09.15.13.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 13:41:15 -0700 (PDT)
Message-ID: <910d6e3cc68bb8d244046342fda1c7c61258eb6f.camel@linuxfoundation.org>
Subject: Re: [docs] is it worth updating "Properly Versioning Pre-Release
 Recipes"?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Tue, 15 Sep 2026 21:41:14 +0100
In-Reply-To: <1d09ac5c-77c1-09ab-5eef-f86b270f66c8@crashcourse.ca>
References: <1d09ac5c-77c1-09ab-5eef-f86b270f66c8@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Sep 2026 20:41:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10516

On Tue, 2026-09-15 at 16:26 -0400, Robert P. J. Day via lists.yoctoproject.=
org wrote:
>=20
> here:
>=20
> https://docs.yoctoproject.org/dev-manual/new-recipe.html#properly-version=
ing-pre-release-recipes
>=20
> that section uses as an example the irssi recipe, which is not even
> mentioned at the "Storing and Naming the Recipe" section anymore and
> doesn't use pre-release anymore, anyway.
>=20
> =C2=A0 the only recipe i see in all of my layers that uses that feature i=
s
> avahi:
>=20
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-connecti=
vity/avahi/avahi_0.9.bb
>=20
> and google AI has a decent rationale:
>=20
> "Avahi uses prolonged release candidate (RC) versioning=E2=80=94such as t=
he
> multi-year 0.9-rcX cycle=E2=80=94primarily because the project has experi=
enced
> long stretches of sparse active maintenance while downstream Linux
> distributions still require fixes for security vulnerabilities and
> bugs."
>=20
> =C2=A0 so with a single recipe that seems to use that feature, is it wort=
h
> updating? if so, i can figure out a patch.

This is something people do need to do occasionally and I'm not sure we
have to match any specific example in the code. That is nice to have
but not essential.

So yes, I think it very much should be documented as it isn't obvious.

Cheers,

Richard

