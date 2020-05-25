Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.27758.1590392018712871889
 for <docs@lists.yoctoproject.org>;
 Mon, 25 May 2020 00:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EIgGIhNz;
 spf=pass (domain: linaro.org, ip: 209.85.219.178, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f178.google.com with SMTP id y18so551657ybb.3
        for <docs@lists.yoctoproject.org>; Mon, 25 May 2020 00:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zZ4ymocB12gj0tduN0d1jr/vmBKot0zf0VYWHsW//Zg=;
        b=EIgGIhNzapNuh6Bu+WGh1c6Nr84hJQOlXF/tW/slXHulNGauMKFTVOEYxX5xlwTVr+
         IZBYYA6ETUxCjLHdTNtNFBbZTTzvUnG6hYQGgziLp4nbnkMTa0qWjkqgYxDSH1Hl1pxA
         avpYPcCyVCk4Zo1CdnkJpPufd7+9waXK4DE7yoEqYA2pgLQhc+nvC/sdQ4IclotIKUfb
         tRklvVERpT85Ne0UGB+hycMBD4WMlwwuLA1C8/Ih6kVYTyt1yx+U9mRWgzJVWIsaBY/8
         8z98RmtA28QIWQ9Wnp6VR3ugF/aGIwB+YEZd3gMP9X9xMcbXfF7gfLcAQdNxmfuHjN1H
         SSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zZ4ymocB12gj0tduN0d1jr/vmBKot0zf0VYWHsW//Zg=;
        b=JhgSYoDbK7Oia7+pnOf9df3+lK9K7qZrUY2EpRh6CwkSz5ztjuQJmzgwiuqDQWAo9u
         q+eCvTGpU+sYCWYovunjpX69oZJtEjXeWKkIkJmesGC8kqb0e11tXebVub92leo2B9Bw
         NznZ5QRsOaaecoxVakz9bm0E4RVvlWGjdiha7iQHZdD0eHUJ9YF8xpUOYrFuV61W+8qE
         DlPhI9E/4RSQZZ5ecQ62TatySWMHjt3vr+cP2kC0pa2gULdjgDfz2+QWrGRyGQYP8zSZ
         o8HZCp0SF7bQ/1NZmsN4DX87QljLy2jhpWc3FjID8j3K9Cut/8RYtTq1AYKgmODRdRb2
         52ig==
X-Gm-Message-State: AOAM532iqcpBKOdjqKxf+k8qF3fBGe1upUOZBRFkWvBTCT8wW3NbLdZt
	izzZSj3Vq6nrufi9nudZ0T3kp14/X+rDtpcggjkG4Q==
X-Google-Smtp-Source: ABdhPJy6xawQGTQk6IsCbwu1/g98G3lPba6BhPjUDpiPkB0J9oiJA7riL617c5J1EalHnk0yBbjfIGvHkIG4jRJHSEA=
X-Received: by 2002:a25:bd81:: with SMTP id f1mr35841847ybh.454.1590392017774;
 Mon, 25 May 2020 00:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
 <20200415152105.GA11838@linux-uys3> <alpine.LFD.2.21.2004161247290.35575@localhost.localdomain>
 <CAP71WjxP3VE8YQo5sS43rOxWzhqhz40Zd2gkX2AGVYxNEdD8oQ@mail.gmail.com>
 <alpine.LFD.2.21.2004161345410.53638@localhost.localdomain>
 <CAP71WjwPdXB36essZJ62sogNq+Qpf1wx3cEGpjKQ3MTDmgFY7w@mail.gmail.com>
 <alpine.LFD.2.21.2004161404130.54465@localhost.localdomain> <DM6PR11MB367614B1115E7BA06017F79FE5B70@DM6PR11MB3676.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB367614B1115E7BA06017F79FE5B70@DM6PR11MB3676.namprd11.prod.outlook.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 25 May 2020 09:33:26 +0200
Message-ID: <CAP71WjwWH-DVijt_bKwoNvHsUBvw3PwcN9yx6QKUiafAypf1yg@mail.gmail.com>
Subject: Re: [docs] Possible changes to the project docs
To: Mark Morton <Mark.Morton@windriver.com>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000046084705a673ffc9"

--00000000000046084705a673ffc9
Content-Type: text/plain; charset="UTF-8"

hi Mark,


On Thu, May 21, 2020 at 10:42 PM Mark Morton <Mark.Morton@windriver.com>
wrote:

> Hi:
>
> I'd like to actually start planning this conversion to Sphinx. So far
> myself, Rob D., Nicolas, and Tim O. are all interested in helping out.
>
> I'd like to have a Zoom meeting or something similar to get started on
> where to go from Nico's proof of concept. Please let me know if you want to
> attend - I'm thinking sometime early next week.
>

Thanks for starting this. I will be happy to help. I can prepare an
'initial' plan to get us started.


>
> Thanks,
> -Mark M.
>
> > -----Original Message-----
> > From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On
> Behalf
> > Of Robert P. J. Day
> > Sent: Thursday, April 16, 2020 11:06 AM
> > To: docs@lists.yoctoproject.org
> > Subject: Re: [docs] Possible changes to the project docs
> >
> > On Thu, 16 Apr 2020, Nicolas Dechesne wrote:
> >
> > >
> > >
> > > On Thu, Apr 16, 2020 at 7:46 PM Robert P. J. Day <
> rpjday@crashcourse.ca>
> > wrote:
> > >       On Thu, 16 Apr 2020, Nicolas Dechesne wrote:
> > >
> > >       > As I put in one of my emails before you can use my dev branch:
> > >       >
> > >       >
> https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=sphinx
> > >       >
> > >       > then it's just
> > >       > pip3 install sphinx
> > >       > # to use the non default theme
> > >       > pip3 install sphinx_rtd_theme
> > >       >
> > >       > cd documentation make html
> > >       >
> > >       > and it should generate exactly that on your local folder
> > >       > https://people.linaro.org/~nicolas.dechesne/yp-docs/
> > >       >
> > >       > I am happy to take patches in this branch (or create/maintain a
> > >       > contrib branch if more folks want to play/experiment and send
> > >       > patches).
> > >
> > >         definitely need some mechanism to handle docbook entities and
> basic
> > >       tags like <filename> ... i'm still poring over pandoc, can it be
> > >       configured to deal with that?
> > >
> > >         will go read more ...
> > >
> > >
> > > It does 'most of the time'. See:
> > > https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp.xml.
> > > html#bsp-layers
> > >
> > > where the docbook source is:
> > >        Each repository is a BSP layer supported by the Yocto Project
> > >
> > >
> > >         (e.g. <filename>meta-raspberrypi</filename> and
> > >
> > >
> > >         <filename>meta-intel</filename>).
> > >
> > >
> > >  I am not sure if it always does the *right* thing though.. and I have
> > > seen occurrences where it failed. I am wondering if we should 'fix'
> > > pandoc , or just spend some time fixing the output of pandoc.
> > > I don't think we will avoid reading/checking each manual, anyways..
> > > I was thinking we could use pandoc for 80% of the work, some regex for
> > > 15% and then manually finish the work.. it might be a bit optimistic
> > > ;)
> >
> >   interesting ... if you go to the top-level page:
> >
> > https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp-
> > guide.xml.html
> >
> > the <filename> tag in the third note is *not* migrated over, you can
> still see
> > the tag. i suspect there will be plenty of tweaking, but i'm still
> totally on-board
> > with this, and am willing to contribute.
> >
> > rday
> 
>

--00000000000046084705a673ffc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">hi Mark,<div><br></div><div><br></div></d=
iv><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 May 21, 2020 at 10:42 PM Mark Morton &lt;<a href=3D"mailto:Mark.Morton@win=
driver.com">Mark.Morton@windriver.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi:<br>
<br>
I&#39;d like to actually start planning this conversion to Sphinx. So far =
myself, Rob D., Nicolas, and Tim O. are all interested in helping out.<br>
<br>
I&#39;d like to have a Zoom meeting or something similar to get started on=
 where to go from Nico&#39;s proof of concept. Please let me know if you wa=
nt to attend - I&#39;m thinking sometime early next week.<br></blockquote><=
div><br></div><div>Thanks for starting this. I will be happy to help. I can=
 prepare an &#39;initial&#39; plan to get us started.=C2=A0</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
-Mark M. <br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_blank=
">docs@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:docs@lists.yoctopro=
ject.org" target=3D"_blank">docs@lists.yoctoproject.org</a>&gt; On Behalf<b=
r>
&gt; Of Robert P. J. Day<br>
&gt; Sent: Thursday, April 16, 2020 11:06 AM<br>
&gt; To: <a href=3D"mailto:docs@lists.yoctoproject.org" target=3D"_blank">=
docs@lists.yoctoproject.org</a><br>
&gt; Subject: Re: [docs] Possible changes to the project docs<br>
&gt; <br>
&gt; On Thu, 16 Apr 2020, Nicolas Dechesne wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Apr 16, 2020 at 7:46 PM Robert P. J. Day &lt;<a href=3D"=
mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&g=
t;<br>
&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Thu, 16 Apr 2020, Nicolas Dechesne =
wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; As I put in one of my emails befo=
re you can use my dev branch:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://git.linaro.org=
/people/nicolas.dechesne/poky.git/log/?h=3Dsphinx" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=
=
=3Dsphinx</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; then it&#39;s just<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; pip3 install sphinx<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; # to use the non default theme<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; pip3 install sphinx_rtd_theme<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; cd documentation make html<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; and it should generate exactly th=
at on your local folder<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://people.linaro.=
org/~nicolas.dechesne/yp-docs/" rel=3D"noreferrer" target=3D"_blank">https:=
//people.linaro.org/~nicolas.dechesne/yp-docs/</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am happy to take patches in thi=
s branch (or create/maintain a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; contrib branch if more folks want=
 to play/experiment and send<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; patches).<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 definitely need some mechanism =
to handle docbook entities and basic<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tags like &lt;filename&gt; ... i&#39;m=
 still poring over pandoc, can it be<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configured to deal with that?<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 will go read more ...<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; It does &#39;most of the time&#39;. See:<br>
&gt; &gt; <a href=3D"https://people.linaro.org/~nicolas.dechesne/yp-docs/b=
sp-guide/bsp.xml" rel=3D"noreferrer" target=3D"_blank">https://people.linar=
o.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp.xml</a>.<br>
&gt; &gt; html#bsp-layers<br>
&gt; &gt;<br>
&gt; &gt; where the docbook source is:<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0 Each repository is a BSP layer suppor=
ted by the Yocto Project<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 (e.g. &lt;filename&gt;meta-raspberry=
pi&lt;/filename&gt; and<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filename&gt;meta-intel&lt;/filen=
ame&gt;).<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0I am not sure if it always does the *right* thing though..=
 and I have<br>
&gt; &gt; seen occurrences where it failed. I am wondering if we should &#=
39;fix&#39;<br>
&gt; &gt; pandoc , or just spend some time fixing the output of pandoc.<br=
>
&gt; &gt; I don&#39;t think we will avoid reading/checking each manual, an=
yways..<br>
&gt; &gt; I was thinking we could use pandoc for 80% of the work, some reg=
ex for<br>
&gt; &gt; 15% and then manually finish the work.. it might be a bit optimi=
stic<br>
&gt; &gt; ;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0interesting ... if you go to the top-level page:<br>
&gt; <br>
&gt; <a href=3D"https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-gu=
ide/bsp-" rel=3D"noreferrer" target=3D"_blank">https://people.linaro.org/~n=
icolas.dechesne/yp-docs/bsp-guide/bsp-</a><br>
&gt; guide.xml.html<br>
&gt; <br>
&gt; the &lt;filename&gt; tag in the third note is *not* migrated over, yo=
u can still see<br>
&gt; the tag. i suspect there will be plenty of tweaking, but i&#39;m stil=
l totally on-board<br>
&gt; with this, and am willing to contribute.<br>
&gt; <br>
&gt; rday<br>
<br>
</blockquote></div></div>

--00000000000046084705a673ffc9--
