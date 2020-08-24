Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.197885.1598284123482557129
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 08:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zc45kzoz;
 spf=pass (domain: linaro.org, ip: 209.85.219.172, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f172.google.com with SMTP id x10so5407618ybj.13
        for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2020 08:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rZIdcrb2ZhXF0z+AVcjZtrOz2hYQ7YqLhSCD5wIyAF4=;
        b=zc45kzozA41WL6AX0VLfWHQgWkfMeJDJiAHnKslzmfE6Fj129yUg+wXexuPlLDwB4j
         G7z4VY+1UtlMBgdoyZmxVMxceX5rzchQX+OCgExqj3VoK/W/Sx83h4QCYHjjieu3Iexi
         zsgBFS/wgOvhXS2rl0IFvnpdxf9m8vykzS/0vTazMrtnZtJ6lHEcywWWfarlM6238KQ+
         6aMG/7AZf0oCyyM7/x+90Ck1D1WdQrl3tsC1GIluiCjO9oH5y77M3jjL9/0oW0Onnd6F
         neshBM1EYc6MLK6sc4Vx8IzaF9uwu6q1eXtajXcMlTfdmHSe4blUXJmV1ziX8YWgju5O
         3kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rZIdcrb2ZhXF0z+AVcjZtrOz2hYQ7YqLhSCD5wIyAF4=;
        b=QfzuUMLshutANrth6R25fie5Grphmclg4WRrh9I+gGmkWyYr6Cs0CTex+Kr2g+7vZJ
         mmoHqlPzL0cy56TCzue/1nfSHbwbI9vhQ41MMm49w663zNnrNff7Fb5zbSjWGtWymniT
         DwUBp81yKXvarhGVyKG9kiHtan6M334yufR+rv75B4uNh0j39dA76Jik+QoYKncnjDDA
         wKvlbsxeagElIFTk2AijYIH9eymBGf27Xd+qixIZnj8f0hpjxnXirOjyYLo6/+1hTwpn
         Nagje19dz9zhW4rfZsC/yURkiT9Rt1p/4sPGr3vW4/GWmAu5mKpi+Vlub3KLe5kFaGGf
         FvXw==
X-Gm-Message-State: AOAM532LKho/o5yM6CS2EAQp37FG45fPVdVGWUCGS92vpA4mr3TFEnpZ
	HpySxwliZDC9h2nLqGZWMfRUyUpGJNqhCDu9qge1sw==
X-Google-Smtp-Source: ABdhPJyqcZIYxDogQppdX6z9gE6bPGLCIpB2g27kdQNSopf74dnvmkg2UNmAETf9dk3Yryulv7W1ubTpEZUzLrs/RQ4=
X-Received: by 2002:a5b:904:: with SMTP id a4mr8492557ybq.397.1598284122454;
 Mon, 24 Aug 2020 08:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
 <c05381ddd372bc0e82e6b24ce45df4ae2df90e1a.camel@linuxfoundation.org>
In-Reply-To: <c05381ddd372bc0e82e6b24ce45df4ae2df90e1a.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 24 Aug 2020 17:48:31 +0200
Message-ID: <CAP71WjzK3G1DPZPzoNrcK61n2duRoKsFN94dJoYyzQ0VAMdhGQ@mail.gmail.com>
Subject: Re: [docs] [sphinx] updates as of Aug 5th.
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

hi Richard,

On Thu, Aug 20, 2020 at 12:59 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Nico/All,
>
> Thanks for putting that list together, its really useful.
>
> On Wed, 2020-08-05 at 23:54 +0200, Nicolas Dechesne wrote:
> > I will be away from the Interweb the next two weeks. So I wanted to
> > share some updates about how the YP docs migration to Sphinx is
> > doing.
> >
> > [...]
> >
> > Richard is trying to add support to easily switch between YP version
> > within the doc (e.g. like the Python doc), and we will host the 'old'
> > documentation as well. e.g. when choosing the 'thud' version, we want
> > to show a static page (not a Sphinx doc) that points to the thud html
> > doc.
>
> I hope you're having some good away time! I'm sending this while I have
> the context in my head ready for when you get back. Its taken me a lot
> more work than I thought but I think I have something ready to share in
> this area now. I've published some sample output at:
>
> https://www.rpsys.net/yocto-docs/

I really like the output, and the added features. I don't like as much
how it's done though (the Makefile changes and the multi-pass sphinx
runs..) but that's an implementation detail ;-) But with the current
output we can create a standalone YP documentation 'web site' that
contains all our old docs (for all releases) independently of DocBook
vs Sphinx!

>
> Basically this combines the existing docbooks docs into a structure
> with the new sphinx generated manual such that you can select and
> nagivate around and see the different versions/options.
>
> I'd ultimately like to replace what we have at
> https://www.yoctoproject.org/docs/ with this. I appreciate there are
> four links there we still need to add into the new docs page:
>
> https://www.yoctoproject.org/docs/what-i-wish-id-known/
> https://www.yoctoproject.org/docs/transitioning-to-a-custom-environment

These 2 could potentially be converted into Sphinx RST files, assuming
we don't need them on the YP 'website'.

> https://www.yoctoproject.org/software-overview/
> https://wiki.yoctoproject.org/wiki/TipsAndTricks
>
> but other than that I think its much more navigable and usable for
> users. Features/changes include:
>
> * Clearly showing which version you've viewing (yes, css needs work)
> * Drop down selection of recent versions
> * Drop down selection of the format you want
>   (individual web pages or all in one mega manual)
> * Older documents with newer point releases show a warning in red at
>   the top
> * Obsolete releases show a warning in red at the top
> * All the releases are listed on the main page for search engine
>   visibility which should improve their indexing and avoid some of the
>   version issues we've had (I've gone back to sumo at present) and
>   make it clear to users how 'behind' a given version is
>
> I know the sphinx transition isn't complete so the "dev" manual version
> has all the issues still needing to be resolved with the transition.
> The CSS also needs a little more work to help with the colours/layout.
>
> I'm interested to hear what people think of this...
>
> Code is in the yocto-docs repo on the sphinx-rp branch. "make -f
> Makefile.sphinx" will generate the docs I've shared and the generated
> output in _build/final is designed to overlay the existing docbook docs
> and all fit together correctly.

Sphinx has a fairly advanced extension mechanism support. My gut
feeling tells me that a lot of what you did can be achieved with a
nice extension.. I will need to think about that.
See https://www.sphinx-doc.org/en/master/extdev/index.html#dev-extensions

For example, here is a simple extension used in the kernel doc project:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sphinx/maintainers_include.py

But we can interact with the Sphinx builder at any stage of the
process. For example the whole generation of the 'old' index files
could be done this way. I would like to figure out how to produce what
you have in a single Sphinx run... But for now let's focus on the
actual output you have and get some feedback from the users as much as
possible, whether this is useful.

>
> Cheers,
>
> Richard
>
>
>
