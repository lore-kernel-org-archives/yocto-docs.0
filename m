Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.7041.1615287637531511762
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 03:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pM9MeMhH;
 spf=pass (domain: linaro.org, ip: 209.85.208.54, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f54.google.com with SMTP id p1so19249578edy.2
        for <docs@lists.yoctoproject.org>; Tue, 09 Mar 2021 03:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ij2zQBuxrYiVO4+quuOXbBjgPZdeIYKEx/SWgO8qsVM=;
        b=pM9MeMhHMy8mA44CU+nLnYksUtbe/GwNqHSpi393LptAATbPcjj+MEh9KzabT1aPWj
         MeKadCnQWTkh+EVuM23Q2jhdxv8o185SH/KMXbkQmJ9U8aBIGDiOG8xz4xwZthELMBhO
         0e1yRftDiLtMglBpafclvnFUECmYaZg7w463Nx/+d3pLfyfHiA+qZfcYIlq/IJF0ofRJ
         Vy7xA1UlzTOqMGfStCD/cRxopHtxCz1ovRjm0n4xhaIqSTXtvo9Amhwp3R0TgSrdBAVi
         lHaFL9LHxO4KAcoAeLbsJF0y6Gn56YGAqTJhZSqenRSb3BJtq/9PmqVtwdoHKZknflgz
         4v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ij2zQBuxrYiVO4+quuOXbBjgPZdeIYKEx/SWgO8qsVM=;
        b=ibnRDGoqg4zwi0uuNAXA71kBEMk1tC5aRounQfQYpt/rFpQxm47HLnzKwDc56ofN+l
         fseJpSlBzuy27MIBdCySlJ/IZIdFAvo6y8F9An1MnFfzw3KObRLyXytTsMO4t8Srh7HE
         TUe+qh0nXWSQg06Z3z6S8vWB7Yust9GJARv+4BD+9WN9mfnFD6uJxYRY7YQDAzpNg0e+
         ZZAMTcigWbCdC5jJd5rEmDRKRFBeEp/5++thlrhlaRbrg/3eAHv5gSrxWZzW86QVD7uC
         YjB/rWodxtaKEBpi2WZqhRBXjL5LFgIW/OzCna2Ooxs1KSJ6tZF8drtRuBm5vcIymnP8
         ItzA==
X-Gm-Message-State: AOAM531HO62tLsBfgpCPFtyO4qyVkOVg4p0Ou7PrQrg6dFhDNKUM8tOP
	JhufCFG1i5Wealfws40N59q3picyfutjjIG9DwPmvA==
X-Google-Smtp-Source: ABdhPJyUUeqrUXmHWX9IDwTWYuA4nYzl6t/RcQSQZA8xb/jRgtrtS9vb911LEj8oMTcI3gsGgdhap6UHOorHF9UyXSA=
X-Received: by 2002:a50:f391:: with SMTP id g17mr3348867edm.26.1615287635909;
 Tue, 09 Mar 2021 03:00:35 -0800 (PST)
MIME-Version: 1.0
References: <b1323c30-5681-20cc-af2b-e38f56c1d22f@crashcourse.ca>
 <20210309101702.g6y4lvp2b3wnfakn@qschulz> <544513ce-f46d-14e2-dff9-bf394f315d@crashcourse.ca>
 <20210309103055.cfqkohjoxq635r2g@qschulz>
In-Reply-To: <20210309103055.cfqkohjoxq635r2g@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 9 Mar 2021 12:00:25 +0100
Message-ID: <CAP71WjwZR85PzS-dZBsFDGhto+HY1rmXyAe=4VjqTRaycVyjYQ@mail.gmail.com>
Subject: Re: [docs] rendering double dashes more emphatically
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 9, 2021 at 11:31 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> On Tue, Mar 09, 2021 at 05:27:31AM -0500, Robert P. J. Day wrote:
> > On Tue, 9 Mar 2021, Quentin Schulz wrote:
> >
> > > Hi Robert,
> > >
> > > On Tue, Mar 09, 2021 at 04:58:54AM -0500, Robert P. J. Day wrote:
> > > >
> > > >   reading bitbake user manual and, in section 1.5.2.2:
> > > >
> > > > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-intro.html#executing-tasks-against-a-set-of-recipe-files
> > > >
> > > > in the first line of the second paragraph, the distinction between a
> > > > single dash and a double dash seems to be pretty vague since, by
> > > > default, i believe sphinx renders a double dash as simply an "em", so
> > > > visually, it's just not as clear as it could be.
> > > >
> > > > one possible fix is to mark up stuff like that with ``...``, since it
> > > > seems it should be monospaced content anyway, and doing that renders
> > > > double dashes nicely.
> > > >
> > > >   thoughts? other options?
> > > >
> > >
> > > Considering in Yocto docs we usually use ``--options`` when not in
> > > code-blocks, I'd say it's pretty safe to do the same for bitbake
> > > documentation.
> > >
> > > FWIW, I (or anyone else?) haven't gone through bitbake documentation
> > > since the move to sphinx to fix the leftover of the migration. Heck, I
> > > haven't even finished Yocto's one :/
> > >
> > > Please send a patch :)
> >
> >   last question -- should patches to BB manual be sent to the YP docs
> > list, or to the bitbake-devel list, since BB docs are part of the BB
> > checkout?
> >
>
> I don't remember seeing patches for bitbake docs in my mailbox. I'm not
> subscribed to bitbake-devel ML, so I'd guess you should send to
> bitbake-devel :)
>
> Send a patch and people will tell you anyway :)

It's bitbake-devel for bitbake. Though I wouldn't be against sending
to yocto-docs as well to get more visibility from our sphinx local
experts!
Richard?

>
> Cheers,
> Quentin
>
> 
>
