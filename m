Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.9920.1618388355067976043
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sP5Q5M1x;
 spf=pass (domain: linaro.org, ip: 209.85.218.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f52.google.com with SMTP id w23so14258232ejb.9
        for <docs@lists.yoctoproject.org>; Wed, 14 Apr 2021 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cox97+T1O0S8xSo1VOxy5Z++XJV/I7Z3FWpIUz4kaZM=;
        b=sP5Q5M1xUkgi73ZSJIEgcjmMtFJWTJm7SGGbZHU0ni8pu7jOKFryOLbmrXSGKuBbms
         2LhZvN1+3OlYRsxweNScUQg9rbN8mcri74AV9txTcYk5KSTHUPQHP8Zvg1zRF4o3AHK5
         V2x3MeztdxyaJ18rY8jYRt08WaOgezL2dObI3LYv2JhXM25tNOasqS0nVJao5PuZ0d6U
         Ti8BAO/DNVj2lJxZzi8s1NnDU2pCyGKHuM5FW48z0aQsZbkDvgvPanYsMFniPLwEUHp3
         yaWjdZu45SU7ADTH3kPHKaaHMWFUEzkN3zHljmkyHY63dquuaYBXvwwB787G9mz54XFq
         0ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cox97+T1O0S8xSo1VOxy5Z++XJV/I7Z3FWpIUz4kaZM=;
        b=r5c9FDnEzYS+vGHQoJpKtrc5VrfOYDQAyUhqO01jZ9rf5u0FJtrwuM3wYkClh0fW0l
         xiX8SXntmaBRhWaczuVDjkw/U6phSpCf84pRrnfI5e4nPd7ewPio48c3fg/nVovCaGbP
         ai3HjtPJNZzkh2OFSVab3USrN72PtkwqvXkO0y3XK5RDJhemYrACsrv+pr8s7lT0Lt4m
         MUbwiHj2wPSFM0H7reTkQn9ls4DRwP0F+JFW5Udyg9BAMeqEd6oW1uK9yeeY8h8EpoPs
         SoItS71h1UvDBsfPg9u1ujYvH31c2JMoNu7fndsTnzblKT7Sd5vHnj1OyVWCwzVJkYlC
         ICOg==
X-Gm-Message-State: AOAM533QzynBfhxNJJtS5HQviM5lRLAqx6tiClLDYcl/Jt0p1XDPYMh8
	/i9jZUnVrQbJGANs1uELuSkNpWmqIE6dsigVxT83qA==
X-Google-Smtp-Source: ABdhPJwJQoKtT78NRwNY+oFqPc53Kro1BtndVz3g4SCJ8J6V1Q6QMlSYtU63Yf110wdAf6YKc+oHmvDhhKREcn7xpAk=
X-Received: by 2002:a17:906:1d10:: with SMTP id n16mr1267626ejh.445.1618388353572;
 Wed, 14 Apr 2021 01:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <c973665acd8a5259b19ab512b2ae7f6d10848cb5.1618358456.git.paul.eggleton@linux.microsoft.com>
 <20210414081303.kciysuaevt3bhjtg@qschulz>
In-Reply-To: <20210414081303.kciysuaevt3bhjtg@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 14 Apr 2021 10:19:03 +0200
Message-ID: <CAP71WjxiU5pfmCkybgaqijUz1LbMoe5_3tJcQDuYWeSsm+hxgg@mail.gmail.com>
Subject: Re: [docs] [PATCH 08/13] ref-manual: add passwd-expire to EXTRA_USERS_PARAMS
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000ec71c305bfea6672"

--000000000000ec71c305bfea6672
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 10:13 AM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> Hi Paul,
>
> On Tue, Apr 13, 2021 at 05:19:49PM -0700, Paul Eggleton wrote:
> > From: Paul Eggleton <paul.eggleton@microsoft.com>
> >
> > Add a reference to the recently added passwd-expire command in
> > EXTRA_USERS_PARAMS.
> >
> > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > ---
> >  documentation/ref-manual/variables.rst | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > index 2e3cc22..3b76dbc 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -2293,6 +2293,17 @@ system and gives an overview of their function
> and contents.
> >           # usermod -s /bin/sh tester; \
> >           # "
> >
> > +      Additionally there is a special ``passwd-expire`` command that
> will
> > +      cause the password for a user to be expired and thus force
> changing it
> > +      on first login, for example: ::
> > +
>
> IIRC, :: will behave the same as : ::, so please use the former (trying to
> have consistency across all docs, though we're far from it now :|, but
> this change is something we want).
>
> Pinging @Nicolas just for confirmation :)
>

Yes, agreed. There was a patch floating around to convert all instances of
: :: into ::, not sure if it was merged or dropped..


>
> Thanks,
> Quentin
>
> 
>
>

--000000000000ec71c305bfea6672
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 14, 2021 at 10:13 AM Quen=
tin Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quenti=
n.schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Paul,<br>
<br>
On Tue, Apr 13, 2021 at 05:19:49PM -0700, Paul Eggleton wrote:<br>
&gt; From: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@microsoft.com=
" target=3D"_blank">paul.eggleton@microsoft.com</a>&gt;<br>
&gt; <br>
&gt; Add a reference to the recently added passwd-expire command in<br>
&gt; EXTRA_USERS_PARAMS.<br>
&gt; <br>
&gt; Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@micr=
osoft.com" target=3D"_blank">paul.eggleton@microsoft.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/ref-manual/variables.rst | 11 +++++++++++<br>
&gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/r=
ef-manual/variables.rst<br>
&gt; index 2e3cc22..3b76dbc 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -2293,6 +2293,17 @@ system and gives an overview of their function=
 and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# usermod -s /bin/sh tester; =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# &quot;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Additionally there is a special ``passwd-expire=
`` command that will<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 cause the password for a user to be expired and=
 thus force changing it<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 on first login, for example: ::<br>
&gt; +<br>
<br>
IIRC, :: will behave the same as : ::, so please use the former (trying to=
<br>
have consistency across all docs, though we&#39;re far from it now :|, but=
<br>
this change is something we want).<br>
<br>
Pinging @Nicolas just for confirmation :)<br></blockquote><div><br></div><=
div>Yes, agreed. There was a patch floating around to convert all instances=
 of : :: into ::, not sure if it was merged or dropped..=C2=A0</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Quentin<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000ec71c305bfea6672--
