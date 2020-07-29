Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web12.1383.1596008215351262805
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 00:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oEtj16sD;
 spf=pass (domain: linaro.org, ip: 209.85.219.174, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f174.google.com with SMTP id a15so12028612ybs.8
        for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2020 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=akx8eJN6SAaD15EZZVmq4MrTw8UH3FHDq5tBQ5gPGZQ=;
        b=oEtj16sDcoMnsg8O0r+MP7k1cW4tQbaU3iUsp/Qgt7Qw7OQipXreD4eI9OYFBx4ONe
         5WXQpSrk8DXwBHYrZAv94+C4pZofH9vRJpaTmfxISQmIzmNwptC51Z3wqVqRwJI7Oa8F
         WUwXJ0p8en8L8zdz1cB/OW/UgalTjCCqTsye/VUn8BWfxZAu5on3y1mHElisvKHwAIF5
         dk+VOizR5n9a6zBrbGFgJcyhSXYrjpanQXpHg1WRbMOBDPe1LU7HYRNVpEtEF/cew3JG
         D1TvGR+dbLJw7HSANkWW/On5xiRAd0ga5UqLW/TREC/sRCJ2Dao5YIOMP6u9UcfAVy+X
         kjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=akx8eJN6SAaD15EZZVmq4MrTw8UH3FHDq5tBQ5gPGZQ=;
        b=Clnk8Oo1nWtZ7RTeip9EzHzpRvBITmXWIy3x3U59kWlsQVf55TpF/SINRu5OWkV0pZ
         mjN7AsxtUJaHdmaGT5r+xkbDlWGvjMj999wG8sldhNJpfnczDXmQZ6iWzH9XdxAdL29Y
         aDZVKyIFHTrN93CKdLKFv7j9ayHocV2rBQG/6NoXT/2E7yLiZjGB3A/esGdT6BfcFDt5
         rDNRPcdoKsR3+Idu/4QAo0FTbPfoSTaEWTsLnF2D7PAKYWQGzWnAdySdJw3ysuCu2stP
         QMFXquCXGztwxx80eiC0LKqjjxYN1nkxfus4wdTgUYrwH2RsAyYkJoYLhY3/cWS4QSlN
         RTVg==
X-Gm-Message-State: AOAM533egW6jXzmqJ+WjANuum/Dx/QrbMMMoRzq/qkN8lkaT0AyzDZel
	6mqDMQD2wPAXuH6fxhnWI8RRzqTDRQWgz0pqyc5tbw==
X-Google-Smtp-Source: ABdhPJwncWq/6AH2xalPFqahwbixbEeulviAkW/CaTIZDa6Hi6gjQOV8KNp9XsHFZcqAsGIVia7/RbjoYEwcnsgERXU=
X-Received: by 2002:a25:8392:: with SMTP id t18mr50587375ybk.397.1596008214223;
 Wed, 29 Jul 2020 00:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200728224149.GA22506@linux-uys3>
In-Reply-To: <20200728224149.GA22506@linux-uys3>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 29 Jul 2020 09:36:43 +0200
Message-ID: <CAP71WjybyNTcZVFp0KbtvoY2nr5wOBxEvA2HNYPZzobouRn+XQ@mail.gmail.com>
Subject: Re: [yocto] Yocto Technical Team Minutes, Engineering Sync, for July 28 2020
To: Trevor Woerner <twoerner@gmail.com>
Cc: docs@lists.yoctoproject.org, Mark Morton <Mark.Morton@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2020 at 12:42 AM Trevor Woerner <twoerner@gmail.com> wrote:
>
> Yocto Technical Team Minutes, Engineering Sync, for July 28 2020
> archive: https://docs.google.com/document/d/1ly8nyhO14kDNnFcW2QskANXW3ZT=
7QwKC5wWVDg9dDH4/edit
>
> =3D=3D disclaimer =3D=3D
> Best efforts are made to ensure the below is accurate and valid. However=
,
> errors sometimes happen. If any errors or omissions are found, please fe=
el
> free to reply to this email with any corrections.
>
> =3D=3D attendees =3D=3D
> Trevor Woerner, Stephen Jolly, Armin Kuster, Josef Holzmayr, Richard
> Purdie, Trevor Gamblin, Joshua Watt, Mark Morton, Ross Burton, Bruce
> Ashfield, Steve Sakoman, (phone-in ??), Jon Mason, Randy MacLeod, Scott
> Murray, Denys Dmytriyenko
>
> =3D=3D notes =3D=3D
> - fixed a race on AB wrt perl
> - 3.1.2 into QA
> - 3.2-m2 to QA once they=E2=80=99re done with 3.1.2
>
> =3D=3D general =3D=3D
> RP: load of perl issues over the weekend, believe to have found issue
> RP: lots of qemumips issues, not sure why, perhaps a timeouts issue? (no=
 ping
>     within 30 seconds)
> RP: some infrastructure issues (one worker has become corrupted)
>
> RP: curious to know what people think about 3.1.2: there is a bitbake is=
sue
>     with toaster, should we release then fix or wait for fix before rele=
ase?
> SS: maybe we should get feedback from people using toaster
> RP: the fix is simple, maybe release 3.1.2 (with release note) then fix
>
> RP: merged re-arrangement of package manager code, this puts more of our=
 code
>     into python libraries instead of bbclass files, which is the directi=
on i
>     want to take going forward
> RP: i need to start a conversation on oe-architecture for future directi=
ons
> RP: e.g. binary package feeds, we want to capture these use-cases into t=
he
>     wiki
>
> [NB: done! see https://wiki.yoctoproject.org/wiki/Future_Directions]
>
> RP: we also posted the current agreement on =E2=80=9Cinclusive language=
=E2=80=9D as agreed
>     on by various groups (oe board, oe-tsc, yp-tsc)
>
> TW: what=E2=80=99s the thinking behind moving code to libraries vs bbcla=
ss?
> RP: pro: parsing speed con: variable dependency tracking is lost
> RP: lots of python code gets written to logs etc, which slows it down
> JPEW: does bitbake automatically detect variable dependencies in library=
 code?
> RP: no. maybe we just need to do the scan once?
> TW: do we lose flexibility? (e.g. it=E2=80=99s easy to copy+paste+modify=
 a bbclass,
>     will that be possible?)
> RP: there will still be all the same entry points, so it should be possi=
ble
> RP: i=E2=80=99m worried about the size of the datastore in memory and it=
 is a
>     bottleneck
>
> RP: i wonder why qemumips is so slow?
> Randy: i think Cisco are the only ones caring about mips
> RP: yes, and Comcast too i think
>
> MM: have been wrapped up in $WORK stuff, but will be working on docs
>     conversion soon
> RP: MH has been putting infrastructure in place and Nico is looking forw=
ard to
>     getting this going
> MM: do we want to try to reproduce our current colours/formatting or try
>     something new
> RP: i like what we have, the project does have an existing scheme, but w=
e can
>     change if something else makes sense

I have some updates on Sphinx..
I recall that the work in progress can be found here:
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=3Dsphinx

The automated conversion from DocBook to Sphinx is managing 'internal'
links quite badly, so it results in a significant amount of work to
fixup links. Also since I wanted to use the Sphinx builtin 'glossary'
for terms and variables in the reference manual, that also required me
to update how links work for terms and variables. That's why it's
taking more time than I would like. I manage to use some
automation/regexp, and do a bit of manual fix up as well.

I also started to experiment with customization in the CSS theme, to
change some color/formatting. It's not done yet, but it has got
better:
https://people.linaro.org/~nicolas.dechesne/yp-docs/html/ref-manual/ref-ma=
nual.html

For now we generate a single large documentation 'website' that
includes all existing docs, instead of publishing each document
separately. I think it's an important change compared to how our
documentation was published so far. I personally like that quite a
bit, and think it's 'better' this way, but I would really want to hear
from you and that we agree this is what we want for the project. We
still need to look at how we want to generate PDF/offline
documentation though. And we need to decide how to manage the bitbake
manual which sits in the bitbake git tree, so right now it's published
separately.

Side note: the VSCode extension for reST is quite good
(https://docs.restructuredtext.net/index.html)

>
> TW: i do lots of builds, never seen issues, why are there so many failur=
es on
>     AB?
> RP: do you do oe-selftest or testsdk builds?
> TW: no
> RP: do you do mips builds?
> TW: no
> RP: so these are the areas where we see these failures, =E2=80=9Cregular=
=
=E2=80=9D builds
>     are okay
> SS: i don=E2=80=99t see issues on my builds but that=E2=80=99s probably =
because of working
>     these issues out on the AB
> RP: infrastructure issues are low, it=E2=80=99s mostly race issues that =
come out of
>     the extreme load of the AB or intermittent architecture issues that =
are
>     rarely tested
>=20
