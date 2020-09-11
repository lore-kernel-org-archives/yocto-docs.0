Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.2177.1599804153217227552
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Sep 2020 23:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=n2Jxbd3I;
 spf=pass (domain: linaro.org, ip: 209.85.219.175, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f175.google.com with SMTP id r7so5658627ybl.6
        for <docs@lists.yoctoproject.org>; Thu, 10 Sep 2020 23:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0DFTt45Sy4FqJUoyBxE8wn+dPp1ysA1S+vJ8BR7OOY0=;
        b=n2Jxbd3IvcB9gddYq00UCD8lvMKqNKXtWp2Flt2nbqEWPBp6qpRNVezGjttE5LJmLp
         fSCztUhuzl8oIDDB6e9BdB/3OkU2cbSndtXnP/EdttKD+iSThsILALnZrSEOEyQwM61w
         w7gxFy2qvYo3aNekbQDPMXZhlG5YGaQlAZqkqi+MOv+dzE2gpnGagysuSxL7rdj9BI/R
         qYiYtklSqzm88BH3GEf4QmlVSC2QQdEtT2I8sAT+kvx4uWlvfn4WpRb/U87p8eLELjlG
         YMz0EjP2vQhhLLL6GUXY/SxeMXCQjyjmgNed6tgiu1X/wSzLxQ9fepAKlFowRDOvSAYF
         uNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0DFTt45Sy4FqJUoyBxE8wn+dPp1ysA1S+vJ8BR7OOY0=;
        b=Kc+0BTe3fi1JYluDbpWhaifmmc7AfONBvAQiyqgRjU4ka6JjL5uVepWtnzHq5TcFLX
         T0nfRn05WeNMgSeL3fqs9TPHDmopaftcF/l71+LVWeu4+rjKKUp9MUnVTB7eL9S3Hmv2
         upyOSNMGUiDvDi3ZynkUU2M/xn6u4aYtfiA39ofDByuoSVjeS+C0lEJqnYkaTkcaXaDd
         WybhI6Wj4jN7j67H/a5IZhEXewQQZ2OQl4N09rJndDlIMd8X7qYK+7dbBycNtR4VOmgY
         VeVdpTtmrRkf1txC+LsiXWIUIV7cRajCcOOA17obIj3wPHr3Q2fa7/snCnEJ9xFuhjeB
         Isxw==
X-Gm-Message-State: AOAM533qWxuzAZ8M5LtxKH+T8ZRzioKsqtGHKXbiFch24h/eDmFWKHNu
	a1M8ThBJYWby7YLOw6ksm6O5J2CSXx6GzKGiDV4VDA==
X-Google-Smtp-Source: ABdhPJwLan77EosLSxorKOP2654e27bUW/IKUa1ZH03i+J26Md3y6jYOhp1L2H5SgCCxglAdABdfwqN0a+EMzmlms8c=
X-Received: by 2002:a25:d348:: with SMTP id e69mr310836ybf.273.1599804152018;
 Thu, 10 Sep 2020 23:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
 <574a4968-f543-ed18-954a-842acf50851d@gmail.com>
In-Reply-To: <574a4968-f543-ed18-954a-842acf50851d@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 11 Sep 2020 08:02:20 +0200
Message-ID: <CAP71Wjyehi0VywUEtZMNmXOs7KZN2mYT2+vZ5Zhmyb+YqHNAYw@mail.gmail.com>
Subject: Re: [docs] [sphinx] updates as of Sep 10th.
To: akuster808 <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000031123d05af036e1d"

--00000000000031123d05af036e1d
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 11, 2020 at 1:39 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 9/10/20 3:03 PM, Nicolas Dechesne wrote:
> > hi there,
> >
> > some more updates on our Sphinx migration task. It turned out to be a
> > rather huge task.. "Never ask engineers to make estimates" applies
> > quite well here ;)
> >
> > I think we are getting close to where we wanted to be. As you should
> > know by now, we are planning to switch for 3.2, and the sphinx
> > migration is kind of blocking M3 right now. Richard and I have spent
> > quite a bit of time on the docs lately to make the final push.
> >
> > Any help in this last mile would be much appreciated.. The 'last mile'
> > is to review each doc and finalize what's left which was not converted
> > properly by pandoc, nor by any of the regexp find/replace we've done..
> > Unfortunately this last step is manual and time consuming.
> >
> > We are planning to merge the sphinx branch in yocto-docs and bitbake
> > repo any time now. We haven't removed the docbook files yet, we will
> > do the removal once we claim to be done.
> >
> > In terms of publishing the docs, our plan is to have a brand new YP
> > docs 'website'. On that website, we will publish docs for each
> > release/branch, and it will be easy to navigate between versions.
> >
> > We have also created 'transition' pages in Sphinx for docs from all YP
> > releases from 0.9 to 3.1.x. For each release, we have a 'static' page
> > with links to the DocBook HTML manuals. So that the YP docs website
> > will be the *only* place to look for our docs moving forward.
> >
> > In each of the 2 sphinx branches, we've done the following:
> > 1. add makefile / sphinx boilerplate
> > 2. used pandoc to convert all .xml into .rst. it's a gross
> > conversion.. far from perfect...
> > 3. added a bunch of commits to fix up what's left from the conversion
> > (images, links, ..)
> > 4. Finally we are doing a manual review of each file and fixing the
> > last things. At this point, what's the most painful is that the
> > 'code-block' sections are not converted automatically.
> >
> > If anybody has any cycle now, we need to finish #4. The current status
> > is that:
> > * brief-yoctoprojectqs/* is done.
> > * bitbake user manual is half done, and I am doing it
> > * bsp-guide/*: i started it, and will finish
> > * ref-manual/*: RP is on it.
> > * there are plenty of warnings when we build, i would like to get rid
> > of them all!
>
>
> >
> > Anything else is work that remains to be done. Before starting
> > anything, please send a quick email here to let everyone know, to
> > avoid duplication. If you have any improvement, please share your
> > patches, I will take them into the sphinx/master branch. And I will
> > continue to work on the remaining files that no one would pick.
> >
> > And since a picture is worth a thousand words...
> >
> > The new doc website is here:
> > https://docs.yoctoproject.org/
> >
> > If you want to help, please review the "WIP" patches on
> > https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=sphinx
> > And pick one of the manuals which are left! It is not straightforward
> > to get started, I have to warn you.. don't hesitate to ask me
> > questions by email or on irc (ndec) if you need any help.
> Are we leaving the Mega manual for last or are we dropping it?
>

No, it's there. Sphinx can produce both "html" files, e.g. a 'website' with
all pages and the navigation bar, but it also has a target called
'singlehtml' which produces a single html page with all the doc. we are
publishing it as well (see the mega manual link in the left bar, or the
drop down selector on the top  you can choose between the regular site or
the mega manual). The mega manuel is:
https://docs.yoctoproject.org/singleindex.html

I am thinking about perhaps renaming it..

There are a few short coming with the Sphinx singlehtml target, the main
one being that Sphinx removes table of content in the singlehtml output.
You can move from manual to manual using the left navigation bar, but there
is no TOC in the HTML.. It's a known issue.. i am hoping we can fix that
later, but I think it's out of scope for 3.2.. At least the use case of
"grepping" through the mega manual is still supported.

I believe the new docs website will bring new ways of using the doc as
well. For example a general index is automatically generated/managed with
glossary terms, and over time we can include more terms in the index:
https://docs.yoctoproject.org/genindex.html



>
> I will take the "overview-manual" if its not taken.
>

thank you!


>
> - armin
>
> >
> > And as a reminder, instructions to build can be found here:
> > https://wiki.yoctoproject.org/wiki/Documentation_Sphinx
> >
> > cheers
> > nico
> >
> >
> >
> > 
>
>
>

--00000000000031123d05af036e1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 11, 2020 at 1:39 AM akust=
er808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 9/10/20 3:03 PM, Nicolas Dechesne wrote:<br>
&gt; hi there,<br>
&gt;<br>
&gt; some more updates on our Sphinx migration task. It turned out to be a=
<br>
&gt; rather huge task.. &quot;Never ask engineers to make estimates&quot; =
applies<br>
&gt; quite well here ;)<br>
&gt;<br>
&gt; I think we are getting close to where we wanted to be. As you should<=
br>
&gt; know by now, we are planning to switch for 3.2, and the sphinx<br>
&gt; migration is kind of blocking M3 right now. Richard and I have spent<=
br>
&gt; quite a bit of time on the docs lately to make the final push.<br>
&gt;<br>
&gt; Any help in this last mile would be much appreciated.. The &#39;last =
mile&#39;<br>
&gt; is to review each doc and finalize what&#39;s left which was not conv=
erted<br>
&gt; properly by pandoc, nor by any of the=C2=A0regexp find/replace we&#39=
;ve done..<br>
&gt; Unfortunately this last step is manual and time consuming.<br>
&gt;<br>
&gt; We are planning to merge the sphinx branch in yocto-docs and bitbake<=
br>
&gt; repo any time now. We haven&#39;t removed the docbook files yet, we w=
ill<br>
&gt; do the removal once we claim to be done.<br>
&gt;<br>
&gt; In terms of publishing the docs, our plan is to have a brand new YP<b=
r>
&gt; docs &#39;website&#39;. On that website, we will publish docs for eac=
h<br>
&gt; release/branch, and it will be easy to navigate between versions.=C2=
=A0<br>
&gt;<br>
&gt; We have also created &#39;transition&#39; pages in Sphinx for docs fr=
om all YP<br>
&gt; releases from 0.9 to 3.1.x. For each release, we have a &#39;static&#=
39; page<br>
&gt; with links to the DocBook HTML manuals. So that the YP docs website<b=
r>
&gt; will be the *only* place to look for our docs moving forward.<br>
&gt;<br>
&gt; In each of the 2 sphinx branches, we&#39;ve done the following:<br>
&gt; 1. add makefile / sphinx boilerplate<br>
&gt; 2. used pandoc to convert all .xml into .rst. it&#39;s a gross<br>
&gt; conversion.. far from perfect...<br>
&gt; 3. added a bunch of commits to fix up what&#39;s left from the conver=
sion<br>
&gt; (images, links, ..)<br>
&gt; 4. Finally we are doing a manual review of each file and fixing the<b=
r>
&gt; last things. At this point, what&#39;s the most painful is that the<b=
r>
&gt; &#39;code-block&#39; sections are not converted automatically.<br>
&gt;<br>
&gt; If anybody has any cycle now, we need to finish #4. The current statu=
s<br>
&gt; is that:<br>
&gt; *=C2=A0brief-yoctoprojectqs/* is done.<br>
&gt; * bitbake user manual is half done, and I am doing it<br>
&gt; * bsp-guide/*: i started it, and will finish<br>
&gt; * ref-manual/*: RP is on it.<br>
&gt; * there are=C2=A0plenty of warnings when we build, i would like to ge=
t rid<br>
&gt; of them all!<br>
<br>
<br>
&gt;<br>
&gt; Anything else is work that remains to be done. Before starting<br>
&gt; anything, please send a quick email here to let everyone know, to<br>
&gt; avoid duplication. If you have any improvement, please share your<br>
&gt; patches, I will take them into the sphinx/master branch. And I will<b=
r>
&gt; continue to work on the remaining files that no one=C2=A0would pick.<=
br>
&gt;<br>
&gt; And since a picture is worth a thousand words...<br>
&gt;<br>
&gt; The new doc website is here:<br>
&gt; <a href=3D"https://docs.yoctoproject.org/" rel=3D"noreferrer" target=
=3D"_blank">https://docs.yoctoproject.org/</a><br>
&gt;<br>
&gt; If you want to help, please review the &quot;WIP&quot; patches on=C2=
=A0<br>
&gt; <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/=
?h=3Dsphinx" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.=
org/cgit/cgit.cgi/yocto-docs/log/?h=3Dsphinx</a><br>
&gt; And pick one of the manuals which are left! It is not straightforward=
<br>
&gt; to get started, I have to warn you.. don&#39;t hesitate to ask me<br>
&gt; questions by email or on irc (ndec) if you need any help.<br>
Are we leaving the Mega manual for last or are we dropping it?<br></blockq=
uote><div><br></div><div>No, it&#39;s there. Sphinx can produce both &quot;=
html&quot; files, e.g. a &#39;website&#39; with all pages and the navigatio=
n bar, but it also has a target called &#39;singlehtml&#39; which produces =
a single html page with all the doc. we are publishing it as well (see the =
mega manual link in the left bar, or the drop down selector on the top=C2=
=A0 you can choose between the regular site or the mega manual). The mega =
manuel is:</div><div><a href=3D"https://docs.yoctoproject.org/singleindex.h=
tml">https://docs.yoctoproject.org/singleindex.html</a><br></div><div><br><=
/div><div>I am thinking about perhaps renaming it..=C2=A0</div><div><br></d=
iv><div>There are a few short coming with the Sphinx singlehtml target, the=
 main one being that Sphinx removes table of content in the singlehtml outp=
ut. You can move from manual to manual using the left navigation bar, but t=
here is no TOC in the HTML.. It&#39;s a known issue.. i am hoping we can fi=
x that later, but I think it&#39;s out of scope for 3.2.. At least the use =
case of &quot;grepping&quot; through the mega manual is still supported.=C2=
=
=A0</div><div><br></div><div>I believe the new docs website will bring new=
 ways of using the doc as well. For example a general index is automaticall=
y generated/managed with glossary terms, and over time we can include more =
terms in the index:=C2=A0</div><div><a href=3D"https://docs.yoctoproject.or=
g/genindex.html">https://docs.yoctoproject.org/genindex.html</a></div><div>=
=
=C2=A0<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
I will take the &quot;overview-manual&quot; if its not taken.<br></blockqu=
ote><div><br></div><div>thank you!</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
- armin<br>
<br>
&gt;<br>
&gt; And as a reminder, instructions to build can be found here:<br>
&gt; <a href=3D"https://wiki.yoctoproject.org/wiki/Documentation_Sphinx" r=
el=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Docu=
mentation_Sphinx</a><br>
&gt;<br>
&gt; cheers<br>
&gt; nico<br>
&gt;<br>
&gt; =C2=A0<br>
&gt;<br>
&gt; <br>
<br>
<br>
</blockquote></div></div>

--00000000000031123d05af036e1d--
