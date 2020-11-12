Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.1086.1605166184164053693
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 23:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ndxbR6RL;
 spf=pass (domain: linaro.org, ip: 209.85.219.173, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f173.google.com with SMTP id 2so4389210ybc.12
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 23:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BnBvRj9ynRgl65xjiSjFBYdNMtpGN1VraEXhEtEDnw0=;
        b=ndxbR6RLKbYe7wLiMDlEUxsPXCQkF6LCz9UMTMtGI09ELY8lGssaypGE8UUnsmtiQ+
         e6wyHjNDZ2IWQt4OjhCFyi331cTFt3eSuYqtuhCflARgK4T6D+xAzcNdLNIB+BjIiei8
         w06JWTlYgKSaB/LnW/gb37gY656KaDDZWHNs6hQ9zGRDrDjrpbWnUMCR7zT1GRFkT2XS
         CA2xouDG0Aa8QEICnZ5M+FlwvRHf24mXtSubOwxdYoMVYn+F7YUJ8gEoQH8iSpTYgJbn
         qFbXS0swspvo22P1mkV45XxIKxXHjKSUukhbYpKAwZP9nNLf40lqa+xwOY8VutT2C6bH
         sOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BnBvRj9ynRgl65xjiSjFBYdNMtpGN1VraEXhEtEDnw0=;
        b=Agc6e6ua3OMrXoZin9Js9fE/1fWgc4urkyhoH1rOVX2QauCuNXbKfzeaB86r9D/OnW
         H4tD9RdYWRcBUzZIJ3xX5HoS3mAcfqpvvTtALdZj9I9iHoctiGMjTvyZJAadGwRuREci
         KVs4qyyCixhjH/fctUgD24rRE4WMJILgBr0yup26Ym3JiSJUtcI4mVjuKPdO3I4Fkstf
         2y5Nz5VIU+kqcuKYQNl4fYVqLV8Mo4kqn4LXUAdSWf06+OgHkYbZIVdR2SdoKAWBy6I0
         toRSSK7hmcrIuYo7t5OykcT28iCl0v829AJpNia4p9+A/h8DQ83gsGZ3TM45xDxMpOWl
         MKGA==
X-Gm-Message-State: AOAM531JuOM/nhfjSbPZSb+gsKlLdRXrjYWn6MRhBnD5UNLY8VdJVnLr
	QbIwLnUOdbqSwedJar2JOBtH5r+HUGxTdK9P8yU/ew==
X-Google-Smtp-Source: ABdhPJwkjZEYlAeioz5YjqlpL7JT08oV+B9tyyh0W3bzX3AwyGUlov063maNjOgRde7OOTXvun2kmB6gdWe40v/qZEY=
X-Received: by 2002:a25:80cd:: with SMTP id c13mr43788167ybm.371.1605166183159;
 Wed, 11 Nov 2020 23:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20201110212917.25172-1-JPEWhacker@gmail.com> <27534.1605130210340595078@lists.yoctoproject.org>
 <f4daa05e-8aa6-c817-fe51-910c0f9d0a69@gmail.com>
In-Reply-To: <f4daa05e-8aa6-c817-fe51-910c0f9d0a69@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 12 Nov 2020 08:29:34 +0100
Message-ID: <CAP71WjydMC_00a6YMWo77Pv39C7hwMYoVJt_sOOTsF5U1rxc6g@mail.gmail.com>
Subject: Re: [docs] [PATCH] documentation: Add Pipenv support
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: shantanoo.desai@gmail.com, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hey Shan,

can you please avoid top posting and using html for emails to the
list? this makes it harder for us to follow.

On Wed, Nov 11, 2020 at 11:05 PM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
>
> On 11/11/20 3:30 PM, shantanoo.desai@gmail.com wrote:
>
> Hi Joshua,
>
> I would suggest adding sphinx-serve as a dev-package to serve the docs during local development/tests.
>
> I'd be fine with that. We can see if anyone else objects, or we can also merge as is and add that as a separate patch.

I never used it, but why not. I just tried it, and it worked. But it's
definitely another patch on its own.

>
> I was able to serve the Sphinx-RTD on my machine simply by executing sphinx-serve in the documentations/ folder. Maybe mention it in the README too?.
>
> I think Pipenv might be required since I was digging into the Algolia Search Indexing and there you can use their document scraper with Pipenv as well. (see https://docsearch.algolia.com/docs/run-your-own/)
>
> Might be worth the effort, since Nico did mention plans to use an indexing search for the new docs.
>
> Would love your thoughts on this.
>
> Regards,
>
> Shan
>
>
>
>
>
> 
>
