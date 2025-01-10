Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514B3E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 11:56:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.16735.1736510189904533011
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 03:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HMWrKLIa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43623f0c574so14830035e9.2
        for <docs@lists.yoctoproject.org>; Fri, 10 Jan 2025 03:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736510188; x=1737114988; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e6BtV3ehoLP6laKq+0KnEqIlX0kSoZeTVsj0uNLKjTg=;
        b=HMWrKLIa4HG4yn+dFgQDP0cQwlgeYLb0ovZScPnqC1iVcU3aDP43lBjZj5C+Z9vywp
         e1WHgzE4PF8nLjshyErhXy7bG4tLhWemTmufQduGKnxxDJihTVAkTZEn6BC66m6aYjrr
         rwJ+JYff/AstQzroB+yBGs725k/eK4y4C+qC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736510188; x=1737114988;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6BtV3ehoLP6laKq+0KnEqIlX0kSoZeTVsj0uNLKjTg=;
        b=IgrmZ7ETHGTY0s+Sr8XOCVANJn7Rhd/Sk8FeEPpNWBIsCjXW5+yfGbGVSff7jND6x6
         ebQPxRbFC86ERreBkpUc7aOvHFK8PwzN+JTrTrqT3KVPpxqa5aLvthY+TiWZBokJoErz
         uKL4JjyCYFYf4QWtyKO3QcG2XPJCnsJ7M0M612uDCI46oSeajNw6DoS26szxZCxwuQ8F
         JkZVGZNvXzTeMOGB8JHMOoct9UI4NOtD+wcRfaWk1x/WEjAztwOWOFZ1Fu+gd8rjLA8n
         eaMBpzTegn42kMoeVevixKO1DA3jTNYUcGbX40UugVNtwAVKn2mDHDiinkOxhChaXHQf
         BFdA==
X-Gm-Message-State: AOJu0YzBLu5+xwyJUDVeSH4LFDCRIiWnL3+R14LHFQ54uHDF1CRbasF9
	t4z6ixy31Ys+ZEqcqQKCXFZ15Cq7mGXB1ukdfSQb24DwIBi4mH2a1CHtsEn+35mg5trHJZocBzx
	LFOk=
X-Gm-Gg: ASbGncsUZevpSuVw8GUImqa6djZSuf5MzYKi7dM6VTVIgaGcJz8TbYRfuJQHe1TymN1
	KVxx+1pk/kVjE8wkhhmuADy6OknLcPmJ8cFBVdajdbrWserVmldJO6Sv+tWZpMkVij80+Bnvu6d
	toDUnxRta2Cu0WwGgOGR9Lr8e+KxkoyCnvXzY8T2mjKF2808GpiuXFNKYUelRaNsxWOIsGgARws
	Lv7YGU7O4WSxL9HBztjcui9oYfCpt1vXqln9SsasQcJVzHEGAQH6qS7MoNQUMYizoAq3NwfPtIf
	OZScWgXxVB5Bkbu3xtPEN3UDWWDTv5vLOqCcXDzatmFnXA==
X-Google-Smtp-Source: AGHT+IFW3P6816jXODf5Vaj6Rl8fOTPYa4enULzSAHLWvdYV1T/hB2hKvoxiMWxe/rgySt1BLqglCg==
X-Received: by 2002:a05:600c:1d14:b0:436:5fc9:309d with SMTP id 5b1f17b1804b1-436e26f6d81mr39422405e9.30.1736510187734;
        Fri, 10 Jan 2025 03:56:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d75e:67c5:40ee:6f3d? ([2001:8b0:aba:5f3c:d75e:67c5:40ee:6f3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d7fsm49808055e9.32.2025.01.10.03.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:56:26 -0800 (PST)
Message-ID: <39d5e40368d56f8c4f7e0c74763734393b4e9aa1.camel@linuxfoundation.org>
Subject: Fragments documentation tweak
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Jan 2025 11:56:26 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jan 2025 11:56:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6080

In testing the new fragments code, I've found a rather important
"gotcha" around file ordering and user expectations.

The expectation is that users can lift local.conf entries into
fragments and they'll "just work". That isn't entirely true.

The fragments are parsed after local.conf, since OE_FRAGMENTS might be
defined there.

The result of this is if automated code appends to local.conf (as for
example our selftests do), the appended variables can end up before the
config fragments after this change.=C2=A0

Previously, if the code was in auto.conf or local.conf and then
local.conf was appended, it would have looked like:

X =3D "Y"
X =3D "Z"

After moving to a fragment, this means if you append local.conf with:

X =3D "Z"

and then the fragment does:

X =3D "Y"

the fragment will win.

I'm not sure how we document this but it is potentially something which
will catch users out. I doubt there is much we can do about it to avoid
it though.

Cheers,

Richard



