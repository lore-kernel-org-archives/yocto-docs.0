Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.9983.1615563163712392658
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 07:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=d6ebwnym;
 spf=pass (domain: linaro.org, ip: 209.85.208.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f52.google.com with SMTP id h10so8517166edt.13
        for <docs@lists.yoctoproject.org>; Fri, 12 Mar 2021 07:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FqD9MN2Xnulvh8De88+WjE4gXg+F2v/DoCC74RgTI8A=;
        b=d6ebwnymVEdkN/W3X2VLatjKVduDwbgizU9mrnenXOjyBCG+ZDeSvC47GC2KGELGeN
         h4ydA8w1eig9n0HrjTieUw3gXN3icNyVZBEvL+o3BBEusJkXLp6uQfDBTKwzmKx8R8Ku
         frWbH2bpkS2TM/H0gO40kUjH76ZRoOW0rQy2jm7+e1OTBEXcRTSN7jjMfu+M4lQSPKtl
         7LSMOuuPEjEX/nWrscWuyE1RiXWAWEZxlCDAG87eqDkA3+cwYucZJiGBeecU5xbnVnvc
         c+pHN4OkUMnk1JLrz83RROF2JSLrJaQeZlqb8SUjBwIOwvMsNdM4IcMc0Ey5Umw1fJE7
         SUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FqD9MN2Xnulvh8De88+WjE4gXg+F2v/DoCC74RgTI8A=;
        b=RKYb+mydgcFATzEnDufht/cfucKIvDG0gTjyt/m3raR3F+Z4G1lLi9ZYBKJKPWtVHC
         adgVtzFnRkG3sCmmhaua+o98Bw+6dePnluI7IH5P7/ly8ipwThiA4UOEhjb/RzYgPWjN
         ZFw86rjnbt+OlNTNDcrHSVDIkma+TvKY26snKP/Hu7YNeFhkRt+F/fwERx17wNqmiIpD
         5iRz065wlx4lIfMz1r2bVzBsN6JkuEaewrFBWSJmAIgimdWQeEP+r5MuAOEV+59zOSrG
         iuZmNJYYVl+8Li7dizJpTc2dFrl6nkUisAdPM+IE9pcLZdEPAruCob+Tf2gquv7k0mM5
         ZSKg==
X-Gm-Message-State: AOAM530r+X1afjNNHRpXG/mWrnLAgZT+08qbMSkTPjDReFxc+jyn9WBg
	TH7hpGTJzLkqkDcAI1q9nd0V42V9P23oM0/RBF1kvQ==
X-Google-Smtp-Source: ABdhPJziUWt2T8qkYrdPF3MRMJcCTadsQi4ZNUDi6seU0A4mtmK14z488Cm7QVQ9O4R1Dx3Hsl/tRoGGTO81m6/14Eg=
X-Received: by 2002:a50:f391:: with SMTP id g17mr14709242edm.26.1615563161836;
 Fri, 12 Mar 2021 07:32:41 -0800 (PST)
MIME-Version: 1.0
References: <1615552603-31220-1-git-send-email-mshah@mvista.com> <20210312145402.pah3wae7wuew2i6x@qschulz>
In-Reply-To: <20210312145402.pah3wae7wuew2i6x@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 12 Mar 2021 16:32:35 +0100
Message-ID: <CAP71WjxiupxNDYeQSu0gVjNkOSUkiumax8zTRVH1AOicfxWerg@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][PATCH] ref-manual: added new section library-functions
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Milan Shah <mshah@mvista.com>, YP docs mailing list <docs@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Randy MacLeod <randy.macleod@windriver.com>, Scott Rifenbark <srifenbark@gmail.com>, 
	Paul Eggleton <bluelightning@bluelightning.org>
Content-Type: multipart/alternative; boundary="0000000000005faed005bd589c0c"

--0000000000005faed005bd589c0c
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 12, 2021 at 3:54 PM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> Hi Milan,
>
> Thanks for the patch!
>
> On Fri, Mar 12, 2021 at 06:06:43PM +0530, Milan Shah wrote:
> > A number of functions in lib/bb/utils.py are used throughout the meta*/
> recipe
> > and bbclass files. Unfortunately the methods for the class are not
> documented.
> >
> > Added a new "library functions" section to the manual in the reference
> manual
> > in the yocto-docs repository and document the utils functions to start
> with.
> >
> > See [YOCTO #9612] for the details.
> >
> > Signed-off-by: Milan Shah <mshah@mvista.com>
>
> [...]
>
> > +``contains``
> > +--------------
> > +
> > +Check if a variable contains all the values specified.
> > +
> > +Arguments:
> > +
> > +    `variable` -- the variable name. This will be fetched and expanded
> (using d.getVar(variable)) and then split into a set().
> > +
> > +    `checkvalues` -- if this is a string it is split on whitespace into
> a set(), otherwise coerced directly into a set().
> > +
> > +    `truevalue` -- the value to return if checkvalues is a subset of
> variable.
> > +    `falsevalue` -- the value to return if variable is empty or if
> checkvalues is not a subset of variable.
> > +
> > +    `d` -- the data store.
> > +
> > +
> > +
> > +See the occurrence in :term:`TUNE_ASARGS` , :term:`TUNE_LDARGS` ,
> :ref:`image_types.bbclass <ref-classes-image_types>` , and
> :ref:`migration-1.8-bluez` sections.
> > +
>
> I'm not sure it makes much sense to duplicate documentation.
>
> I see an absolute need for bb.utils functions to be documented
> thoroughly in code, where they are implemented.
>
> e.g.
> https://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n983
>
> This seems to be the case for most functions, which is a good thing.
>
> What I am afraid with your patch is that nobody will take care of
> maintaining this copy of the documention from bb.utils code when there
> will be changes, deletions or additions.
>
> Since one should be able to extract Python docstring from a python file
> with e.g. bb.utils.contains.__doc__, it should be possible to have
> something autogenerated and thus, auto-maintained.
> You can probably iterate over all functions defined in a Python module
> too.
>
> Also, I'd probably see this kind of documentation more in Bitbake docs
> than YP docs (or both).
>
> I'd see something similar to what Pillow is doing here:
> https://pillow.readthedocs.io/en/stable/reference/Image.html#functions
> which links to:
> https://pillow.readthedocs.io/en/stable/_modules/PIL/Image.html#open
> if one wants to see the source code.
>
> With a quick google search, I found this:
> https://www.sphinx-doc.org/en/master/usage/extensions/autodoc.html
>
> It probably could be something that we add to our release scripts and
> then somehow add the resulting rst/html to the bitbake docs. No idea how
> to hook this up though, just giving ideas (and complaining :) ).
>

It should be easier for bitbake actually, since the docs and the source
both live in the same repo. We should definitely look into that.
This is how it's integrated in the Kernel doc:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sphinx/kerneldoc.py?h=v5.12-rc2

then in the .rst file, they have:
.. kernel-doc:: include/linux/memblock.h




>
> Cheers,
> Quentin
>
> 
>
>

--0000000000005faed005bd589c0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 3:54 PM Quent=
in Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin=
.schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hi Milan,<br>
<br>
Thanks for the patch!<br>
<br>
On Fri, Mar 12, 2021 at 06:06:43PM +0530, Milan Shah wrote:<br>
&gt; A number of functions in lib/bb/utils.py are used throughout the meta=
*/ recipe<br>
&gt; and bbclass files. Unfortunately the methods for the class are not do=
cumented.<br>
&gt; <br>
&gt; Added a new &quot;library functions&quot; section to the manual in th=
e reference manual<br>
&gt; in the yocto-docs repository and document the utils functions to star=
t with.<br>
&gt; <br>
&gt; See [YOCTO #9612] for the details.<br>
&gt; <br>
&gt; Signed-off-by: Milan Shah &lt;<a href=3D"mailto:mshah@mvista.com" tar=
get=3D"_blank">mshah@mvista.com</a>&gt;<br>
<br>
[...]<br>
<br>
&gt; +``contains``<br>
&gt; +--------------<br>
&gt; +<br>
&gt; +Check if a variable contains all the values specified.<br>
&gt; +<br>
&gt; +Arguments:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 `variable` -- the variable name. This will be fetched =
and expanded (using d.getVar(variable)) and then split into a set().<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 `checkvalues` -- if this is a string it is split on wh=
itespace into a set(), otherwise coerced directly into a set().<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 `truevalue` -- the value to return if checkvalues is a=
 subset of variable.<br>
&gt; +=C2=A0 =C2=A0 `falsevalue` -- the value to return if variable is emp=
ty or if checkvalues is not a subset of variable.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 `d` -- the data store.<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +See the occurrence in :term:`TUNE_ASARGS` , :term:`TUNE_LDARGS` , :r=
ef:`image_types.bbclass &lt;ref-classes-image_types&gt;` , and :ref:`migrat=
ion-1.8-bluez` sections.<br>
&gt; +<br>
<br>
I&#39;m not sure it makes much sense to duplicate documentation.<br>
<br>
I see an absolute need for bb.utils functions to be documented<br>
thoroughly in code, where they are implemented.<br>
<br>
e.g. <a href=3D"https://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/li=
b/bb/utils.py#n983" rel=3D"noreferrer" target=3D"_blank">https://git.yoctop=
roject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n983</a><br>
<br>
This seems to be the case for most functions, which is a good thing.<br>
<br>
What I am afraid with your patch is that nobody will take care of<br>
maintaining this copy of the documention from bb.utils code when there<br>
will be changes, deletions or additions.<br>
<br>
Since one should be able to extract Python docstring from a python file<br=
>
with e.g. bb.utils.contains.__doc__, it should be possible to have<br>
something autogenerated and thus, auto-maintained.<br>
You can probably iterate over all functions defined in a Python module<br>
too.<br>
<br>
Also, I&#39;d probably see this kind of documentation more in Bitbake docs=
<br>
than YP docs (or both).<br>
<br>
I&#39;d see something similar to what Pillow is doing here:<br>
<a href=3D"https://pillow.readthedocs.io/en/stable/reference/Image.html#fu=
nctions" rel=3D"noreferrer" target=3D"_blank">https://pillow.readthedocs.io=
/en/stable/reference/Image.html#functions</a><br>
which links to:<br>
<a href=3D"https://pillow.readthedocs.io/en/stable/_modules/PIL/Image.html=
#open" rel=3D"noreferrer" target=3D"_blank">https://pillow.readthedocs.io/e=
n/stable/_modules/PIL/Image.html#open</a><br>
if one wants to see the source code.<br>
<br>
With a quick google search, I found this:<br>
<a href=3D"https://www.sphinx-doc.org/en/master/usage/extensions/autodoc.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://www.sphinx-doc.org/en/mas=
ter/usage/extensions/autodoc.html</a><br>
<br>
It probably could be something that we add to our release scripts and<br>
then somehow add the resulting rst/html to the bitbake docs. No idea how<b=
r>
to hook this up though, just giving ideas (and complaining :) ).<br></bloc=
kquote><div><br></div><div>It should be easier for bitbake actually, since =
the docs and the source both live in the same repo. We should definitely lo=
ok into that.</div><div>This is how it&#39;s integrated in the Kernel doc:<=
/div><div><a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git/tree/Documentation/sphinx/kerneldoc.py?h=3Dv5.12-rc2">https://=
git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentati=
on/sphinx/kerneldoc.py?h=3Dv5.12-rc2</a><br></div><div><br></div><div>then =
in the .rst file, they have:</div><div>.. kernel-doc:: include/linux/memblo=
ck.h<br></div><div><br></div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
Quentin<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000005faed005bd589c0c--
