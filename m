Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.5372.1596681322839421790
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 19:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f15het1M;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id z6so48135518iow.6
        for <docs@lists.yoctoproject.org>; Wed, 05 Aug 2020 19:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ezkNhKfpLex+wp307plyuqiMlxuWCbVTrs7jp0+4HJU=;
        b=f15het1MpWPoP0cP9PGBuWl0FW2vi3pwwCbPo00vufxYhHzZORQz3HRkpKW5QijhGe
         Oa4juY8jQgcZlG3mpnVemAuuNg0iO3AeDTqwNmx9+hCdQYBbs+8r3B40NkLOQgB0asIs
         OT3aX9VZBmqVNbggHCcb2czCWFP8GSikS0WCkNdSeYExbwnPXgYoa6kIZScZLqlc2frD
         HZ9qsSEJz5n/yCRF3qT2oknH1pjlzoVpne+vk36T8qtn2ZWCKFNbuZuWaq6xcMXfC27H
         TAWn3MJqTM2okj4xUH5h8Qwlg1eHC95llgksi+rLHKRO+d+yYBu6CT7HOWSebNeSnzcY
         5oKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ezkNhKfpLex+wp307plyuqiMlxuWCbVTrs7jp0+4HJU=;
        b=fRsMtdAsf5T/LtHpPeGPH3PUbjj4FLTtDtZo+Bd7GOmnnrdPGzfo/qyVNtA2PYkE5P
         SfoOafj5b8StQ6+RajOhi2osfmfbbKCaSNDDTWjLhKfMDZXEA3I37tKluyYa5rwCsWVM
         vcdERWYs+NdmnbaYVtbKMHUy5ORVkyfn0t9KYBfUfXLQoVqfx/WQSk4KSMgburR0AwMA
         TPSjUpFdQBt+s9ugYkGOp9zOhJRAcU2czgIXxzctsJCuOYLXipcMiQvnJ52Uef75uo4C
         0EP8Sgf8xOsz3SeCWcz8ia3TmBJieOfk55ZVjmE2dshlrcw7vpsq9Uj3GjEYhuY5LS9W
         geRw==
X-Gm-Message-State: AOAM533yo+h0CAJmpQmiMI3KurQqLvcuhXzP4dZ1hSbSJTLw2Vzoy17w
	CN3Mtje4Fvx9irHCJrvl7WtobmhLaeR5MsofQms=
X-Google-Smtp-Source: ABdhPJyv1I/ZRqR/6ZNdMh97jO9xf0wSPSv5yivp1l+Q5QPJt5MBN89RnTORLUlJQCUE1cPtgJMKj1cUPEpG6wBGyGE=
X-Received: by 2002:a05:6602:15d0:: with SMTP id f16mr6957783iow.45.1596681322277;
 Wed, 05 Aug 2020 19:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
In-Reply-To: <CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Wed, 5 Aug 2020 19:35:11 -0700
Message-ID: <CANx9H-CUsCD5hgg-G1yGC1jhMDUvFjLU2hr+xksmE=3w1WhTAw@mail.gmail.com>
Subject: Re: [docs] [sphinx] updates as of Aug 5th.
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000008af6205ac2c5765"

--00000000000008af6205ac2c5765
Content-Type: text/plain; charset="UTF-8"

Nico,

Thank you SO much for all this work. And especially thank you for taking
the time to write this very explicit email.

I plan to work on this come hell or high water during the time you will be
away.

On Wed, Aug 5, 2020 at 2:54 PM Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> hi there,
>
> I will be away from the Interweb the next two weeks. So I wanted to
> share some updates about how the YP docs migration to Sphinx is doing.
> [it is a fairly long email].
>
> To be honest, I wouldn't mind a little bit of help, and I will give
> some hints about how you can help!
>
> We are still working on publishing the current Sphinx docs on
> yoctoproject.org, in the meantime, it's here for YP and Bitbake
> documentation.
>
> https://people.linaro.org/~nicolas.dechesne/yp-docs/html/index.html
> https://people.linaro.org/~nicolas.dechesne/bitbake-docs/html/
>
> All changes are pushed to the 'sphinx' branch in yocto-docs and in
> bitbake trees.
>
> Summary of the recent changes:
>
> * I imported some CSS config from the current YP documentation, as a
> result the look and feel is much closer to what we currently have.
> There are still things to improve, but it's better on my eyes at
> least.
> * I added all images/figures, since they were missed by the automatic
> conversion.
> * I added a general index (it's a builtin Sphinx feature), which uses
> all terms from the glossary. It is a nice feature, which looks
> promising (it's a general index across all documents)
> * I fixed a large amount to cross references (~2200 instances) to


2200!!!


> terms and sections using a series of Python regexp and also another
> 400 instances were fixed manually.. when my regexp failed.

400!!!


> * I added extlinks Sphinx support to refer to external links/website,
> and fixed them up in the source tree.
> * I added intersphinx support which allows a Sphinx documentation
> project to refer to section, terms, references from another Sphinx
> documentation project. This is really good, since we can cross
> reference bitbake terms directly from the YP documentation, eg..
> :term:`bitbake:BB_FOO` will 'just work'.
>
> The new documentation source code (.rst files) are really good to work
> with, and it's much better to work with ReST files than XML, without
> any surprise. The conversion is just a lot of work, and I already
> spent some significant amount of work on it.. I hope you will find it
> useful and I really hope it will achieve its goal to make it more
> attractive to contribute to Yocto Project documentation project.
>
> The way Sphinx works is that we have a single documentation project
> that includes all the YP 'books'. It is an important change, we no
> longer have X independent books, but have one project with all of
> them. We need to work on how we want to publish the documentation
> after the Sphinx migration.
>
> Richard is trying to add support to easily switch between YP version
> within the doc (e.g. like the Python doc), and we will host the 'old'
> documentation as well. e.g. when choosing the 'thud' version, we want
> to show a static page (not a Sphinx doc) that points to the thud html
> doc.
>
> And now here is the section you are all expecting the most! How can you
> help?
>
> 1. first you could learn about Sphinx and get familiar with the new
> syntax. You should review all the patches one by one, to learn from
> what I did! The sphinx documentation is good too. But looking at a
> real world example is much easier.
>
> 2. there are still plenty of broken links.. it's mostly cross
> references to section from one doc to another. DocBook used to have
> 'variables' (set in poky.ent) for each document (http link) and had
> some macro to append an anchor to create a link. This whole mechanism
> is not working well with Sphinx, and we should use Sphinx 'references'
> (e.g. :ref: syntax) instead. Maybe some of that can be automated with
> regexp, but I am not sure (very often it's multi line text and the
> replacement pattern is not always obvious).. Just to give an idea
> about how much work there is:
>  $ git grep YOCTO_DOCS_.*_URL */*.rst  | wc -l
> 475
>
> 3. During the conversion from DocBook the 'code' or 'shell' sections
> have been messed up, and is lost... it's quite unfortunate as this
> will require some good amount of work to convert.. In Sphinx, we would
> do this:
> .. code-block:: shell
>    $ cd $HOME/poky
>    $ source oe-init-build-env
> And it would render as we expect it to be.
> This task is typically something that would distribute well among many
> developers..
>
> 4. There are probably some other conversion hiccups at random places
> (color, font type, text, ...), so I think we will have to do a careful
> review of the HTML to find such issues and fix them. To be honest, I
> think it's a rather good thing to do anyways
>
> 5. Theme or CSS improvements. We are using the standard 'read the doc'
> theme. I would like to get feedback about the visual quality of the
> resulting HTML project. If anyone has idea to improve it, that would
> be much appreciated.
>
> thanks!
> nico
> 
>

--00000000000008af6205ac2c5765
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Nico,</div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thank you SO much for all this work. And especially thank you fo=
r taking the time to write this very explicit email.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I plan to work on this come hell or high water=
 during the time you will be away.</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 5, 2020 at 2:54 PM Nicol=
as Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dech=
esne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">hi t=
here,<br>
<br>
I will be away from the Interweb the next two weeks. So I wanted to<br>
share some updates about how the YP docs migration to Sphinx is doing.<br>
[it is a fairly long email].<br>
<br>
To be honest, I wouldn&#39;t mind a little bit of help, and I will give<br=
>
some hints about how you can help!<br>
<br>
We are still working on publishing the current Sphinx docs on<br>
<a href=3D"http://yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">y=
octoproject.org</a>, in the meantime, it&#39;s here for YP and Bitbake<br>
documentation.<br>
<br>
<a href=3D"https://people.linaro.org/~nicolas.dechesne/yp-docs/html/index.=
html" rel=3D"noreferrer" target=3D"_blank">https://people.linaro.org/~nicol=
as.dechesne/yp-docs/html/index.html</a><br>
<a href=3D"https://people.linaro.org/~nicolas.dechesne/bitbake-docs/html/"=
 rel=3D"noreferrer" target=3D"_blank">https://people.linaro.org/~nicolas.de=
chesne/bitbake-docs/html/</a><br>
<br>
All changes are pushed to the &#39;sphinx&#39; branch in yocto-docs and in=
<br>
bitbake trees.<br>
<br>
Summary of the recent changes:<br>
<br>
* I imported some CSS config from the current YP documentation, as a<br>
result the look and feel is much closer to what we currently have.<br>
There are still things to improve, but it&#39;s better on my eyes at<br>
least.<br>
* I added all images/figures, since they were missed by the automatic<br>
conversion.<br>
* I added a general index (it&#39;s a builtin Sphinx feature), which uses<=
br>
all terms from the glossary. It is a nice feature, which looks<br>
promising (it&#39;s a general index across all documents)<br>
* I fixed a large amount to cross references (~2200 instances) to</blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">2200!!!</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><br>
terms and sections using a series of Python regexp and also another<br>
400 instances were fixed manually.. when my regexp failed.</blockquote><di=
v dir=3D"auto">400!!!</div><div dir=3D"auto"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><br>
* I added extlinks Sphinx support to refer to external links/website,<br>
and fixed them up in the source tree.<br>
* I added intersphinx support which allows a Sphinx documentation<br>
project to refer to section, terms, references from another Sphinx<br>
documentation project. This is really good, since we can cross<br>
reference bitbake terms directly from the YP documentation, eg..<br>
:term:`bitbake:BB_FOO` will &#39;just work&#39;.<br>
<br>
The new documentation source code (.rst files) are really good to work<br>
with, and it&#39;s much better to work with ReST files than XML, without<b=
r>
any surprise. The conversion is just a lot of work, and I already<br>
spent some significant amount of work on it.. I hope you will find it<br>
useful and I really hope it will achieve its goal to make it more<br>
attractive to contribute to Yocto Project documentation project.<br>
<br>
The way Sphinx works is that we have a single documentation project<br>
that includes all the YP &#39;books&#39;. It is an important change, we no=
<br>
longer have X independent books, but have one project with all of<br>
them. We need to work on how we want to publish the documentation<br>
after the Sphinx migration.<br>
<br>
Richard is trying to add support to easily switch between YP version<br>
within the doc (e.g. like the Python doc), and we will host the &#39;old&#=
39;<br>
documentation as well. e.g. when choosing the &#39;thud&#39; version, we w=
ant<br>
to show a static page (not a Sphinx doc) that points to the thud html<br>
doc.<br>
<br>
And now here is the section you are all expecting the most! How can you he=
lp?<br>
<br>
1. first you could learn about Sphinx and get familiar with the new<br>
syntax. You should review all the patches one by one, to learn from<br>
what I did! The sphinx documentation is good too. But looking at a<br>
real world example is much easier.<br>
<br>
2. there are still plenty of broken links.. it&#39;s mostly cross<br>
references to section from one doc to another. DocBook used to have<br>
&#39;variables&#39; (set in poky.ent) for each document (http link) and ha=
d<br>
some macro to append an anchor to create a link. This whole mechanism<br>
is not working well with Sphinx, and we should use Sphinx &#39;references&=
#39;<br>
(e.g. :ref: syntax) instead. Maybe some of that can be automated with<br>
regexp, but I am not sure (very often it&#39;s multi line text and the<br>
replacement pattern is not always obvious).. Just to give an idea<br>
about how much work there is:<br>
=C2=A0$ git grep YOCTO_DOCS_.*_URL */*.rst=C2=A0 | wc -l<br>
475<br>
<br>
3. During the conversion from DocBook the &#39;code&#39; or &#39;shell&#39=
; sections<br>
have been messed up, and is lost... it&#39;s quite unfortunate as this<br>
will require some good amount of work to convert.. In Sphinx, we would<br>
do this:<br>
.. code-block:: shell<br>
=C2=A0 =C2=A0$ cd $HOME/poky<br>
=C2=A0 =C2=A0$ source oe-init-build-env<br>
And it would render as we expect it to be.<br>
This task is typically something that would distribute well among many<br>
developers..<br>
<br>
4. There are probably some other conversion hiccups at random places<br>
(color, font type, text, ...), so I think we will have to do a careful<br>
review of the HTML to find such issues and fix them. To be honest, I<br>
think it&#39;s a rather good thing to do anyways<br>
<br>
5. Theme or CSS improvements. We are using the standard &#39;read the doc&=
#39;<br>
theme. I would like to get feedback about the visual quality of the<br>
resulting HTML project. If anyone has idea to improve it, that would<br>
be much appreciated.<br>
<br>
thanks!<br>
nico<br>
<br>
</blockquote></div></div>

--00000000000008af6205ac2c5765--
