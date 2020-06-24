Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web12.14931.1593008843594559561
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 07:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SGxkM6/o;
 spf=pass (domain: linaro.org, ip: 209.85.219.172, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f172.google.com with SMTP id t9so1114267ybk.9
        for <docs@lists.yoctoproject.org>; Wed, 24 Jun 2020 07:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B0oObvjWzpzw8hx73c8FFiHnhiBiFXgMkN74G74c0rc=;
        b=SGxkM6/oHcPcElvKsemmvLlJEbubdJ1c7IRaWsJMkmEx4D1ItyxaqVksPr7ZbY08ra
         G4BwfVTFOu/ENIvZxxOUVJgh69AMX3WYz2GbzzfCbdeYb28+jiwqcEyawXvvJBV9WrD6
         5ZPKNmgjQ36j2hgFX/VSPCxR2YrDqU5iqx0+NZTdPNJ2OsAIXVYjlODErwqzYJpOTZkY
         hzwIWVYMJL7CJemXLRcO//E216OIFO6E6Mtq7Pd19WfUq32g6agdAb5n68I10lFqr9Wz
         BZclYg0mNMqmPW7iUJQ4xFYrVL9fYJFsJk/Jzvnht+NFHXTQ6iUJ3ACFdJPHrS69Bp4e
         UFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B0oObvjWzpzw8hx73c8FFiHnhiBiFXgMkN74G74c0rc=;
        b=WphQ+Rmai23Z8kvxWx8M5GmwGFOoJWxp++dyydOmUKMrbwTQiYUOf74Eki3dgdndda
         Jl+OZotJpsU9ehtI3SqNe1WXQalbl3FnfhwIAxJ5BUk01ch1ql/kTQCVAv8IlyIVorst
         x9yVCMK38hs3iazpLbpLqJnXod9Nw/EUbEQgEEEud6WqUQXP3ZJlditNdlaLazxnjBbg
         xwFYoIEEJ8fBryb8Qd7wCBtrpaanRMT9vCk4Z6feVTqW//HPwac926SV41kJkQHPwiMU
         lFgg7bN6HQ2sOszgqarm/zdyYjbxJpt3tyM1awlF4VPs5Vd3J/R1WE/S3IG4gVkOTw1E
         /Suw==
X-Gm-Message-State: AOAM533NehE/t7tvj7QY1l/mhMTfsZwhfV3phExx3v6nDaHwM/uMd/Xr
	GxqhEERfy4J8FKlfd26eTnX+B4eFFXW2f7lgFefu4A==
X-Google-Smtp-Source: ABdhPJz6EjvD04PDfYmBKGkC+op1HhMO5cuCa4OgtCb+fQQfbOluU52tN+8Cvn187uhhS3krLk71zwSCurZXpRm0gUk=
X-Received: by 2002:a25:dacc:: with SMTP id n195mr29132275ybf.475.1593008842620;
 Wed, 24 Jun 2020 07:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <brBieKgFlfS0C1xLUD5I5LQ0ZKxNBkhcCwKfuzqZTPTQv9slA-1bH2sneuut6k6lMlCO1n_03w5D65oBcbwU2u9Q3ZdmvT-vUWqrLI2jN5c=@protonmail.com>
 <a1ce3e159c94a1826ff718670c8e3bb2195c155c.camel@linuxfoundation.org>
In-Reply-To: <a1ce3e159c94a1826ff718670c8e3bb2195c155c.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 24 Jun 2020 16:27:11 +0200
Message-ID: <CAP71Wjz3=ugDGyfDirANko1KSXC-3qkfYGsuMAkuQ4QhTamzWA@mail.gmail.com>
Subject: Re: [docs] Modern style documentation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: marius.kriegerowski@protonmail.com, 
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 24, 2020 at 4:23 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi,
>
> On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski via
> lists.yoctoproject.org wrote:
> >
> > Dear Community,
> > I would like to motivate a re-structuring of the documentation. The
> > single page documenting mega manual is great as it carries all the
> > information. But at the same time it is hard to navigate,
> > overwhelming for early stage users and hard to pick up where started
> > earlier on.
> > Are there plans that break this single page documentation?
> >
> > To be more constructive: I find it very convenient and I highly
> > recommend a permanently shown navigation bar, highlighting where the
> > current content is located. This allows to find information again,
> > even if a user only has a vague idea where a piece of information was
> > found last time, simply thanks to the iinherent structural pattern,
> > not only the text describing the chapters. Let's take advantage of
> > the humans being better at remembering shapes and patterns rather
> > than text and content.
> >
> > If this undertaking is already on it's way I'd be happy to join.
>
> I did notice the discussion on irc.
>
> FWIW we're in the middle of planning to migrate the documentation from
> its current format in docbook over to sphinx. I think that should give
> us more options for what you describe with navigation in amongst
> various other advantages.
>
> Help with the migration would be much appreciated and we'll keep this
> need in mind as we work through the details of this.
>
> I do think we'll end up with some kind of combination of both formats
> since some people do need something searchable/scrollable but I realise
> others need the navigation interface more, there is a place/need for
> both.

FWIW. you can check our current work-in-progress thoughts on this topic here:
https://wiki.yoctoproject.org/wiki/index.php?title=Documentation_Sphinx


>
> Cheers,
>
> Richard
>
> 
