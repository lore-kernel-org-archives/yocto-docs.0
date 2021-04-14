Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.9976.1618388286043365141
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hcfyVip8;
 spf=pass (domain: linaro.org, ip: 209.85.208.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f53.google.com with SMTP id ba6so22611769edb.1
        for <docs@lists.yoctoproject.org>; Wed, 14 Apr 2021 01:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LAFBJ7U2f+6W2NxHCwaf7+f03rWtgV3w3hzQcl3BbGc=;
        b=hcfyVip8LeCjKvkvzVVpz6g4ONow7McAi6gDSBA0ZA7krdgM1fZP87wUYP2BK7W0Vq
         dMOpLnvYpA3FNesKxeelRb1upNK9RIi4/PZ2jDOKTEg9fsl7Uovm21os7ZYJTAq6sG9Q
         44JQwY2evbzYEXMllJmGbw9HhrJUxnUrzdle1t7FWZtam9ZYyy1KkrVcMaUML5z3Fq16
         YAnLqtlk5WBOdDlZmOs/3vL7zGuIpSDA2Qv6ojkgsMIBAmwe2Yl0E96XC9yLzA8uQ2AV
         tOR3xpl/34Be7YscEHOo4xJ/+yNOjgGMgfstYpbsvEkv+3LME45NEKY6HBMQCSysmWx4
         ewLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LAFBJ7U2f+6W2NxHCwaf7+f03rWtgV3w3hzQcl3BbGc=;
        b=A7AKTjaaW3tq3ytvD4bebz0gT760ABsOvpblB0Tq+7UiD21GKYCLGcJnG+VFVy1xa9
         zyb8RBsaM5+Ld3BwetPgSGYo8cotVDnwRxTTh4S8BW6ZrFj2Ek1+zmA2D4zyHzq2tydP
         pFqruPYbwJCI0axLtq5aiT7sd9GfAfU7NNaSa9sXOHzUN5okCDeXRVCQRWwa9wqu2jua
         ScWnitD2/1VmhqdFgVkOZd84H/oqFqgeffg7If5LBDQuLR1K83S9hTTfhw362xwyd5nS
         AvLp3ap38yyWJxZrUwF2qcPi7KoOX2rwhLfPG7oTyTtno8omV3sc+bSzl6FbLnAS1oTL
         yuGA==
X-Gm-Message-State: AOAM533srTR7QR7AqZSGGQKBfo3XjZ3HdPKtaVKprkN/leFlu9XrotGZ
	QJRXLQdNZcVa/9HsoJI2WlqzJOCKBnDoTFstDm6CmA==
X-Google-Smtp-Source: ABdhPJzpotiRE9Y6ioD2UloopnTD9Dt5iyNl2Fw/+Ut6stQgkvjTi2LscHwULuS4b+rSN0gRpLLQxkriRvoo1gOoiQY=
X-Received: by 2002:a05:6402:34c4:: with SMTP id w4mr40882378edc.367.1618388284506;
 Wed, 14 Apr 2021 01:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <9a02215494bae33c57e9fd7f6924e995713c7b1c.1618358456.git.paul.eggleton@linux.microsoft.com>
 <20210414081000.74szybq42anpitfs@qschulz>
In-Reply-To: <20210414081000.74szybq42anpitfs@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 14 Apr 2021 10:17:53 +0200
Message-ID: <CAP71WjyqN70t+8Q=+MVU_iib7OePqtPPY1o+zhzt9J10mKu8oA@mail.gmail.com>
Subject: Re: [docs] [PATCH 06/13] ref-manual: add REQUIRED_VERSION and adjust PREFERRED_VERSION entry
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000ce94af05bfea622e"

--000000000000ce94af05bfea622e
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 10:10 AM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> Hi Paul,
>
> Just nitpicking.
>
> On Tue, Apr 13, 2021 at 05:19:47PM -0700, Paul Eggleton wrote:
> > From: Paul Eggleton <paul.eggleton@microsoft.com>
> >
> > Add REQUIRED_VERSION, add a reference to it in PREFERRED_VERSION and
> > adjust the opening statement to read slightly better.
> >
> > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > ---
> >  documentation/ref-manual/variables.rst | 22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > index ef61339..a97f858 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -5798,10 +5798,10 @@ system and gives an overview of their function
> and contents.
> >           exclusive alternative providers.
> >
> >     :term:`PREFERRED_VERSION`
> > -      If multiple versions of recipes exist, this variable determines
> which
> > -      version is given preference. You must always suffix the variable
> with
> > -      the :term:`PN` you want to select, and you should set the
> > -      :term:`PV` accordingly for precedence.
> > +      If there are multiple versions of a recipe available, this
> variable
> > +      determines which version should be given preference. You must
> always
> > +      suffix the variable with the :term:`PN` you want to select, and
> you
> > +      should set the :term:`PV` accordingly for precedence.
> >
>
> Would it make sense to explicit what suffixing with PN and specifying PV
> mean?
> We have an example just a few lines below, so I'd see something like:
>
> suffix the variable with the :term:`PN` you want to select (`python` in
> the example below), and you should set the :term:`PV` accordingly
> (`3.4.0` in the example).
>
> >        The ``PREFERRED_VERSION`` variable supports limited wildcard use
> >        through the "``%``" character. You can use the character to match
> any
> > @@ -5859,6 +5859,10 @@ system and gives an overview of their function
> and contents.
> >           The ``\_forcevariable`` override is not handled specially.
> This override
> >           only works because the default value of ``OVERRIDES`` includes
> "forcevariable".
> >
> > +      If a recipe with the specified version is not available, a warning
> > +      message will be shown. See :term:`REQUIRED_VERSION` if you want
> this
> > +      to be an error instead.
> > +
> >     :term:`PREMIRRORS`
> >        Specifies additional paths from which the OpenEmbedded build
> system
> >        gets source code. When the build system searches for source code,
> it
> > @@ -6216,6 +6220,16 @@ system and gives an overview of their function
> and contents.
> >        the recipe will be skipped, and if the build system attempts to
> build
> >        the recipe then an error will be triggered.
> >
> > +   :term:`REQUIRED_VERSION`
> > +      If there are multiple versions of a recipe available, this
> variable
> > +      determines which version should be given preference.
> ``REQUIRED_VERSION``
> > +      works in exactly the same manner as :term:`PREFERRED_VERSION`,
> except
> > +      that if the specified version is not available then an error
> message
> > +      is shown and the build fails immediately.
> > +
> > +      If both ``REQUIRED_VERSION`` and ``PREFERRED_VERSION`` are set for
>
> I think we wanted to go for using :term: for every occurence of a
> variable (which is *definitely* not something we've done so far), so I'd
> suggest s/``PREFERRED_VERSION``/:term:`PREFERRED_VERSION`/ here. For me
> REQUIRED_VERSION does not warrant the use of term because it is used in
> the paragraph defining it (but maybe it's something we want?).
>

Looking (far) ahead, if we assume we can render :term: with a proper style,
then I think it makes sense to use it everywhere, even here.


>
> Cheers,
> Quentin
>
> 
>
>

--000000000000ce94af05bfea622e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 14, 2021 at 10:10 AM Quen=
tin Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quenti=
n.schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Paul,<br>
<br>
Just nitpicking.<br>
<br>
On Tue, Apr 13, 2021 at 05:19:47PM -0700, Paul Eggleton wrote:<br>
&gt; From: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@microsoft.com=
" target=3D"_blank">paul.eggleton@microsoft.com</a>&gt;<br>
&gt; <br>
&gt; Add REQUIRED_VERSION, add a reference to it in PREFERRED_VERSION and<=
br>
&gt; adjust the opening statement to read slightly better.<br>
&gt; <br>
&gt; Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@micr=
osoft.com" target=3D"_blank">paul.eggleton@microsoft.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/ref-manual/variables.rst | 22 ++++++++++++++++++-=
---<br>
&gt;=C2=A0 1 file changed, 18 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/r=
ef-manual/variables.rst<br>
&gt; index ef61339..a97f858 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -5798,10 +5798,10 @@ system and gives an overview of their functio=
n and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exclusive alternative provide=
rs.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0:term:`PREFERRED_VERSION`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 If multiple versions of recipes exist, this var=
iable determines which<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 version is given preference. You must always su=
ffix the variable with<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 the :term:`PN` you want to select, and you shou=
ld set the<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 :term:`PV` accordingly for precedence.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 If there are multiple versions of a recipe avai=
lable, this variable<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 determines which version should be given prefer=
ence. You must always<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 suffix the variable with the :term:`PN` you wan=
t to select, and you<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 should set the :term:`PV` accordingly for prece=
dence.<br>
&gt;=C2=A0 <br>
<br>
Would it make sense to explicit what suffixing with PN and specifying PV m=
ean?<br>
We have an example just a few lines below, so I&#39;d see something like:<=
br>
<br>
suffix the variable with the :term:`PN` you want to select (`python` in<br=
>
the example below), and you should set the :term:`PV` accordingly<br>
(`3.4.0` in the example).<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 The ``PREFERRED_VERSION`` variable support=
s limited wildcard use<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 through the &quot;``%``&quot; character. Y=
ou can use the character to match any<br>
&gt; @@ -5859,6 +5859,10 @@ system and gives an overview of their function=
 and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The ``\_forcevariable`` overr=
ide is not handled specially. This override<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0only works because the defaul=
t value of ``OVERRIDES`` includes &quot;forcevariable&quot;.<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 If a recipe with the specified version is not a=
vailable, a warning<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 message will be shown. See :term:`REQUIRED_VERS=
ION` if you want this<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 to be an error instead.<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0:term:`PREMIRRORS`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Specifies additional paths from which the =
OpenEmbedded build system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 gets source code. When the build system se=
arches for source code, it<br>
&gt; @@ -6216,6 +6220,16 @@ system and gives an overview of their function=
 and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the recipe will be skipped, and if the bui=
ld system attempts to build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the recipe then an error will be triggered=
.<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0:term:`REQUIRED_VERSION`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 If there are multiple versions of a recipe avai=
lable, this variable<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 determines which version should be given prefer=
ence. ``REQUIRED_VERSION``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 works in exactly the same manner as :term:`PREF=
ERRED_VERSION`, except<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 that if the specified version is not available =
then an error message<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 is shown and the build fails immediately.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 If both ``REQUIRED_VERSION`` and ``PREFERRED_VE=
RSION`` are set for<br>
<br>
I think we wanted to go for using :term: for every occurence of a<br>
variable (which is *definitely* not something we&#39;ve done so far), so I=
&#39;d<br>
suggest s/``PREFERRED_VERSION``/:term:`PREFERRED_VERSION`/ here. For me<br=
>
REQUIRED_VERSION does not warrant the use of term because it is used in<br=
>
the paragraph defining it (but maybe it&#39;s something we want?).<br></bl=
ockquote><div><br></div><div>Looking (far) ahead, if we assume we can rende=
r :term: with a proper style, then I think it makes sense to use it everywh=
ere, even here.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Cheers,<br>
Quentin<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000ce94af05bfea622e--
