Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EE2CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 10:23:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.24015.1697711006367095699
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 03:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h5p5aw/Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso13442305e9.3
        for <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697711005; x=1698315805; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hDXJKDHOnN7/Yh1dgEJ16Qqx+KcUTQQY0dCg6iGl4IE=;
        b=h5p5aw/Z/NncmYB5kYAbOMFBTaX5q59fpYVtB83L7cbjWt1QtJd+gNjah6PcjqGWGp
         /6CizuelmhUUodksYraUCEKhQYkhMprHLDDK0EvvGYFZwN0Pm2wa6g5KZVQjNfwt/UW4
         Ivl98CjbkbA1aBQZ0WTlysQJkUbL/oPIoXuJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697711005; x=1698315805;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDXJKDHOnN7/Yh1dgEJ16Qqx+KcUTQQY0dCg6iGl4IE=;
        b=hk3slnyQH1cbI29SMXZp60UhXV1+1FsUFNujzj1TsmV8HvKd1pZQPVojl6nbt5XRZr
         R6xCYDUPnXRbag8BfneXCFfDtTEyq4UCiCE9tp1Jl9WejoCTIM4pU6crPoyedZHWBgGZ
         1nRbKKEDIfF1CTpWHKKyfgJObGbRjNnfcuxQUnKoKRo0NUumkjG+i7cCxDw0Qbtp5hv0
         SPT/+FTc8vsK53vg0KR9OW3+2FEowUBgdGejdbT6P87Jl5Q/MIEX/JGeXF/Gu/pxyWwQ
         gsuLuqJxF5l0bZeLnsJ9wbBs0EpzXx9+vINDv71tiYHTK57JpXzOlx1df5kCEVCd9Z+r
         MTpw==
X-Gm-Message-State: AOJu0YxRmkLc47rQUevb1kJcvr2XluBE9Q/vt0sjMYM9OB+SuvvcEQHt
	3IkAcsexno7p0QqwYfnyo6QpUg==
X-Google-Smtp-Source: AGHT+IE/NeFJpd4+Sz8QkRyNsCXZA/h3SlzZiJfl4xJq1ww6rh0y51CpoC9ST79C+SI5QVE2gnLJew==
X-Received: by 2002:a05:600c:a29f:b0:404:6ed9:98d1 with SMTP id hu31-20020a05600ca29f00b004046ed998d1mr1430808wmb.41.1697711004731;
        Thu, 19 Oct 2023 03:23:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb? ([2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c450d00b0040651505684sm4093119wmo.29.2023.10.19.03.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:23:23 -0700 (PDT)
Message-ID: <0518c8c52a102972f5c201d9d5e911cce1c3d72e.camel@linuxfoundation.org>
Subject: Re: [docs] [yocto-security] Documenting YP processes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Rich Persaud
 <persaur@gmail.com>
Cc: Marta Rybczynska <rybczynska@gmail.com>, YP docs mailing list
	 <docs@lists.yoctoproject.org>, yocto-security@lists.yoctoproject.org
Date: Thu, 19 Oct 2023 11:23:23 +0100
In-Reply-To: <CANNYZj-Rrb79fXxTJcmWsiOVBQc7=BFz3AvgWLan9195BuoakA@mail.gmail.com>
References: <6E691FD5-CD71-43FF-9BA5-BC268F3731EA@gmail.com>
	 <CANNYZj-Rrb79fXxTJcmWsiOVBQc7=BFz3AvgWLan9195BuoakA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 10:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4421

On Thu, 2023-10-19 at 11:27 +0200, Alexander Kanavin wrote:
> On Thu, 19 Oct 2023 at 11:21, Rich Persaud <persaur@gmail.com> wrote:
> > On the broader topic of CVEs, there are thousands of reported security =
issues in public code, which are never [1] assigned a CVE, due to the workl=
oad of teams which assign CVEs.
>=20
> I have a fairly radical viewpoint here. I think this whole business of
> backporting CVEs is an unsustainable dead end, which already misses
> out a lot of important security fixes due to many of them being fixed
> quietly with no publicity or formal process.
>=20
> The only way out is for the indutriy to transition to a product
> lifecycle where upgrading the software stack regularly (and if needed,
> rapidly) to supported, current upstream releases is the norm.

I'm not sure that is so radical :)

Ultimately, software does need to become easier to update and to do
that you basically need extensive automated testing so you can be
confident in making new releases. We're trying to do our bit in that
regard!

The problem won't be solved overnight though so in reality there will
be a trend towards it for a time. I suspect/hope we'll end up at a
point where software can be updated a lot more dynamically.

Cheers,

Richard

