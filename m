Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.10426.1616753790916669689
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 03:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=W6e+hhXU;
 spf=pass (domain: linaro.org, ip: 209.85.208.49, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f49.google.com with SMTP id h13so5675483eds.5
        for <docs@lists.yoctoproject.org>; Fri, 26 Mar 2021 03:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o7rtm83QXTWg+uzDlrIt8g4YuSV4gqIRSq/g4k08Z3Y=;
        b=W6e+hhXU/GA/TDy4oupCRx52gvK5ekSnPWLkm5LrAIVQRo7L6MP9g4sTxt4Fl03ERk
         YciqOEBR+nNMiNxUvme9UXUyG4j/OvTcD4S/FcaXoMSMTyHLn+TfrxwyJ+WrED4T4d0C
         QmKGJJoC2mRgFmx+A7DdtRlyIewYNcOTUHzqQouGv5LEeN24Bm34Y7NjMYXGeMH0QYJO
         RpML3YbEHIPtizrtjrtVMWllepYnrdk5oddVz4qJrfGMRAzGaTucbVAomRORhxeh+ROA
         FLzCRhkw3kIOpVI8hDhNuKSNAOKfZdOrW5l5J17X1k6I9WiRXK39io7U7E6CYAejGeMb
         Pppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o7rtm83QXTWg+uzDlrIt8g4YuSV4gqIRSq/g4k08Z3Y=;
        b=nIIw4j+sDItP4CeXDnR67WYIhnWoIpa8mRvQvkGN6vh9w/Gfd3nWshGp2fupWn61Of
         xWq8VqhqopHPBgRvicPa75ZhaXdBqpgQupQk4OHZmLYFkRAqKmCGt7cxrbIhMYo9nV0N
         5JsTQAClVztfmDGOziTQ0/zGrWPTa68u2p57mrj8KBTpPNQaYdwxazczdoeXfwPUtbM6
         cNdlqOZ6Kv7EYy3cEfWsFmN4DgBgk0S5vUMgA4loaWXiG76ORP++98trmoTPhA9GPDyY
         9QrLQC5rO1mTdTjsCBdsFDk9aiyZ4wgpaZQ1paV+uFWYcvuD7RCppgEE/SEWlvyiG8rv
         Uznw==
X-Gm-Message-State: AOAM5302ocrypBMqDwFvH0dUwySCM8huJYhhgkhomcSFz1bwCIyxdX4r
	O3/DpJdtJqTJ7MnIJiqawvBxdFOmw9QIWsyOEnGCug==
X-Google-Smtp-Source: ABdhPJyJKkZXr/l1Ik0xXAlJUn2z9BIpMuXvk4BMHg86kzvjeXd/2q1EATD7Y1JoM/Ahi1+8f6Z0jJb9S7847X9V02o=
X-Received: by 2002:a05:6402:34c4:: with SMTP id w4mr14467507edc.367.1616753789204;
 Fri, 26 Mar 2021 03:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210325181211.59332-1-nicolas.dechesne@linaro.org> <20210326100835.yqjsor3qrgfagdvg@qschulz>
In-Reply-To: <20210326100835.yqjsor3qrgfagdvg@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 26 Mar 2021 11:16:18 +0100
Message-ID: <CAP71Wjwd05Nw6HxLBW-gZENj8mD+VnGHQ-cWbV+p6T4hF2Pjfw@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] scripts/run-docs-build: add for loop when publishing tags/branches
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000004b955c05be6dd382"

--0000000000004b955c05be6dd382
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 26, 2021 at 11:08 AM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> Hi Nicolas,
>
> On Thu, Mar 25, 2021 at 07:12:10PM +0100, Nicolas Dechesne wrote:
> > Use for loop to avoid repeating the same pattern over and over.
> >
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
> >  scripts/run-docs-build | 72 ++++++++++++++++--------------------------
> >  1 file changed, 27 insertions(+), 45 deletions(-)
> >
> > diff --git a/scripts/run-docs-build b/scripts/run-docs-build
> > index 79b1edc..e8e081c 100755
> > --- a/scripts/run-docs-build
> > +++ b/scripts/run-docs-build
> > @@ -33,17 +33,14 @@ make publish
> >  mkdir $outputdir/bitbake/next
> >  cp -r ./_build/final/* $outputdir/bitbake/next
> >
> > -git checkout 1.48
> > -make clean
> > -make publish
> > -mkdir $outputdir/bitbake/1.48
> > -cp -r ./_build/final/* $outputdir/bitbake/1.48
> > -
> > -git checkout 1.46
> > -make clean
> > -make publish
> > -mkdir $outputdir/bitbake/1.46
> > -cp -r ./_build/final/* $outputdir/bitbake/1.46
> > +# stable branches
> > +for branch in 1.46 1.48; do
> > +    git checkout $branch
> > +    make clean
> > +    make publish
> > +    mkdir $outputdir/bitbake/$branch
> > +    cp -r ./_build/final/* $outputdir/bitbake/$branch
> > +done
> >
> >  # only sync bitbake folder for now. We need bitbake to be published
> first
> >  # since the bitbake intersphinx index will be downloaded to build
> yocto-docs
> > @@ -69,40 +66,25 @@ make publish
> >  mkdir $outputdir/next
> >  cp -r ./_build/final/* $outputdir/next
> >
> > -cd $ypdocs
> > -git checkout gatesgarth
> > -make clean
> > -make publish
> > -mkdir $outputdir/gatesgarth
> > -cp -r ./_build/final/* $outputdir/gatesgarth
> > -
> > -cd $ypdocs
> > -git checkout dunfell
> > -make clean
> > -make publish
> > -mkdir $outputdir/dunfell
> > -cp -r ./_build/final/* $outputdir/dunfell
> > -
> > -cd $ypdocs
> > -git checkout yocto-3.2.1
> > -make clean
> > -make publish
> > -mkdir $outputdir/3.2.1
> > -cp -r ./_build/final/* $outputdir/3.2.1
> > -
> > -cd $ypdocs
> > -git checkout yocto-3.2
> > -make clean
> > -make publish
> > -mkdir $outputdir/3.2
> > -cp -r ./_build/final/* $outputdir/3.2
> > -
> > -cd $ypdocs
> > -git checkout yocto-3.1.5
> > -make clean
> > -make publish
> > -mkdir $outputdir/3.1.5
> > -cp -r ./_build/final/* $outputdir/3.1.5
> > +# stable branches
> > +for branch in dunfell gatesgarth; do
> > +    cd $ypdocs
> > +    git checkout $branch
> > +    make clean
> > +    make publish
> > +    mkdir $outputdir/$branch
> > +    cp -r ./_build/final/* $outputdir/$branch
> > +done
> > +
> > +# Yocto Project releases/tags
> > +for tag in 3.1.5 3.2 3.2.1; do
>
> What about using `git tag -l 3.2*` so that we don't need to maintain the
> list of tags?
>
> Or, maybe `git tag --contains <3.1.5 commit hash introducing sphinx doc>
> --contains <3.2 commit hash introducing sphinx doc>` so that the
> 3.1.[56789] tags don't need to be added either?
>

yes, I thought about that too.. I wanted to get a quick fix first to
publish 3.1.6 and 3.2.2 which were missing..
on the other hand, we have a larger issue with this. The 'release'
information is needed here , but it's also needed on the website
(downloads) and it's needed in the switchers.js as well...
So we probably want to take a high level view of the problem. Michael
created https://bugzilla.yoctoproject.org/show_bug.cgi?id=14330 to let us
think about it.

my idea would be a publish/maintain a yaml file that would represent the
database of all our releases and docs, which would be maintained/updated by
the release manager, it would include all information we need to build and
publish the docs, update the 'download' page on the website, ...

up until now, we have been using:
http://api-v1.yoctoproject.org/documentation-api
http://api-v1.yoctoproject.org/api/downloads?release

i think we need a few improvements to that..



> Same mechanism can be used for bitbake git repo I guess.
>
> Cheers,
> Quentin
>

--0000000000004b955c05be6dd382
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 26, 2021 at 11:08 AM Quen=
tin Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quenti=
n.schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Nicolas,<br>
<br>
On Thu, Mar 25, 2021 at 07:12:10PM +0100, Nicolas Dechesne wrote:<br>
&gt; Use for loop to avoid repeating the same pattern over and over.<br>
&gt; <br>
&gt; Signed-off-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne=
@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/run-docs-build | 72 ++++++++++++++++--------------------=
------<br>
&gt;=C2=A0 1 file changed, 27 insertions(+), 45 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/run-docs-build b/scripts/run-docs-build<br>
&gt; index 79b1edc..e8e081c 100755<br>
&gt; --- a/scripts/run-docs-build<br>
&gt; +++ b/scripts/run-docs-build<br>
&gt; @@ -33,17 +33,14 @@ make publish<br>
&gt;=C2=A0 mkdir $outputdir/bitbake/next<br>
&gt;=C2=A0 cp -r ./_build/final/* $outputdir/bitbake/next<br>
&gt;=C2=A0 <br>
&gt; -git checkout 1.48<br>
&gt; -make clean<br>
&gt; -make publish<br>
&gt; -mkdir $outputdir/bitbake/1.48<br>
&gt; -cp -r ./_build/final/* $outputdir/bitbake/1.48<br>
&gt; -<br>
&gt; -git checkout 1.46<br>
&gt; -make clean<br>
&gt; -make publish<br>
&gt; -mkdir $outputdir/bitbake/1.46<br>
&gt; -cp -r ./_build/final/* $outputdir/bitbake/1.46<br>
&gt; +# stable branches<br>
&gt; +for branch in 1.46 1.48; do<br>
&gt; +=C2=A0 =C2=A0 git checkout $branch<br>
&gt; +=C2=A0 =C2=A0 make clean<br>
&gt; +=C2=A0 =C2=A0 make publish<br>
&gt; +=C2=A0 =C2=A0 mkdir $outputdir/bitbake/$branch<br>
&gt; +=C2=A0 =C2=A0 cp -r ./_build/final/* $outputdir/bitbake/$branch<br>
&gt; +done<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # only sync bitbake folder for now. We need bitbake to be publis=
hed first<br>
&gt;=C2=A0 # since the bitbake intersphinx index will be downloaded to buil=
d yocto-docs<br>
&gt; @@ -69,40 +66,25 @@ make publish<br>
&gt;=C2=A0 mkdir $outputdir/next<br>
&gt;=C2=A0 cp -r ./_build/final/* $outputdir/next<br>
&gt;=C2=A0 <br>
&gt; -cd $ypdocs<br>
&gt; -git checkout gatesgarth<br>
&gt; -make clean<br>
&gt; -make publish<br>
&gt; -mkdir $outputdir/gatesgarth<br>
&gt; -cp -r ./_build/final/* $outputdir/gatesgarth<br>
&gt; -<br>
&gt; -cd $ypdocs<br>
&gt; -git checkout dunfell<br>
&gt; -make clean<br>
&gt; -make publish<br>
&gt; -mkdir $outputdir/dunfell<br>
&gt; -cp -r ./_build/final/* $outputdir/dunfell<br>
&gt; -<br>
&gt; -cd $ypdocs<br>
&gt; -git checkout yocto-3.2.1<br>
&gt; -make clean<br>
&gt; -make publish<br>
&gt; -mkdir $outputdir/3.2.1<br>
&gt; -cp -r ./_build/final/* $outputdir/3.2.1<br>
&gt; -<br>
&gt; -cd $ypdocs<br>
&gt; -git checkout yocto-3.2<br>
&gt; -make clean<br>
&gt; -make publish<br>
&gt; -mkdir $outputdir/3.2<br>
&gt; -cp -r ./_build/final/* $outputdir/3.2<br>
&gt; -<br>
&gt; -cd $ypdocs<br>
&gt; -git checkout yocto-3.1.5<br>
&gt; -make clean<br>
&gt; -make publish<br>
&gt; -mkdir $outputdir/3.1.5<br>
&gt; -cp -r ./_build/final/* $outputdir/3.1.5<br>
&gt; +# stable branches<br>
&gt; +for branch in dunfell gatesgarth; do<br>
&gt; +=C2=A0 =C2=A0 cd $ypdocs<br>
&gt; +=C2=A0 =C2=A0 git checkout $branch<br>
&gt; +=C2=A0 =C2=A0 make clean<br>
&gt; +=C2=A0 =C2=A0 make publish<br>
&gt; +=C2=A0 =C2=A0 mkdir $outputdir/$branch<br>
&gt; +=C2=A0 =C2=A0 cp -r ./_build/final/* $outputdir/$branch<br>
&gt; +done<br>
&gt; +<br>
&gt; +# Yocto Project releases/tags<br>
&gt; +for tag in 3.1.5 3.2 3.2.1; do<br>
<br>
What about using `git tag -l 3.2*` so that we don&#39;t need to maintain th=
e<br>
list of tags?<br>
<br>
Or, maybe `git tag --contains &lt;3.1.5 commit hash introducing sphinx doc&=
gt;<br>
--contains &lt;3.2 commit hash introducing sphinx doc&gt;` so that the<br>
3.1.[56789] tags don&#39;t need to be added either?<br></blockquote><div><b=
r></div><div>yes, I thought about that too.. I wanted to get a quick fix fi=
rst to publish 3.1.6 and 3.2.2 which were missing..=C2=A0</div><div>on the =
other hand, we have a larger issue with this. The &#39;release&#39; informa=
tion is needed here , but it&#39;s also needed on the website (downloads) a=
nd it&#39;s needed in the switchers.js as well...=C2=A0</div><div>So we pro=
bably want to take a high level view of the problem. Michael created=C2=A0<=
a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14330">https:=
//bugzilla.yoctoproject.org/show_bug.cgi?id=3D14330</a> to let us think abo=
ut it.</div><div><br></div><div>my idea would be a publish/maintain a yaml =
file that would represent the database of all our releases and docs, which =
would be maintained/updated by the release manager, it would include all in=
formation we need to build and publish the docs, update the &#39;download&#=
39; page on the website, ...=C2=A0</div><div><br></div><div>up until now, w=
e have been using:</div><div><a href=3D"http://api-v1.yoctoproject.org/docu=
mentation-api">http://api-v1.yoctoproject.org/documentation-api</a><br></di=
v><div><a href=3D"http://api-v1.yoctoproject.org/api/downloads?release">htt=
p://api-v1.yoctoproject.org/api/downloads?release</a><br></div><div><br></d=
iv><div>i think we need a few improvements to that..=C2=A0</div><div><br></=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Same mechanism can be used for bitbake git repo I guess.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div></div>

--0000000000004b955c05be6dd382--
