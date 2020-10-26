Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web08.1165.1603735230724319894
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 11:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RCr7mSNu;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id h196so8422471ybg.4
        for <docs@lists.yoctoproject.org>; Mon, 26 Oct 2020 11:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hd5+xHdru97M9JkmaF7UyD6FgyEV/YpR9wqTmsfu0tU=;
        b=RCr7mSNuVThHZ0OizEKRaL1SBfAg97hTYiYNOm21pgBne+zXEJh0KU/0gPENiotsDX
         oJIZSQaQsj1xvaNG1qfGHyQtMnv9r1w2LrhQQsn6+ye0hclVl5JCTbnSoB3DIKa+N0yH
         d+7ChJAELXoXj7TFM//FrmRClqGbVQ6xtmJtDxixk5ZszMIzfu7PNQ/9LH5ufWJGphL5
         8OpJeFKfSBxPrDjgheFpROGCyoaSpwuva0fsxDILa5acRlXQnOimsr+rVSiIJmJIg7UA
         ilr9ZZkGRAs/vo17hjyk+tLvn7TDlUyntLadfgBY0xLIQ7NGlLzwgROADRp49Dd8m1TH
         s5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hd5+xHdru97M9JkmaF7UyD6FgyEV/YpR9wqTmsfu0tU=;
        b=qBhuMfEq24wUWclBnfkgbMeTW5r+/LS0DwZwQizB1iZWl/+VRd3WLnVgMPWB9RX4H7
         +EXnpcXHE7fIMTLfK84yDGM5fPFfsnGild39s98f6a4LcRq9OYwUtnNCcXEFEhzVFG0T
         Fe2cqOz9HPpfeRm54J8q1CQjS+BTe8Be4CKgGmMzBp3UqkmcWXtgxsBcKb+GOcX6lpLM
         hlEzUJKRDDDG55XXWi8Vy09DDszalqx6Ok5QHiVrShIe57s0XyRPg6nSSNJa9pD4SZl1
         hT9PHURQPYIaNzcr3be+Ox1SYAfTAQHEwNVa+7y/mJpgg1jTXZt+/bBtCmd+WdDhOOg6
         BGTg==
X-Gm-Message-State: AOAM5334eB4k0COM1GYBGOC0MsgU6njheTvpE2EPLAUBnuj8Uq7yridR
	YEdB9intGZW4cX/GlLM+iZFzYAdcY46Lg4bq4haWjA==
X-Google-Smtp-Source: ABdhPJxsHiDpS4AFFKd8GymaX5QhTB3fG2unNlABG4XZCOrfaolm2B4vIvNkLkGYNRAHCQIhxUk4fCeUa+C0L72BBNk=
X-Received: by 2002:a25:3813:: with SMTP id f19mr22354672yba.373.1603735229694;
 Mon, 26 Oct 2020 11:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200917210947.51974-1-foss@0leil.net> <CAP71Wjwm_LYCVGAhm8O+0tC1K=aCLhwjmF_j5mh_gJGi4nYmJw@mail.gmail.com>
 <20200918081406.zr6u2evo55tfmgvz@qschulz> <91be94be029787448f6fb8c43eba8525@0leil.net>
In-Reply-To: <91be94be029787448f6fb8c43eba8525@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 26 Oct 2020 19:00:18 +0100
Message-ID: <CAP71WjywKHU7knyj5Fee1EHjssFDo8HvE_ERGKUB3D5jzQgYiw@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] docs: static: theme_overrides.css: fix responsive design on <640px screens
To: Quentin Schulz <foss@0leil.net>
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2020 at 6:47 PM Quentin Schulz <foss@0leil.net> wrote:
>
> Hi all,
>
> On 2020-09-18 10:14, Quentin Schulz wrote:
> [...]
> > Also, I've spent an hour or sotrying to find a solution to make sphinx
> > detect
> > static files changes but couldn't figure anything out.
> > Beware, removing the _build/html directory isn't even enough to copy
> > newly changed static files. I had to remove the whole _build directory
> > to make it rebuild. There's probably a smarter way to do it but for
> > automation you might to know what does not work well for now.
> >
> > c.f.: https://github.com/sphinx-doc/sphinx/issues/2090
> >
> > I didn't want to go the route of the last comment which is ALWAYS
> > rebuilding index.rst and didn't want to hack to much.
> >
> > So, static_css_files and static_js_files are copied only on the first
> > build but not later on.
> >
>
> Just to update on this, css/js files aren't watched over. However I
> believe this
> is not an issue since css/js files are **always** copied when at least
> one page
> is being regenerated. They are just not copied over when they're the
> only files
> changed. This basically makes css/js development/debugging much more
> cumbersome
> but it's fine for production since there's probably always going to be a
> commit
> changing at least one doc page soon after a css/js change?

For production (e.g. what ends up on docs.yoctoproject.org) we are
still trying to fully automate that.. but for sure, we can force a
clean build for each push.

>
> Quentin
