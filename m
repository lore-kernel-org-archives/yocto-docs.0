Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87755C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 16:54:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.43511.1741625638206696466
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 09:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZxBpp8Ie;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43bc4b16135so26691025e9.1
        for <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 09:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741625636; x=1742230436; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cqH5RNA4+V94Yf+slqd6ff0/PyqOJrqIrolyj3RDlUI=;
        b=ZxBpp8IeOiWo/nrfBiusfsu3Oh4JZQX7QumL0DInd++rMeIJxOVxO+0Vl8fhIAvzF+
         G306URPl6czoLrUUQM5E0RQ/8Y/oPa5XAnqibJQJmqzGC01K2TAtBMNRUxGeVIgc50TC
         YxFErUVkByy5ci3VNerQzNg+oeq3w4cWudxXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741625636; x=1742230436;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cqH5RNA4+V94Yf+slqd6ff0/PyqOJrqIrolyj3RDlUI=;
        b=f8j/RMp1PQfoSDQum3nNjk4o3n+0MU8pqRSkkM9t1xJYQNbKAYcZFTRAg6eq8HIO/W
         09lFdm27Je/jbYzH16z26R/4FjidMxwXRZQweY36lkmgdT7Txc3q55d/YzhRZDGkzbmD
         8eAKuBSMTqu0Il/cg9yTAxriLE0UTnwxn25n3JVDOZCabl8Ie+By4lm8DGauSm7+eKha
         u8k0MDRXTEVDhgBxwXnl6MOTvWeeg8L4phVO4ptNxJqf9Y5tbNuWMz6yslbFQsBZMMYY
         7JqsCG+AeEcu08uEuO/4PODTlgeYpyYjwPthY8JD5F4ih44S+e9Om6A8KxVNGGX947+p
         vPMg==
X-Gm-Message-State: AOJu0Yylac8Kcb7KK8qW47pqcfLSpX8mWKtMRjdF4iHBs0+ng0/eq3yI
	3ifEjUGokjGzze42MwCUYOzpoRslrQuWNJegK1bA4ET6Qems1zMUdjK5HsJeneY=
X-Gm-Gg: ASbGnctZUdhhxCIsutVOKKd97cP55Va+o6+970eexI0v6xWpw2DI63dRWAhFwJde96S
	7VXSkZKBmxVAS96GHe/e2ZtU0IiTNpCFqvi7qyQhhKL64KRTkbWAcykSihYQk13fa+7r5U/1XXh
	eTzuwQfImjPPwO9bJMChSYlN3dz2vNkeBNMdekNTSyXTxTKi4rqLHmQN0lvuV/sxMFca1ueJIiB
	bGnEJ3pDVbm1jP/aLeS9q8ri2nYk/rMjCBor/0k3Dj9KFlr4mLuF14p/yFAyz18NbvdbS6NGvk2
	ywhYTCAqm5+JbCffMEzqWird2Y0oK+lZfV39tElQNtD6ak51xYnfiUSrfDUnyckl7nYVYxaJgo8
	Rw6mytxvmVMltW+tav7TjDUHIXYO6/Xd8WA==
X-Google-Smtp-Source: AGHT+IH7k0pUVMChV4dgJBu/w6RS3tmdrUsRSIHeRkxuZOP2NnWorui25zcp3EXAKCLR69wDMzo/7g==
X-Received: by 2002:a05:600c:35d1:b0:43b:da2b:762d with SMTP id 5b1f17b1804b1-43c601d90c8mr98594345e9.7.1741625636611;
        Mon, 10 Mar 2025 09:53:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d30:def0:6e8d:cbc8? ([2001:8b0:aba:5f3c:3d30:def0:6e8d:cbc8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0193bfsm15714390f8f.55.2025.03.10.09.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 09:53:56 -0700 (PDT)
Message-ID: <00f1f0d807758da4bf11c78de652f6d4b6ad1863.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v3 0/5] fetch2/github_release_artifact: fetcher
 for (private) release artifacts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: lgo@pengutronix.de, bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, yocto@pengutronix.de
Date: Mon, 10 Mar 2025 16:53:55 +0000
In-Reply-To: <20250307120055.1816436-1-l.goehrs@pengutronix.de>
References: <20250307120055.1816436-1-l.goehrs@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 16:54:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6524

On Fri, 2025-03-07 at 13:00 +0100, Leonard G=C3=B6hrs via lists.yoctoprojec=
t.org wrote:
> This fetcher enables downloading artifacts attached to GitHub releases
> in private repositories.
>=20
> Authentication is provided using tokens via the `BB_FETCH_GHRA_TOKEN`
> variable.
>=20
> Changes from v1 to v2:
>=20
> =C2=A0 - Provide examples on how to provide the `GH_TOKEN` more securely =
than
> =C2=A0=C2=A0=C2=A0 just hardcoding it in the recipe in the commit message=
.
> =C2=A0=C2=A0=C2=A0 E.g. via the `local.conf` or environment variables.
> =C2=A0 - Indent the code example in the documentation `.rst` using three
> =C2=A0=C2=A0=C2=A0 spaces instead of two.
> =C2=A0 - Document the `token=3D` URI parameter along with the `GH_TOKEN`
> =C2=A0=C2=A0=C2=A0 variable.
>=20
> Changes from v2 to v3:
>=20
> =C2=A0 - Rename `FetchData.headers` to `FetchData.http_headers` and do no=
t set
> =C2=A0=C2=A0=C2=A0 a default. Use `getattr` with a default instead.
> =C2=A0 - Rename the token variable from `GH_TOKEN` (the de-facto default =
in
> =C2=A0=C2=A0=C2=A0 GitHub actions) to `BB_FETCH_GHRA_TOKEN` (makes it mor=
e obvious where
> =C2=A0=C2=A0=C2=A0 the variable is used).
> =C2=A0 - Remove support for supplying the GitHub token as SRC_URI paramet=
er
> =C2=A0=C2=A0=C2=A0 to make it less likely that they are accidentally leak=
ed, when e.g.
> =C2=A0=C2=A0=C2=A0 sharing the recipe.
> =C2=A0 - Do not use `dict_a | dict_b` to merge the header dicts,
> =C2=A0=C2=A0=C2=A0 as that feature is not available in Python 3.8 used on=
 Ubuntu 20.04.
> =C2=A0=C2=A0=C2=A0 Use `dict(**dict_a, **dict_b)` instead.
> =C2=A0 - Explicitly state in the documentation that access tokens should =
have
> =C2=A0=C2=A0=C2=A0 minimal scope.
>=20
> Alexander Kanavin and Peter Marko have voiced some security concerns abou=
t
> the token handling in bitbake variables that have not been adressed in
> this v3.
>=20
> The security of the current solution should be on par or better than
> what we have for `http` URLs that include basic auth usernames and
> passwords. I consider this acceptable.
>=20
> A generic way to store these kinds of fetcher secrets outside of the
> normal bitbake variables would be desirable though.

I've been giving this patchset a lot of thought. I'm a bit concerned
about creating a new "fetcher" namespace for something that is fairly
niche, particularly when as Peter points out, the same thing can be
achieved with a bbclass.

If there were no other way to do this, I think I'd be leaning to taking
the patches but since there is another way which isn't too difficult, I
think that we should promote that approach instead.

One of the reasons for this is that by merging the new fetcher, it
would complicate potential future changes to the wget fetcher and I'd
prefer not to further limit our options there if we can help it.

Unless I see other people saying they need this new fetcher, I'm
therefore likely going to decline it in favour of the bbclass approach.

Cheers,

Richard

