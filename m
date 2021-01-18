Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.31362.1610963952088450362
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jan 2021 01:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=exMjsXUz;
 spf=pass (domain: smile.fr, ip: 209.85.218.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f52.google.com with SMTP id r12so11461549ejb.9
        for <docs@lists.yoctoproject.org>; Mon, 18 Jan 2021 01:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ws+3lxY30XXjbWWFKx7GZsiaDRb6j3go4VUClXCh2zY=;
        b=exMjsXUzCZKNKy5dvbsBjQaT/dos9BpHn/HzuxOmhRPMzS4DwhzdbsJEttFXfGosQv
         HSb4Dkczc2P7Kn3E6m9/LJLD3GVOWMSFQzF4Zzg6uLFtDQxdv5m3UWRwWE4GV4Akjb+l
         SBDQPS+pw4LtS3Z4rsSa2+4O7de2BqEs+kdIh9JM4mjM6c9ZbHLS0/7jGxr2QADBprZv
         S/BxcFT6wXGx1+AwZ6a1F2GQYZdVnu9SIgOpHB4Tp8ni83SmW4ThCWWypERGAp+NK6Uk
         3wTkuZggPcHO5gLsxXxv1d4ilms0zdPTghPB5x/brmJt9dd3eU7wL91ucDwgVqM2UFYo
         BPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ws+3lxY30XXjbWWFKx7GZsiaDRb6j3go4VUClXCh2zY=;
        b=JG1sGho23u+0qjKXy7eicr6PC7wnZp6YecHWcb58R4DbIjutsiVDiYWp6RaQN6PU1O
         1va0yGJEW+9eykLh7ge9BhrKmUyYKs9qhuxgKSxYkGCqYLfkVi0qfV2jdHNh1ajRWP0l
         +HngJcsR1mXRVwoMtZnR94QpaKajCyG/pqN1MFEtP26S4barnTIlQA3DFai0uy0iu5CF
         Q4fbGKjHVw1++BANmpqH0C+dfVxQiLXARDf5eKDGws7iE9/EzA7WWaQPD6xM95oE+L6G
         QTd/9+0mtLXo+hBWOTX99qgnPqK764NNytBWofS8EPI6OCzx1bhCecNELOmvPfAadl2h
         nBiA==
X-Gm-Message-State: AOAM533+PoOEY3mckpairELFyzxpDYgZvovsERpSyXgHt/dILP1RGsLd
	P3l/raIgI9PBUJaZeM6huiiC0YZzuJ5Y9cAwiDlEpA==
X-Google-Smtp-Source: ABdhPJx9H8iM1Y2keBC/gLSZ9XAjqCSFuj6kDY/LOG1KTJ8d3TaclXmtIDeoHxRgxaBtmbe2l00G2e1CdYT+yM0CGQs=
X-Received: by 2002:a17:906:22c7:: with SMTP id q7mr16790233eja.486.1610963950552;
 Mon, 18 Jan 2021 01:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20210113172329.7683-1-yoann.congal@smile.fr> <CAP71Wjwi92hxX7U_qC7KwKQpND4mD_F_K8RQ8xBApZUw8o+GFQ@mail.gmail.com>
 <CAMSfU+7kP7kotufDWP=b=SSnK2OXc+w96HfK8doZuNTcDja2Hw@mail.gmail.com>
 <20210114111815.u5r2ltfrnvqweel5@qschulz> <CAP71WjxCRKmy2vJzykLiD77_PNHWSexL1vm+ax8Ek8RMo0hgWw@mail.gmail.com>
 <20210114114646.2opuupittdc6kz5a@qschulz>
In-Reply-To: <20210114114646.2opuupittdc6kz5a@qschulz>
From: "Yoann Congal" <yoann.congal@smile.fr>
Date: Mon, 18 Jan 2021 10:58:44 +0100
Message-ID: <CAMSfU+5ANFiO-jGKJVqtbLqFMbLvZoKumx94sV3VWEzW+q6gMA@mail.gmail.com>
Subject: Re: [docs] [PATCH] toaster-manual: Fix a warning related to the code-block directive
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000004d9f405b929c66b"

--00000000000004d9f405b929c66b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi !



Le jeu. 14 janv. 2021 =C3=A0 12:46, Quentin Schulz <
quentin.schulz@streamunlimited.com> a =C3=A9crit :

> On Thu, Jan 14, 2021 at 12:22:58PM +0100, Nicolas Dechesne wrote:
> > On Thu, Jan 14, 2021 at 12:18 PM Quentin Schulz <
> > quentin.schulz@streamunlimited.com> wrote:
> >
> > > Hi Yoann, Nicolas,
> > >
> > > On Thu, Jan 14, 2021 at 12:06:10PM +0100, Yoann Congal wrote:
> > > > Hi !
> > > >
> > > > Le mer. 13 janv. 2021 =C3=A0 18:39, Nicolas Dechesne <
> > > nicolas.dechesne@linaro.org>
> > > > a =C3=A9crit :
> > > >
> > > > > On Wed, Jan 13, 2021 at 6:23 PM Yoann Congal <
> yoann.congal@smile.fr>
> > > > > wrote:
> > > > >
> > > > >> Fix the following warning by specifying the language (here :
> shell):
> > > > >> .../yocto/poky/documentation/toaster-manual/reference.rst:572:
> > > WARNING:
> > > > >> Error in "code-block" directive:
> > > > >> 1 argument(s) required, 0 supplied.
> > > > >>
> > > > >
> > > > > Which version of Sphinx are you using? I suspect an old version, =
in
> > > Sphinx
> > > > > 2+ (I think) it is no longer an error to omit the language. And I
> > > don't see
> > > > > any warnings in my builds. In fact, we have 0 warning in the whol=
e
> > > doc, and
> > > > > we will try to avoid adding new ones!
> > > > >
> > > >
> > > > Well you were right! I was running sphinx 1.8. I got no more warnin=
gs
> > > after
> > > > upgrading to sphinx 3.4.3.
> > > >
> > > > Sorry about the noise !
> > > >
> > >
> > > And now I just discovered we don't have a requirements.txt or somethi=
ng
> > > alike where we could ask for a min version of sphinx.
> > >
> > > @Nicolas, any idea why we're not using requirements.txt so that one
> > > could do pip install -r requirements.txt (and we could also enforce a
> > > min version of Sphinx, the theme or pyyaml)? Or whatever mechanisms t=
he
> > > cool kids doing Python use nowadays?
> > >
> >
> > We have a Pipfile, which is even cooler, no? but we don't specify any
> > version yet!
> >
>
> Didn't even know!
>
> Kind of wary of this project though because of that part of their README:
> " WARNING: This project is under active design and development. Nothing
> is set in stone at this point in time."
>
> But maybe something we could add to the docs
> (https://docs.yoctoproject.org/ref-manual/system-requirements.html) as an
> alternative installaion method?
>
> Aaaaaand I should have read the README in yocto-docs more seriously :)
>

Me too!

Following this discussion, I made a proposal here :
https://lists.yoctoproject.org/g/docs/topic/patch_documentation_add_a/79919=
516
=3D> A simple Sphinx extension printing a warning on out-dated Sphinx versi=
on.
It will prevent this discussion from happening again in the future...

Yoann

--00000000000004d9f405b929c66b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi !</div><div><br></div><div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Le=C2=A0jeu. 14 janv. 2021 =C3=A0=C2=A012:46, Quentin Schulz &lt;<a hre=
f=3D"mailto:quentin.schulz@streamunlimited.com">quentin.schulz@streamunlimi=
ted.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Thu, Jan 14, 2021 at 12:22:58PM +0100, Nicolas Deche=
sne wrote:<br>
&gt; On Thu, Jan 14, 2021 at 12:18 PM Quentin Schulz &lt;<br>
&gt; <a href=3D"mailto:quentin.schulz@streamunlimited.com" target=3D"_blank=
">quentin.schulz@streamunlimited.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi Yoann, Nicolas,<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Jan 14, 2021 at 12:06:10PM +0100, Yoann Congal wrote:<br>
&gt; &gt; &gt; Hi !<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Le mer. 13 janv. 2021 =C3=A0 18:39, Nicolas Dechesne &lt;<br=
>
&gt; &gt; <a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">=
nicolas.dechesne@linaro.org</a>&gt;<br>
&gt; &gt; &gt; a =C3=A9crit :<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Jan 13, 2021 at 6:23 PM Yoann Congal &lt;<a hre=
f=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr<=
/a>&gt;<br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; Fix the following warning by specifying the languag=
e (here : shell):<br>
&gt; &gt; &gt; &gt;&gt; .../yocto/poky/documentation/toaster-manual/referen=
ce.rst:572:<br>
&gt; &gt; WARNING:<br>
&gt; &gt; &gt; &gt;&gt; Error in &quot;code-block&quot; directive:<br>
&gt; &gt; &gt; &gt;&gt; 1 argument(s) required, 0 supplied.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Which version of Sphinx are you using? I suspect an old=
 version, in<br>
&gt; &gt; Sphinx<br>
&gt; &gt; &gt; &gt; 2+ (I think) it is no longer an error to omit the langu=
age. And I<br>
&gt; &gt; don&#39;t see<br>
&gt; &gt; &gt; &gt; any warnings in my builds. In fact, we have 0 warning i=
n the whole<br>
&gt; &gt; doc, and<br>
&gt; &gt; &gt; &gt; we will try to avoid adding new ones!<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Well you were right! I was running sphinx 1.8. I got no more=
 warnings<br>
&gt; &gt; after<br>
&gt; &gt; &gt; upgrading to sphinx 3.4.3.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sorry about the noise !<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; And now I just discovered we don&#39;t have a requirements.txt or=
 something<br>
&gt; &gt; alike where we could ask for a min version of sphinx.<br>
&gt; &gt;<br>
&gt; &gt; @Nicolas, any idea why we&#39;re not using requirements.txt so th=
at one<br>
&gt; &gt; could do pip install -r requirements.txt (and we could also enfor=
ce a<br>
&gt; &gt; min version of Sphinx, the theme or pyyaml)? Or whatever mechanis=
ms the<br>
&gt; &gt; cool kids doing Python use nowadays?<br>
&gt; &gt;<br>
&gt; <br>
&gt; We have a Pipfile, which is even cooler, no? but we don&#39;t specify =
any<br>
&gt; version yet!<br>
&gt; <br>
<br>
Didn&#39;t even know!<br>
<br>
Kind of wary of this project though because of that part of their README:<b=
r>
&quot; WARNING: This project is under active design and development. Nothin=
g<br>
is set in stone at this point in time.&quot;<br>
<br>
But maybe something we could add to the docs<br>
(<a href=3D"https://docs.yoctoproject.org/ref-manual/system-requirements.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/ref-=
manual/system-requirements.html</a>) as an<br>
alternative installaion method?<br>
<br>
Aaaaaand I should have read the README in yocto-docs more seriously :)<br><=
/blockquote><div><br></div><div>Me too!</div><div><br></div><div>Following =
this discussion, I made a proposal here : <a href=3D"https://lists.yoctopro=
ject.org/g/docs/topic/patch_documentation_add_a/79919516">https://lists.yoc=
toproject.org/g/docs/topic/patch_documentation_add_a/79919516</a></div><div=
>=3D&gt; A simple Sphinx extension printing a warning on out-dated Sphinx v=
ersion.</div><div>It will prevent this discussion from happening again in t=
he future...<br></div></div><div><br></div>Yoann<br></div>

--00000000000004d9f405b929c66b--
