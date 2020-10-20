Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web09.1840.1603228468835267797
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 14:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h0t8ozu8;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id t25so4834659ejd.13
        for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2020 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R9M9RkgwPll18VA1X4XrG9mYYggIM0B9o7naK/FKOEQ=;
        b=h0t8ozu85mQXDQAg+mol5OG8zFaQrc3oaTSOsC457qGvcuunuJ9dOz4ZO3rW0SSKkX
         626aLudtnVk5Dqip3DBCiJEGWnjmkw19TqtyBqZfyuVTSm7UAHdRui5x0L5yjeu1SD5b
         vxd4OuNSbS8Bh/vwHXB2cNj7geSIpQ0KErzAXQ3YYtYtBHj26ICRuCxqUo2kkwo5eJwF
         UrDRG7sc/+3z5QThMYgpQCo5QyZla0no+3bhF5ZMfVzyi/MLXhuYU0SX03N1HyIISdek
         SW+TNQuk2kZxQoWnJwY5fF/8k8sjWA7nOdmjMSZkCWK2bB8R+jtxn8HtkEfSmZfAt5gR
         NjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R9M9RkgwPll18VA1X4XrG9mYYggIM0B9o7naK/FKOEQ=;
        b=bkOcuGnLYf0pYziO01QTHZoJ8xeJKU8i17mX7WOL+ds44DcTCNrRNyH9tYIt4XJQyJ
         FQtRpdFsxJ7e0cug8yr+BsdDcjNO8bxPP1RPSb7pociDq4c7xxx94hkWGakZC+NNiWbf
         WNF9+4EB5xAMV3VNRwvF32HrsfmTfO1Y4qoecNTP2SgnqEL9DbKam51zCnnRecfH+EF+
         a79UIXHc/uQ03ZcvURdcTvL5XvxceSFABnyatbV8AAOLXGyEz7qeZAx8b+NfuGheTmGQ
         IkoCrSfrLrzSMZv4Hns9SuUaPXVw7uqs65274x+ggKFbXG6Y0VLPNfeZrYmV9ry/Ms6t
         tERw==
X-Gm-Message-State: AOAM530QWf/WSCiadyPx1wVkaeRAxPUg5IQh37F/Mm515aOIkJzW8X6f
	pxXxJtopapkNes4gtznKLDui27+5Aqppfj8H5uw=
X-Google-Smtp-Source: ABdhPJwIYvjtNJXwJAyOTRoBWaJJ8/A8Qrhp7oVPr7jO5wRthoOISAX5WYqzTXU4fNb1pcVd8cGgqekAzv6do1Ho77E=
X-Received: by 2002:a17:906:1643:: with SMTP id n3mr78431ejd.459.1603228467278;
 Tue, 20 Oct 2020 14:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201020170326.14313-1-JPEWhacker@gmail.com> <CAJdd5Gb0L4Yhwmsawp4K+muy92SW+Y3tLYA7sv9CnM108GWwFQ@mail.gmail.com>
 <9c52a04c-7184-8dfc-44e6-83a4cb7db2d0@gmail.com>
In-Reply-To: <9c52a04c-7184-8dfc-44e6-83a4cb7db2d0@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 20 Oct 2020 17:14:16 -0400
Message-ID: <CADkTA4N+dJv_QqtEiJBxdcZXE5SxkDjDJF-+4Sz6n4+wVDYRKw@mail.gmail.com>
Subject: Re: [docs][PATCH] kernel-dev: Add FAQ for how to use a vanilla kernel
To: "Robert Berger@yocto.user" <robert.berger.yocto.user@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>, docs@lists.yoctoproject.org, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2020 at 5:05 PM Robert Berger@yocto.user
<robert.berger.yocto.user@gmail.com> wrote:
>
> Hi,
>
> On 20/10/2020 21:14, Joshua Watt wrote:
> > On Tue, Oct 20, 2020 at 12:03 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >> +.. note::
> >> +    You will notice that this is will still pull the kernel source from `the
> >> +    Yocto Kernel git repo
> >> +    <https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/>`_, however it is
> >> +    using the default value for :term:`KBRANCH` (e.g. ``"v5.8/standard/base"``)
> >> +    which is an exact mirror of the upstream kernel.
> >
> > This is a lie. I thought it was the upstream mirror, but it's not.
> > v5.8/base is the mirror and this one has a few extra patches.
> >
>
> And exactly because only Bruce knows (most of the time) what is in all
> those funny branches why not use upstream (kernel.org) for a vanilla kernel?
>

We are documented how the single linux-yocto repository can be used to
track tip (master), or any of the -stable upstream kernels
(<version>/base), or the yocto specifics (<version>/standard/base),
without needing to create 'x' recipes to do it. It is just a branch
switch away.

Someone can always use upstream in their own kernel recipe, we are
just using this doc to describe what's in oe-core itself.

Bruce

> Regards,
>
> Robert



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
