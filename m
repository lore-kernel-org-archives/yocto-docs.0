Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.676.1618507965947091225
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 10:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vKZqTk/t;
 spf=pass (domain: linaro.org, ip: 209.85.208.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f50.google.com with SMTP id x4so29086729edd.2
        for <docs@lists.yoctoproject.org>; Thu, 15 Apr 2021 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hzme0i+VMbtExqsiHDOQLTyu8RkKPoaNZAOFIKSTZZw=;
        b=vKZqTk/ti13dLlcUSQQDd+mW6QHStYQiAaqlJemkTTP6ODLq4n5+urAN7uJJMJERRI
         CFxo0MoCbPI++pEaN4ZchoMIXAVM2ALKwA4vX54IZSR9bNprbcGYCpqm87jNTP5khdgS
         NVbhr3CM3MAUbLuNgA1O86u43djtcO41n9dW0gTVD5r25VHxZDQL6ew9ANDOAk4EbGUo
         dRToxXGJvpzOA1YD3zdbQHMwQfe9ErC263C8oMLOS/ZrExDo2taBLWr9PPuU4kpHLsAJ
         svnSHCKA3qCvj8osnVWxrEOQ1YxTYlRk/z9Zex6uuZmDuCGSglA6KOJQn96zT50sTDnB
         JpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hzme0i+VMbtExqsiHDOQLTyu8RkKPoaNZAOFIKSTZZw=;
        b=ny8xhTwKFM7aAzWBPGB0U33DaKBvgMhCMxREYLR7/vokLvkhf4IL938daqtU3WTwn/
         ZMQqfkdab4dDDvkdGu2E6gXnmhmRMX5GdtzoY5q5N1PVzCbM2uwlpXLaNePJc3wdWqEQ
         WZY25nSEtCxbzqNuh7FcUTyZs0UnMcYSCLv8xaz56WrNkReed25ZiTx5vxagMBapF+GK
         GKyXYvDpi2ZwJ3mHUT9ChN4D1nu/1mUl9+8DSS/7fMB3B7gA2pj5ljDekICkg42b30w7
         14vl1sCnzoIeL0MDCEtrSySVZ0WzCKGKYmXGm5P2rcLW7y+XQDudaaf+diKhR3ktlvLd
         HZ3A==
X-Gm-Message-State: AOAM53062h2nYYe+zENb1ya/0Ur4LpwqBymfKGlLLLUwUKpkV9ND9EXd
	8WxKOkUmTMFjFapsO5oEmvNvkgCZCR3wmkzWFtfdLw==
X-Google-Smtp-Source: ABdhPJzYnejB6NhAjfxDBqU1I1BOnnW7XbGIm0ZDOdXxsAYU7inbP5Jepg25OGH9OQA2sX8BVhRzi8g9MwTJklTjvHo=
X-Received: by 2002:a50:8fe6:: with SMTP id y93mr5558238edy.224.1618507964441;
 Thu, 15 Apr 2021 10:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <d8b43077bf92ad403028cbf37b61c4a6349f9370.1618358456.git.paul.eggleton@linux.microsoft.com>
 <20210414082603.gmkxjpyxwnhwzzor@qschulz> <1712714.3VsfAaAtOV@linc>
 <20210415095914.eqpunspm2rnpnc4v@qschulz> <CAP71WjxKavO93Cm8ZooE4HnJtbb79WLOQASEkh9UL5nFKw8ZNA@mail.gmail.com>
 <20210415140700.qwj4lotqr72es3jm@qschulz>
In-Reply-To: <20210415140700.qwj4lotqr72es3jm@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 15 Apr 2021 19:32:33 +0200
Message-ID: <CAP71WjzA17gH5BECDNPTivM2BS28-Otv_c-C8oc5U6AM1hK_Hg@mail.gmail.com>
Subject: Re: [docs] [PATCH 12/13] ref-manual: add migration section for 3.3 release
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Paul Eggleton <bluelightning@bluelightning.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000497a1005c00640e4"

--000000000000497a1005c00640e4
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 15, 2021 at 4:07 PM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> On Thu, Apr 15, 2021 at 12:25:55PM +0200, Nicolas Dechesne wrote:
> > On Thu, Apr 15, 2021 at 11:59 AM Quentin Schulz <
> > quentin.schulz@streamunlimited.com> wrote:
> > > On Thu, Apr 15, 2021 at 09:52:31PM +1200, Paul Eggleton wrote:
> > > > On Wednesday, 14 April 2021 20:26:03 NZST Quentin Schulz wrote:
> > > > > On Tue, Apr 13, 2021 at 05:19:53PM -0700, Paul Eggleton wrote:
> > > > > > +BitBake changes
> > > > > > +---------------
> > > > > > +
> > > > > > +- BitBake is now configured to use a default ``umask`` of
> ``022``
> > > for all
> > > > > > tasks +  (specified via a new ``BB_DEFAULT_UMASK`` variable). If
> > > needed,
> > > > > > ``umask`` can
> > > > > s/``BB_DEFAULT_UMASK``/:term:`BB_DEFAULT_UMASK`/
> > > > >
> > > > > IIRC, this works fine even for bitbake terms (might need some
> tweaking
> > > > > if it does not work but I know we use :term: for some bitbake
> variables
> > > > > from bitbake's docs).
> > > >
> > > > Wow, that does work but I didn't imagine that it would. Any idea how
> it
> > > > resolves those references given that doc is not in this tree?
> > > >
> > >
> > > How internally it works? No idea :)
> > >
> >
> > It is interesting... I would not have expected that to work ;)
> >
> >
> > >
> > > But the few lines here are what makes it work:
> > >
> > >
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/conf.py#n90
> >
> >
> > So, this is correct we use the intersphinx extension to link YP and
> bitbake
> > docs which are indeed 2 different sphinx projects. When we build the YP
> > docs, it will first download the bitbake sphinx 'index, e.g. you can see
> > that in the log when building YP docs:
> >
> > loading intersphinx inventory from
> > https://docs.yoctoproject.org/bitbake/objects.inv...
> >
> > So now sphinx knows about all the :ref:, :doc:, :term:, ... defined in
> > bitbake, so we can use them to create cross references. More on that
> here:
> > https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html
> >
> > A nice debug tip is to run:
> > python -msphinx.ext.intersphinx
> > https://docs.yoctoproject.org/bitbake/objects.inv
> >
> > which shows all the bitbake references that can be used from YP docs.
> >
> >
> > >
> > >
> > > Nicolas and/or other peoples involved in the migration might be able to
> > > tell you more, I'm not :/
> > >
> > > "it works for me" is enough to me right now :p
> > >
> >
> > Yes, it does! I never realized that it would, and I have always
> > explicitely used the intersphinx prefix, e.g. :term:`bibtake:BB_XXX`. But
> > reading the doc more carefully, it states that you can use the 'prefix'
> to
> > force the lookup to be done in the specific intersphinx. But if the
> > reference is 'unique' then the prefix is not required. And it works for
> > :ref: as well.. I tried with:
> > :ref:`Fetchers
> <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
> >
> > and it worked fine.. that's cool, because that means we should be able to
> > remove some extraneous bitbake: prefix in few places.
> >
> > As for :term:`BB_DEFAULT_UMASK` it works because this 'term' is not
> define
> > in the YP reference manual terms. If you add it in YP doc then the link
> > will use the local term instead of bitbake, which makes sense I suppose.
> >
>
> I think so? I could imagine some bitbake variables to be better explained
> in
> the context of their use in the Yocto Project.
>
> We have to be careful with :ref: though, I wouldn't want links to point
> to the incorrect doc if the reference appears in both documentations?
> Especially since Sphinx wouldn't detect this as an error, since the
> :ref: would be valid in both cases. I'm pretty sure it's very unlikely
> to happen, but do we want to risk it :) ?
>

You might be right.. perhaps being explicit is better.. to avoid any issue
with disambiguation...
the bitbake: prefix bothers me a bit (too long), so perhaps we could change
it to bb: and enforce it everywhere it's needed.

I think i had a patch that renamed folder and files in bitbake docs (like
we did for yp-docs already), that would also help shorten all references..
e.g.

:ref:`Fetchers <bb:user-manual/fetching:fetchers>`
looks much better than
:ref:`Fetchers <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`


>
> Cheers,
> Quentin
> --
> StreamUnlimited Engineering GmbH
> High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
> Fax: +43 1 667 20 02 4401
> quentin.schulz@streamunlimited.com, www.streamunlimited.com
>

--000000000000497a1005c00640e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 15, 2021 at 4:07 PM Quent=
in Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin=
.schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Thu, Apr 15, 2021 at 12:25:55PM +0200, Nicola=
s Dechesne wrote:<br>
&gt; On Thu, Apr 15, 2021 at 11:59 AM Quentin Schulz &lt;<br>
&gt; <a href=3D"mailto:quentin.schulz@streamunlimited.com" target=3D"_blank=
">quentin.schulz@streamunlimited.com</a>&gt; wrote:<br>
&gt; &gt; On Thu, Apr 15, 2021 at 09:52:31PM +1200, Paul Eggleton wrote:<br=
>
&gt; &gt; &gt; On Wednesday, 14 April 2021 20:26:03 NZST Quentin Schulz wro=
te:<br>
&gt; &gt; &gt; &gt; On Tue, Apr 13, 2021 at 05:19:53PM -0700, Paul Eggleton=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; +BitBake changes<br>
&gt; &gt; &gt; &gt; &gt; +---------------<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +- BitBake is now configured to use a default ``um=
ask`` of ``022``<br>
&gt; &gt; for all<br>
&gt; &gt; &gt; &gt; &gt; tasks +=C2=A0 (specified via a new ``BB_DEFAULT_UM=
ASK`` variable). If<br>
&gt; &gt; needed,<br>
&gt; &gt; &gt; &gt; &gt; ``umask`` can<br>
&gt; &gt; &gt; &gt; s/``BB_DEFAULT_UMASK``/:term:`BB_DEFAULT_UMASK`/<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; IIRC, this works fine even for bitbake terms (might nee=
d some tweaking<br>
&gt; &gt; &gt; &gt; if it does not work but I know we use :term: for some b=
itbake variables<br>
&gt; &gt; &gt; &gt; from bitbake&#39;s docs).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Wow, that does work but I didn&#39;t imagine that it would. =
Any idea how it<br>
&gt; &gt; &gt; resolves those references given that doc is not in this tree=
?<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; How internally it works? No idea :)<br>
&gt; &gt;<br>
&gt; <br>
&gt; It is interesting... I would not have expected that to work ;)<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; But the few lines here are what makes it work:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/=
tree/documentation/conf.py#n90" rel=3D"noreferrer" target=3D"_blank">https:=
//git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/conf.py#=
n90</a><br>
&gt; <br>
&gt; <br>
&gt; So, this is correct we use the intersphinx extension to link YP and bi=
tbake<br>
&gt; docs which are indeed 2 different sphinx projects. When we build the Y=
P<br>
&gt; docs, it will first download the bitbake sphinx &#39;index, e.g. you c=
an see<br>
&gt; that in the log when building YP docs:<br>
&gt; <br>
&gt; loading intersphinx inventory from<br>
&gt; <a href=3D"https://docs.yoctoproject.org/bitbake/objects.inv." rel=3D"=
noreferrer" target=3D"_blank">https://docs.yoctoproject.org/bitbake/objects=
.inv.</a>..<br>
&gt; <br>
&gt; So now sphinx knows about all the :ref:, :doc:, :term:, ... defined in=
<br>
&gt; bitbake, so we can use them to create cross references. More on that h=
ere:<br>
&gt; <a href=3D"https://www.sphinx-doc.org/en/master/usage/extensions/inter=
sphinx.html" rel=3D"noreferrer" target=3D"_blank">https://www.sphinx-doc.or=
g/en/master/usage/extensions/intersphinx.html</a><br>
&gt; <br>
&gt; A nice debug tip is to run:<br>
&gt; python -msphinx.ext.intersphinx<br>
&gt; <a href=3D"https://docs.yoctoproject.org/bitbake/objects.inv" rel=3D"n=
oreferrer" target=3D"_blank">https://docs.yoctoproject.org/bitbake/objects.=
inv</a><br>
&gt; <br>
&gt; which shows all the bitbake references that can be used from YP docs.<=
br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Nicolas and/or other peoples involved in the migration might be a=
ble to<br>
&gt; &gt; tell you more, I&#39;m not :/<br>
&gt; &gt;<br>
&gt; &gt; &quot;it works for me&quot; is enough to me right now :p<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes, it does! I never realized that it would, and I have always<br>
&gt; explicitely used the intersphinx prefix, e.g. :term:`bibtake:BB_XXX`. =
But<br>
&gt; reading the doc more carefully, it states that you can use the &#39;pr=
efix&#39; to<br>
&gt; force the lookup to be done in the specific intersphinx. But if the<br=
>
&gt; reference is &#39;unique&#39; then the prefix is not required. And it =
works for<br>
&gt; :ref: as well.. I tried with:<br>
&gt; :ref:`Fetchers &lt;bitbake-user-manual/bitbake-user-manual-fetching:fe=
tchers&gt;`<br>
&gt; <br>
&gt; and it worked fine.. that&#39;s cool, because that means we should be =
able to<br>
&gt; remove some extraneous bitbake: prefix in few places.<br>
&gt; <br>
&gt; As for :term:`BB_DEFAULT_UMASK` it works because this &#39;term&#39; i=
s not define<br>
&gt; in the YP reference manual terms. If you add it in YP doc then the lin=
k<br>
&gt; will use the local term instead of bitbake, which makes sense I suppos=
e.<br>
&gt; <br>
<br>
I think so? I could imagine some bitbake variables to be better explained i=
n<br>
the context of their use in the Yocto Project.<br>
<br>
We have to be careful with :ref: though, I wouldn&#39;t want links to point=
<br>
to the incorrect doc if the reference appears in both documentations?<br>
Especially since Sphinx wouldn&#39;t detect this as an error, since the<br>
:ref: would be valid in both cases. I&#39;m pretty sure it&#39;s very unlik=
ely<br>
to happen, but do we want to risk it :) ?<br></blockquote><div><br></div><d=
iv>You might be right.. perhaps being explicit is better.. to avoid any iss=
ue with disambiguation...=C2=A0</div><div>the bitbake: prefix bothers me a =
bit (too long), so perhaps we could change it to bb: and enforce it everywh=
ere it&#39;s needed.=C2=A0</div><div><br></div><div>I think i had a patch t=
hat renamed folder=C2=A0and files in bitbake docs (like we did for yp-docs =
already), that would also help shorten all references.. e.g.=C2=A0</div><di=
v><br></div><div>:ref:`Fetchers &lt;bb:user-manual/fetching:fetchers&gt;`=
=C2=A0</div><div>looks much better than</div><div>:ref:`Fetchers &lt;bitbak=
e-user-manual/bitbake-user-manual-fetching:fetchers&gt;`<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
Quentin<br>
-- <br>
StreamUnlimited Engineering GmbH<br>
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria<br>
Fax: +43 1 667 20 02 4401<br>
<a href=3D"mailto:quentin.schulz@streamunlimited.com" target=3D"_blank">que=
ntin.schulz@streamunlimited.com</a>, <a href=3D"http://www.streamunlimited.=
com" rel=3D"noreferrer" target=3D"_blank">www.streamunlimited.com</a><br>
</blockquote></div></div>

--000000000000497a1005c00640e4--
