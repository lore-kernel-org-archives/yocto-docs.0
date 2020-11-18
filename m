Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web09.31008.1605732723614425561
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 12:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ikhYstgZ;
 spf=pass (domain: linaro.org, ip: 209.85.219.174, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f174.google.com with SMTP id l14so3022414ybq.3
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 12:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5V3oYU233pRsClNV2lWYWWd7thAxVtueHYehgvfALIM=;
        b=ikhYstgZzK230qUQ5oK45zzs707u3pEAInuoGWfmt2TzEEPATqeAtStQLjB+xP0GZ8
         n6dJf34oHqrqCrTudKO+a/QKHkwEtKv6gl6au0YPiFhGbgBluz1LFrrx3V1B9OtE3oG+
         1KC8YCv2l5tbz9wkXexY/UQjWSDLQ/4jEqhTpIsGDmwGaiOKKI0ZvtlNfhGKYNFG5lII
         33XbM0734jdwoppCTkV9OqluSzgFnAm/GQCy4fe7/Ix+/gOsG8WF001Im1KnQx9YII9V
         FLZvFbVEyiq7wc/dWh+jpYriB9lz04S1q3v18CoCwFUkQQlbvrwnbMjTGuyfv2RUoL+I
         O8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5V3oYU233pRsClNV2lWYWWd7thAxVtueHYehgvfALIM=;
        b=U2lAY6DLKgEs758TiJU9OPiiVAy/Ix5b/LCaWAySN6ANa5ygfJAkvSPcCB0fTNveBj
         XJFURQfxIs5zI+pDiCLCFZ4teX51LUgwAbT27CCZ1H8b7lhtwQsr/0yNO2dPkDb7g594
         4LUOB+65lFDDGAahEFTxX5B6p7EWYe0Y50qZVsyZeePVuyVDpvC9Wtm21txKuNa41AoU
         Rvnhl/94twWLwDM2HHx9SvEsLvhKpLsWf8q+4ZSe4iH1p0mp0VTfVCj79ZoiFpEeI04i
         Xinbb51Q2fXQLxne6bnFeG0EFgDQAkhypa3hVQdlF3emvhgecd6Ivp+5sWraouz6aaan
         2Qjw==
X-Gm-Message-State: AOAM530O9RxKy0E3bFH3pa+NgqFF4NpUYfK/bIyKw/BGo0JwsOA7RlDw
	dVy5uGito4CUxdpiOmmcVDlkVepBskzWizHtYpersgCnz+QFvt5Z
X-Google-Smtp-Source: ABdhPJx0vOgooikGRvAsLGxlAXLU2Nlo+m2xMvkUi1snl9+T7i7f3iV0bCQvUDNa8T7e7ZbiiSgJZniRYptciZEw1lk=
X-Received: by 2002:a25:9b04:: with SMTP id y4mr7488638ybn.397.1605732722539;
 Wed, 18 Nov 2020 12:52:02 -0800 (PST)
MIME-Version: 1.0
References: <7db04884-5aad-bb6f-e169-d4aa276cb3e@crashcourse.ca>
In-Reply-To: <7db04884-5aad-bb6f-e169-d4aa276cb3e@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 18 Nov 2020 21:51:51 +0100
Message-ID: <CAP71WjzgKBOKxkmyrgLGvCu8NVAYn8iWe-BOukpTHiEhifAttA@mail.gmail.com>
Subject: Re: [docs] couple more observations about bbappend and BBMASKing
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hey Robert,

On Tue, Nov 17, 2020 at 6:36 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   i'll throw this out there as possible enhancements to the docs as
> i've run across this on an occasional basis.
>
>   consider, say, an OE recipe "fubar" that, among other things,
> defines SRC_URI to include a couple standard files that it installs in
> the normal places:
>
>   SRC_URI = "... \
>                 fubar.service \
>                 fubar.conf \
>                 ... "
>
>   first observation is that it is, of course, reasonable to define a
> file "fubar_%.bbappend" file to override those two files but, on
> occasion, i've seen a bbappend file of the form
>
> fubar_%.bbappend
>
>   FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>   SRC_URI += "fubar.conf fubar.service"
>
>   do_install_append() {
>         ... whatever ...
>   }
>
> it is, of course, unnecessary to append those two files to SRC_URI as
> they are *already* part of SRC_URI from the original recipe, but it is
> surprising how many people i've run into who don't know that, and
> assume they *always* need to append to SRC_URI whatever files they're
> supplying with their bbappend processing. (doesn't hurt, of course,
> but it does demonstrate a misunderstanding of how SRC_URI works.)

I would rather say it's a misunderstanding of how bbappend works in
this specific case.
Looking at the documentation we have today I think it's already
'clear' and explains well what a bbappend does, We even has an example
that is exactly what you have above. So I am not sure how it can be
better, see:
https://docs.yoctoproject.org/dev-manual/dev-manual-common-tasks.html#using-bbappend-files-in-your-layer

If you can find a better wording, or perhaps another example to
insist, feel free to send a patch!

>
>   also, with respect to BBMASKing, i have on occasion seen someone
> who, when starting a project, decides they don't need the
> do_install_append() from fubar.bbappend but *do* still want the custom
> files, and proceed to BBMASK that fubar.bbappend file, not realizing
> that by BBMASKing the bbappend file, they're taking out the
> FILESEXTRAPATHS... line, thereby de-activating the custom files and
> reverting to the original ones.
>
>   thoughts? is any of the above worth adding a bit more about?

Here again, checking the manual:
https://docs.yoctoproject.org/ref-manual/ref-variables.html?highlight=bbmask#term-BBMASK

We have "Prevents BitBake from processing recipes and recipe append files."

>
> rday
>
>
> 
>
