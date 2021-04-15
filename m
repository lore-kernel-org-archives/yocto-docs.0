Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.5049.1618482367979892974
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 03:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GphVZmch;
 spf=pass (domain: linaro.org, ip: 209.85.208.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f43.google.com with SMTP id z1so27397635edb.8
        for <docs@lists.yoctoproject.org>; Thu, 15 Apr 2021 03:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gmpfHu07s0BpKme3iTomeQ5JajRA9Tq/lfwKEY1UzpQ=;
        b=GphVZmch88+v8iA+1iUFgQLDqR90lRWI3MOw03D1ZCi+g8zQY2T0yrcT2rQjSv+ZWr
         +slEa0UvaI/KNo67EuNBVXf4W4QATRRaBZztn22y5s0P5LM8/UvlO4OW/ORAk7vraop2
         XGsIw9r6cD30sQBvHQwtRa2BtXHCjzVr+skVb1EtCkaNwMlHABbiMuDFBhFPQQhgbHSq
         Z9NhxGLvZNIT7cwjeqNu4PW+pu0H2OEGq9FXi2LHXhXdeeCJ+XB6Li1pApbiScHDmaqJ
         GrZcgObs7+LkYoQNsdI4d0AbS6UFTRO8O+77riZ5Nchh2LTUtats6NYv+Ogx9b3gLjub
         D+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gmpfHu07s0BpKme3iTomeQ5JajRA9Tq/lfwKEY1UzpQ=;
        b=ixc0eu+z8fxeM69yv0ze52gU8y0GMYyYQ2cI4p6qqu/lyk3siohRMQr573lKUtOUYj
         erzXeS6N6rjGoNqOpEE2h/hUxgOaCu5waSWWHJ1+cjg2sKH0z8cnunou7eCiDRdZ2Gqs
         ODO+rhtEESoszdZrxAoz8OXkHoxoeQg4cfjcXStSN45z84Dq3NpQpLynq7pkGHXZpFrN
         tnH73DdOseJR2P4X3N2VruZPaPy8MGpF/O1R+XeTJ5P5iOrRRHhs76ZhxjnvQH+CClLb
         VBGs+nGmurtBvkzrJQx2fERppUvF6I3+lZjCUpvct2eXqLjwenQxiELDLcOtkmVnvs4j
         tJ8A==
X-Gm-Message-State: AOAM532AFnwGuRsP3RwyS9iY9Lb2V3aTaasJA00ZqDbQ0zq0RmNd0h5a
	Cp5pjRYlTYlTPklJ6VVkFVS+9tr+tpJIFpTNsRzraQ==
X-Google-Smtp-Source: ABdhPJwEx2cwB1qUSIj0O6QhkMAC49UIA/l0ll/VQyhvE3zXvlN8YGm+//SvSn2m8lN8XhKd/OHuk71j5ZFrEUP+qj0=
X-Received: by 2002:a50:8fe6:: with SMTP id y93mr3254579edy.224.1618482366510;
 Thu, 15 Apr 2021 03:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <d8b43077bf92ad403028cbf37b61c4a6349f9370.1618358456.git.paul.eggleton@linux.microsoft.com>
 <20210414082603.gmkxjpyxwnhwzzor@qschulz> <1712714.3VsfAaAtOV@linc> <20210415095914.eqpunspm2rnpnc4v@qschulz>
In-Reply-To: <20210415095914.eqpunspm2rnpnc4v@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 15 Apr 2021 12:25:55 +0200
Message-ID: <CAP71WjxKavO93Cm8ZooE4HnJtbb79WLOQASEkh9UL5nFKw8ZNA@mail.gmail.com>
Subject: Re: [docs] [PATCH 12/13] ref-manual: add migration section for 3.3 release
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Paul Eggleton <bluelightning@bluelightning.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000880e3605c0004aff"

--000000000000880e3605c0004aff
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 15, 2021 at 11:59 AM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> Hi Paul,
>
> On Thu, Apr 15, 2021 at 09:52:31PM +1200, Paul Eggleton wrote:
> > Hi Quentin
> >
> > Thanks for the review!
> >
> > On Wednesday, 14 April 2021 20:26:03 NZST Quentin Schulz wrote:
> > > On Tue, Apr 13, 2021 at 05:19:53PM -0700, Paul Eggleton wrote:
> > > > +BitBake changes
> > > > +---------------
> > > > +
> > > > +- BitBake is now configured to use a default ``umask`` of ``022``
> for all
> > > > tasks +  (specified via a new ``BB_DEFAULT_UMASK`` variable). If
> needed,
> > > > ``umask`` can
> > > s/``BB_DEFAULT_UMASK``/:term:`BB_DEFAULT_UMASK`/
> > >
> > > IIRC, this works fine even for bitbake terms (might need some tweaking
> > > if it does not work but I know we use :term: for some bitbake variables
> > > from bitbake's docs).
> >
> > Wow, that does work but I didn't imagine that it would. Any idea how it
> > resolves those references given that doc is not in this tree?
> >
>
> How internally it works? No idea :)
>

It is interesting... I would not have expected that to work ;)


>
> But the few lines here are what makes it work:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/conf.py#n90


So, this is correct we use the intersphinx extension to link YP and bitbake
docs which are indeed 2 different sphinx projects. When we build the YP
docs, it will first download the bitbake sphinx 'index, e.g. you can see
that in the log when building YP docs:

loading intersphinx inventory from
https://docs.yoctoproject.org/bitbake/objects.inv...

So now sphinx knows about all the :ref:, :doc:, :term:, ... defined in
bitbake, so we can use them to create cross references. More on that here:
https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html

A nice debug tip is to run:
python -msphinx.ext.intersphinx
https://docs.yoctoproject.org/bitbake/objects.inv

which shows all the bitbake references that can be used from YP docs.


>
>
> Nicolas and/or other peoples involved in the migration might be able to
> tell you more, I'm not :/
>
> "it works for me" is enough to me right now :p
>

Yes, it does! I never realized that it would, and I have always
explicitely used the intersphinx prefix, e.g. :term:`bibtake:BB_XXX`. But
reading the doc more carefully, it states that you can use the 'prefix' to
force the lookup to be done in the specific intersphinx. But if the
reference is 'unique' then the prefix is not required. And it works for
:ref: as well.. I tried with:
:ref:`Fetchers <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`

and it worked fine.. that's cool, because that means we should be able to
remove some extraneous bitbake: prefix in few places.

As for :term:`BB_DEFAULT_UMASK` it works because this 'term' is not define
in the YP reference manual terms. If you add it in YP doc then the link
will use the local term instead of bitbake, which makes sense I suppose.


> [...]
>
> > > > +  (particularly if you create your own custom distro configuration).
> > > > +- The :ref:`ccache <ref-classes-ccache>` class now uses ``ccache``
> from
> > > > the +  build host rather than building ``ccache-native`` (due to
> circular
> > > > +  dependencies in ccache 4.0 that are impractical to resolve
> otherwise),
> > > > so +  if you enable it you will now need to have ``ccache``
> installed on
> > > > your +  host system.
> > >
> > > Will a warning be shown if ccache is not installed on the host or does
> > > it silently fail to use ccache?
> >
> > Good question, but on further digging I found the corresponding code
> change
> > actually got reverted and I had missed that in my earlier sweep. Just as
> well
> > you asked about it :)
> >
>
> :)
>
> Cheers,
> Quentin
>
> 
>
>

--000000000000880e3605c0004aff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 15, 2021 at 11:59 AM Quen=
tin Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quenti=
n.schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Paul,<br>
<br>
On Thu, Apr 15, 2021 at 09:52:31PM +1200, Paul Eggleton wrote:<br>
&gt; Hi Quentin<br>
&gt; <br>
&gt; Thanks for the review!<br>
&gt; <br>
&gt; On Wednesday, 14 April 2021 20:26:03 NZST Quentin Schulz wrote:<br>
&gt; &gt; On Tue, Apr 13, 2021 at 05:19:53PM -0700, Paul Eggleton wrote:<b=
r>
&gt; &gt; &gt; +BitBake changes<br>
&gt; &gt; &gt; +---------------<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +- BitBake is now configured to use a default ``umask`` of =
``022`` for all<br>
&gt; &gt; &gt; tasks +=C2=A0 (specified via a new ``BB_DEFAULT_UMASK`` var=
iable). If needed,<br>
&gt; &gt; &gt; ``umask`` can<br>
&gt; &gt; s/``BB_DEFAULT_UMASK``/:term:`BB_DEFAULT_UMASK`/<br>
&gt; &gt; <br>
&gt; &gt; IIRC, this works fine even for bitbake terms (might need some tw=
eaking<br>
&gt; &gt; if it does not work but I know we use :term: for some bitbake va=
riables<br>
&gt; &gt; from bitbake&#39;s docs).<br>
&gt; <br>
&gt; Wow, that does work but I didn&#39;t imagine that it would. Any idea =
how it <br>
&gt; resolves those references given that doc is not in this tree?<br>
&gt;=C2=A0 <br>
<br>
How internally it works? No idea :)<br></blockquote><div><br></div><div>It=
 is interesting... I would not have expected that to work ;)=C2=A0</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
But the few lines here are what makes it work:<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/tree/docu=
mentation/conf.py#n90" rel=3D"noreferrer" target=3D"_blank">https://git.yoc=
toproject.org/cgit/cgit.cgi/yocto-docs/tree/documentation/conf.py#n90</a></=
blockquote><div><br></div><div>So, this is correct we use the intersphinx e=
xtension to link YP and bitbake docs which are indeed 2 different sphinx pr=
ojects. When we build the YP docs, it will first download the bitbake sphin=
x &#39;index, e.g. you can see that in the log when building YP docs:</div>=
<div class=3D"gmail_quote"><br></div>loading intersphinx inventory from <a =
href=3D"https://docs.yoctoproject.org/bitbake/objects.inv.">https://docs.yo=
ctoproject.org/bitbake/objects.inv.</a>..<br><div><br></div><div>So now sph=
inx knows about all the :ref:, :doc:, :term:, ... defined in bitbake, so we=
 can use them to create cross references. More on that here:=C2=A0<a href=
=3D"https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html=
">https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html</a=
></div><div><br></div><div>A nice debug tip is to run:</div><div>python -ms=
phinx.ext.intersphinx <a href=3D"https://docs.yoctoproject.org/bitbake/obje=
cts.inv">https://docs.yoctoproject.org/bitbake/objects.inv</a><br></div><di=
v><br></div><div>which shows all the bitbake references that can be used fr=
om YP docs.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
<br>
Nicolas and/or other peoples involved in the migration might be able to<br=
>
tell you more, I&#39;m not :/<br>
<br>
&quot;it works for me&quot; is enough to me right now :p<br></blockquote><=
div><br></div><div>Yes, it does! I never realized that it would, and I have=
 always explicitely=C2=A0used the intersphinx prefix, e.g. :term:`bibtake:B=
B_XXX`. But reading the doc more carefully, it states that you can use the =
&#39;prefix&#39; to force the lookup to be done in the specific intersphinx=
. But if the reference is &#39;unique&#39; then the prefix is not required.=
 And it works for :ref: as well.. I tried with:</div><div>:ref:`Fetchers &l=
t;bitbake-user-manual/bitbake-user-manual-fetching:fetchers&gt;`<br></div><=
div><br></div><div>and it worked fine.. that&#39;s cool, because that means=
 we should be able to remove some extraneous bitbake: prefix in few places.=
=
=C2=A0</div><div><br></div><div>As for :term:`BB_DEFAULT_UMASK` it works b=
ecause this &#39;term&#39; is not define in the YP reference manual terms. =
If you add it in YP doc then the link will use the local term instead of bi=
tbake, which makes sense I suppose.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
[...]<br>
<br>
&gt; &gt; &gt; +=C2=A0 (particularly if you create your own custom distro =
configuration).<br>
&gt; &gt; &gt; +- The :ref:`ccache &lt;ref-classes-ccache&gt;` class now u=
ses ``ccache`` from<br>
&gt; &gt; &gt; the +=C2=A0 build host rather than building ``ccache-native=
`` (due to circular<br>
&gt; &gt; &gt; +=C2=A0 dependencies in ccache 4.0 that are impractical to =
resolve otherwise),<br>
&gt; &gt; &gt; so +=C2=A0 if you enable it you will now need to have ``cca=
che`` installed on<br>
&gt; &gt; &gt; your +=C2=A0 host system.<br>
&gt; &gt; <br>
&gt; &gt; Will a warning be shown if ccache is not installed on the host o=
r does<br>
&gt; &gt; it silently fail to use ccache?<br>
&gt; <br>
&gt; Good question, but on further digging I found the corresponding code =
change <br>
&gt; actually got reverted and I had missed that in my earlier sweep. Just=
 as well <br>
&gt; you asked about it :)<br>
&gt; <br>
<br>
:)<br>
<br>
Cheers,<br>
Quentin<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000880e3605c0004aff--
