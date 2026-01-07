Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0EFCF6BE1
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 16:34:07 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10245.1767803641567688362
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 08:34:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=apx0TDfM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so24201995e9.2
        for <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 08:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767803640; x=1768408440; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjUJZummFYoFZQWGvBjVNp24UtY9mLbrI2BN27zifk0=;
        b=apx0TDfMXI0DQrcdDA7dRO8rfvJwVnSQ6CfKlY4xdFGlbO2HuEnJlu6OyLK3qCd6qz
         y2kC4n/isOpn3T1iPocmxbcxOvjB1SBlqWriYiw2ux5LDSlXIoxjrafGeGhpK+Cl92fU
         u1GK6Npn2mIFIR4sbkUxYB+zMBcSiw/YLDUUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803640; x=1768408440;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RjUJZummFYoFZQWGvBjVNp24UtY9mLbrI2BN27zifk0=;
        b=VvvSRraf0yH6MRCpgkkQ5fCgzYRNYzEBqwyO+xCh5UMWrn8PwP4goCzDxRA98wRH20
         DkS2ZxxmNIPBk+4qQ9xixjS4s5lWEiu8Wnzu4qjNumSmMiAI2hjqqNTdkAqg5KmxGWxD
         CSjEXz0BO0YSoKHFz6JUVRO2Gn1/I8QfKVR0XDmSjQHmOgdqn/CznL0vBYnfbIlyLvdq
         AziAdVcL1Cci90hQPrKPhwMPNgUhqg1KheMoKB9ayEVfHQZKfdZeZ5CG6hkMZ9O9pUye
         Mrj6mese0EQLgqjlgVebmPqGHGJuMAHi2ccZQs7tdAZh0ltvcuaWufkyfrNEEpU3qHsH
         kb5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXINIzU1idq6cT/vjanTuct4mN7wGTJgwDIxoVq3LqDtA3XGx/5qQJQHbjA+75iaeUsWKXT@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwTNegKqo1N6FqUw3UT5fabH+lrANYnTRYyUA2xq3MoBJ7MxPw4
	E/MX5kU8yJZ3YuexHB1YS9EL1DgRPOb/mEL2Jhr9s5wOcpVycD6vDQyaTPdlvaHXQYs=
X-Gm-Gg: AY/fxX5eOqOeCH6LgWScYMKEEhNwICx661/VY/safgbUkf2o1D9CbqrDoIYDtIsIzi5
	qzQ1E5+6wk69hBft5eHNI5bptvBGns1aWJH9erX3BYzM5z5eLJebqFkQbkgoJNOaZ83pYEj6ifB
	TBj2rrA6sveQL2kdoDX/Q7RIwo2T2q/m+6rJtE0fD8Uj5Mp2XfrAsXr3H5ZdyLEc31wU8n7UpYH
	JCWdfIjNovPgNyKOUGs6v9ryujfbn831uqBoth3YWlEncQId3XfYAluTpn1gwt5fryarDWY+7xg
	Cz7LQJkaStXgfHXpoKbAGrT1pgdjpRyTS/LAnCk8GoEblUfeVkQ9pUoPE5ac4zTFN4cPCI6XKz9
	iN3EsN9rMetKyjebWpIFmqn76W9MY7Ee2rCFvwfwcMSzEH6V6nlq9D5gZFcNARbj3ifBVB1jHLm
	mPF1Z+Q/5esQ13p2tWWuxI46u0vy+B8cf2eMO21Y/L49MyYnIaQGkIuRIzCNtLs6DNlOrpBbfG
X-Google-Smtp-Source: AGHT+IGuur/MrDYV+JYbxOsmvm5gfkxcVbhJOJ7oUrcpHP4OvZUjR7MsFPUWfcUzGhkyQeBsB4ohUg==
X-Received: by 2002:a05:600c:3b05:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-47d84b3865emr34847695e9.28.1767803639938;
        Wed, 07 Jan 2026 08:33:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:97d2:bd66:800:7506? ([2001:8b0:aba:5f3c:97d2:bd66:800:7506])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c86sm108917795e9.3.2026.01.07.08.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:33:59 -0800 (PST)
Message-ID: <e5913520e7d9e07ea0e21a9ad4ea7592531b8062.camel@linuxfoundation.org>
Subject: Re: [docs] my opinion on why i think the docs need refactoring,
 with an example
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 07 Jan 2026 16:33:58 +0000
In-Reply-To: <a7e2a0dc-1509-aeb7-cab6-ee9f3f1f0a22@crashcourse.ca>
References: <a7e2a0dc-1509-aeb7-cab6-ee9f3f1f0a22@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 16:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8412

On Wed, 2026-01-07 at 08:04 -0800, Robert P. J. Day via
lists.yoctoproject.org wrote:
>=20
> =C2=A0 One of the things that has bothered me about the general OE/YP doc=
s
> for a while is that, in things like glossaries and reference manuals,
> there's too much explanatory content being stuffed into those
> sections, rather than being fully explained in a single place in a
> single manual somewhere.
>=20
> =C2=A0 IMHO, any topic or feature should have an adequately complete
> explanation in one manual somewhere, and references or glossaries
> should have little more than a one- or two-sentence summary of any
> concept, then should redirect the reader to the full explanation.
>=20
> =C2=A0 Here's an example related to PROVIDES, where much of the same
> content is duplicated in both the body of the BB manual, and in the
> BB
> variables glossary:
>=20
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-execution.html#providers
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-ref-variables.html#term-PROVIDES
>=20
> =C2=A0 This seems inefficient and somewhat disorganized, since the poor
> reader becomes unsure where to find the definitive explanation. There
> should be a single location that fully and completely explains any
> concept, and all else should do little more than link to that
> explanation.
>=20
> =C2=A0 This would make it easier for volunteers to offer to write
> documentation, since the rule would be that they're expected to
> explain some concept in sufficient detail, that would be added to the
> appropriate manual or user guide, and everyone else would simply
> point
> at it. As it is, I think far too much explanatory content is being
> placed in reference sections or glossaries.
>=20
> =C2=A0 Thoughts?

We take incremental improvements to the docs and we can add these
sections and do that. The barrier is people having time to do the work
and write the patches.

Cheers,

Richard

