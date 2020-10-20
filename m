Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web08.2070.1603229704502886372
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 14:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O/soOdml;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id n6so4471718wrm.13
        for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2020 14:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h9/Hw0P33HTlL4x9xT5u2kpCjbaN7Sjc5yPVKMGFGiw=;
        b=O/soOdmlIHxIAHSapojhx4sLwgbzOf2QkcBODSvL3s5VTSlkfNHLpYTfH3tzDnWqds
         4BKlk+hzTVSzLIaxO0FPl+ti4TySiktrictQniEwv4vue6pRT6JZM3ttgN6DeeyYQ+Ri
         IilymB4SOjjTdTGZYqSJWB+CqPNuE6AEm+7onHrurRF0ZcjZ2ZhSxCyuOfbbAAxgvpi4
         zx5paP15vopUqI5Vsn39Ye626pJTNe/rdG3zTITOLc6Ath2vEKxUani9TC6JvxRUSfBY
         pwIcgwb8Zk4z3N5ewpHotqp3g5Ip82bd9cx8BT0oldhKccWQomRh8nWVudz1bqfyJajv
         ZnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h9/Hw0P33HTlL4x9xT5u2kpCjbaN7Sjc5yPVKMGFGiw=;
        b=SlYRZd5f+vAWJRGnRgBUt6c/tWZ29A9wM7vbUA5sdKq/fdrKfvuF/WCNHibn2Uv8aa
         ZPZt8fIh+wmVHAeb4J/gx+v+d4X8cT2HDxNn9RQMYL3w0mjiaTCLwsXTnJKQ3YhHVRFq
         VFGhe6U3Md7xbeDCwteQWevgAYQTAATUoQPPw1iQymEy5fxKXga76dmHUO4xpgVsViZh
         Sy8FyBWb137bDyFkNAF2Wbfz4tQ41ZzX1byuwyqYCJe8l3KwDxlcz08/P3IlZtx9n0Xg
         GjrVSAoGYBNSNyOAkgSJl45VF1xHxODlIpRhGZ9hQcfpDFng1RZlotSrb0+ixhb+2PbJ
         XGVg==
X-Gm-Message-State: AOAM533rxMNAYg6kVxbmklxJwEdHFwuLYApaJXhiRk1E8GO8EnLK8Nn/
	53voVPEGbLmZ5NColKy22FNKu6PquJ9iSbYbcFo=
X-Google-Smtp-Source: ABdhPJx68iNTiv0X7+NWoKJHJkVE2fp5W6QHX8Ifj3f2xPK1T5xlGg1n2EgVRQRdlTZtL3PnYgd5hFeHeNY+/ZrNIyg=
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr15564wmi.56.1603229702977;
 Tue, 20 Oct 2020 14:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201020170326.14313-1-JPEWhacker@gmail.com> <CAJdd5Gb0L4Yhwmsawp4K+muy92SW+Y3tLYA7sv9CnM108GWwFQ@mail.gmail.com>
 <9c52a04c-7184-8dfc-44e6-83a4cb7db2d0@gmail.com> <CADkTA4N+dJv_QqtEiJBxdcZXE5SxkDjDJF-+4Sz6n4+wVDYRKw@mail.gmail.com>
In-Reply-To: <CADkTA4N+dJv_QqtEiJBxdcZXE5SxkDjDJF-+4Sz6n4+wVDYRKw@mail.gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Tue, 20 Oct 2020 16:34:52 -0500
Message-ID: <CAJdd5GaXgjV8JFjh82mAbO_==m6Sgg0L-=iGTpKMn_93s38Wyg@mail.gmail.com>
Subject: Re: [docs][PATCH] kernel-dev: Add FAQ for how to use a vanilla kernel
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Robert Berger@yocto.user" <robert.berger.yocto.user@gmail.com>, docs@lists.yoctoproject.org, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2020 at 4:14 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Oct 20, 2020 at 5:05 PM Robert Berger@yocto.user
> <robert.berger.yocto.user@gmail.com> wrote:
> >
> > Hi,
> >
> > On 20/10/2020 21:14, Joshua Watt wrote:
> > > On Tue, Oct 20, 2020 at 12:03 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> > >> +.. note::
> > >> +    You will notice that this is will still pull the kernel source from `the
> > >> +    Yocto Kernel git repo
> > >> +    <https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/>`_, however it is
> > >> +    using the default value for :term:`KBRANCH` (e.g. ``"v5.8/standard/base"``)
> > >> +    which is an exact mirror of the upstream kernel.
> > >
> > > This is a lie. I thought it was the upstream mirror, but it's not.
> > > v5.8/base is the mirror and this one has a few extra patches.
> > >
> >
> > And exactly because only Bruce knows (most of the time) what is in all
> > those funny branches why not use upstream (kernel.org) for a vanilla kernel?
> >
>
> We are documented how the single linux-yocto repository can be used to
> track tip (master), or any of the -stable upstream kernels
> (<version>/base), or the yocto specifics (<version>/standard/base),
> without needing to create 'x' recipes to do it. It is just a branch
> switch away.
>
> Someone can always use upstream in their own kernel recipe, we are
> just using this doc to describe what's in oe-core itself.

There is a lot at play here; IMHO, using the branches Bruce maintains
is actually the best option (if you can use it) because those branches
are tested; I assume he's not making changes and diverging from
upstream for the fun of it; the changes fix actual bugs. For example,
I converted meta-rockchip to use the standard/base branches, and
really haven't had to worry about it since; I have pretty high
confidence those are going to continue to just work. meta-rockchip
gets to freeload off of Bruce's hard work to upgrade the kernel and
stays relatively up-to-date without much effort on my part :)

OOTH, I get that people really just want to use the vanilla kernel
(even though they probably *also* want the changes Bruce made), and it
certainly "feels" like a better story if we can do that. As Bruce
pointed out, you can do that by setting KBRANCH to the <version>/base
branch. I think the part that's missing there is that you also have to
set SRCREV to a SHA1 on the branch, probably with some strange
override? Maybe `SRCREV_machine_pn-linux-yocto = "..."` ? And, if you
do that, I think the other problem is that `LINUX_VERSION` will then
be wrong, so you might need to override that also. This also means
that you don't get the latest versions "automatically" since you have
to manually bump the SRCREV. In general it seems really easy for the
linux-yocto recipes to get out of sync with your settings and cause
confusion. We could maybe figure out a way to have a SRCREV for the
upstream branch in the linux-yocto recipes, but it's weird and
problematic to have a SRCREV pointing to something that's not tested
(back the the point of why we have the "standard" branches in the
first place, they are tested and work).

>
> Bruce
>
> > Regards,
> >
> > Robert
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
